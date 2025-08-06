---
title: Ptyxis terminal background transparency
description: How to set ptyxis terminal transparency
draft: false
tags: terminal, linux, fedora, gnome
---
[[Ptyxis]] terminal  transparency is hidden from GUI, but you can set it via terminal with this command:

`gsettings set org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/$PTYXIS_PROFILE/ opacity .85`

Change the opacity number from .85 to your desired number.

**References:**
* https://www.reddit.com/r/gnome/comments/1fwubwy/new_gnome_terminal_471/