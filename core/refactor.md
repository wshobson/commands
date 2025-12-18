---
model: claude-sonnet-4-20250514
---

# Code Refactoring

Improve code quality while preserving behavior.

## Target
$ARGUMENTS

## Process

1. **Analyze Current State**: Read the code and identify:
   - Code smells (duplication, long methods, large classes)
   - Complexity issues (deep nesting, unclear logic)
   - Naming problems (unclear variables, misleading names)
   - SOLID principle violations

2. **Plan Refactoring**: Determine safe improvements:
   - Extract methods/functions for clarity
   - Rename for better readability
   - Simplify conditionals
   - Remove dead code
   - Reduce coupling

3. **Execute Changes**:
   - Make one logical change at a time
   - Preserve all existing behavior
   - Follow existing code style conventions
   - Keep changes minimal and focused

4. **Verify**: Ensure tests still pass (if they exist)

## Guidelines

- Never change functionality - only structure
- Prefer small, incremental changes
- If unsure about a change, don't make it
- Document non-obvious refactoring decisions

## Output

Provide:
- Summary of changes made
- Before/after comparison of key sections
- Any suggestions for further improvements (don't implement)
