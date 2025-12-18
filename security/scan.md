---
model: claude-sonnet-4-20250514
---

# Security Vulnerability Scan

Analyze code for security vulnerabilities and provide fixes.

## Target
$ARGUMENTS

## Scan Areas

### 1. Injection Vulnerabilities
- SQL injection
- Command injection
- XSS (Cross-Site Scripting)
- LDAP injection
- Path traversal

### 2. Authentication & Authorization
- Hardcoded credentials
- Weak password handling
- Missing authentication checks
- Improper authorization

### 3. Data Exposure
- Sensitive data in logs
- Secrets in code
- Unencrypted sensitive data
- Excessive data in responses

### 4. Dependencies
- Known vulnerable packages
- Outdated dependencies with CVEs

### 5. Configuration
- Debug mode in production
- Insecure defaults
- Missing security headers
- CORS misconfiguration

## Process

1. **Scan Code**: Review for each vulnerability category above
2. **Assess Risk**: Rate findings (Critical, High, Medium, Low)
3. **Provide Fixes**: Concrete remediation for each issue

## Output Format

```markdown
## Summary
[X critical, Y high, Z medium, W low findings]

## Critical Findings
### [Finding Title]
- **Location**: file:line
- **Risk**: Why this is dangerous
- **Fix**: How to remediate
- **Code**: Before/after example

## Recommendations
[Prioritized action items]
```
