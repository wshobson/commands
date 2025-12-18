---
model: claude-sonnet-4-20250514
---

# TDD Refactor Phase - Improve Code Quality

Clean up implementation while keeping all tests green.

## Target
$ARGUMENTS

## Prerequisites
- All tests are passing (from `/tdd:green`)
- Implementation is functionally complete

## Process

1. **Identify Improvements**:
   - Duplicated code to extract
   - Long methods to break down
   - Unclear names to rename
   - Complex logic to simplify
   - Missing abstractions

2. **Refactor Incrementally**:
   - Make ONE small change
   - Run tests immediately
   - If tests fail, undo and try smaller change
   - If tests pass, commit mentally and continue

3. **Common Refactorings**:
   - Extract method/function
   - Rename variable/function
   - Simplify conditional
   - Remove duplication
   - Improve encapsulation

4. **Stop When Clean**:
   - Code is readable
   - No obvious duplication
   - Single responsibility respected
   - Tests still all pass

## Rules

- **Never break tests**: Every refactoring must keep tests green
- **Small steps**: If a refactoring is risky, break it down
- **No new features**: Only restructure existing code
- **Trust the tests**: They protect you during refactoring

## Output

- Cleaned up implementation
- All tests still passing
- Summary of refactorings made
- Any remaining technical debt noted

## TDD Cycle Complete
Feature is implemented with clean code and comprehensive tests.
