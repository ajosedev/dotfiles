## Temporary Files

Use the operating system temporary directory for disposable files created outside the project. Prefer `$TMPDIR` when it is available; otherwise use `/tmp`.

## Worktree Setup

Create worktrees from the base repository with the interactive zsh function `gwta <folder-name> [branch-name] [base-branch]`. Then, run `gwti` in the new worktree in the same interactive shell (`gwta` changes directory). `gwti` copies the base checkout's `.env` if present and installs dependencies using the detected lockfile/package manager.

If those functions are unavailable, use an equivalent setup only if you can verify that it preserves the same behavior; otherwise ask before proceeding.

Worktrees should be named after tickets, with a few key words, such as `DSYS-1234-fix-bug`, with the branch name being just the ticket (`DSYS-1234`). If no ticket exists, the branch should be prefixed with `ajose/xxx`, with the worktree matching as `ajose-xxx`.

## Commits

Do not commit unless I explicitly ask you to commit or ask for an outcome that requires a commit, such as opening a PR.

## AI disclosure in public messages

When acting as me, append a brief AI disclosure to PR descriptions, review replies, issue comments, and similar public-facing prose. Name the specific message type in the note—for example, “*Note: This PR description was written by AI on Andrew’s behalf.*” or “*Note: This review reply was written by AI on Andrew’s behalf.*”

Do not add this note to source-code comments, commit messages, or text that already has an AI disclosure. Do not imply I personally reviewed or verified work unless I did.
