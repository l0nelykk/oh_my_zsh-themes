# ==========================================
# Custom theme: arch
# ==========================================

# Prompt configuration (input line)
get_path() {
     if [[ "$PWD" == "$HOME" ]]; then
         echo ""
     else
         echo "%F{159,italic}%1d "
     fi
}
# Prompt with purple arrow
PROMPT='$(get_path)%F{255}▶ %f'

# Colors for ls utility (gray folders, purple executables/scripts)
# di=directories, ex=executables, ln=symlinks, fi=regular files
export LS_COLORS="di=38;5;244:ex=38;5;99:ln=38;5;242:fi=00"
alias ls='ls --color=auto'

# Syntax highlighting
_apply_syntax_colors() {
    if (( $+ZEBRA_STRIPES || $+ZSH_HIGHLIGHT_STYLES )); then

        # Commands, aliases, functions
        ZSH_HIGHLIGHT_STYLES[command]='fg=152,bold'
        ZSH_HIGHLIGHT_STYLES[builtin]='fg=152,bold'
        ZSH_HIGHLIGHT_STYLES[alias]='fg=152,bold'
        ZSH_HIGHLIGHT_STYLES[function]='fg=152,bold'

        # Errors / Unknown commands
        ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=242,bold'

        # Flags and arguments (color 90 - dark grayish purple, muted)
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=73'
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=73'

        # Paths to files and directories
        ZSH_HIGHLIGHT_STYLES[path]='fg=80,underline'

        # Text in quotes
        ZSH_HIGHLIGHT_STYLES[string]='fg=44'
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=44'
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=44'
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=44'
        ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=44'

        # Variables like $HOME
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=81'
        ZSH_HIGHLIGHT_STYLES[environment-variable]='fg=81'
        ZSH_HIGHLIGHT_STYLES[assign]='fg=81'

        # Operators, pipes and arrows (color 242 - medium gray, bold)
        # &&, |, >, >>, etc.
        ZSH_HIGHLIGHT_STYLES[redirection]='fg=81,bold'
        ZSH_HIGHLIGHT_STYLES[operator]='fg=81,bold'

        # Comments (color 238 - very dark gray, italic to blend into background)
        ZSH_HIGHLIGHT_STYLES[comment]='fg=238,italic'

        # Default text / Arguments / Filenames (color 248 - light gray, readable)
        ZSH_HIGHLIGHT_STYLES[default]='fg=250'
    fi
}

# Wrapper to enforce color application on every prompt refresh
autoload -U add-zsh-hook
add-zsh-hook precmd _apply_syntax_colors

# Run Fastfetch when terminal opens (Display Gentoo logo with left padding)
clear
fastfetch --logo arch --logo-padding-left 5
echo
