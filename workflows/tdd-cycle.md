---
model: claude-opus-4-5-20251101
---

# TDD Cycle Workflow

Complete Test-Driven Development cycle: Red → Green → Refactor.

## Feature
$ARGUMENTS

## Workflow Phases

### Phase 1: Understand Requirements
Use the Task tool with `subagent_type="Explore"`:
- "Explore the codebase to understand how to implement: $ARGUMENTS. Find existing test patterns, related code, and integration points."

### Phase 2: RED - Write Failing Tests
Use the Task tool with `subagent_type="general-purpose"`:
- "Write comprehensive FAILING tests for: $ARGUMENTS.
  - Follow existing test patterns in the codebase
  - Cover happy path, edge cases, and error scenarios
  - Use descriptive test names (should_X_when_Y)
  - Tests MUST fail when run (no implementation yet)
  - Verify tests fail for the right reason"

**Gate**: Run tests and confirm they fail appropriately before proceeding.

### Phase 3: GREEN - Minimal Implementation
Use the Task tool with `subagent_type="general-purpose"`:
- "Implement the MINIMAL code to make all tests pass for: $ARGUMENTS.
  - Write just enough code to pass tests
  - Don't add features not required by tests
  - Don't optimize yet
  - Run tests after each change"

**Gate**: All tests must pass before proceeding.

### Phase 4: REFACTOR - Clean Up
Use the Task tool with `subagent_type="general-purpose"`:
- "Refactor the implementation for: $ARGUMENTS.
  - Improve code quality while keeping tests green
  - Extract methods, rename variables, remove duplication
  - Run tests after each refactoring
  - Stop when code is clean and all tests pass"

## Output

- Complete test suite
- Clean implementation
- All tests passing
- Summary of TDD cycle iterations
