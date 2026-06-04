# claude-anki 🇬🇧

One English lesson a day. Each file is short, focused on **a single real doubt**, and written to be:

1. **Read as a note** — explained in plain language, with examples in English.
2. **Drilled as a flashcard** — every lesson ends with a `Flashcards` section in `Front → Back` form, easy to drop into Anki or review in Notes.

## How it works

- Every lesson lives in `lessons/YYYY-MM-DD-title.md`.
- One doubt per day. Small and digestible beats complete and forgotten.
- Each lesson ends with a **mini-quiz** (answer key at the bottom) + **flashcards**.

## Install

```bash
git clone https://github.com/thadeu/claude-anki.git
cd claude-anki
./install.sh
```

`install.sh` creates symlinks under `~/.claude/` (it doesn't matter where you cloned the repo — each machine resolves its own path):

| Symlink | Points to |
| --- | --- |
| `~/.claude/anki-data` | the repo root (lessons, template, README) |
| `~/.claude/commands/anki` | `commands/` (the `/anki:*` commands) |
| `~/.claude/skills/anki` | `skills/anki/` (the house style) |

Then restart Claude Code to load the commands.

## Commands (`/anki:*`)

| Command | What it does |
| --- | --- |
| `/anki:today [topic]` | Today's lesson — creates a new one (or reviews today's if it already exists). Topic optional. |
| `/anki:yesterday` | Reviews yesterday's lesson (quiz first, answers after). |
| `/anki:review [date\|topic]` | Drills any past lesson — random if no argument. |
| `/anki:list` | Lists every lesson, newest first. |

The house style (format, tone, answer key) lives in the skill at `skills/anki/SKILL.md`.

## Suggested routine

| When | What |
| --- | --- |
| Today | Read the new lesson + take the mini-quiz |
| Tomorrow | Review yesterday's flashcards before opening the new one |
| Weekly | Re-read the titles in `lessons/` — what still trips you up? Turn it into a review lesson. |

## Lesson privacy

By default your daily lessons **stay local** — `.gitignore` ignores `lessons/*.md` (only `example-*.md` is versioned, as a sample). That keeps your study out of the public repo. If you'd rather sync lessons across machines via git, remove that line from `.gitignore`.

## Import into Notes (macOS)

Markdown pastes cleanly into Notes (headings become headings, lists become lists). Options:

- **Manual:** open the `.md`, copy everything, paste into a new note.
- **Shortcut (Shortcuts app):** build a "Get File → Create Note" shortcut pointing at `lessons/`.

## Example

- [don't vs doesn't](lessons/example-dont-vs-doesnt.md)
