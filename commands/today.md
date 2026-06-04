---
description: anki:today — today's English lesson (create a new one, or review today's if it exists)
---

Run the daily English lesson. Follow the conventions in the `anki` skill (`~/.claude/skills/anki/SKILL.md`), including its template.

Optional topic from the user: `$ARGUMENTS`

Steps:

1. Ensure the data dir exists: `mkdir -p ~/.claude/anki-data/lessons`.
2. Resolve today's date with `date +%F`.
3. List `~/.claude/anki-data/lessons/` and check for a file starting with today's date.
4. **If today's lesson already exists** → open it and run it as a review: show the rule briefly, then quiz the user with the mini-quiz / flashcards and wait for their answers before revealing the answer key.
5. **If there is no lesson for today** → create one:
   - Topic: use `$ARGUMENTS` if provided. Otherwise read the last 2–3 lesson filenames and pick the natural next step in the progression.
   - Write `~/.claude/anki-data/lessons/<today>-<kebab-title>.md` following the template (clear explanation, English examples, mini-quiz with answer key at the bottom, flashcards).
   - If `~/.claude/anki-data/README.md` has a lesson index, add a one-line entry to it.
   - Then teach it in chat and run the mini-quiz, waiting for the user's answers.

Keep it to one doubt. Explain clearly with English examples, encouraging tone, no profanity.
