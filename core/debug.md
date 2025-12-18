---
model: claude-sonnet-4-20250514
---

# Debug Assistant

Systematically debug issues and find root causes.

## Problem
$ARGUMENTS

## Process

1. **Gather Information**:
   - Read error messages and stack traces
   - Identify the failing code path
   - Check recent changes that might have caused the issue

2. **Reproduce**: Understand the conditions that trigger the bug

3. **Isolate**: Narrow down the problem:
   - Which file(s) are involved?
   - Which function is failing?
   - What input causes the failure?

4. **Analyze Root Cause**:
   - Trace data flow to find where it diverges from expected
   - Check for common issues:
     - Null/undefined values
     - Type mismatches
     - Off-by-one errors
     - Race conditions
     - Missing error handling

5. **Fix**: Implement the minimal change to resolve the issue

6. **Verify**: Confirm the fix works and doesn't break other things

## Output

```markdown
## Root Cause
[Explanation of why the bug occurred]

## Fix
[The change made to resolve it]

## Verification
[How to confirm the fix works]

## Prevention
[How to avoid similar bugs in the future]
```
