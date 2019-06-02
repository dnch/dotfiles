# Hey, More Dotfiles!

I may have named this repo incorrectly, as if it works the way I intend it to, the only hidden file needed will be `.config` :tada:

## Getting Started

Everything here is based around `$XDG_CONFIG_HOME` being present, including for `fish`. Given that (so far) the only target platform for these dotfiles is macOS, I'm using `launchctl` to have it present for every process launched.

## Change Tracking and Monitoring

This is designed to be an in-place, living repo. I don't want to put the repo somewhere else on disk and have a set of symlinks holding things in place.

I also want GitHub to be the source of truth for synchronising between my machines; In the past, I've tried using a combination of Git+Dropbox, but I either forget to commit things, or found trying to maintin a web of symlinks becomes too onerous.

I wanted to make sure I had a clear warning when I had un-commited changes to my shared configuration. Every time a new instance of Fish starts, it checks to see if there are any un-committed changes, un-pushed commits, or new commits on GitHub. If there are, it adds the corresponding icons to my prompt:

Icon           | Status Variable  | Intended Message
-------------- | ---------------- | ----------------
:biohazard: | DOTFILES_DIRTY   | Uncommited changes in `$XDG_CONFIG_HOME`
:parking:   | DOTFILES_SHINY   | Commits in `$XDG_CONFIG_HOME` that haven't been pushed to GitHub
:sparkle:   | DOTFILES_STALE   | New commits on GitHub

It does this through the magic of _Universal Variables._ :sparkles: Seriously, learn [Fish](https://fishshell.com/). It's awesome.

# rbenv

Nothing special here, just a helper that puts the current version in my right prompt.
