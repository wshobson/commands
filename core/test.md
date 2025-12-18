---
model: claude-sonnet-4-20250514
---

# Test Generation

Generate comprehensive tests for the specified code.

## Target
$ARGUMENTS

## Process

1. **Analyze the Code**: Read and understand:
   - Function signatures and return types
   - Input validation and edge cases
   - Error conditions and exceptions
   - Dependencies and side effects

2. **Identify Test Cases**:
   - Happy path scenarios
   - Edge cases (empty, null, boundary values)
   - Error scenarios
   - Integration points

3. **Generate Tests**:
   - Use the project's existing test framework
   - Follow existing test patterns and conventions
   - Use descriptive test names (should_X_when_Y)
   - Apply Arrange-Act-Assert pattern

4. **Include**:
   - Unit tests for isolated logic
   - Integration tests for component interaction
   - Appropriate mocks/stubs for dependencies

## Test Structure

```
describe('ComponentName', () => {
  describe('methodName', () => {
    it('should return X when given Y', () => {
      // Arrange
      // Act
      // Assert
    });
  });
});
```

## Output

- Complete test file(s) matching project conventions
- Coverage of identified test cases
- Instructions to run the tests
