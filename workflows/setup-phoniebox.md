---
model: claude-sonnet-4-6
---

Set up a Phoniebox v2 RFID jukebox on a Raspberry Pi from scratch. Walk the user through hardware, OS flashing, SSH key authentication, non-interactive installation, RFID reader registration, YouTube audio downloading, and RFID card linking — handling all remote work automatically via SSH from any OS (Windows, Mac, Linux).

[Extended thinking: This workflow guides the user through the complete Phoniebox setup process, executing all remote commands via SSH so the user never needs to type on the Pi directly. It handles all known pitfalls: the installer's hard requirement for username 'pi', SSH password-auth bugs in Raspberry Pi Imager, evdev missing post-install, deviceName.txt trailing-newline bug, MPD volume normalization, udev auto-restart for USB reconnects, and yt-dlp JS challenge solving.]

## Step 1 — Hardware checklist

Ask the user to confirm they have:
- Raspberry Pi (2/3/4 or Zero W) — recommend 3B+
- MicroSD card (16GB+, Class 10)
- USB RFID reader (125kHz plug-and-play recommended)
- RFID cards/fobs (must match reader frequency)
- USB-powered speakers
- Power supply for Pi
- Ethernet cable (recommended for initial setup — WiFi can be configured after)

Ask which Raspberry Pi model they have. Ask if they want Spotify (Premium required) or local audio only.

---

## Step 2 — Flash the SD card

Tell the user to download Raspberry Pi Imager from https://www.raspberrypi.com/software/

**Imager settings (exact values matter):**
- Device: their Pi model
- OS: Raspberry Pi OS Lite (32-bit) — **Legacy Bullseye**, NOT Bookworm
- Customisation:
  - Hostname: `phoniebox`
  - Username: `pi` (**REQUIRED** — Phoniebox installer hard-requires user `pi`)
  - Password: `raspberry`
  - SSH: **Allow password authentication**
  - WiFi: their network (optional — Ethernet is more reliable for setup)

> **Warning:** Setting username to anything other than `pi` causes installer failure with "User must be 'pi'".

> **Known Raspberry Pi Imager bug:** On some versions, password authentication is not correctly applied even when selected. If SSH login fails, connect the Pi to a monitor and keyboard, log in at the console, run `sudo passwd pi` to reset the password, and enable `PasswordAuthentication yes` in `/etc/ssh/sshd_config`.

---

## Step 3 — Set up SSH key authentication

Check for an existing SSH key:
```bash
ls ~/.ssh/id_ed25519.pub
```

If missing, generate one:
```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
```

Find the Pi's IP address:
```bash
arp -a | grep -i "b8-27-eb\|dc-a6-32\|e4-5f-01"
```

If not found via arp, check your router's DHCP table or try `ping phoniebox.local`.

Copy the SSH key to the Pi using Python paramiko (preferred on Windows where `sshpass` is unavailable):

```python
import paramiko

client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect('PI_IP', username='pi', password='raspberry', timeout=10)

with open(os.path.expanduser('~/.ssh/id_ed25519.pub')) as f:
    pubkey = f.read().strip()

for cmd in ['mkdir -p ~/.ssh', 'chmod 700 ~/.ssh',
            f'echo "{pubkey}" >> ~/.ssh/authorized_keys',
            'chmod 600 ~/.ssh/authorized_keys']:
    stdin, stdout, stderr = client.exec_command(cmd)
    stdout.channel.recv_exit_status()

client.close()
```

If paramiko is not installed: `pip install paramiko`

Verify passwordless access works:
```bash
ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_ed25519 pi@PI_IP "echo connected"
```

Store the Pi's IP and use this pattern for all subsequent remote commands:
```bash
ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_ed25519 pi@PI_IP "COMMAND"
```

---

## Step 4 — Install Phoniebox

Install git if missing:
```bash
ssh pi@PI_IP "sudo apt-get install -y git"
```

Clone the repository:
```bash
ssh pi@PI_IP "cd /home/pi && git clone https://github.com/MiczFlor/RPi-Jukebox-RFID.git"
```

Create non-interactive install config:
```bash
ssh pi@PI_IP "cat > /home/pi/PhonieboxInstall.conf << 'EOF'
WIFIconfig=\"NO\"
AUTOHOTSPOTconfig=\"NO\"
EXISTINGuse=\"NO\"
AUDIOiFace=\"PCM\"
DIRaudioFolders=\"/home/pi/RPi-Jukebox-RFID/shared/audiofolders\"
GPIOconfig=\"NO\"
SPOTinstall=\"NO\"
EOF"
```

Run the installer non-interactively (`-a` uses the conf file):
```bash
ssh pi@PI_IP "nohup sudo bash /home/pi/RPi-Jukebox-RFID/scripts/installscripts/install-jukebox.sh -a > /home/pi/install.log 2>&1 &"
```

Monitor progress (check every 2–3 minutes):
```bash
ssh pi@PI_IP "tail -20 /home/pi/install.log && ps aux | grep install-jukebox | grep -v grep"
```

Installation is complete when the log shows `Done (in Xh Xm Xs)`. Then reboot:
```bash
ssh pi@PI_IP "sudo reboot"
```

Wait for the Pi to come back up:
```bash
until ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -i ~/.ssh/id_ed25519 pi@PI_IP "echo up" 2>/dev/null; do sleep 3; done
```

---

## Step 5 — Fix common post-install issues

### Install missing evdev module

The RFID daemon requires `evdev`, which is not always installed:
```bash
ssh pi@PI_IP "sudo pip3 install evdev --break-system-packages"
```

### Fix volume settings

Disable MPD volume normalization (causes volume to drop suddenly after playback starts):
```bash
ssh pi@PI_IP "sudo sed -i 's/volume_normalization.*\"yes\"/volume_normalization\t\t\"no\"/' /etc/mpd.conf && sudo systemctl restart mpd"
```

Set startup volume to 85:
```bash
ssh pi@PI_IP "echo '85' > /home/pi/RPi-Jukebox-RFID/settings/Startup_Volume"
```

Set ALSA PCM to 100% on every boot (prevents silent audio after reboot):
```bash
ssh pi@PI_IP "sudo tee /etc/rc.local << 'EOF'
#!/bin/sh -e
amixer set PCM 100%
exit 0
EOF
sudo chmod +x /etc/rc.local"
```

### Fix audio folder permissions

```bash
ssh pi@PI_IP "sudo chown -R pi:www-data /home/pi/RPi-Jukebox-RFID/shared/audiofolders/ && sudo chmod -R 775 /home/pi/RPi-Jukebox-RFID/shared/audiofolders/"
```

---

## Step 6 — Set up RFID reader

Check the reader is detected:
```bash
ssh pi@PI_IP "lsusb && ls /dev/input/by-id/"
```

Get the exact device name as seen by evdev:
```bash
ssh pi@PI_IP "python3 -c 'from evdev import InputDevice, list_devices; [print(repr(InputDevice(fn).name)) for fn in list_devices()]'"
```

Write the device name **without a trailing newline** (trailing `\n` causes "Could not find device"):
```bash
ssh pi@PI_IP "printf 'DEVICE_NAME_HERE' > /home/pi/RPi-Jukebox-RFID/scripts/deviceName.txt"
```

> **Critical:** Always use `printf`, never `echo`, to write `deviceName.txt`. A trailing newline causes a silent string-mismatch that prevents the RFID service from finding the reader.

Restart the RFID service:
```bash
ssh pi@PI_IP "sudo systemctl restart phoniebox-rfid-reader.service"
```

Test card reading (swipe within the 15-second window):
```bash
ssh pi@PI_IP "python3 -c '
from evdev import InputDevice, list_devices
from select import select
devices = [InputDevice(fn) for fn in list_devices()]
for d in devices:
    if \"RFID\" in d.name or \"Sycreader\" in d.name:
        print(\"Swipe card now!\")
        r,w,x = select([d], [], [], 15)
        if r:
            for event in d.read(): print(event)
'"
```

### Set up udev rule for auto-restart on USB reconnect

Get the vendor and product IDs:
```bash
ssh pi@PI_IP "lsusb | grep -i rfid"
```

Create the udev rule (replace VENDOR and PRODUCT with hex IDs from lsusb output):
```bash
ssh pi@PI_IP "sudo tee /etc/udev/rules.d/99-rfid-reader.rules << 'EOF'
ACTION==\"add\", SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"VENDOR\", ATTRS{idProduct}==\"PRODUCT\", RUN+=\"/bin/systemctl restart phoniebox-rfid-reader.service\"
EOF
sudo udevadm control --reload-rules"
```

---

## Step 7 — Download audio from YouTube

Install Node.js (required for yt-dlp to solve YouTube's JS challenges):
```bash
ssh pi@PI_IP "sudo apt-get install -y nodejs"
```

Create a folder and download audio as MP3:
```bash
ssh pi@PI_IP "mkdir -p /home/pi/RPi-Jukebox-RFID/shared/audiofolders/FOLDER_NAME && yt-dlp --js-runtimes node --remote-components ejs:github -x --audio-format mp3 --audio-quality 0 -o '/home/pi/RPi-Jukebox-RFID/shared/audiofolders/FOLDER_NAME/%(title)s.%(ext)s' 'YOUTUBE_URL'"
```

Fix permissions after download:
```bash
ssh pi@PI_IP "sudo chown -R pi:www-data /home/pi/RPi-Jukebox-RFID/shared/audiofolders/ && sudo chmod -R 775 /home/pi/RPi-Jukebox-RFID/shared/audiofolders/"
```

> Use English folder names — non-ASCII characters can cause issues with the Phoniebox web interface.

---

## Step 8 — Register RFID cards

Check the last swiped card ID:
```bash
ssh pi@PI_IP "cat /home/pi/RPi-Jukebox-RFID/shared/latestID.txt"
```

Link a card to an audio folder:
```bash
ssh pi@PI_IP "printf 'FOLDER_NAME' > /home/pi/RPi-Jukebox-RFID/shared/shortcuts/CARD_ID"
```

Link a card to a system command (stop, volume, shutdown, etc.) by editing `rfid_trigger_play.conf`. Example — assign stop command:
```bash
ssh pi@PI_IP "sed -i 's/CMDSTOP=\"%CMDSTOP%\"/CMDSTOP=\"CARD_ID\"/' /home/pi/RPi-Jukebox-RFID/settings/rfid_trigger_play.conf"
```

Available commands: `CMDSTOP`, `CMDPAUSE`, `CMDPLAY`, `CMDVOLUP`, `CMDVOLDOWN`, `CMDNEXT`, `CMDPREV`, `CMDSHUFFLE`, `CMDSHUTDOWN`, `CMDREBOOT`, `CMDMUTE`, `CMDVOL30`–`CMDVOL100`

---

## Step 9 — Verify everything works

Run a full health check:
```bash
ssh pi@PI_IP "
echo '=== RFID Service ===' && sudo systemctl is-active phoniebox-rfid-reader.service
echo '=== PCM Volume ===' && amixer get PCM | grep Mono
echo '=== MPD Volume ===' && /home/pi/RPi-Jukebox-RFID/scripts/playout_controls.sh -c=getvolume
echo '=== Audio Folders ===' && ls /home/pi/RPi-Jukebox-RFID/shared/audiofolders/
echo '=== Registered Cards ===' && for f in /home/pi/RPi-Jukebox-RFID/shared/shortcuts/*; do echo \"\$(basename \$f): \$(cat \$f)\"; done
"
```

Check the web interface: `http://phoniebox.local` or `http://PI_IP`

---

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| "User must be 'pi'" during install | Username was not set to `pi` in Imager | Re-flash SD card with username `pi` |
| SSH "Permission denied" | Password auth not applied by Imager | Connect monitor+keyboard; run `sudo passwd pi`; set `PasswordAuthentication yes` in sshd_config |
| RFID reader not detected | USB power or port issue | Try a different port; use a powered USB hub |
| "Could not find device" in RFID service | Trailing newline in deviceName.txt | Re-write using `printf` (not `echo`) |
| Audio folder invisible in web UI | Wrong ownership (pi:pi instead of pi:www-data) | `sudo chown -R pi:www-data audiofolders/` |
| Volume starts loud then drops | MPD volume normalization enabled | Set `volume_normalization "no"` in `/etc/mpd.conf` |
| Card registered but doesn't play | Shortcut file contains card ID instead of folder name | `printf 'FOLDER_NAME' > shortcuts/CARD_ID` |
| RFID stops after USB reconnect | No auto-restart on re-plug | Create udev rule (Step 6) |
| YouTube download fails (geo-blocked) | Video not available in region | Use `ytsearch1:TITLE` instead of URL |
| SSH host key warning after re-flash | Stale known_hosts entry | `ssh-keygen -R phoniebox.local` |
