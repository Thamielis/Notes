
# Plan: Synchronize Task-Orchestrator → Jira Cloud and Create Confluence Pages (Space Key: UTWL)

This plan describes an end-to-end, idempotent synchronization of the MCP Task-Orchestrator project “Sync-AD2CISign” into Jira Cloud (project key AD2CI) and the creation of relevant Confluence pages in space UTWL, using MCP tools only (no repo script). It includes discovery, mapping, idempotency design, and concrete command templates.

---

## Assumptions, Scope, and Open Questions

- Assumptions
  - MCP Task-Orchestrator is running and reachable via Docker MCP gateway.
  - Project ID (Task-Orchestrator): de68f54f-e30c-4f0a-88e7-ad369e434a26 (already resolved).
  - Atlassian MCP server (“atlassian”) is enabled in Docker MCP gateway.
  - Jira Cloud project key: AD2CI.
  - Confluence space key: UTWL.
  - Credentials for Jira/Confluence (Cloud) will be provided as secrets to the “atlassian” MCP server.

- Open questions (clarify for precise behavior)
  - Which Jira issue types do you prefer for “tasks”? Story vs Task? (Default below: Epic for features; Task for tasks.)
  - Do you want updates (title/description) to overwrite Jira on subsequent syncs or only create once?
  - Should we push Jira keys back into Task-Orchestrator (recommended for idempotent upserts)?

- Out-of-scope
  - Custom Jira workflows/fields beyond standard epic/task creation and linking.
  - Attachments, advanced formatting beyond basic Markdown on Confluence pages.

---

## High-Level Strategy

1. Prepare MCP environment (required servers, credentials).
2. Extract authoritative data from Task-Orchestrator (projects → features → tasks).
3. Synchronize Jira
   - Epics (from features), idempotent upsert.
   - Tasks (from tasks), idempotent upsert.
   - Link tasks to their epic.
   - Label and/or embed external references to guarantee idempotency on re-runs.
4. Create/update Confluence pages in space UTWL:
   - Project Overview page: links to Jira project and epics, summary stats.
   - One page per Feature including a task table and deep links to Jira issues.
5. Persist mappings back into Task-Orchestrator (recommended):
   - Add a section/tag to each feature/task capturing Jira issue keys (and Confluence page URLs).
6. Validate, report, and define re-run behavior (idempotency).

---

## Step 1 — Prepare MCP Environment

- Enable Atlassian server (already enabled; included for completeness):

```powershell
docker mcp server enable atlassian
```

- Set Jira/Confluence secrets (Cloud API token method). Replace placeholders with real values:

```powershell
docker mcp secret set atlassian.JIRA_URL=https://your-domain.atlassian.net
docker mcp secret set atlassian.JIRA_USERNAME=your.email@domain.com
docker mcp secret set atlassian.JIRA_API_TOKEN=your_api_token

docker mcp secret set atlassian.CONFLUENCE_URL=https://your-domain.atlassian.net/wiki
docker mcp secret set atlassian.CONFLUENCE_USERNAME=your.email@domain.com
docker mcp secret set atlassian.CONFLUENCE_API_TOKEN=your_confluence_token
```

- Verify Jira/Confluence tool visibility:

```powershell
docker mcp tools list --format=json | ConvertFrom-Json | Where-Object { $_.name -match '^jira_' -or $_.name -match '^confluence_' } | Select-Object -ExpandProperty name
```

---

## Step 2 — Extract Data from Task-Orchestrator

- Get features (to become epics):

```powershell
docker mcp tools call search_features projectId=de68f54f-e30c-4f0a-88e7-ad369e434a26 limit=200 --verbose
```

- Get tasks (to become Jira issues):

```powershell
docker mcp tools call search_tasks projectId=de68f54f-e30c-4f0a-88e7-ad369e434a26 limit=1000 --verbose
```

Recommended: Capture both outputs, parse JSON, and construct:

- Feature map: featureId → { name, summary, tags }
- Task list with feature association (task.featureId), title, summary, priority, status.

---

## Step 3 — Idempotent Jira Upsert Design

- Labels: Add a durable label to all issues created by the sync:
  - label: orchestrator-sync
- External reference: Include the Task-Orchestrator entity ID in the Jira issue description (or as an extra label) to enable deterministic lookups on re-run:
  - label: orchestrator-id-<UUID> (for tasks), orchestrator-feature-<UUID> (for epics)
  - or include: “Orchestrator ID: <UUID>” in the description.

- Upsert pattern:
  1) Search for an existing Jira Epic by label and summary (or by stored orchestrator id).
  2) Create or Update Epic accordingly.
  3) Repeat for tasks, then link to epic.

