---
name: Data Validation Pipeline
description: Create comprehensive data validation systems with schema validation, quality checks, and automated monitoring for data integrity.
allowed_tools:
  - filesystem      # Access data files and validation schemas
  - memory          # Track validation patterns and data quality metrics
  - sqlite          # Store validation results and quality reports
tags:
  - data-validation
  - data-quality
  - schema-validation
  - data-integrity
  - monitoring
category: development
version: 1.0.0
author: AI Commands Team
---

# Data Validation Pipeline

Create a comprehensive data validation system for: $ARGUMENTS

Implement validation including:

1. **Schema Validation**:
   - Pydantic models for structure
   - JSON Schema generation
   - Type checking and coercion
   - Nested object validation
   - Custom validators

2. **Data Quality Checks**:
   - Null/missing value handling
   - Outlier detection
   - Statistical validation
   - Business rule enforcement
   - Referential integrity

3. **Data Profiling**:
   - Automatic type inference
   - Distribution analysis
   - Cardinality checks
   - Pattern detection
   - Anomaly identification

4. **Validation Rules**:
   - Field-level constraints
   - Cross-field validation
   - Temporal consistency
   - Format validation (email, phone, etc.)
   - Custom business logic

5. **Error Handling**:
   - Detailed error messages
   - Error categorization
   - Partial validation support
   - Error recovery strategies
   - Validation reports

6. **Performance**:
   - Streaming validation
   - Batch processing
   - Parallel validation
   - Caching strategies
   - Incremental validation

7. **Integration**:
   - API endpoint validation
   - Database constraints
   - Message queue validation
   - File upload validation
   - Real-time validation

Include data quality metrics, monitoring dashboards, and alerting. Make it extensible for custom validation rules.
