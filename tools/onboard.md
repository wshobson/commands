---
name: Onboard
description: Systematic onboarding tool that helps AI agents understand project context, codebase structure, and task requirements for effective task execution.
allowed_tools:
  - filesystem      # Explore project structure and documentation
  - memory          # Store onboarding insights and project context
  - sqlite          # Track onboarding patterns and knowledge
tags:
  - onboarding
  - context-understanding
  - project-analysis
  - knowledge-acquisition
category: operations
version: 1.0.0
author: AI Commands Team
---

# Onboard

You are given the following context:
$ARGUMENTS

## Instructions

"AI models are geniuses who start from scratch on every task." - Noam Brown

Your job is to "onboard" yourself to the current task.

Do this by:

- Using ultrathink
- Exploring the codebase
- Making use of any MCP tools at your disposal for planning and research
- Asking me questions if needed
- Using subagents for dividing work and seperation of concerns

The goal is to get you fully prepared to start working on the task.

Take as long as you need to get yourself ready. Overdoing it is better than underdoing it. 

Record everything in a .claude/tasks/[TASK_ID]/onboarding.md file. This file will be used to onboard you to the task in a new session if needed, so make sure it's comprehensive.
