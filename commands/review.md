---
description: anki:review — drill any past English lesson (random, or by date/topic)
---

Drill a past English lesson for spaced repetition. Follow the `anki` skill conventions (`~/.claude/anki-data/skills/anki/SKILL.md`).

Selector from the user (optional): `$ARGUMENTS` — may be a date (YYYY-MM-DD), a topic keyword, or empty.

Steps:

1. List `~/.claude/anki-data/lessons/`.
2. Pick the lesson:
   - If `$ARGUMENTS` is a date → that day's lesson.
   - If `$ARGUMENTS` is a keyword → the lesson whose title matches.
   - If empty → pick one to review (prefer the oldest, to fight forgetting; vary your pick between runs so it's not always the same one).
3. Run it as a review: quiz first (flashcard fronts + mini-quiz), wait for answers, then reveal the answer key and correct gently.

Explain clearly with English examples, encouraging tone, no profanity.
