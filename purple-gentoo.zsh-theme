# ==========================================
# Кастомная тема: dark-purple (Gentoo Style)
# ==========================================

# Настройка промпта (строки ввода)
get_path() {
     if [[ "$PWD" == "$HOME" ]]; then
         echo ""
     else
         echo "%F{201,italic}%1d "
     fi
}
# Промпт с фиолетовой стрелочкой (цвет 93)
PROMPT='$(get_path)%F{255}▶ %f'

# Цвета для утилиты ls (серые папки, фиолетовые исполняемые файлы/скрипты)
export LS_COLORS="di=38;5;244:ex=38;5;99:ln=38;5;242:fi=00"
alias ls='ls --color=auto'

# Подсветка синтаксиса (zsh-syntax-highlighting)
_apply_syntax_colors() {
    if (( $+ZEBRA_STRIPES || $+ZSH_HIGHLIGHT_STYLES )); then

        # Команды, алиасы, функции (спокойный серый)
        ZSH_HIGHLIGHT_STYLES[command]='fg=201,bold'
        ZSH_HIGHLIGHT_STYLES[builtin]='fg=201,bold'
        ZSH_HIGHLIGHT_STYLES[alias]='fg=201,bold'
        ZSH_HIGHLIGHT_STYLES[function]='fg=201,bold'

        # Ошибки / Неизвестные команды (Яркий фиолетовый вместо красного)
        ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=238,bold'

        # Флаги и аргументы (-r, --help) (тёмно-серый)
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=90'
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=90'

        # Пути к файлам и директориям
        ZSH_HIGHLIGHT_STYLES[path]='fg=260,underline'

        # Текст в кавычках (мягкий серый, никакой зелени)
        ZSH_HIGHLIGHT_STYLES[string]='fg=198'
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=198'
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=198'
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=198'
        ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=198'

        # Переменные вроде $HOME (светло-серый, чтобы выделялись)
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=198'
        ZSH_HIGHLIGHT_STYLES[environment-variable]='fg=198'
        ZSH_HIGHLIGHT_STYLES[assign]='fg=198'

        # Операторы, пайпы и стрелочки (&&, |, >, >>) (Фиолетовый акцент)
        ZSH_HIGHLIGHT_STYLES[redirection]='fg=242,bold'
        ZSH_HIGHLIGHT_STYLES[operator]='fg=242,bold'

        # Комментарии (очень тёмный серый, чтобы уходили на задний план)
        ZSH_HIGHLIGHT_STYLES[comment]='fg=238,italic'

        # Обычный текст / Аргументы / Имена файлов (спокойный серый)
        ZSH_HIGHLIGHT_STYLES[default]='fg=248'
    fi
}

# Обертка для железного применения цветов
autoload -U add-zsh-hook
add-zsh-hook precmd _apply_syntax_colors

# Запуск Fastfetch при открытии терминала (Выводим логотип Gentoo)
clear
fastfetch --logo gentoo --logo-padding-left 9
