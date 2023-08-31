# remove-guard

Ask first for confirmation whenever `rm -r` is called in a `bash` shell session. The repository consists of a function to add to your `.bashrc` file and an alias for the function (`rmv`). It also aliases another function to mask the standard `rm` command. 

When `rmv -r` is called, it displays the first few subdirectories that would be deleted by the standard `rm -r` command. It does not list all directories, so you still need to be careful. 

The primary goal of `rmv -r` is to reduce keyboard input errors (for instance, accidentally hitting enter after scrolling through previous commands) or "muscle memory" errors that might occur when deleting repositories. I decided to write this code after discovering that there was no good solutions to efficiently and carefully delete repositories using standard `bash` commands; either you need to remove each file separately or remove a directory without any confirmation. `rmv -r` falls somewhere in between these two options, asking for confirmation before deleting.
