# ==========================================
# Custom theme: blackarch
# ==========================================

# Prompt configuration (input line)
get_path() {
     if [[ "$PWD" == "$HOME" ]]; then
         echo ""
     else
         echo "%F{248}%1d "
     fi
}
PROMPT='$(get_path)%F{244}▶ %f'  # Gray prompt symbol

# Colors for `ls` utility
export LS_COLORS="di=38;5;244:ex=38;5;160:ln=38;5;242:fi=00"  # Gray:244, Red:160, Dim-gray:242
alias ls='ls --color=auto'

# Syntax highlighting (zsh-syntax-highlighting)
# Called after plugin loads to reassign colors
_apply_syntax_colors() {
    if (( $+ZEBRA_STRIPES || $+ZSH_HIGHLIGHT_STYLES )); then

        # Commands, aliases, functions
        ZSH_HIGHLIGHT_STYLES[command]='fg=248,bold'
        ZSH_HIGHLIGHT_STYLES[builtin]='fg=248,bold'
        ZSH_HIGHLIGHT_STYLES[alias]='fg=248,bold'
        ZSH_HIGHLIGHT_STYLES[function]='fg=248,bold'

        # Errors or unknown commands
        ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=160,bold'

        # Options
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=242'
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=242'

        # Paths
        ZSH_HIGHLIGHT_STYLES[path]='fg=244,underline'

        # TEXT IN QUOTES
        ZSH_HIGHLIGHT_STYLES[string]='fg=243'
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=243,none'
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=243,none'

        # Variables like $HOME
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=251'
        ZSH_HIGHLIGHT_STYLES[environment-variable]='fg=251'
        ZSH_HIGHLIGHT_STYLES[assign]='fg=251'

        # Operators, pipes and arrows (&&, |, >)
        ZSH_HIGHLIGHT_STYLES[redirection]='fg=124,bold'  # Dark red

        # Comments
        ZSH_HIGHLIGHT_STYLES[comment]='fg=238,italic'  # Dark gray

        # Filenames that appear AFTER redirection arrows (e.g., file.txt)
        ZSH_HIGHLIGHT_STYLES[arg0]='fg=248'  # Light gray

        # Default text
        ZSH_HIGHLIGHT_STYLES[default]='fg=248'  # Light gray
    fi
}

# Wrapper to ensure plugin colors are applied
autoload -U add-zsh-hook
add-zsh-hook precmd _apply_syntax_colors

# Run Fastfetch when terminal opens
clear
fastfetch --logo blackarch --logo-padding-left 5
