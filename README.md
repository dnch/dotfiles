# Hey, More Dotfiles!

I may have named this repo incorrectly; If it works the way I intend it to, the only hidden file needed will be `.config` :tada:, rendering the pluralisation of this repo's name incorrect.

## Getting Started

Everything here is based around `$XDG_CONFIG_HOME` being present, including for `fish`. Given that (so far) the only target platform for these dotfiles is macOS, I'm using `launchctl` to have it present for every process launched.

## Change Tracking and Monitoring

This is designed to be an in-place, living repo. I don't want to put the repo somewhere else on disk and have a set of symlinks holding things in place.

I also want GitHub to be the source of truth for synchronising between my machines; In the past, I've tried using a combination of Git+Dropbox, but I either forget to commit things, or found trying to maintin a web of symlinks becomes too onerous.

I wanted to make sure I had a clear warning when I had un-commited changes to my shared configuration. Every time a new instance of Fish starts, it checks to see if there are any un-committed changes, un-pushed commits, or new commits on GitHub. If there are, it leaves me a helpful message via `fish_greeting`.

It does this through the magic of _Universal Variables._ :sparkles: Seriously, learn [Fish](https://fishshell.com/). It's awesome.

# rbenv

Nothing special here, just a helper that puts the current version in my right prompt.

# git

I've got a few custom helpers / commands that I've added to my workflow—they live in `git/helpers` and are loaded into `$PATH`.

Also, because I have this deployed on both my personal and work machines, i've left out the `[user]` configuraiton in `git/config`, opting instead to have the `GIT_COMMITTER_*`, and `GIT_AUTHOR_*` environment variables in `fish/config.local.fish`.

# RubyGems

At the moment, RubyGems doens't support `$XDG_CONFIG_HOME` (and at this stage (looks very unlikely to do so)[https://github.com/rubygems/rubygems/issues/1599]), so I get aroud it by pointing `$GEMRC` to a file inside my repo.

# Visual Studio Code

Still a TODO at this stage; I am keeping an eye on this with great interest:

- https://github.com/Microsoft/vscode/issues/3884

# TODO

## Fish

- [] re-add fisherman, install fzf again

## Homebrew

- [] track "standard" homebrew dependencies using a brewfile