- Tooling available:
  - Create: jira_create_issue
  - Update: jira_update_issue
  - Search: jira_search (JQL)
  - Link to Epic: jira_link_to_epic
  - Batch create: jira_batch_create_issues (creates faster, but linking still needed after)

---

## Step 4 — Create/Update Epics (from Features)

- Find or create Epic for each feature:

Example JQL (search existing epic for feature):

```powershell
# Escape quotes as needed:
docker mcp tools call jira_search `
  jql="project = AD2CI AND issuetype = Epic AND labels in (orchestrator-sync) AND summary ~ \"<feature name>\"" `
  fields=summary,labels limit=5 --verbose
```

- Create Epic if not found:

```powershell
docker mcp tools call jira_create_issue `
  project_key=AD2CI `
  issue_type="Epic" `
  summary="<Feature Name>" `
  description="<Feature Summary>`n`nOrchestrator Feature ID: <feature-uuid>`nLabels: orchestrator-sync orchestrator-feature-<feature-uuid>"
```

Capture the epic key returned (e.g., AD2CI-123). Persist it for later linking and for idempotent re-runs.

- Optional Update if found:

```powershell
docker mcp tools call jira_update_issue `
  issue_key=AD2CI-123 `
  fields="summary=<Feature Name>,description=<Updated Summary>"
```

---

## Step 5 — Create/Update Tasks (from Tasks)

- For each task:
  - Determine target issue type (default: Task). Optionally map Task-Orchestrator priority to Jira priority.
  - Search by JQL for a match via labels and/or orchestrator id:

    ```powershell
    docker mcp tools call jira_search `
      jql="project = AD2CI AND issuetype in (Task,Story) AND labels in (orchestrator-sync, orchestrator-id-<task-uuid>)" `
      fields=summary,labels limit=5 --verbose
    ```

- Create if not found:

```powershell
docker mcp tools call jira_create_issue `
  project_key=AD2CI `
  issue_type="Task" `
  summary="<Task Title>" `
  description="<Task Summary>`n`nOrchestrator Task ID: <task-uuid>`nLabels: orchestrator-sync orchestrator-id-<task-uuid>"
```

- Link to epic (once you have AD2CI-<epic> and AD2CI-<issue>):

```powershell
docker mcp tools call jira_link_to_epic `
  epic_key="AD2CI-<epic>" `
  issue_key="AD2CI-<issue>"
```

- Optional Update if found:

```powershell
docker mcp tools call jira_update_issue `
  issue_key=AD2CI-<issue> `
  fields="summary=<Task Title>,description=<Updated Summary>"
```

Notes:

- If you prefer batch creation for performance:
  - Use jira_batch_create_issues to create epics first, then tasks, then link tasks to epics via jira_link_to_epic.
  - Ensure to include labels and orchestrator ids in the batch payload.

---

## Step 6 — Create/Update Confluence Pages (Space UTWL)

- Page strategy:
  - Project Overview Page (title): “Sync-AD2CISign – Project Overview”
    - Summary of the project (from Task-Orchestrator project summary)
    - Link to Jira project (e.g., <https://your-domain.atlassian.net/jira/core/projects/AD2CI/board>)
    - List of Epics with links to each Jira epic
    - Stats: number of features, number of tasks, created/updated counts
  - One page per Feature:
    - Title: “Sync-AD2CISign – Feature: <Feature Name>”
    - Body: feature summary, Jira epic link, a table listing tasks with columns: Title, Status, Priority, Jira issue link

- Idempotent page upsert:
  - Search by title in space UTWL:

    ```powershell
    docker mcp tools call confluence_search `
      cql="space=UTWL AND title ~ \"Sync-AD2CISign – Project Overview\"" limit=5 --verbose
    ```

  - If not found → confluence_create_page; else → confluence_update_page.

- Create page (example):

```powershell
docker mcp tools call confluence_create_page `
  space_key=UTWL `
  title="Sync-AD2CISign – Project Overview" `
  body_markdown="## Overview`nProject: Sync-AD2CISign`nJira: https://your-domain.atlassian.net/jira/core/projects/AD2CI/board`n- Features: <n>`n- Tasks: <n>`n- Last Sync: <timestamp>`n`n## Epics`n- <AD2CI-123> <Feature Name> (link)"
```

- Update page (example):

```powershell
docker mcp tools call confluence_update_page `
  page_id=<page-id> `
  title="Sync-AD2CISign – Project Overview" `
  body_markdown="<regenerated body>"
```

- Feature pages similar pattern:

```powershell
docker mcp tools call confluence_create_page `
  space_key=UTWL `
  title="Sync-AD2CISign – Feature: <Feature Name>" `
  body_markdown="### Summary`n<feature summary>`n`n### Jira Epic`n- <AD2CI-123>`n`n### Tasks`n| Title | Jira | Status | Priority |`n|---|---|---|---|`n| <Task> | <JiraKey> | <Status> | <Priority> |"
