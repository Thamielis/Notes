
I will scan the repository to see if there is any existing code or configuration that stores the MCP project ID or references how to look up the “Sync-AD2CISign” project, so I can give you exact commands that match your setup.

# Plan: Retrieve the “Sync-AD2CISign” Project from MCP

This plan outlines how to locate and retrieve the MCP Task-Orchestrator project for “Sync-AD2CISign” using Docker’s MCP Gateway CLI. It includes discovery, lookup, verification, and persistence steps tailored for your repository and PowerShell environment.

---

## Preconditions

- Docker Desktop with MCP Toolkit is enabled.
- MCP Task-Orchestrator server is running and available to the MCP Gateway:
  - Recommended image: `ghcr.io/jpicklyk/task-orchestrator:latest`
  - Persist DB using a volume: `mcp-task-data:/app/data`
- Optional: Jira MCP server available if you plan to validate downstream exports later.

---

## Step 1 — Verify MCP Tools Are Available

- Confirm the gateway can see Task-Orchestrator tools:

  ```powershell
  docker mcp tools list
  ```

- Sanity check (look for known tools):

  ```powershell
  docker mcp tools list | findstr /I "search_projects search_features search_tasks get_project"
  ```

Success criteria:

- `search_projects` and `get_project` appear in the list (Task-Orchestrator exports these per its API reference).

---

## Step 2 — Inspect the Tool Schema Before Calling

Parameter names can vary by server version. Inspect first to confirm argument names you can pass to `search_projects`.

- Inspect the tool to see accepted parameters:

  ```powershell
  docker mcp tools inspect search_projects
  ```

- If you need a machine-readable schema:

  ```powershell
  docker mcp tools inspect search_projects --format=json
  ```

What to look for:

- Arguments such as: name, query, text, tags, status, priority, sort, limit, offset, etc.
- Confirm the correct name for the free-text filter (e.g., `name`, `query`, or `text`).

---

## Step 3 — Search for the Project by Name

Try the most likely filters first. Use the exact parameter name identified in Step 2.

Examples (try in order depending on schema):

- Name-equals match (preferred for uniqueness):

  ```powershell
  docker mcp tools call search_projects name="Sync-AD2CISign" exact=true limit=5 --verbose
  ```

- Full-text query variant:

  ```powershell
  docker mcp tools call search_projects query="Sync-AD2CISign" limit=10 --verbose
  ```

- Text search fallback:

  ```powershell
  docker mcp tools call search_projects text="Sync-AD2CISign" limit=10 --verbose
  ```

Notes:

- Include `limit` and optionally `sort` if supported (e.g., `sort="created_at:desc"`).
- If you have namespacing or tagging, include filters like `tags="repo:Sync-AD2CISign"` for disambiguation.

Success criteria:

- The command returns a project list containing an item whose name is “Sync-AD2CISign”.

---

## Step 4 — Extract the Project ID (PowerShell)

The `docker mcp` CLI prints logs plus a final JSON result. A robust extraction approach is to capture the last JSON-looking line and parse it.

- If the server returns an envelope object with `.data.items`:

  ```powershell
  $raw = docker mcp tools call search_projects name="Sync-AD2CISign" exact=true limit=5 --verbose
  $jsonLine = $raw | Select-String '^\s*\{' | Select-Object -Last 1 | ForEach-Object { $_.ToString() }
  $parsed = $jsonLine | ConvertFrom-Json

  # If envelope shape with data.items
  $project = $parsed.data.items | Where-Object { $_.name -eq 'Sync-AD2CISign' } | Select-Object -First 1
  $projectId = $project.id
  Write-Host "ProjectId: $projectId"
  ```

- If the server returns a top-level array:

  ```powershell
  $raw = docker mcp tools call search_projects name="Sync-AD2CISign" exact=true limit=5 --verbose
  $jsonLine = $raw | Select-String '^\s*\[' | Select-Object -Last 1 | ForEach-Object { $_.ToString() }
  $parsed = $jsonLine | ConvertFrom-Json

  $project = $parsed | Where-Object { $_.name -eq 'Sync-AD2CISign' } | Select-Object -First 1
  $projectId = $project.id
  Write-Host "ProjectId: $projectId"
  ```

Validation:

- Once you have `$projectId`, confirm with:

  ```powershell
  docker mcp tools call get_project id=$projectId --verbose
  ```

---

## Step 5 — Persist the Project ID for Reuse

Choose one of the following:

- Environment variable (current session):

  ```powershell
  $env:AD2CI_MCP_PROJECT_ID = $projectId
  ```

- Store in a simple text file for scripts (example path):

  ```powershell
  Set-Content -Path .\.mcp-project-id.txt -Value $projectId -Encoding UTF8
  ```

- Pass directly to the existing export script:

  ```powershell
  pwsh ./src/Tools/Export-AD2CI-JiraBacklog.ps1 `
    -ProjectKey "YOUR_JIRA_PROJECT_KEY" `
    -ProjectId  "$projectId"
  ```

---

## Step 6 — If Project Does Not Exist, Create It

If search returns no results, create the project and re-run the search:

```powershell
docker mcp tools call create_project `
  name="Sync-AD2CISign" `
  summary="Top-level project container for AD → CI signature sync workflows" `
  tags="repo:Sync-AD2CISign"
```

Then repeat the search and extraction steps to capture the new `projectId`.

---

## Edge Cases and Recommendations

- Multiple Matches:
  - Use `exact=true` with the `name` filter.
  - Add a tag filter like `tags="repo:Sync-AD2CISign"` if supported by the schema to disambiguate.
- Output Shape Differences:
  - Inspect the tool or capture raw output to confirm whether results are wrapped in an envelope object.
- Concurrency:
  - Task-Orchestrator enforces update/delete locks. For reads, no special handling is required.
- Persistence:
  - Ensure your Task-Orchestrator container uses a persistent volume (e.g., `mcp-task-data:/app/data`) so the project persists across restarts.

---

## Success Criteria

- The `search_projects` call returns exactly one “Sync-AD2CISign” project object.
- You can resolve and print a stable `projectId` value.
- `get_project` with that `projectId` returns a valid project payload.
- The `Export-AD2CI-JiraBacklog.ps1` script runs successfully when provided the resolved `projectId`.

---

## Assumptions and Open Questions

- The Task-Orchestrator is already registered in your MCP Toolkit and visible to the gateway.
- The `search_projects` tool supports one of the documented text filters (`name`, `query`, or `text`). If not, confirm the exact parameters with `docker mcp tools inspect search_projects`.

If you need exact parameter names or you see unexpected JSON shapes, run the inspection step and adjust the filter and parsing logic accordingly.
