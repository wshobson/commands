---
model: claude-opus-4-5-20251101
---

# Feature Development Workflow

End-to-end feature implementation with multi-phase orchestration.

## Feature
$ARGUMENTS

## Workflow Phases

### Phase 1: Discovery
Use the Task tool with `subagent_type="Explore"` to understand the codebase:
- "Find all files related to [feature area]. Identify existing patterns, data models, and integration points. Map the architecture relevant to implementing: $ARGUMENTS"

**Output needed**: List of relevant files, existing patterns to follow, integration points.

### Phase 2: Planning
Use the Task tool with `subagent_type="Plan"` to design the implementation:
- "Design the implementation for: $ARGUMENTS. Based on the codebase exploration, create a step-by-step plan including: files to modify, new files to create, data model changes, API changes, and testing approach. Consider edge cases and error handling."

**Output needed**: Detailed implementation plan with specific files and changes.

### Phase 3: Implementation
Use the Task tool with `subagent_type="general-purpose"` for each implementation step:
- Execute the plan step by step
- Implement backend changes first
- Then frontend/UI changes
- Run tests after each significant change

### Phase 4: Testing
Use the Task tool with `subagent_type="general-purpose"`:
- "Write comprehensive tests for the implemented feature: $ARGUMENTS. Include unit tests, integration tests, and edge cases. Ensure all tests pass."

### Phase 5: Verification
- Run full test suite
- Verify feature works end-to-end
- Check for regressions

## Output

- Summary of all changes made
- Files created/modified
- Test coverage
- Any remaining TODOs or follow-up items
