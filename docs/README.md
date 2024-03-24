> [!CAUTION]
> This annex is not released by the Z-Shell team.

<h1 align="center">
  <a href="https://github.com/z-shell/zi">
    <img align="center" src="https://github.com/z-shell/zi/raw/main/docs/images/logo.png" alt="Logo" width="60px" height="60px" />
  </a> ❮ Zi ❯ Annex - Alias
</h1>
<h2 align="center">
  <p> An Annex that allows you to set an alias for a bin installed with bin-gem-node </p>
</h2><hr />

## 💡 Wiki: alias - [annexes](https://wiki.zshell.dev/ecosystem/category/-annexes) - [bin-gem-node](https://wiki.zshell.dev/ecosystem/annexes/bin-gem-node)

## Install

Simply load like a regular plugin, i.e.:

```zsh
zi light kiliantyler/z-a-alias
```

This installs the annex and makes the `alias''` ice available.

You can use this annex supplimentarily with bin-gem-node `fbin''` and `sbin''` ices.

For example to install eza _as_ eza as well as alias it to `ls`:

```zsh
zi as'null' from"gh-r" sbin'**/eza' alias'ls' for \
  kiliantyler/eza-releaser
```

This allows builtins and default commands to be aliased while still allowing `\command ls` to work as expected. If you have `eza` installed via `sbin'**/eza -> ls'` or `fbin'**/eza -> ls'` running `command ls` will still run `eza`.

---

> [!NOTE]
>
> This repository compatible with [Zi](https://github.com/z-shell/zi)
