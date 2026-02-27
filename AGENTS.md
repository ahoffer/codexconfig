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
- If you can infer or discover needed details from the repo or system, do that first.
- When blocked, ask the smallest possible clarifying question and then proceed.

## Command Approval Policy

- Prompt me before executing recursive deletes (for example: `rm -r`, `rm -rf`, or equivalent delete-recursive patterns).
- Prompt me before executing any `ssh` command.
- Prompt me before executing any `sudo` command.
- Do not prompt for normal low-risk commands outside the cases above.
- Never execute `git push` from Codex. Git pushes are manual and done by me outside AI coding environments.
