# SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <hyperpolymath>
#
# Known-Good Baseline Shell Configuration
# ========================================
# A minimal, secure, POSIX-compatible shell configuration.
# Source this from your ~/.bashrc or ~/.zshrc
#
# Usage: . /path/to/baseline.sh
#        source /path/to/baseline.sh

# =============================================================================
# SAFETY & SECURITY
# =============================================================================

# Exit on undefined variables (catch typos)
set -u 2>/dev/null || true

# Secure umask: files 644, directories 755
umask 022

# Disable core dumps (security)
ulimit -c 0 2>/dev/null || true

# =============================================================================
# HISTORY CONFIGURATION
# =============================================================================

# History size
HISTSIZE=10000
HISTFILESIZE=20000

# Ignore duplicates and commands starting with space
HISTCONTROL=ignoreboth:erasedups

# Append to history, don't overwrite
shopt -s histappend 2>/dev/null || true

# Timestamp history entries
HISTTIMEFORMAT='%F %T  '

# Ignore common commands in history
HISTIGNORE='ls:ll:la:cd:pwd:exit:clear:history'

# =============================================================================
# SHELL BEHAVIOR
# =============================================================================

# Check window size after each command
shopt -s checkwinsize 2>/dev/null || true

# Enable ** glob pattern (bash 4+)
shopt -s globstar 2>/dev/null || true

# Case-insensitive globbing
shopt -s nocaseglob 2>/dev/null || true

# Autocorrect minor typos in cd
shopt -s cdspell 2>/dev/null || true

# Enable extended pattern matching
shopt -s extglob 2>/dev/null || true

# =============================================================================
# PATH CONFIGURATION
# =============================================================================

# Function to safely add to PATH (no duplicates)
path_prepend() {
    case ":${PATH}:" in
        *:"$1":*) ;;
        *) PATH="$1${PATH:+:$PATH}" ;;
    esac
}

path_append() {
    case ":${PATH}:" in
        *:"$1":*) ;;
        *) PATH="${PATH:+$PATH:}$1" ;;
    esac
}

# User binaries (high priority)
[ -d "$HOME/.local/bin" ] && path_prepend "$HOME/.local/bin"
[ -d "$HOME/bin" ] && path_prepend "$HOME/bin"

# Cargo/Rust (RSR: Rust preferred for CLI tools)
[ -d "$HOME/.cargo/bin" ] && path_prepend "$HOME/.cargo/bin"

# Deno (RSR: replaces Node/npm/bun)
[ -d "$HOME/.deno/bin" ] && path_prepend "$HOME/.deno/bin"

# Guix (RSR: primary package manager)
if [ -d "$HOME/.guix-profile" ]; then
    path_prepend "$HOME/.guix-profile/bin"
    export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"
fi

# Nix (RSR: fallback package manager)
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

export PATH

# =============================================================================
# EDITOR & PAGER
# =============================================================================

# Prefer modern editors
if command -v hx >/dev/null 2>&1; then
    export EDITOR='hx'
    export VISUAL='hx'
elif command -v nvim >/dev/null 2>&1; then
    export EDITOR='nvim'
    export VISUAL='nvim'
elif command -v vim >/dev/null 2>&1; then
    export EDITOR='vim'
    export VISUAL='vim'
else
    export EDITOR='vi'
    export VISUAL='vi'
fi

# Pager configuration
export PAGER='less'
export LESS='-R -F -X -i -M -S'
export LESSHISTFILE=-

# =============================================================================
# LOCALE & ENCODING
# =============================================================================

export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

# =============================================================================
# SAFE ALIASES
# =============================================================================

# Interactive safety (prompt before overwrite)
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Directory listing
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Clear screen
alias cls='clear'

# =============================================================================
# DEVELOPMENT ENVIRONMENT (RSR-Compliant)
# =============================================================================

# Rust
if command -v rustc >/dev/null 2>&1; then
    export RUST_BACKTRACE=1
fi

# Deno (RSR: preferred JS runtime)
if command -v deno >/dev/null 2>&1; then
    export DENO_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/deno"
fi

# XDG Base Directory Specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# =============================================================================
# PROMPT
# =============================================================================

# Simple, informative prompt
# Format: [exit_code] user@host:dir $
__baseline_prompt() {
    local exit_code=$?
    local prompt_char='$'
    [ "$(id -u)" -eq 0 ] && prompt_char='#'

    if [ $exit_code -ne 0 ]; then
        printf '\001\033[31m\002[%d]\001\033[0m\002 ' "$exit_code"
    fi
    printf '\001\033[32m\002%s\001\033[0m\002@\001\033[34m\002%s\001\033[0m\002:\001\033[36m\002%s\001\033[0m\002 %s ' \
        "${USER:-$(whoami)}" \
        "${HOSTNAME%%.*}" \
        "${PWD/#$HOME/\~}" \
        "$prompt_char"
}

# Only set prompt for interactive shells
case $- in
    *i*)
        if [ -n "${BASH_VERSION:-}" ]; then
            PROMPT_COMMAND='PS1="$(__baseline_prompt)"'
        elif [ -n "${ZSH_VERSION:-}" ]; then
            precmd() { PS1="$(__baseline_prompt)" }
        else
            PS1='$ '
        fi
        ;;
esac

# =============================================================================
# CLEANUP
# =============================================================================

# Unset helper functions (keep namespace clean)
unset -f path_prepend path_append 2>/dev/null || true

# Reset -u for compatibility with scripts that don't handle it
set +u 2>/dev/null || true

# vim: ft=sh ts=4 sw=4 et
