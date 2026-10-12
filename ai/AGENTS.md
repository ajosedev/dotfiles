## Temporary Files

Use the operating system temporary directory for disposable files created outside the project. Prefer `$TMPDIR` when it is available; otherwise use `/tmp`.

## Worktree Setup

Create worktrees from the base repository with the interactive zsh function `gwta <folder-name> [branch-name] [base-branch]`. Then, run `gwti` in the new worktree in the same interactive shell (`gwta` changes directory). `gwti` copies the base checkout's `.env` if present and installs dependencies using the detected lockfile/package manager.
