# shell

shell (bash): .bashrc/.bash_profile — алиасы, PATH, функции, env.

## Основные опции

- **Где лежит конфиг**: `~/.bashrc`, `~/.bash_profile`
- **Что чаще всего меняют**: алиасы, `PATH`, переменные окружения, подключение snippet'ов (`source ...`).
- **Заметки**: лучше держать `.bash_profile`, который `source`-ит `.bashrc`, чтобы login shell тоже получал настройки.

- **Файлы в пакете**:
  - `.bash_profile`
  - `.bashrc`

## Примеры

- **Dry-run (без изменений)**:
  - `stow -d my-settings -t "$HOME" -n -v shell`
- **Применить (создать/обновить симлинки)**:
  - `stow -d my-settings -t "$HOME" -v shell`
- **Удалить симлинки пакета**:
  - `stow -d my-settings -t "$HOME" -D shell`

## Альтернативные пакеты

- **zsh**: популярный shell (oh-my-zsh, powerlevel10k).
- **fish**: удобный интерактивный shell (своё синтаксическое поведение).
- **nushell**: pipeline-ориентированный shell.

