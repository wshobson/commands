---
name: Feature Development Workflow
description: Implement a new feature using specialized agents with explicit Task tool invocations
allowed_tools:
  - memory          # For storing API designs and component specifications
  - filesystem      # For implementing frontend, backend, and test code
tags:
  - feature-development
  - backend
  - frontend
  - testing
  - deployment
  - workflow
category: development
version: 2.0.0
author: AI Commands Team
---

Implement a new feature using specialized agents with explicit Task tool invocations:

[Extended thinking: This workflow orchestrates multiple specialized agents to implement a complete feature from design to deployment. Each agent receives context from previous agents to ensure coherent implementation.]

Use the Task tool to delegate to specialized agents in sequence:

1. **Backend Architecture Design**
   - Use Task tool with subagent_type="backend-architect" 
   - Prompt: "Design RESTful API and data model for: $ARGUMENTS. Include endpoint definitions, database schema, and service boundaries."
   - Save the API design and schema for next agents

2. **Frontend Implementation**
   - Use Task tool with subagent_type="frontend-developer"
   - Prompt: "Create UI components for: $ARGUMENTS. Use the API design from backend-architect: [include API endpoints and data models from step 1]"
   - Ensure UI matches the backend API contract

3. **Test Coverage**
   - Use Task tool with subagent_type="test-automator"
   - Prompt: "Write comprehensive tests for: $ARGUMENTS. Cover both backend API endpoints: [from step 1] and frontend components: [from step 2]"
   - Include unit, integration, and e2e tests

4. **Production Deployment**
   - Use Task tool with subagent_type="deployment-engineer"
   - Prompt: "Prepare production deployment for: $ARGUMENTS. Include CI/CD pipeline, containerization, and monitoring for the implemented feature."
   - Ensure all components from previous steps are deployment-ready

Aggregate results from all agents and present a unified implementation plan.

Feature description: $ARGUMENTS
