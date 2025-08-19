---
name: Comprehensive Code Review
description: Perform a comprehensive review using multiple specialized agents with explicit Task tool invocations
allowed_tools:
  - memory          # For storing review findings from each specialized agent
  - filesystem      # For analyzing code, architecture, and test files
tags:
  - code-review
  - security
  - architecture
  - performance
  - testing
  - workflow
category: development
version: 2.0.0
author: AI Commands Team
---

Perform a comprehensive review using multiple specialized agents with explicit Task tool invocations:

[Extended thinking: This workflow performs a thorough multi-perspective review by orchestrating specialized review agents. Each agent examines different aspects and the results are consolidated into a unified action plan.]

Execute parallel reviews using Task tool with specialized agents:

## 1. Code Quality Review
- Use Task tool with subagent_type="code-reviewer"
- Prompt: "Review code quality and maintainability for: $ARGUMENTS. Check for code smells, readability, documentation, and adherence to best practices."
- Focus: Clean code principles, SOLID, DRY, naming conventions

## 2. Security Audit
- Use Task tool with subagent_type="security-auditor"
- Prompt: "Perform security audit on: $ARGUMENTS. Check for vulnerabilities, OWASP compliance, authentication issues, and data protection."
- Focus: Injection risks, authentication, authorization, data encryption

## 3. Architecture Review
- Use Task tool with subagent_type="architect-reviewer"
- Prompt: "Review architectural design and patterns in: $ARGUMENTS. Evaluate scalability, maintainability, and adherence to architectural principles."
- Focus: Service boundaries, coupling, cohesion, design patterns

## 4. Performance Analysis
- Use Task tool with subagent_type="performance-engineer"
- Prompt: "Analyze performance characteristics of: $ARGUMENTS. Identify bottlenecks, resource usage, and optimization opportunities."
- Focus: Response times, memory usage, database queries, caching

## 5. Test Coverage Assessment
- Use Task tool with subagent_type="test-automator"
- Prompt: "Evaluate test coverage and quality for: $ARGUMENTS. Assess unit tests, integration tests, and identify gaps in test coverage."
- Focus: Coverage metrics, test quality, edge cases, test maintainability

## Consolidated Report Structure
Compile all feedback into a unified report:
- **Critical Issues** (must fix): Security vulnerabilities, broken functionality, architectural flaws
- **Recommendations** (should fix): Performance bottlenecks, code quality issues, missing tests
- **Suggestions** (nice to have): Refactoring opportunities, documentation improvements
- **Positive Feedback** (what's done well): Good practices to maintain and replicate

Target: $ARGUMENTS
