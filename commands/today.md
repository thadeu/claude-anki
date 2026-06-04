---
description: anki:today — today's English lesson (create a new one, or review today's if it exists)
---

Run the daily English lesson. Follow the conventions in the `anki` skill (`~/.claude/anki-data/skills/anki/SKILL.md`) and the shape in `~/.claude/anki-data/_template.md`.

Optional topic from the user: `$ARGUMENTS`

Steps:

1. Resolve today's date with `date +%F`.
2. List `~/.claude/anki-data/lessons/` and check for a file starting with today's date.
3. **If today's lesson already exists** → open it and run it as a review: show the rule briefly, then quiz the user with the mini-quiz / flashcards and wait for their answers before revealing the gabarito.
4. **If there is no lesson for today** → create one:
   - Topic: use `$ARGUMENTS` if provided. Otherwise read the last 2–3 lesson filenames and pick the natural next step in the progression.
   - Write `~/.claude/anki-data/lessons/<today>-<kebab-title>.md` following the template (PT explanation, EN examples, mini-quiz with gabarito at the bottom, flashcards).
   - Add a one-line entry to the README index.
   - Then teach it in chat and run the mini-quiz, waiting for the user's answers.

Keep it to one doubt. Explain in Portuguese, examples in English, encouraging tone, no profanity.
