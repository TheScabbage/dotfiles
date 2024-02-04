Big box o dotfiles.
Uses GNU Stow to manage the symlinks.

To install on new system:

```git clone git@gitlab.com:Scabbage/dotfiles.git ~/dotfiles```

```stow ~/dotfiles```

If conflicting files already exist, then move them into the /dotfiles directory with:

```stow --adopt *```

Which will alter the contents of the ~/dotfiles directory.
Now to discard all of the original dotfiles, simply:

```git restore .```

Then update the old symlinks with

```stow .```