```

---

## Step 7 — Persist Mappings Back to Task-Orchestrator (Recommended)

To guarantee idempotent re-runs:

- Add a section to each Feature with its Jira Epic key and Confluence page link:

```powershell
docker mcp tools call add_section `
  entityType="FEATURE" `
  entityId="<feature-uuid>" `
  title="External Links" `
  usageDescription="Stores links to Jira and Confluence" `
  content="Epic: AD2CI-<epic>`nConfluence: <page-url>`n" `
  contentFormat="MARKDOWN" `
  ordinal=50 `
  tags="links,jira,confluence"
```

- Add a section to each Task with its Jira issue key:

```powershell
docker mcp tools call add_section `
  entityType="TASK" `
  entityId="<task-uuid>" `
  title="External Links" `
  usageDescription="Stores Jira issue key" `
  content="Jira: AD2CI-<issue>`n" `
  contentFormat="MARKDOWN" `
  ordinal=50 `
  tags="links,jira"
```

Future runs can first read these sections to avoid searching Jira when keys are already known.

---

## Step 8 — Validation and Reporting

- Validate epics created/updated:

```powershell
docker mcp tools call jira_search jql="project = AD2CI AND issuetype = Epic AND labels = orchestrator-sync" fields=summary,labels limit=100 --verbose
```

- Validate tasks created/updated:

```powershell
docker mcp tools call jira_search jql="project = AD2CI AND labels = orchestrator-sync" fields=summary,labels limit=1000 --verbose
```

- Validate Confluence pages:

```powershell
docker mcp tools call confluence_search cql="space=UTWL AND title ~ \"Sync-AD2CISign\"" limit=100 --verbose
```

- Optional: Produce a summary section back in Task-Orchestrator “Project” with counts using add_section.

---

## Metrics for Success

- Synchronization:
  - Count of features mapped to epics (should equal number of features).
  - Count of tasks mapped to Jira issues (should equal number of tasks).
  - Number of creates vs updates (re-runs should trend toward 0 creates).

- Confluence:
  - Project overview page exists in space UTWL and contains links to all epics.
  - Feature pages exist/updated for each feature with up-to-date task tables and Jira links.

- Idempotency:
  - Re-running the plan yields no duplicate issues or pages.
  - Jira search by labels/orchestrator-id returns the same items (stable mapping).

---

## Risks and Mitigations

- Missing credentials → ensure secrets for both Jira and Confluence are set before calling tools.
- Empty Jira project → JQL-based fallback won’t find issues; prefer using get-all-projects where available or create the first issue.
- Rate limits → throttle batch size and include small delays between calls if needed.
- Title collisions → rely on labels and orchestrator-id in labels and descriptions to avoid duplicates.

---

## Optional Enhancements

- Use jira_batch_create_issues for faster initial creation (epics then tasks) followed by jira_link_to_epic for linking.
- Store Jira keys in Task-Orchestrator tags (update_task) as an alternative to sections.
- Add Confluence child pages for “Testing Strategy”, “Technical Approach” by applying Task-Orchestrator templates and mirroring content.

---

## Quick Command Checklist

- Verify servers/secrets:

```powershell
docker mcp server list
docker mcp tools list | findstr /I "^jira_"
docker mcp tools list | findstr /I "^confluence_"
```

- Extract orchestrator data:

```powershell
docker mcp tools call search_features projectId=de68f54f-e30c-4f0a-88e7-ad369e434a26 limit=200 --verbose
docker mcp tools call search_tasks    projectId=de68f54f-e30c-4f0a-88e7-ad369e434a26 limit=1000 --verbose
```

- Create epic:

```powershell
docker mcp tools call jira_create_issue project_key=AD2CI issue_type="Epic" summary="<Feature Name>" description="<...>"
```

- Create task:

```powershell
docker mcp tools call jira_create_issue project_key=AD2CI issue_type="Task" summary="<Task Title>" description="<...>"
```

- Link task → epic:

```powershell
docker mcp tools call jira_link_to_epic epic_key="AD2CI-<epic>" issue_key="AD2CI-<issue>"
```

- Create/Update Confluence page:

```powershell
docker mcp tools call confluence_create_page space_key=UTWL title="Sync-AD2CISign – Project Overview" body_markdown="<md>"
```

---

This plan keeps all operations within MCP, ensures repeatable idempotent syncs, and provides concrete command templates. Once you confirm your preferred Jira issue type for tasks (Story vs Task) and provide Jira/Confluence credentials, you can execute the steps progressively and measure success against the metrics above.
