# ==========================================
# Кастомная тема: dark-red
# ==========================================

# Настройка промпта (строки ввода)
get_path() {
     if [[ "$PWD" == "$HOME" ]]; then
         echo ""
     else
         echo "%F{248}%1d "
     fi
}
PROMPT='$(get_path)%F{244}▶ %f'

# Цвета для утилиты `ls` (серые папки, красные исполняемые файлы)
export LS_COLORS="di=38;5;244:ex=38;5;160:ln=38;5;242:fi=00"
alias ls='ls --color=auto'

# Подсветка синтаксиса (zsh-syntax-highlighting)
# Вызывается после загрузки плагина, чтобы переназначить цвета
_apply_syntax_colors() {
    if (( $+ZEBRA_STRIPES || $+ZSH_HIGHLIGHT_STYLES )); then

		#команды, алиасы, функции
        ZSH_HIGHLIGHT_STYLES[command]='fg=248,bold'
        ZSH_HIGHLIGHT_STYLES[builtin]='fg=248,bold'
        ZSH_HIGHLIGHT_STYLES[alias]='fg=248,bold'
        ZSH_HIGHLIGHT_STYLES[function]='fg=248,bold'

		#errors
        ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=160,bold'

        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=242'
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=242'

        ZSH_HIGHLIGHT_STYLES[path]='fg=244,underline'

        # ТЕКСТ В КАВЫЧКАХ (Полное отключение стандартных цветов аргументов)
        ZSH_HIGHLIGHT_STYLES[string]='fg=243'
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=243,none'
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=243,none'

        # Переменные вроде $HOME (светло-серый, чтобы выделялись)
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=251'
        ZSH_HIGHLIGHT_STYLES[environment-variable]='fg=251'
        ZSH_HIGHLIGHT_STYLES[assign]='fg=251'
        
        # Операторы, пайпы и стрелочки (&&, |, >) (тёмно-красный акцент)
        ZSH_HIGHLIGHT_STYLES[redirection]='fg=124,bold'
                
        # Комментарии (очень тёмный серый, чтобы не отвлекали)
        ZSH_HIGHLIGHT_STYLES[comment]='fg=238,italic'

        # Имена файлов, которые идут ПОСЛЕ стрелочек перенаправления (например, file.txt)
        ZSH_HIGHLIGHT_STYLES[arg0]='fg=248'

		# Остальной текст
        ZSH_HIGHLIGHT_STYLES[default]='fg=248'
    fi
}

# Обертка, чтобы цвета плагина гарантированно применились
autoload -U add-zsh-hook
add-zsh-hook precmd _apply_syntax_colors

# Запуск Fastfetch при открытии терминала
clear
fastfetch --logo blackarch --logo-padding-left 5

