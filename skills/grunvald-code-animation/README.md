# GRUNVALDLAB Code Animation Director

Собственный скилл режиссуры и производства анимаций кодом. Основан на разборе ролика «Мой личный аниматор на Opus 5.5» и официальной документации HyperFrames.

**Отличие от стандартного HyperFrames:** HyperFrames объясняет, как рендерить HTML; этот скилл задает сценарий, ДНК стиля, монтажные требования GRUNVALDLAB, тестовые варианты A/B и контроль готового MP4.

## Установка в Codespaces / Linux

1. Открыть клонированный репозиторий grunvald91/video-use.
2. Убедиться, что есть Node.js 22+, npm, FFmpeg.
3. Выполнить из корня: bash skills/grunvald-code-animation/install.sh
4. Без сетевой установки HyperFrames: INSTALL_HYPERFRAMES=0 bash skills/grunvald-code-animation/install.sh
5. Перезапустить Claude Code или Codex и дать запрос: «Используй /grunvald-code-animation и /hyperframes. Создай 25-секундное объясняющее видео ...»

Установка проводится **в терминале машины агента**, не внутри облачного чата ChatGPT. Наличие файлов в GitHub само по себе не устанавливает Node-модули в Codespaces.

## Источники

- Официальный проект: https://github.com/heygen-com/hyperframes
- Руководство: https://hyperframes.app/docs/1-startup/2-quickstart
- Исходный видеоразбор: https://youtu.be/K1Mr5_7Gm3g

Chromium может потребоваться для локального рендера. Первое скачивание зависимостей требует сети. Лицензии чужих материалов сохранять в ASSETS.md.
