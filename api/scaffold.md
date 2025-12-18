---
model: claude-sonnet-4-20250514
---

# API Scaffold Generator

Generate a complete REST API endpoint with best practices.

## Requirements
$ARGUMENTS

## Process

1. **Detect Framework**: Identify the project's API framework:
   - Python: FastAPI, Django REST, Flask
   - Node.js: Express, Fastify, NestJS
   - Go: Gin, Echo, Chi
   - Java: Spring Boot
   - Use existing patterns in the codebase

2. **Generate Components**:

   **Route/Controller**:
   - RESTful endpoint handlers (GET, POST, PUT, DELETE)
   - Request validation
   - Response formatting
   - Error handling

   **Models/Schema**:
   - Data models/entities
   - Request/response DTOs
   - Validation rules

   **Service Layer** (if pattern exists):
   - Business logic
   - Data access abstraction

3. **Include**:
   - Input validation
   - Proper HTTP status codes
   - Error responses
   - Type definitions/hints

4. **Match Project Style**:
   - Follow existing naming conventions
   - Use established patterns
   - Consistent with other endpoints

## Output

Complete, working API endpoint code including:
- Route definitions
- Request/response models
- Basic validation
- Standard error handling

Files placed in appropriate project locations.
