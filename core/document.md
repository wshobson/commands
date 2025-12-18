---
model: claude-sonnet-4-20250514
---

# Documentation Generator

Generate clear, useful documentation for code.

## Target
$ARGUMENTS

## Process

1. **Analyze Code**: Read and understand:
   - Public API surface
   - Function signatures and parameters
   - Return values and types
   - Side effects and exceptions

2. **Generate Documentation**:

   **For Functions/Methods**:
   - Brief description (one line)
   - Parameters with types and descriptions
   - Return value description
   - Exceptions that may be thrown
   - Usage example

   **For Classes**:
   - Class purpose and responsibility
   - Constructor parameters
   - Public methods summary
   - Usage example

   **For Modules/Files**:
   - Module purpose
   - Main exports
   - Dependencies
   - Quick start example

3. **Match Project Style**:
   - Use existing documentation format (JSDoc, docstrings, etc.)
   - Follow project conventions for tone and detail level

## Output

Documentation in the appropriate format for the language:

- Python: Google-style or NumPy-style docstrings
- JavaScript/TypeScript: JSDoc comments
- Java: Javadoc
- Go: Go doc comments
- Rust: Rustdoc comments

Include practical examples that demonstrate common usage.
