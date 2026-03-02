## Data Sharing Constraint
- The user is NOT permitted to allow data sent through Codex to be used for model training. Do not suggest opting in to any data sharing, feedback, or training program. If asked, remind the user of this constraint.

## Collaboration Guardrails

- Push back by default: Do not accept my suggestions immediately when they introduce ambiguity, semantic drift, or maintenance risk.
- Require explicit tradeoff analysis for naming and API decisions:
- Provide 2-3 alternatives.
- State risks of each.
- Recommend one with rationale.
- Ask one clarifying question before implementing terminology changes that affect public types, method names, or test language.
- Only proceed immediately without pushback when the request is clearly mechanical and low-risk.
- If I insist on a risky naming choice, implement it but annotate the risk briefly in the final summary.

## Execution Expectations

- Default to doing the work, not asking me to do it, unless a decision truly requires my input or access.
- If there is a safe, low-risk step Codex can take directly, Codex should do it instead of pushing that work onto me.
- If you can infer or discover needed details from the repo or system, do that first.
- Always check the version of software before peeking or poking it directly.
- When blocked, ask the smallest possible clarifying question and then proceed.

## Environment Notes

- Codex normally runs on `bigfish`, even when the interactive terminal is being used from `clown` over `ssh`.
- Distinguish the local terminal host from the execution host: typing may originate on `clown`, but commands and filesystem access are local to `bigfish` unless a tool explicitly targets `clown`.
- Under `~/bin`, treat the working git repository as living on `bigfish` by default.
- Under `~/projects`, treat git repositories as living on `clown` by default.
- On the `clown` host, treat `~` as `/Users/aaron` (macOS-style), not `/home/aaron`.
- When a path is given as `~/...` for `clown`, resolve it under `/Users/aaron` unless the host configuration explicitly indicates otherwise.
- For files that exist only on `clown`, prefer copying them to `bigfish` before nontrivial processing. Use `/Users/aaron/bin/sendfile` to copy a file or the current clipboard image to `/tmp/fromclown` on `bigfish`; `/Users/aaron/bin/kittypaste` pastes the resulting `bigfish` path into the terminal when the `clown` clipboard contains an image.

## Command Approval Policy

- Prompt me before executing recursive deletes (for example: `rm -r`, `rm -rf`, or equivalent delete-recursive patterns).
- Prompt me before executing any `ssh` command.
- Prompt me before executing any `sudo` command.
- Do not prompt for normal low-risk commands outside the cases above.
- Never execute `git push` from Codex. Git pushes are manual and done by me outside AI coding environments.

## Build Workflow

- When building a module from a directory that contains a `pom.xml`, use `qb`, not `mvn`.
- Use `qbc` instead of `qb` for a clean build.
- Use Maven for test execution only, such as `mvn test` or `mvn verify`.
- To build and then run unit tests: `qb && mvn test`.

## Testing

- Favor clarity and simplicity over exhaustive coverage or pedantic detail
