---
model: claude-sonnet-4-20250514
---

# Monitoring Setup

Configure monitoring, alerting, and observability.

## Application
$ARGUMENTS

## Components

### 1. Metrics
- Application metrics (request rate, latency, errors)
- Business metrics (signups, orders, etc.)
- Infrastructure metrics (CPU, memory, disk)

### 2. Logging
- Structured logging format
- Log levels configuration
- Log aggregation setup

### 3. Tracing (if applicable)
- Distributed tracing setup
- Span configuration
- Trace sampling

### 4. Alerting
- SLO-based alerts
- Error rate thresholds
- Latency thresholds
- Resource utilization alerts

## Process

1. **Detect Stack**: Identify existing monitoring tools:
   - Prometheus/Grafana
   - DataDog
   - New Relic
   - CloudWatch
   - Custom

2. **Generate Configuration**:
   - Metrics instrumentation code
   - Dashboard definitions
   - Alert rules

3. **Provide**:
   - Setup instructions
   - Key metrics to watch
   - Recommended alert thresholds

## Output

- Instrumentation code for the application
- Dashboard configuration (Grafana JSON, etc.)
- Alert rule definitions
- Runbook for common alerts
