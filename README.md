# remove-guard

Ask first for confirmation whenever `rm -r` is called in a `bash` shell session. The repository consists of a function to add to your `.bashrc` or `.bash_profile` file.

## Set up

Place the `remove` function in the `rm_alias` file in your `.bashrc` or `.bash_profile` file. Add an alias for `remove` (such as `rmv`) function to the `.bashrc` file with `alias rmv='remove'`.

### Recommeded: remove `rm` functionality

To add additional guardrails and ensure that you cannot use the `rm` command, add the following function to your `.bashrc` or `.bash_profile` file:

```bash
remover() {
    echo "Use rmv instead command"
}

alias rm='remover'
```

To reenable `rm`, enter the command `unalias rm`.

## How it works

When `rmv -r` is called, it displays the first few subdirectories that would be deleted by the standard `rm -r` command. It does not list all directories, so you still need to be careful. 

Example:

```
rmv -r docs

*** Entered: rmv -r docs
*** Subdirectories include:
    >>> docs
    >>> docs/_includes
    >>> docs/academics
    >>> docs/quiz
    >>> docs/content
    >>> docs/_layouts
    >>> ...
*** Are you sure? [Y/n]:
```

The primary goal of `rmv -r` is to reduce keyboard input errors (for instance, accidentally hitting enter after scrolling through previous commands) or "muscle memory" errors that might occur when deleting repositories. I decided to write this code after discovering that there was no good solutions to efficiently and carefully delete repositories using standard `bash` commands; either you need to remove each file separately or remove a directory without any confirmation. `rmv -r` falls somewhere in between these two options, asking for confirmation before deleting.
