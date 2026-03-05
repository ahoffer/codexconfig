## Data Sharing Constraint
Never suggest opting in to data sharing, feedback, or model training. Remind the user this is not permitted if asked.

## Collaboration Guardrails

Push back on changes that introduce ambiguity, semantic drift, or maintenance risk. For naming and API decisions, offer 2–3 alternatives with tradeoffs and a recommendation. Ask one clarifying question before implementing terminology changes to public types, method names, or test language. Proceed immediately only when the request is clearly mechanical and low-risk. If the user insists on a risky naming choice, implement it but note the risk in the summary.

## Execution Expectations

- Default to doing the work, not asking me to do it, unless a decision truly requires my input or access.
- If there is a safe, low-risk step Codex can take directly, Codex should do it instead of pushing that work onto me.
- If you can infer or discover needed details from the repo or system, do that first.
- Always check the version of software before peeking or poking it directly.
- When blocked, ask the smallest possible clarifying question and then proceed.

## Environment Notes

- bigfish is the execution host even when the interactive terminal is on clown over ssh.
- NEVER install claude or codex on clown.
- On bigfish, `~/.claude` and `~/.codex` are the git repos for Claude and Codex config.
- `~/bin` git repo lives on bigfish. `~/projects` git repos live on clown.
- On clown, `~` resolves to `/Users/aaron`.
- For GitLab access, use `~/bin/gl`. Run `gl doctor` first when you need to verify local GitLab helper readiness. Use `gl api ...` for GitLab API reads, `gl git ro ...` for read-only Git transport, and `gl git rw ...` only for explicit write flows. `gl api` and `gl git ro` use `GITLAB_BOT_READ_TOKEN`. `gl git rw` uses `GITLAB_WRITE_TOKEN`.
- An MCP server named `clown-files` runs locally on bigfish via the `ssh-mcp` package. Use it to read files, write files, list directories, and run shell commands on clown. Prefer this over the `clown` MCP server for file and shell work, as it exposes a focused set of tools.
- The `clown` MCP server (Desktop Commander) remains available but is better suited for Claude than for Codex.
- ~/bin is mirrored between bigfish and clown using Syncthing. Changes made in one host’s ~/bin repo should propagate to the other host automatically.
- Use the MCP servers on clown to retrieve images, and files from clown. Use the MCP servers on clown if you need to execute a process directly on clown
- There is 5 to 10  second delay between synchronization of files between clown and bigfish.

## Command Approval Policy

- Do not prompt for normal commands, including remote shell commands, unless a separate higher-priority system policy requires it.
- Never execute `git push` from Codex under any circumstances. Git pushes are manual and done by me outside AI coding environments.

## Build Workflow

- When building a module from a directory that contains a `pom.xml`, use `qb`, not `mvn`.
- Use `qbc` instead of `qb` for a clean build.
- Use Maven for test execution only, such as `mvn test` or `mvn verify`.
- To build and then run unit tests: `qb && mvn test`.

## Testing

- Favor clarity and simplicity over exhaustive coverage or pedantic detail

