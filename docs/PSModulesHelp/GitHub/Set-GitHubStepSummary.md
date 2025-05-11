Set-GitHubStepSummary
---------------------

### Synopsis
Set a summary for the step in GitHub Actions

---

### Description

You can set some custom Markdown for each job so that it will be displayed on the summary page of a workflow run.
You can use job summaries to display and group unique content, such as test result summaries, so that someone viewing
the result of a workflow run doesn't need to go into the logs to see important information related to the run, such as failures.

Job summaries support GitHub flavored Markdown, and you can add your Markdown content for a step to the `GITHUB_STEP_SUMMARY`
environment file. `GITHUB_STEP_SUMMARY` is unique for each step in a job. For more information about the per-step file that
`GITHUB_STEP_SUMMARY` references, see [Environment files](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions?utm_source=chatgpt.com#environment-files).

When a job finishes, the summaries for all steps in a job are grouped together into a single job summary and are shown on the
workflow run summary page. If multiple jobs generate summaries, the job summaries are ordered by job completion time.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubStepSummary -Summary 'Hello, World!'
```

---

### Parameters
#### **Summary**
Summary of the step

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **Overwrite**
Whether to overwrite the existing summary

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Adding a job summary](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions?utm_source=chatgpt.com#adding-a-job-summary)

---

### Syntax
```PowerShell
Set-GitHubStepSummary [-Summary] <String> [-Overwrite] [<CommonParameters>]
```
