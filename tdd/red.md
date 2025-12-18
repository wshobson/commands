---
model: claude-sonnet-4-20250514
---

# TDD Red Phase - Write Failing Tests

Write comprehensive failing tests that define expected behavior before implementation.

## Feature
$ARGUMENTS

## Process

1. **Understand Requirements**: Clarify what the feature should do:
   - Expected inputs and outputs
   - Edge cases and boundaries
   - Error conditions

2. **Design Test Cases**:
   - Happy path (normal operation)
   - Edge cases (empty, null, min/max values)
   - Error scenarios (invalid input, failures)
   - Boundary conditions

3. **Write Failing Tests**:
   - Use project's existing test framework
   - Follow `should_X_when_Y` naming convention
   - One assertion per test when possible
   - Use Arrange-Act-Assert pattern

4. **Verify Failures**:
   - Run tests to confirm they fail
   - Ensure they fail for the RIGHT reason (missing implementation, not syntax errors)
   - Failure messages should guide implementation

## Test Template

```
describe('FeatureName', () => {
  it('should [expected behavior] when [condition]', () => {
    // Arrange - set up test data

    // Act - call the code under test

    // Assert - verify expected outcome
  });
});
```

## Output

- Complete test file with all test cases
- Tests that FAIL when run (no implementation yet)
- Clear failure messages indicating what needs to be implemented
- Run command to execute tests

## Next Step
After tests are written, use `/tdd:green` to implement minimal code to pass.
