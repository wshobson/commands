---
model: claude-sonnet-4-20250514
---

# Code Review

Perform a thorough code review with actionable feedback.

## Target
$ARGUMENTS

## Review Dimensions

### 1. Correctness
- Does the code do what it's supposed to do?
- Are there logic errors or edge cases not handled?
- Are error conditions properly managed?

### 2. Security
- Input validation present?
- Injection vulnerabilities (SQL, XSS, command)?
- Sensitive data properly handled?
- Authentication/authorization correct?

### 3. Performance
- Obvious inefficiencies (N+1 queries, unnecessary loops)?
- Resource leaks (unclosed connections, memory)?
- Appropriate data structures used?

### 4. Maintainability
- Code is readable and self-documenting?
- Functions/classes have single responsibility?
- Duplication minimized?
- Tests adequate?

### 5. Style
- Follows project conventions?
- Consistent naming?
- Appropriate comments (not too many, not too few)?

## Output Format

```markdown
## Summary
[Overall assessment: Approve / Request Changes / Needs Discussion]

## Critical Issues
[Must fix before merge]

## Suggestions
[Nice to have improvements]

## Positive Notes
[What's done well]
```

## Guidelines

- Be specific: reference line numbers
- Be constructive: explain why and suggest how
- Prioritize: distinguish critical from nice-to-have
- Be respectful: review the code, not the person
