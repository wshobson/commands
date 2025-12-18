---
model: claude-opus-4-5-20251101
---

# Intelligent Fix Workflow

Systematically diagnose and fix issues with root cause analysis.

## Problem
$ARGUMENTS

## Workflow Phases

### Phase 1: Understand the Problem
Use the Task tool with `subagent_type="Explore"`:
- "Investigate this issue: $ARGUMENTS. Find relevant code, error sources, and potential causes. Trace the code path involved."

### Phase 2: Diagnose Root Cause
Analyze the exploration results:
- What is the immediate cause of the error?
- What is the underlying root cause?
- Are there related issues that should be fixed together?

### Phase 3: Plan the Fix
Use the Task tool with `subagent_type="Plan"`:
- "Plan a fix for: $ARGUMENTS. Based on the investigation, design a solution that addresses the root cause, not just symptoms. Consider side effects and regression risks."

### Phase 4: Implement Fix
Use the Task tool with `subagent_type="general-purpose"`:
- Execute the planned fix
- Make minimal, focused changes
- Add or update tests to prevent regression

### Phase 5: Verify
- Run tests to confirm fix works
- Check for regressions
- Verify the original issue is resolved

## Output

```markdown
## Root Cause
[What caused the issue]

## Fix Applied
[Changes made]

## Files Modified
[List of files]

## Tests
[New/updated tests]

## Verification
[How the fix was verified]

## Prevention
[How to prevent similar issues]
```
