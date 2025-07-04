# LB’s dotfiles

![Screenshot of my shell prompt](https://i.imgur.com/EkEtphC.png)

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/loganbek/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/loganbek/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE-MIT.txt}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/loganbek/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-L26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="loganbek"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="loganbek@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

Some of the functionality of these dotfiles depends on formulae installed by `brew.sh`. If you don’t plan to run `brew.sh`, you should look carefully through the script and manually install any particularly important ones. A good example is Bash/Git completion: the dotfiles use a special version from Homebrew.

## WSL (Windows Subsystem for Linux) Setup

### Prerequisites

1. **Enable WSL2 on Windows:**
   ```powershell
   wsl --install
   ```
2. **Install Ubuntu from Microsoft Store**
3. **Install Windows Terminal** (recommended)

### Installation

1. **Clone the repository in WSL:**
   ```bash
   cd ~
   git clone https://github.com/loganbek/dotfiles.git ~/Projects/dotfiles
   ln -s ~/Projects/dotfiles ~/dotfiles
   ```
2. **Run the bootstrap script:**
   ```bash
   cd ~/dotfiles
   ./bootstrap.sh
   ```

This will automatically detect WSL and run WSL-specific setup, including:
- Linking Windows directories (Downloads, Documents, Desktop)
- Installing essential Linux packages and WSL utilities
- Setting up clipboard and Windows interop aliases

### Tips
- Use `cdw`, `cdd`, `cdp` to quickly access Windows folders
- Use `open` to open files with Windows default programs
- Use `pbcopy`/`pbpaste` for clipboard integration
- For best performance, keep projects in the WSL filesystem (`~/`)

## Feedback

Suggestions/improvements
[welcome](https://github.com/loganbek/dotfiles/issues)!

## Author

| [![github/loganbek](https://avatars.githubusercontent.com/u/your-github-id?s=70)](https://github.com/loganbek "Follow @loganbek on GitHub") |
|---|
| [loganbek](https://github.com/loganbek) |

## Thanks to…

* Anyone who [contributed a patch](https://github.com/loganbek/dotfiles/contributors) or [made a helpful suggestion](https://github.com/loganbek/dotfiles/issues)
