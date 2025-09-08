---
created: 2025-08-26T09:16:43 (UTC +02:00)
tags: [openai,cookbook,api,examples,guides,gpt,chatgpt,gpt-4,embeddings]
source: https://cookbook.openai.com/examples/codex/jira-github
author: 
---

# Automate Jira ↔ GitHub with Codex

---
## [Purpose of this cookbook](https://cookbook.openai.com/examples/codex/jira-github#purpose-of-this-cookbook)

This cookbook provides a practical, step-by-step approach to automating the workflow between Jira and GitHub. By labeling a Jira issue, you trigger an end-to-end process that creates a **GitHub pull request**, keeps both systems updated, and streamlines code review, all with minimal manual effort. The automation is powered by the [`codex-cli`](https://github.com/openai/openai-codex) agent running inside a GitHub Action.

## ![Full data-flow diagram](https://cookbook.openai.com/images/codex_action.png)

The flow is:

1.  Label a Jira issue
2.  Jira Automation calls the GitHub Action
3.  The action spins up `codex-cli` to implement the change
4.  A PR is opened
5.  Jira is transitioned & annotated - creating a neat, zero-click loop. This includes changing the status of the ticket, adding the PR link and commenting in the ticket with updates.

## [Prerequisites](https://cookbook.openai.com/examples/codex/jira-github#prerequisites)

-   Jira: project admin rights + ability to create automation rules
-   GitHub: write access, permission to add repository secrets, and a protected `main` branch
-   API keys & secrets placed as repository secrets:
    -   `OPENAI_API_KEY` – your OpenAI key for `codex-cli`
    -   `JIRA_BASE_URL`, `JIRA_EMAIL`, `JIRA_API_TOKEN` – for REST calls from the action
-   `codex-cli` installed locally (`pnpm add -g @openai/codex`) for ad-hoc testing
-   A repository that contains a `.github/workflows/` folder

## [Create the Jira Automation Rule](https://cookbook.openai.com/examples/codex/jira-github#create-the-jira-automation-rule)

![Automation Rule](https://cookbook.openai.com/images/jira_rule.png)

The first step in this rule listens for changes to an issue’s labels. This ensures we only trigger the automation when a label is added or modified—no need to process every update to the issue.

Next, we check whether the updated labels include a specific keyword, in our example we are using `aswe`. This acts as a filter so that only issues explicitly tagged for automation proceed, avoiding unnecessary noise from unrelated updates.

If the condition is met, we send a `POST` request to GitHub’s `workflow_dispatch` endpoint. This kicks off a GitHub Actions workflow with the relevant issue context. We pass in the issue key, summary, and a cleaned-up version of the description—escaping quotes and newlines so the payload parses correctly in YAML/JSON. There are [additional fields](https://support.atlassian.com/cloud-automation/docs/jira-smart-values-issues/) available as variables in JIRA to give the codex agent more context during its execution.

This setup allows teams to tightly control which Jira issues trigger automation, and ensures GitHub receives structured, clean metadata to act on. We can also set up multiple labels, each triggering a different GitHub Action. For example, one label could kick off a quick bug fix workflow, while another might start work on refactoring code or generating API stubs.

## [Add the GitHub Action](https://cookbook.openai.com/examples/codex/jira-github#add-the-github-action)

GitHub Actions enable you to automate workflows within your GitHub repository by defining them in YAML files. These workflows specify a series of jobs and steps to execute. When triggered either manually or via a POST request, GitHub automatically provisions the necessary environment and runs the defined workflow steps.

To process the `POST` request from JIRA we will create a Github action with a YAML like below in the `.github/workflows/` directory of the repository:

```
<span data-line=""><span>name</span><span>: </span><span>Codex Automated PR</span></span>
<span data-line=""><span>on</span><span>:</span></span>
<span data-line=""><span>  </span><span>workflow_dispatch</span><span>:</span></span>
<span data-line=""><span>    </span><span>inputs</span><span>:</span></span>
<span data-line=""><span>      </span><span>issue_key</span><span>:</span></span>
<span data-line=""><span>        </span><span>description</span><span>: </span><span>'JIRA issue key (e.g., PROJ-123)'</span></span>
<span data-line=""><span>        </span><span>required</span><span>: </span><span>true</span></span>
<span data-line=""><span>      </span><span>issue_summary</span><span>:</span></span>
<span data-line=""><span>        </span><span>description</span><span>: </span><span>'Brief summary of the issue'</span></span>
<span data-line=""><span>        </span><span>required</span><span>: </span><span>true</span></span>
<span data-line=""><span>      </span><span>issue_description</span><span>:</span></span>
<span data-line=""><span>        </span><span>description</span><span>: </span><span>'Detailed issue description'</span></span>
<span data-line=""><span>        </span><span>required</span><span>: </span><span>true</span></span>
<span data-line=""> </span>
<span data-line=""><span>permissions</span><span>:</span></span>
<span data-line=""><span>  </span><span>contents</span><span>: </span><span>write</span><span>           </span><span># allow the action to push code &amp; open the PR</span></span>
<span data-line=""><span>  </span><span>pull-requests</span><span>: </span><span>write</span><span>      </span><span># allow the action to create and update PRs</span></span>
<span data-line=""> </span>
<span data-line=""><span>jobs</span><span>:</span></span>
<span data-line=""><span>  </span><span>codex_auto_pr</span><span>:</span></span>
<span data-line=""><span>    </span><span>runs-on</span><span>: </span><span>ubuntu-latest</span></span>
<span data-line=""> </span>
<span data-line=""><span>    </span><span>steps</span><span>:</span></span>
<span data-line=""><span>    </span><span># 0 – Checkout repository</span></span>
<span data-line=""><span>    - </span><span>uses</span><span>: </span><span>actions/checkout@v4</span></span>
<span data-line=""><span>      </span><span>with</span><span>:</span></span>
<span data-line=""><span>        </span><span>fetch-depth</span><span>: </span><span>0</span><span>       </span><span># full history → lets Codex run tests / git blame if needed</span></span>
<span data-line=""> </span>
<span data-line=""><span>    </span><span># 1 – Set up Node.js and Codex</span></span>
<span data-line=""><span>    - </span><span>uses</span><span>: </span><span>actions/setup-node@v4</span></span>
<span data-line=""><span>      </span><span>with</span><span>:</span></span>
<span data-line=""><span>        </span><span>node-version</span><span>: </span><span>22</span></span>
<span data-line=""><span>    - </span><span>run</span><span>: </span><span>pnpm add -g @openai/codex</span></span>
<span data-line=""> </span>
<span data-line=""><span>    </span><span># 2 – Export / clean inputs (available via $GITHUB_ENV)</span></span>
<span data-line=""><span>    - </span><span>id</span><span>: </span><span>vars</span></span>
<span data-line=""><span>      </span><span>run</span><span>: </span><span>|</span></span>
<span data-line=""><span>        echo "ISSUE_KEY=${{ github.event.inputs.issue_key }}"        &gt;&gt; $GITHUB_ENV</span></span>
<span data-line=""><span>        echo "TITLE=${{ github.event.inputs.issue_summary }}"        &gt;&gt; $GITHUB_ENV</span></span>
<span data-line=""><span>        echo "RAW_DESC=${{ github.event.inputs.issue_description }}" &gt;&gt; $GITHUB_ENV</span></span>
<span data-line=""><span>        DESC_CLEANED=$(echo "${{ github.event.inputs.issue_description }}" | tr '\n' ' ' | sed 's/"/'\''/g')</span></span>
<span data-line=""><span>        echo "DESC=$DESC_CLEANED"                                    &gt;&gt; $GITHUB_ENV</span></span>
<span data-line=""><span>        echo "BRANCH=codex/${{ github.event.inputs.issue_key }}"     &gt;&gt; $GITHUB_ENV</span></span>
<span data-line=""> </span>
<span data-line=""><span>    </span><span># 3 – Transition Jira issue to "In Progress"</span></span>
<span data-line=""><span>    - </span><span>name</span><span>: </span><span>Jira – Transition to In Progress</span></span>
<span data-line=""><span>      </span><span>env</span><span>:</span></span>
<span data-line=""><span>        </span><span>ISSUE_KEY</span><span>:      </span><span>${{ env.ISSUE_KEY }}</span></span>
<span data-line=""><span>        </span><span>JIRA_BASE_URL</span><span>:  </span><span>${{ secrets.JIRA_BASE_URL }}</span></span>
<span data-line=""><span>        </span><span>JIRA_EMAIL</span><span>:     </span><span>${{ secrets.JIRA_EMAIL }}</span></span>
<span data-line=""><span>        </span><span>JIRA_API_TOKEN</span><span>: </span><span>${{ secrets.JIRA_API_TOKEN }}</span></span>
<span data-line=""><span>      </span><span>run</span><span>: </span><span>|</span></span>
<span data-line=""><span>        curl -sS -X POST \</span></span>
<span data-line=""><span>          --url   "$JIRA_BASE_URL/rest/api/3/issue/$ISSUE_KEY/transitions" \</span></span>
<span data-line=""><span>          --user  "$JIRA_EMAIL:$JIRA_API_TOKEN" \</span></span>
<span data-line=""><span>          --header 'Content-Type: application/json' \</span></span>
<span data-line=""><span>          --data  '{"transition":{"id":"21"}}'</span></span>
<span data-line=""><span>          # 21 is the transition ID for changing the ticket status to In Progress. Learn more here: https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issues/#api-rest-api-3-issue-issueidorkey-transitions-get</span></span>
<span data-line=""> </span>
<span data-line=""><span>    </span><span># 4 – Set Git author for CI commits</span></span>
<span data-line=""><span>    - </span><span>run</span><span>: </span><span>|</span></span>
<span data-line=""><span>        git config user.email "github-actions[bot]@users.noreply.github.com"</span></span>
<span data-line=""><span>        git config user.name  "github-actions[bot]"</span></span>
<span data-line=""> </span>
<span data-line=""><span>    </span><span># 5 – Let Codex implement &amp; commit (no push yet)</span></span>
<span data-line=""><span>    - </span><span>name</span><span>: </span><span>Codex implement &amp; commit</span></span>
<span data-line=""><span>      </span><span>env</span><span>:</span></span>
<span data-line=""><span>        </span><span>OPENAI_API_KEY</span><span>:  </span><span>${{ secrets.OPENAI_API_KEY }}</span></span>
<span data-line=""><span>        </span><span>CODEX_QUIET_MODE</span><span>: </span><span>"1"</span><span>          </span><span># suppress chatty logs</span></span>
<span data-line=""><span>      </span><span>run</span><span>: </span><span>|</span></span>
<span data-line=""><span>        set -e</span></span>
<span data-line=""><span>        codex --approval-mode full-auto --no-terminal --quiet \</span></span>
<span data-line=""><span>              "Implement JIRA ticket $ISSUE_KEY: $TITLE. $DESC"</span></span>
<span data-line=""> </span>
<span data-line=""><span>        git add -A</span></span>
<span data-line=""><span>        git commit -m "feat($ISSUE_KEY): $TITLE"</span></span>
<span data-line=""> </span>
<span data-line=""><span>    </span><span># 6 – Open (and push) the PR in one go</span></span>
<span data-line=""><span>    - </span><span>id</span><span>: </span><span>cpr</span></span>
<span data-line=""><span>      </span><span>uses</span><span>: </span><span>peter-evans/create-pull-request@v6</span></span>
<span data-line=""><span>      </span><span>with</span><span>:</span></span>
<span data-line=""><span>        </span><span>token</span><span>:  </span><span>${{ secrets.GITHUB_TOKEN }}</span></span>
<span data-line=""><span>        </span><span>base</span><span>:   </span><span>main</span></span>
<span data-line=""><span>        </span><span>branch</span><span>: </span><span>${{ env.BRANCH }}</span></span>
<span data-line=""><span>        </span><span>title</span><span>:  </span><span>"${{ env.TITLE }} (${{ env.ISSUE_KEY }})"</span></span>
<span data-line=""><span>        </span><span>body</span><span>: </span><span>|</span></span>
<span data-line=""><span>          Auto-generated by Codex for JIRA **${{ env.ISSUE_KEY }}**.</span></span>
<span data-line=""><span>          ---</span></span>
<span data-line=""><span>          ${{ env.DESC }}</span></span>
<span data-line=""> </span>
<span data-line=""><span>    </span><span># 7 – Transition Jira to "In Review" &amp; drop the PR link</span></span>
<span data-line=""><span>    - </span><span>name</span><span>: </span><span>Jira – Transition to In Review &amp; Comment PR link</span></span>
<span data-line=""><span>      </span><span>env</span><span>:</span></span>
<span data-line=""><span>        </span><span>ISSUE_KEY</span><span>:      </span><span>${{ env.ISSUE_KEY }}</span></span>
<span data-line=""><span>        </span><span>JIRA_BASE_URL</span><span>:  </span><span>${{ secrets.JIRA_BASE_URL }}</span></span>
<span data-line=""><span>        </span><span>JIRA_EMAIL</span><span>:     </span><span>${{ secrets.JIRA_EMAIL }}</span></span>
<span data-line=""><span>        </span><span>JIRA_API_TOKEN</span><span>: </span><span>${{ secrets.JIRA_API_TOKEN }}</span></span>
<span data-line=""><span>        </span><span>PR_URL</span><span>:         </span><span>${{ steps.cpr.outputs.pull-request-url }}</span></span>
<span data-line=""><span>      </span><span>run</span><span>: </span><span>|</span></span>
<span data-line=""><span>        # Status transition</span></span>
<span data-line=""><span>        curl -sS -X POST \</span></span>
<span data-line=""><span>          --url   "$JIRA_BASE_URL/rest/api/3/issue/$ISSUE_KEY/transitions" \</span></span>
<span data-line=""><span>          --user  "$JIRA_EMAIL:$JIRA_API_TOKEN" \</span></span>
<span data-line=""><span>          --header 'Content-Type: application/json' \</span></span>
<span data-line=""><span>          --data  '{"transition":{"id":"31"}}'</span></span>
<span data-line=""><span>          # 31 is the Transition ID for changing the ticket status to In Review. Learn more here: https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issues/#api-rest-api-3-issue-issueidorkey-transitions-get</span></span>
<span data-line=""> </span>
<span data-line=""><span>        # Comment with PR link</span></span>
<span data-line=""><span>        curl -sS -X POST \</span></span>
<span data-line=""><span>          --url   "$JIRA_BASE_URL/rest/api/3/issue/$ISSUE_KEY/comment" \</span></span>
<span data-line=""><span>          --user  "$JIRA_EMAIL:$JIRA_API_TOKEN" \</span></span>
<span data-line=""><span>          --header 'Content-Type: application/json' \</span></span>
<span data-line=""><span>          --data  "{\"body\":{\"type\":\"doc\",\"version\":1,\"content\":[{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"PR created: $PR_URL\"}]}]}}"</span></span>
```

## [Key Steps in the Workflow](https://cookbook.openai.com/examples/codex/jira-github#key-steps-in-the-workflow)

1.  **Codex Implementation & Commit** (Step 5)
    
    -   Uses OpenAI API to implement the JIRA ticket requirements
    -   Runs codex CLI in full-auto mode without terminal interaction
    -   Commits all changes with standardized commit message
2.  **Create Pull Request** (Step 6)
    
    -   Uses peter-evans/create-pull-request action
    -   Creates PR against main branch
    -   Sets PR title and description from JIRA ticket info
    -   Returns PR URL for later use
3.  **JIRA Updates** (Step 7)
    
    -   Transitions ticket to "In Review" status via JIRA API
    -   Posts comment with PR URL on the JIRA ticket
    -   Uses curl commands to interact with JIRA REST API

## [Label an Issue](https://cookbook.openai.com/examples/codex/jira-github#label-an-issue)

Attach the special `aswe` label to any bug/feature ticket:

1.  **During creation** – add it in the "Labels" field before hitting _Create_
2.  **Existing issue** – hover the label area → click the pencil icon → type `aswe`

![Adding a label](https://cookbook.openai.com/images/add_label.png)

## [End-to-end Flow](https://cookbook.openai.com/examples/codex/jira-github#end-to-end-flow)

1.  Jira label added → Automation triggers
2.  `workflow_dispatch` fires; action spins up on GitHub
3.  `codex-cli` edits the codebase & commits
4.  PR is opened on the generated branch
5.  Jira is moved to **In Review** and a comment with the PR URL is posted
6.  Reviewers are notified per your normal branch protection settings

![Jira comment with PR link](https://cookbook.openai.com/images/jira_comment.png) ![Jira status transition to In Review](https://cookbook.openai.com/images/jira_status_change.png)

## [Review & Merge the PR](https://cookbook.openai.com/examples/codex/jira-github#review--merge-the-pr)

You can open the PR link posted in the JIRA ticket and check to see if everything looks good and then merge it. If you have branch protection and Smart Commits integration enabled, the Jira ticket will be automatically closed when the pull request is merged.

## [Conclusion](https://cookbook.openai.com/examples/codex/jira-github#conclusion)

This automation streamlines your development workflow by creating a seamless integration between Jira and GitHub:

-   **Automatic status tracking** - Tickets progress through your workflow without manual updates
-   **Improved developer experience** - Focus on reviewing code quality instead of writing boilerplate code
-   **Reduced handoff friction** - The PR is ready for review as soon as the ticket is labeled

The `codex-cli` tool is a powerful AI coding assistant that automates repetitive programming tasks. You can explore more about it [here](https://github.com/openai/codex/)
