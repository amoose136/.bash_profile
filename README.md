# .bash_profile
This is my bash config on macOS. Add as much of it as you want to your own .bash_profile file in ~ and get cool features such as:
* Showing current working directory before the $
* Better colors and default colors on ls command
* qlk command:
  * type `qlk foo` to preview the file `foo` with quicklook
  * type `qlk *` to preview everything in the current directory
* Improved ssh
  * Add aliases to `$servers` array and then typing `ssh servername` will connect with a tunnel back to the local machine. This has some advantages:
    * This tunnel can be used to ssh back (inception style) to the local machine with `sshback`
    * `scpb foo` will place foo in the working directory of the local machine at the time the ssh connection was initiated. This directory is also added to ENV on the remote machine as `$LOCAL_PWD` and the username of the local host as `$LOCAL_USER`.
  * If the server name is not aliased in `$servers` all arguments are passed to the standard ssh command.

# Monokai.terminal
This is the theme I use for my terminal. It makes the colors not suck on both light and dark backgrounds.
This is a modified version of https://github.com/stephenway/monokai.terminal

# Screenshots
![qlk demo](https://github.com/amoose136/bash-config/raw/master/images/sceen.png "qlk demo")
![sshb demo](https://github.com/amoose136/bash-config/raw/master/images/screen2.png "sshb demo")
  
