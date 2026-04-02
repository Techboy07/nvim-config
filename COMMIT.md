# Commit Message Generation Rules

You are given a Git diff from this repository.

Your task is to generate a Git commit message and write it as plain text suitable for saving into a file named commit-message.txt.

Workflow

1. Run `git status && git diff HEAD && git log -n 3 --oneline` to see changes
2. Generate the commit message and present it for user review first
3. After approval, write to commit-message.txt

Format requirements
The output must contain exactly the text that should appear inside commit-message.txt.
Do not include explanations, comments, or code fences.
Do not include the filename itself in the output.

Commit message structure

Line 1  
A conventional commit style summary line.

Rules for summary line  
Use a type prefix such as feat, fix, or chore  
Imperative tense  
Business readable language  
High level summary of the outcome  
Fewer than 72 characters

Line 2  
Blank line

Lines 3 onward  
A concise change summary list.

Rules for change summary  
Use asterisk bullets  
Short clear statements  
Describe what was added, changed, or fixed  
Avoid low level implementation details

Input
Git diff

Output
Only the commit message text exactly as it should appear in commit-message.txt

Feature Rating Task (not included in commit message)
After generating the commit message, rate each implemented feature on a grade scale (A-F) with brief notes. Present this as a table before the commit message. This helps track implementation quality over time.

Rating requirements:

- Do not truncate notes - provide full detailed feedback
- Include specific file paths where issues or changes are located
- Describe what was done well and what could be improved
- Note any code quality concerns, potential bugs, or inconsistencies

Grade Command
After the rating table, include a grade summary command in the following format:

```
/grade <feature-name> | <file-path> | <grade> | <mistake-or-improvement-note>
```

Grade command rules:

- One line per changed/added feature or significant change
- `<feature-name>`: Short name for the feature or change
- `<file-path>`: The file where the change was made
- `<grade>`: Letter grade A-F (A = excellent, F = critical issues)
- `<mistake-or-improvement-note>`: Note describing either a mistake made or how the change helped
- Use multiple numbered lines for detailed notes when needed

Example:

```
/grade user-auth | src/auth/login.ts | B
  1. Added proper error handling for failed login attempts
  2. Missing input validation on email field
  3. Should add rate limiting to prevent brute force attacks

/grade api-endpoint | api/users.js | A
  1. Implemented caching layer that reduced query time by 40%
  2. Added proper error responses with status codes
  3. Well-documented with JSDoc comments
```
