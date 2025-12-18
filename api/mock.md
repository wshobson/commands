---
model: claude-sonnet-4-20250514
---

# API Mock Server

Create a mock server for API testing and development.

## API to Mock
$ARGUMENTS

## Process

1. **Analyze API Specification**:
   - Read OpenAPI/Swagger spec if available
   - Or analyze existing API code
   - Identify endpoints, methods, request/response shapes

2. **Generate Mock Server**:
   - Use appropriate tool for project (MSW, json-server, WireMock, etc.)
   - Create mock responses for each endpoint
   - Include realistic sample data

3. **Include**:
   - All CRUD operations
   - Realistic response delays (optional)
   - Error responses for testing
   - Different scenarios (empty lists, single item, many items)

4. **Setup Instructions**:
   - How to start the mock server
   - How to integrate with tests
   - How to customize responses

## Output

- Mock server configuration
- Sample response data
- Setup/run instructions
- Integration examples for tests
