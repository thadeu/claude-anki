# claude-anki 🇬🇧

Uma lição de inglês por dia. Cada arquivo é curto, focado em **uma dúvida real**, e escrito pra ser:

1. **Lido como nota** — explico em português, com exemplos em inglês.
2. **Estudado como flashcard** — toda lição termina com uma seção `Flashcards` no formato `Frente → Verso`, fácil de jogar no Anki ou revisar no Notes.

## Como funciona

- Toda lição vive em `lessons/AAAA-MM-DD-titulo.md`.
- Uma dúvida por dia. Pequena e digerível vence "completa e esquecida".
- No fim de cada lição: **mini-quiz** (com gabarito no rodapé) + **flashcards**.

## Instalação

```bash
git clone https://github.com/thadeu/claude-anki.git
cd claude-anki
./install.sh
```

O `install.sh` cria symlinks em `~/.claude/` (não importa onde você clonou o repo — cada máquina resolve o próprio caminho):

| Symlink | Aponta pra |
| --- | --- |
| `~/.claude/anki-data` | a raiz do repo (lições, template, README) |
| `~/.claude/commands/anki` | `commands/` (os `/anki:*`) |
| `~/.claude/skills/anki` | `skills/anki/` (a house style) |

Depois reinicie o Claude Code pra carregar os comandos.

## Comandos (`/anki:*`)

| Comando | O que faz |
| --- | --- |
| `/anki:today [tema]` | Lição de hoje — cria uma nova (ou revisa a de hoje se já existir). Tema opcional. |
| `/anki:yesterday` | Revisa a lição de ontem (quiz primeiro, gabarito depois). |
| `/anki:review [data\|tema]` | Treina qualquer lição passada — aleatória se sem argumento. |
| `/anki:list` | Lista todas as lições, mais recentes primeiro. |

A "house style" (formato, tom PT→EN, gabarito) fica na skill em `skills/anki/SKILL.md`.

## Rotina sugerida

| Quando | O quê |
| --- | --- |
| Hoje | Ler a lição nova + fazer o mini-quiz |
| Amanhã | Revisar os flashcards da lição de ontem antes de abrir a nova |
| Toda semana | Reler os títulos em `lessons/` — o que ainda trava? Vira lição de revisão. |

## Privacidade das lições

Por padrão, suas lições diárias **ficam locais** — o `.gitignore` ignora `lessons/*.md` (só o `example-*.md` vai versionado, como amostra). Assim seu estudo não vai pro GitHub público. Se você preferir sincronizar as lições entre máquinas via git, remova essa linha do `.gitignore`.

## Importar pro Notes (macOS)

Markdown cola limpo no Notes (títulos viram títulos, listas viram listas). Opções:

- **Manual:** abrir o `.md`, copiar tudo, colar numa nota nova.
- **Atalho (Shortcuts):** criar um atalho "Get File → Create Note" apontando pra `lessons/`.

## Exemplo

- [don't vs doesn't](lessons/example-dont-vs-doesnt.md)
