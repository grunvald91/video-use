#!/usr/bin/env bash
# Запускать на машине кодового агента (например, Codex Cloud).
# Не публикует ролики и не запускает GitHub Actions.
set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/../.." && pwd)"
skill_dir="$repo_dir/skills/grunvald-code-animation"
if ! command -v node >/dev/null 2>&1; then echo "Требуется Node.js 22+" >&2; exit 1; fi
node -e 'if(Number(process.versions.node.split(".")[0])<22)process.exit(1)' || { echo "Обновите Node.js до 22+" >&2; exit 1; }
command -v npm >/dev/null || { echo "Нет npm" >&2; exit 1; }
command -v ffmpeg >/dev/null || { echo "Нет ffmpeg" >&2; exit 1; }
command -v ffprobe >/dev/null || { echo "Нет ffprobe" >&2; exit 1; }

for target in "$HOME/.claude/skills" "$HOME/.codex/skills"; do
  mkdir -p "$target"
  ln -sfn "$skill_dir" "$target/grunvald-code-animation"
done
echo "GRUNVALDLAB skill зарегистрирован в Claude Code и Codex."

if [[ "$(printenv INSTALL_HYPERFRAMES 2>/dev/null || echo 1)" == "1" ]]; then
  echo "Устанавливаю официальный базовый набор HyperFrames skills..."
  npx --yes hyperframes skills update
fi
echo "Готово. Перезапустите агента, затем вызовите /grunvald-code-animation."
echo "Для HyperFrames используйте дополнительно /hyperframes. Рендер проверять отдельно."
