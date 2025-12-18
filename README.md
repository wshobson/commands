# Claude Code Slash Commands

Production-ready slash commands for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) that extend its capabilities with focused automation tools and multi-step workflows.

## Overview

This repository provides **~25 focused slash commands** organized by domain:

| Category | Commands | Purpose |
|----------|----------|---------|
| **core/** | 6 | Essential everyday tools (explain, refactor, test, debug, review, document) |
| **tdd/** | 3 | Test-Driven Development cycle (red, green, refactor) |
| **api/** | 2 | API development (scaffold, mock) |
| **security/** | 2 | Security analysis (scan, audit) |
| **devops/** | 4 | Infrastructure (docker, k8s, deploy, monitor) |
| **workflows/** | 5 | Multi-step orchestrations (feature, tdd-cycle, fix, review-full, modernize) |

## Installation

```bash
cd ~/.claude
git clone https://github.com/wshobson/commands.git
```

## Usage

Commands are invoked with directory prefixes:

```bash
# Core tools
/core:explain src/auth/middleware.ts
/core:refactor the user validation logic
/core:test the payment service

# TDD cycle
/tdd:red user registration with email verification
/tdd:green                    # implement to pass tests
/tdd:refactor                 # clean up the code

# API development
/api:scaffold REST endpoints for order management
/api:mock the external payment API

# Security
/security:scan the authentication module
/security:audit               # check dependencies for CVEs

# DevOps
/devops:docker optimize the Dockerfile
/devops:k8s generate manifests for the API service
/devops:deploy create pre-deployment checklist
/devops:monitor set up observability

# Workflows (multi-step orchestration)
/workflows:feature implement user notifications
/workflows:tdd-cycle shopping cart with discounts
/workflows:fix the memory leak in worker processes
/workflows:review-full the new payment integration
/workflows:modernize the legacy auth module
```

## Command Types

### Tools (core/, tdd/, api/, security/, devops/)

Single-purpose utilities that perform focused tasks:
- Fast execution (5-30 seconds)
- Clear input → output
- Use `claude-sonnet-4-20250514` for efficiency

### Workflows (workflows/)

Multi-step orchestrations that coordinate complex tasks:
- Use the Task tool with real subagent types (`Explore`, `Plan`, `general-purpose`)
- Phased execution with gates between steps
- Use `claude-opus-4-5-20251101` for complex reasoning

## Models Used

| Model | Use Case |
|-------|----------|
| `claude-opus-4-5-20251101` | Complex workflows requiring extended thinking |
| `claude-sonnet-4-20250514` | Focused tools and single-step operations |

## Subagent Types

Workflows use these **real** Claude Code subagent types:

| Type | Purpose |
|------|---------|
| `Explore` | Codebase exploration and discovery |
| `Plan` | Implementation planning and design |
| `general-purpose` | Execution of planned tasks |

## Directory Structure

```
commands/
├── core/           # Essential tools
│   ├── explain.md
│   ├── refactor.md
│   ├── test.md
│   ├── debug.md
│   ├── review.md
│   └── document.md
├── tdd/            # TDD cycle
│   ├── red.md
│   ├── green.md
│   └── refactor.md
├── api/            # API development
│   ├── scaffold.md
│   └── mock.md
├── security/       # Security tools
│   ├── scan.md
│   └── audit.md
├── devops/         # Infrastructure
│   ├── docker.md
│   ├── k8s.md
│   ├── deploy.md
│   └── monitor.md
├── workflows/      # Multi-step orchestrations
│   ├── feature.md
│   ├── tdd-cycle.md
│   ├── fix.md
│   ├── review-full.md
│   └── modernize.md
├── scripts/
│   └── validate.sh # Command validation
└── README.md
```

## Validation

Validate all commands:

```bash
./scripts/validate.sh
```

Checks for:
- Valid model names
- Valid subagent types
- Required placeholders
- File size limits

## Design Principles

1. **Concise**: Commands are under 100 lines, focused on essential guidance
2. **Real subagents**: Only uses actual Claude Code subagent types
3. **Correct models**: Uses proper API model identifiers
4. **No pseudo-code**: Instructions Claude can actually follow
5. **Composable**: Commands can be chained for complex workflows

## Creating New Commands

Use this template:

```markdown
---
model: claude-sonnet-4-20250514
---

# Command Name

Brief description.

## Target
$ARGUMENTS

## Process

1. **Step One**: What to do
2. **Step Two**: What to do next

## Output

What gets produced.
```

For workflows, use `claude-opus-4-5-20251101` and include Task tool invocations with real subagent types.

## License

MIT License - See LICENSE file.

## Contributing

1. Follow the design principles above
2. Run `./scripts/validate.sh` before submitting
3. Keep commands focused and concise
