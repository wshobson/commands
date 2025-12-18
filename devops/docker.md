---
model: claude-sonnet-4-20250514
---

# Docker Optimization

Optimize Dockerfile and container configuration for production.

## Target
$ARGUMENTS

## Analysis Areas

### 1. Image Size
- Use minimal base images (alpine, distroless, slim)
- Multi-stage builds
- Remove unnecessary files
- Combine RUN commands

### 2. Build Performance
- Layer ordering (least changing first)
- .dockerignore optimization
- Cache utilization
- Parallel builds

### 3. Security
- Non-root user
- Minimal installed packages
- No secrets in image
- Read-only filesystem where possible
- Security scanning

### 4. Runtime
- Health checks
- Proper signal handling
- Resource limits
- Logging configuration

## Process

1. **Review Current Dockerfile**: Identify optimization opportunities
2. **Apply Improvements**: Implement best practices
3. **Verify**: Ensure application still works

## Output

- Optimized Dockerfile
- .dockerignore improvements
- docker-compose.yml updates (if applicable)
- Before/after image size comparison
- Build time improvements
