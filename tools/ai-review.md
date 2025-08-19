---
name: AI/ML Code Review
description: Specialized code review tool for AI/ML projects, focusing on model quality, data handling, LLM implementation, and production readiness. Analyzes reproducibility, prompt injection prevention, privacy compliance, and performance optimization.
allowed_tools:
  - filesystem      # Code file analysis
  - memory          # Track review patterns
  - sqlite          # Store review metrics
tags:
  - ai-ml
  - code-review
  - model-validation
  - data-science
  - llm-optimization
category: development
version: 1.0.0
author: AI Commands Team
---

# AI/ML Code Review

Perform a specialized AI/ML code review for: $ARGUMENTS

Conduct comprehensive review focusing on:

1. **Model Code Quality**:
   - Reproducibility checks
   - Random seed management
   - Data leakage detection
   - Train/test split validation
   - Feature engineering clarity

2. **AI Best Practices**:
   - Prompt injection prevention
   - Token limit handling
   - Cost optimization
   - Fallback strategies
   - Timeout management

3. **Data Handling**:
   - Privacy compliance (PII handling)
   - Data versioning
   - Preprocessing consistency
   - Batch processing efficiency
   - Memory optimization

4. **Model Management**:
   - Version control for models
   - A/B testing setup
   - Rollback capabilities
   - Performance benchmarks
   - Drift detection

5. **LLM-Specific Checks**:
   - Context window management
   - Prompt template security
   - Response validation
   - Streaming implementation
   - Rate limit handling

6. **Vector Database Review**:
   - Embedding consistency
   - Index optimization
   - Query performance
   - Metadata management
   - Backup strategies

7. **Production Readiness**:
   - GPU/CPU optimization
   - Batching strategies
   - Caching implementation
   - Monitoring hooks
   - Error recovery

8. **Testing Coverage**:
   - Unit tests for preprocessing
   - Integration tests for pipelines
   - Model performance tests
   - Edge case handling
   - Mocked LLM responses

Provide specific recommendations with severity levels (Critical/High/Medium/Low). Include code examples for improvements and links to relevant best practices.
