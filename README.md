# nota

nota is an basic applet framework for micro utilities like TODO lists, calendars, ...

While including the basics with this project, it is easily expanable using Lua.

# Included apps

* `install`
  - Special: Installs a Lua applet into the nota database so that it can be loaded from nota without it being compiled into nota.
* `uninstall`
  - Special: Does the reverse of `install`.
* `list`
  - Special: Lists applets.

* `todo`
  - A basic TODO applet.

# Installation.

Install [Carbon](https://github.com/carbonsrv/carbon) first.

Then run `make`. This will zip up core nota and its frontends, continuing to generate a carbon app bundle of nota, followed shortly by installing the applets into its storage db.

# Story

The author's brain is very picky on what to remember and what not.

Things he doesn't care much about he forgets quickly. *Very quickly*

The author forgot he started this project, only to find out he did three days later.

... And again after another three days.

... And countless other days.
