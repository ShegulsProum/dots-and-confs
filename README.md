<div align="center">
<h1>dots</h1>
</div>

## Setting up

Shoutout to [jaagr/dots](https://github.com/jaagr/dots)

This simple yet effective technique lets you track the files you care about
and it doesn't require any tools other than git. The files will be kept at
their intended location, without the need to create symlinks or copies.

Files are added to the repository by calling `dots add $HOME/.config/file` and when
issuing `git status` - only changes to files explicitly added will be shown.

To get a list of files not tracked by git, use `dots untracked` or `dots untracked-at $HOME/path/to/foo/bar`
to only show files in a specific subdirectory.

Dead simple!

### Alias

```sh
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
```

### Setup

```sh
git init --bare $HOME/.dots.git
dots remote add origin https://github.com/ShegulsProum/dots-and-confs.git
```

### Configuration

```sh
dots config status.showUntrackedFiles no

# Useful aliases
dots config alias.untracked "status -u ."
dots config alias.untracked-at "status -u"
```

### Usage

```sh
# Use the dots alias like you would use the git command
dots status
dots add --update ...
dots commit -m "..."
dots push

# Listing files (not tracked by git)
dots untracked
dots status -u .config/

# Listing files (tracked by git)
dots ls-files
dots ls-files .config/polybar/
```

### Replication

```sh
git clone --recursive --separate-git-dir=$HOME/.dots.git https://github.com/ShegulsProum/dots-and-confs.git /tmp/dots
rsync -rvl --exclude ".git" /tmp/dots/ $HOME/
rm -r /tmp/dots
dots submodule update --init --recursive $HOME/
```