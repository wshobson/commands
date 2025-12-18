---
model: claude-sonnet-4-20250514
---

# Kubernetes Manifest Generator

Generate production-ready Kubernetes manifests.

## Application
$ARGUMENTS

## Process

1. **Analyze Application**:
   - Type (web service, worker, cron job)
   - Resource requirements
   - Configuration needs
   - Dependencies (databases, caches)

2. **Generate Manifests**:

   **Core Resources**:
   - Deployment/StatefulSet
   - Service
   - ConfigMap/Secret references
   - ServiceAccount

   **Production Essentials**:
   - Resource requests/limits
   - Liveness/readiness probes
   - Pod disruption budget
   - Horizontal pod autoscaler

   **Security**:
   - SecurityContext (non-root, read-only)
   - NetworkPolicy
   - RBAC (if needed)

3. **Configuration**:
   - Environment-specific values via ConfigMaps
   - Secrets for sensitive data
   - Kustomize overlays or Helm values (if used)

## Output

```yaml
# deployment.yaml
# service.yaml
# configmap.yaml
# hpa.yaml (if applicable)
# networkpolicy.yaml
```

With comments explaining key configuration choices.
