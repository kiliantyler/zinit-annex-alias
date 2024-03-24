# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Zsh Plugin Standard:
# builtin emulate -L zsh ${=${options[xtrace]:#off}:+-o xtrace}
# builtin setopt extended_glob warn_create_global typeset_silent no_short_loops rc_quotes no_auto_pushd

# Standardized $0 handling
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://wiki.zshell.dev/community/zsh_plugin_standard#standard-plugins-hash
typeset -gA Plugins
Plugins[ZA_ALIAS]="${0:h}"

# Functions directory
# https://wiki.zshell.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]] {
    fpath+=( "${0:h}/functions" )
}

# The Proposed Function-Name Prefixes
# https://wiki.zshell.dev/community/zsh_plugin_standard#the-proposed-function-name-prefixes
autoload -Uz .za-alias-{atload,help}-handler

# An empty stub to fill the help handler fields
.za-alias-null-handler() { :; }

@zi-register-annex "z-a-alias" hook:atload-30 \
  .za-alias-atload-handler \
  .za-alias-null-handler "alias''" # register a new ice-mod: alias''
