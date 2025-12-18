---
model: claude-sonnet-4-20250514
---

# Code Explanation

Explain code clearly with visual diagrams and step-by-step breakdowns.

## Target
$ARGUMENTS

## Process

1. **Read the Code**: Use the Read tool to examine the specified file(s) or code section

2. **Analyze Structure**: Identify:
   - Main purpose and responsibility
   - Key functions/classes and their roles
   - Data flow and control flow
   - Dependencies and integrations

3. **Create Visual Representation**: Generate a Mermaid diagram showing:
   - For functions: flowchart of logic
   - For classes: class diagram with relationships
   - For systems: component/sequence diagrams

4. **Explain Step-by-Step**:
   - Start with high-level overview (what it does)
   - Break down into logical sections
   - Explain complex parts with examples
   - Highlight patterns and design decisions

5. **Identify**:
   - Key concepts a reader should understand
   - Potential gotchas or non-obvious behavior
   - Related code they should also review

## Output Format

```markdown
## Overview
[1-2 sentence summary]

## Visual Diagram
[Mermaid diagram]

## Detailed Explanation
[Step-by-step breakdown]

## Key Concepts
[List of important concepts used]

## Related Code
[Files/functions to explore next]
```
