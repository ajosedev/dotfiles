## Temporary Files

Use the operating system temporary directory for disposable files created outside the project. Prefer `$TMPDIR` when it is available; otherwise use `/tmp`.

Keep project artifacts in the project working directory unless I ask otherwise. Avoid storing sensitive information in temporary directories. Remove temporary files when they are no longer needed, unless I ask to preserve them for review.
