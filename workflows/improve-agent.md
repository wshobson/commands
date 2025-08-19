---
name: Agent Improvement Workflow
description: Improve an existing agent based on recent performance analysis and user feedback
allowed_tools:
  - memory          # For analyzing agent performance patterns and storing improvements
  - filesystem      # For updating agent configurations and prompts
tags:
  - agent-improvement
  - performance-analysis
  - optimization
  - workflow
category: development
version: 1.0.0
author: AI Commands Team
---

Improve an existing agent based on recent performance:

1. Analyze recent uses of: $ARGUMENTS
2. Identify patterns in:
   - Failed tasks
   - User corrections
   - Suboptimal outputs
3. Update the agent's prompt with:
   - New examples
   - Clarified instructions
   - Additional constraints
4. Test on recent scenarios
5. Save improved version
