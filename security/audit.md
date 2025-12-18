---
model: claude-sonnet-4-20250514
---

# Dependency Security Audit

Audit project dependencies for known vulnerabilities.

## Target
$ARGUMENTS

## Process

1. **Identify Package Manager**:
   - npm/yarn/pnpm (package.json)
   - pip (requirements.txt, pyproject.toml)
   - go mod (go.mod)
   - cargo (Cargo.toml)
   - maven/gradle (pom.xml, build.gradle)

2. **Run Audit Commands**:
   ```bash
   # Node.js
   npm audit --json

   # Python
   pip-audit

   # Go
   govulncheck ./...

   # Rust
   cargo audit
   ```

3. **Analyze Results**:
   - Identify vulnerable packages
   - Determine severity levels
   - Check for available fixes

4. **Recommend Actions**:
   - Which packages to update
   - Breaking changes to watch for
   - Alternatives for unmaintained packages

## Output

```markdown
## Audit Summary
- Total dependencies: X
- Vulnerable: Y
- Critical: Z

## Vulnerable Dependencies
| Package | Current | Fixed In | Severity | CVE |
|---------|---------|----------|----------|-----|
| ...     | ...     | ...      | ...      | ... |

## Recommended Actions
1. [Highest priority fixes]
2. [Other updates]

## Update Commands
[Commands to fix vulnerabilities]
```
