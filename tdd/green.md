---
model: claude-sonnet-4-20250514
---

# TDD Green Phase - Make Tests Pass

Implement the minimal code needed to make failing tests pass.

## Feature
$ARGUMENTS

## Prerequisites
- Failing tests exist (from `/tdd:red`)
- Tests fail for the right reasons

## Process

1. **Review Failing Tests**: Understand what each test expects:
   - Read test names and assertions
   - Identify the simplest failing test to start with

2. **Implement Minimal Code**:
   - Write just enough code to pass ONE test
   - Don't add features not required by tests
   - Don't optimize prematurely
   - Use simple, obvious implementations

3. **Run Tests After Each Change**:
   - Verify the targeted test now passes
   - Ensure no other tests broke
   - Move to next failing test

4. **Repeat Until All Green**:
   - One test at a time
   - Minimal implementation each time
   - All tests should pass when done

## Guidelines

- **YAGNI**: Don't implement what tests don't require
- **Simple first**: The ugliest working code is fine for now
- **Small steps**: One test, one implementation, verify, repeat
- **No refactoring yet**: That's the next phase

## Output

- Implementation code that passes all tests
- Confirmation that all tests pass
- Note any code that needs cleanup (for refactor phase)

## Next Step
After all tests pass, use `/tdd:refactor` to clean up the code.
