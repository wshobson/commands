---
name: Git Workflow Automation
description: Complete Git workflow using specialized agents for review, testing, and deployment readiness
allowed_tools:
  - memory          # For storing review results and commit messages
  - filesystem      # For analyzing uncommitted changes and test files
  - github          # For creating commits, pushes, and pull requests
tags:
  - git
  - code-review
  - testing
  - deployment
  - pull-request
  - workflow
category: development
version: 1.0.0
author: AI Commands Team
---

Complete Git workflow using specialized agents:

1. code-reviewer: Review uncommitted changes
2. test-automator: Ensure tests pass
3. deployment-engineer: Verify deployment readiness
4. Create commit message following conventions
5. Push and create PR with proper description

Target branch: $ARGUMENTS
