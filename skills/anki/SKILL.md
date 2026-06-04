---
name: anki
description: Daily English-learning ritual. Use when the user wants an English lesson, to review a past lesson, asks an English grammar/usage doubt, or types /anki:today, /anki:yesterday, /anki:review, /anki:list. Also trigger on natural phrasing like "today's English lesson", "review yesterday's lesson", "drill a past lesson". Lessons live in ~/.claude/anki-data/lessons as dated markdown, written to be both read as notes and drilled as flashcards.
---

# claude-anki — daily English coach

A spaced-repetition English habit. One small doubt per day, written as dated markdown, studied like Anki cards.

This skill is self-contained: it works whether it was installed via `./install.sh` (symlinks `~/.claude/anki-data` to the cloned repo) or via `npx skills add thadeu/claude-anki` (copies just this skill). The slash commands `/anki:*` are optional sugar — if they aren't installed, run the same flows from the natural-language triggers in the description above.

## Setup (do this first, every run)

The data root is `~/.claude/anki-data`. Make sure the lessons directory exists before reading or writing:

```bash
mkdir -p ~/.claude/anki-data/lessons
```

- If installed via `install.sh`, `~/.claude/anki-data` is a symlink to the repo, so lessons land in the repo (and stay local — see the repo's `.gitignore`).
- If installed via `npx skills add`, the command above creates a real local directory; lessons live there.

## Where things live

- Lessons: `~/.claude/anki-data/lessons/YYYY-MM-DD-title.md`
- Optional index: `~/.claude/anki-data/README.md` — if it exists, keep one line per lesson; if not, derive listings from the lesson filenames.

## House style (non-negotiable)

- **Explain clearly and concisely**, with plenty of English examples.
- **No profanity.** Keep it clean and professional.
- **One doubt per lesson.** Small and digestible beats complete and forgotten.
- **Every lesson ends with:** a mini-quiz (answers in a `Mini-quiz answer key` section at the very bottom) and a `Flashcards` section as `Front → Back` pairs.
- Use the section order from the template below: Golden rule → Why → Most common trap → Table → Memory trick → Mini-quiz → Flashcards → Answer key.
- Encouraging tone. Celebrate wins, correct gently, and separate grammar mistakes from spelling/polish (e.g. a missing apostrophe is polish, not grammar).

## Lesson template

Copy this shape for every new lesson (`~/.claude/anki-data/_template.md` holds the same thing when installed from the repo):

```markdown
# YYYY-MM-DD — <title of the doubt>

> **Doubt of the day:** <the question in one sentence>

## Golden rule

<the rule in 1-2 lines — what to memorize if you only have 10 seconds>

## Why

<the short explanation. where the rule comes from>

## Most common trap

- ❌ <frequent mistake>
- ✅ <correct form>

## Table

| Case | Form | Example |
| --- | --- | --- |
|  |  |  |

## Memory trick

<a mnemonic>

## Mini-quiz

1. ___
2. ___
3. ___

## Flashcards

- **Front:** <question> → **Back:** <answer>

---

### Mini-quiz answer key

1. ...
```

## Dates

Always resolve dates with the shell, never by hand (this runs on macOS):

- Today: `date +%F`
- Yesterday: `date -v-1d +%F`

## Modes

These mirror the `/anki:*` commands; run them on request even without the slash commands installed.

### today (`/anki:today [topic]`)

1. Resolve today's date with `date +%F`.
2. List `~/.claude/anki-data/lessons/` and check for a file starting with today's date.
3. **If today's lesson exists** → run it as a review: show the rule briefly, then quiz with the mini-quiz / flashcards and wait for answers before revealing the answer key.
4. **If not** → create one: pick the topic (the user's stated doubt, else the natural next step after the last 2–3 lessons), write `~/.claude/anki-data/lessons/<today>-<kebab-title>.md` from the template, update the index if one exists, then teach it and run the mini-quiz, waiting for answers.

### yesterday (`/anki:yesterday`)

Resolve yesterday's date with `date -v-1d +%F`, find that lesson (or the most recent one before today), and run it as a **review, not a re-read**: quiz first, wait, then reveal the answer key and correct gently.

### review (`/anki:review [date|topic]`)

Pick a past lesson — by date, by topic keyword, or (if no argument) the oldest/least-recently-reviewed, varying the pick between runs — and drill it quiz-first.

### list (`/anki:list`)

List `~/.claude/anki-data/lessons/*.md` newest first by date prefix, showing date + a readable title, ending with a count. No lesson contents.

## Reviewing (spaced repetition)

Don't just re-print the lesson. **Quiz first**: show the flashcard fronts / mini-quiz questions, let the user answer from memory, THEN reveal and correct against the answer key. That's the Anki way.
