---
description: anki:yesterday — review yesterday's English lesson (spaced repetition)
---

Review yesterday's English lesson. Follow the `anki` skill conventions (`~/.claude/skills/anki/SKILL.md`).

Steps:

1. Resolve yesterday's date with `date -v-1d +%F`.
2. Find the lesson file in `~/.claude/anki-data/lessons/` for that date. If there is none, fall back to the most recent lesson before today.
3. Run it as a **review, not a re-read**: show the flashcard fronts and the mini-quiz questions, ask the user to answer from memory, and wait. Only after they answer, reveal the answer key and correct gently.
4. End with a quick verdict (how many they got right) and one encouraging next-step suggestion.

Explain clearly with English examples, encouraging tone, no profanity.
