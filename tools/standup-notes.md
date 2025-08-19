---
name: Standup Notes Generator
description: Generate daily standup notes by reviewing project context, Obsidian vault information, and Jira tickets for efficient team communication.
allowed_tools:
  - filesystem      # Access project files and documentation
  - memory          # Track progress and project updates
  - sqlite          # Store standup history and project metrics
tags:
  - standup
  - team-communication
  - progress-tracking
  - jira-integration
  - documentation
category: operations
version: 1.0.0
author: AI Commands Team
---

# Standup Notes Generator

Generate daily standup notes by reviewing Obsidian vault context and Jira tickets.

## Usage
```
/standup-notes
```

## Process

1. **Gather Context from Obsidian**
   - Use `mcp__mcp-obsidian__obsidian_get_recent_changes` to find recently modified files
   - Use `mcp__mcp-obsidian__obsidian_get_recent_periodic_notes` to get recent daily notes
   - Look for project updates, completed tasks, and ongoing work

2. **Check Jira Tickets**
   - Use `mcp__atlassian__searchJiraIssuesUsingJql` to find tickets assigned to current user
   - Filter for:
     - In Progress tickets (current work)
     - Recently resolved/closed tickets (yesterday's accomplishments)
     - Upcoming/todo tickets (today's planned work)

3. **Generate Standup Notes**
   Format:
   ```
   Morning!
   Yesterday:
   
   • [Completed tasks from Jira and Obsidian notes]
   • [Key accomplishments and milestones]
   
   Today:
   
   • [In-progress Jira tickets]
   • [Planned work from tickets and notes]
   • [Meetings from calendar/notes]
   
   Note: [Any blockers, dependencies, or important context]
   ```

4. **Write to Obsidian**
   - Create file in `Standup Notes/YYYY-MM-DD.md` format
   - Use `mcp__mcp-obsidian__obsidian_append_content` to write the generated notes

## Implementation Steps

1. Get current user info from Atlassian
2. Search for recent Obsidian changes (last 2 days)
3. Query Jira for:
   - `assignee = currentUser() AND (status CHANGED FROM "In Progress" TO "Done" DURING (-1d, now()) OR resolutiondate >= -1d)`
   - `assignee = currentUser() AND status = "In Progress"`
   - `assignee = currentUser() AND status in ("To Do", "Open") AND (sprint in openSprints() OR priority in (High, Highest))`
4. Parse and categorize findings
5. Generate formatted standup notes
6. Save to Obsidian vault

## Context Extraction Patterns

- Look for keywords: "completed", "finished", "deployed", "released", "fixed", "implemented"
- Extract meeting notes and action items
- Identify blockers or dependencies mentioned
- Pull sprint goals and objectives