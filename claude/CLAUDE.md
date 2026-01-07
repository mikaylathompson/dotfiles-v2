# System-wide Claude Instructions

## Communication Preferences
- Be very concise - avoid headers/titles when a simple description suffices
- Skip unnecessary elaboration; get to the point
- When summarizing changes, use plain descriptions not bullet point headers
- Do not use emojis

## Code Quality Standards
- Avoid client-side workarounds; implement features properly on the backend
- Don't leave "temporary" solutions - if something needs backend support, add it
- Remove outdated comments when fixing the underlying issue
- Minimize comments. Add them to explain non-obvious intention of code only.

## Git Conventions
- Commit messages: short, lowercase, concise
- Examples: `account owner filtering on backend`, `add TSR ID search to backend`
- Commits should be logically grouped by staging individual lines (consider using `git add --patch`)
- Aim for commits being individually buildable and runnable, but this is not a hard requirement if it makes staging a commit much more difficult.

## Development Workflow
- If relevant, test changes in the browser before considering them complete
- When reviewing diffs, pay attention to edge cases and potential regressions
- Ask clarifying questions about non-obvious behavior before implementing
- Feel free to write planning or informative documents in a local `tmp/` dir. Do not commit them unless explicitly directed.

## Python and UV Usage

**IMPORTANT**: Always use native `uv` commands for Python package management and script execution.

### DO:
- `uv run script.py` - Run Python scripts
- `uv add package` - Add dependencies
- `uv remove package` - Remove dependencies
- `uv sync` - Sync dependencies
- `uv venv` - Create virtual environments
- `uv python install 3.12` - Install Python versions

### DON'T:
- ❌ `uv pip install` - Never use uv pip commands
- ❌ `uv pip uninstall` - Never use uv pip commands
- ❌ `python3 script.py` - Never run python3 directly
- ❌ `python3 -m pip` - Never use pip directly
- ❌ `pip install` - Never use pip directly

### Rationale:
- Native `uv` commands are faster and more reliable
- `uv pip` is a legacy compatibility layer that should be avoided
- Direct `python3` usage bypasses uv's environment management
- Using native uv commands ensures consistent behavior across all projects

## Typescript Usage
- Avoid using `any` unless it is absolutely unavoidable. In that case, highlight to the user where and why you used it.

