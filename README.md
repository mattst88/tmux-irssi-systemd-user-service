# tmux+irssi as a systemd user-service

A collection of hacks to run [irssi](https://irssi.org/) inside [tmux](https://tmux.github.io/) via a systemd user service.

I hope by publishing this that someone can be inspired to find a way to do it without so many awful hacks (and let me know about it!).

## Why

I use [adv_windowlist.pl](https://github.com/irssi/scripts.irssi.org/blob/master/scripts/adv_windowlist.pl) which has great integration with tmux.

I want irssi to start and stop cleanly on system reboot, which means starting up tmux.

## What

* `irssi.service`: systemd user service. Install to `/etc/systemd/user/`
* `tmux-irssi.env`: optional environment file. Install to `~/.config/`
* `pid.pl`: irssi script to write a pid file. Install to `~/.irssi/scripts/` (and symlink in `~/.irssi/scripts/autorun/`)

## Installation

After installing the files, just enable the service:

```sh
$ systemctl --user daemon-reload
$ systemctl --user enable --now irssi
```

The you can connect to tmux with

```sh
tmux -L irssi attach
```
