# ==========================================
# Custom theme: dark-purple (Gentoo Style)
# ==========================================

# Prompt configuration (input line)
get_path() {
     if [[ "$PWD" == "$HOME" ]]; then
         echo ""
     else
         echo "%F{201,italic}%1d "
     fi
}
# Prompt with purple arrow (color 93 - bright purple)
PROMPT='$(get_path)%F{255}▶ %f'

# Colors for ls utility (gray folders, purple executables/scripts)
# di=directories (gray 244), ex=executables (purple 99), ln=symlinks (gray 242), fi=regular files (default)
export LS_COLORS="di=38;5;244:ex=38;5;99:ln=38;5;242:fi=00"
alias ls='ls --color=auto'

# Syntax highlighting (zsh-syntax-highlighting)
_apply_syntax_colors() {
    if (( $+ZEBRA_STRIPES || $+ZSH_HIGHLIGHT_STYLES )); then

        # Commands, aliases, functions (color 201 - hot pink/magenta, bold)
        ZSH_HIGHLIGHT_STYLES[command]='fg=201,bold'
        ZSH_HIGHLIGHT_STYLES[builtin]='fg=201,bold'
        ZSH_HIGHLIGHT_STYLES[alias]='fg=201,bold'
        ZSH_HIGHLIGHT_STYLES[function]='fg=201,bold'

        # Errors / Unknown commands (color 238 - dark gray, bold, subtle error indication)
        ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=238,bold'

        # Flags and arguments (color 90 - dark grayish purple, muted)
        # -r, --help style options
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=90'
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=90'

        # Paths to files and directories (color 260 - muted lavender, underlined)
        ZSH_HIGHLIGHT_STYLES[path]='fg=260,underline'

        # Text in quotes (color 198 - vibrant pink, no green for cleanliness)
        ZSH_HIGHLIGHT_STYLES[string]='fg=198'
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=198'
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=198'
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=198'
        ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=198'

        # Variables like $HOME (color 198 - vibrant pink to stand out)
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=198'
        ZSH_HIGHLIGHT_STYLES[environment-variable]='fg=198'
        ZSH_HIGHLIGHT_STYLES[assign]='fg=198'

        # Operators, pipes and arrows (color 242 - medium gray, bold)
        # &&, |, >, >>, etc.
        ZSH_HIGHLIGHT_STYLES[redirection]='fg=242,bold'
        ZSH_HIGHLIGHT_STYLES[operator]='fg=242,bold'

        # Comments (color 238 - very dark gray, italic to blend into background)
        ZSH_HIGHLIGHT_STYLES[comment]='fg=238,italic'

        # Default text / Arguments / Filenames (color 248 - light gray, readable)
        ZSH_HIGHLIGHT_STYLES[default]='fg=248'
    fi
}

# Wrapper to enforce color application on every prompt refresh
autoload -U add-zsh-hook
add-zsh-hook precmd _apply_syntax_colors

# Run Fastfetch when terminal opens (Display Gentoo logo with left padding)
clear
fastfetch --logo gentoo --logo-padding-left 9
