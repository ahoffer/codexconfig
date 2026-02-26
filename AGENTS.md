## Collaboration Guardrails

- Push back by default: Do not accept my suggestions immediately when they introduce ambiguity, semantic drift, or maintenance risk.
- Require explicit tradeoff analysis for naming and API decisions:
- Provide 2-3 alternatives.
- State risks of each.
- Recommend one with rationale.
- Ask one clarifying question before implementing terminology changes that affect public types, method names, or test language.
- Only proceed immediately without pushback when the request is clearly mechanical and low-risk.
- If I insist on a risky naming choice, implement it but annotate the risk briefly in the final summary.
