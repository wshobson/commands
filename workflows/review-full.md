---
model: claude-opus-4-5-20251101
---

# Comprehensive Code Review Workflow

Multi-dimensional code review covering correctness, security, performance, and maintainability.

## Target
$ARGUMENTS

## Workflow Phases

### Phase 1: Understand Context
Use the Task tool with `subagent_type="Explore"`:
- "Explore the code context for: $ARGUMENTS. Understand what this code does, how it integrates with the rest of the system, and what patterns it should follow."

### Phase 2: Correctness Review
Use the Task tool with `subagent_type="general-purpose"`:
- "Review for correctness: $ARGUMENTS.
  - Does the code do what it's supposed to?
  - Are there logic errors or missed edge cases?
  - Is error handling adequate?
  - Are there race conditions or concurrency issues?"

### Phase 3: Security Review
Use the Task tool with `subagent_type="general-purpose"`:
- "Review for security: $ARGUMENTS.
  - Injection vulnerabilities (SQL, XSS, command)?
  - Authentication/authorization issues?
  - Sensitive data exposure?
  - Input validation?"

### Phase 4: Performance Review
Use the Task tool with `subagent_type="general-purpose"`:
- "Review for performance: $ARGUMENTS.
  - Obvious inefficiencies (N+1 queries, unnecessary loops)?
  - Resource leaks?
  - Appropriate data structures?
  - Scalability concerns?"

### Phase 5: Maintainability Review
Use the Task tool with `subagent_type="general-purpose"`:
- "Review for maintainability: $ARGUMENTS.
  - Code readability and clarity?
  - Single responsibility principle?
  - Test coverage adequate?
  - Documentation sufficient?"

## Output

```markdown
## Summary
[Approve / Request Changes / Needs Discussion]

## Critical Issues (Must Fix)
[Blocking issues]

## Security Concerns
[Security findings]

## Performance Issues
[Performance findings]

## Suggestions (Nice to Have)
[Improvements]

## Positive Notes
[What's done well]
```
