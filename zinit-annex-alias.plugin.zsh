# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-

# Zsh Plugin Standard:
builtin emulate -L zsh ${=${options[xtrace]:#off}:+-o xtrace}
builtin setopt extended_glob warn_create_global typeset_silent no_short_loops rc_quotes no_auto_pushd

# According to the Zsh Plugin Standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#zero-handling
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Standard hash for plugins:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#std-hash
typeset -gA Plugins
Plugins[DEFAULT_ICE_DIR]="${0:h}"

# Functions directory
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#funcs-dir
if [[ $PMSPEC != *f* ]] {
    fpath+=( "${0:h}/functions" )
}

# The Proposed Function-Name Prefixes
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#namespacing
autoload -Uz .za-alias-{atload,help}-handler

# An empty stub to fill the help handler fields
.za-alias-null-handler() { :; }

@zinit-register-annex "zinit-annex-alias" \
  hook:atload-50 \
  .za-alias-atload-handler \
  .za-alias-null-handler "alias''" # register a new ice: alias''
