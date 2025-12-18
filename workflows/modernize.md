---
model: claude-opus-4-5-20251101
---

# Legacy Modernization Workflow

Systematically modernize legacy code while maintaining functionality.

## Target
$ARGUMENTS

## Workflow Phases

### Phase 1: Assessment
Use the Task tool with `subagent_type="Explore"`:
- "Analyze this legacy code: $ARGUMENTS. Identify: outdated patterns, deprecated dependencies, missing tests, documentation gaps, and technical debt. Map dependencies and integration points."

### Phase 2: Modernization Plan
Use the Task tool with `subagent_type="Plan"`:
- "Create a modernization plan for: $ARGUMENTS. Prioritize changes by risk and impact. Include: dependency updates, pattern refactoring, test additions, and documentation. Plan for incremental migration, not big-bang rewrites."

### Phase 3: Add Test Coverage
Use the Task tool with `subagent_type="general-purpose"`:
- "Add characterization tests for: $ARGUMENTS. These tests capture current behavior (even if buggy) to protect against regressions during modernization."

### Phase 4: Incremental Modernization
For each planned change, use Task tool with `subagent_type="general-purpose"`:
- Make one modernization change
- Run tests
- Verify no regressions
- Proceed to next change

### Phase 5: Documentation
Use the Task tool with `subagent_type="general-purpose"`:
- Update documentation
- Add inline comments for complex sections
- Document architectural decisions

## Output

- Modernized code
- New test coverage
- Updated documentation
- Summary of changes
- Remaining technical debt (if any)
