---
model: claude-sonnet-4-20250514
---

# Deployment Checklist

Generate a comprehensive pre-deployment checklist.

## Deployment
$ARGUMENTS

## Checklist Categories

### Code Readiness
- [ ] All tests passing
- [ ] Code reviewed and approved
- [ ] No TODO/FIXME in critical paths
- [ ] Feature flags configured
- [ ] Debug code removed

### Security
- [ ] No secrets in code
- [ ] Dependencies scanned
- [ ] Security review completed
- [ ] Access controls verified

### Database
- [ ] Migrations tested
- [ ] Rollback plan exists
- [ ] Backup verified
- [ ] Performance impact assessed

### Infrastructure
- [ ] Resource limits configured
- [ ] Health checks working
- [ ] Logging configured
- [ ] Monitoring/alerts set up

### Documentation
- [ ] Changelog updated
- [ ] Runbook updated
- [ ] API docs current

### Rollback Plan
- [ ] Previous version tagged
- [ ] Rollback procedure documented
- [ ] Rollback tested

## Process

1. **Analyze Changes**: Review what's being deployed
2. **Generate Checklist**: Customize based on change type
3. **Identify Risks**: Flag high-risk items

## Output

Customized checklist for this specific deployment with:
- Applicable items checked/unchecked
- Risk assessment
- Rollback procedure
- Post-deployment verification steps
