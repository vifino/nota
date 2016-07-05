# nota notes and ideas

Everything should be as modular as possible.

The user interface should be a module, too. One can choose to have a plain text interface or even a web interface.

Plugins are responsible for every interaction. TODO features are in a todo module for example. Reminders in a reminder module, etc...

The storage of things are in a vfs with the sql backend, so that there is a single file containing everything you might possibly want to save.

This also gives one the ability to have the database contain modules, in theory. You could "install" a module by letting nota download a file and store it in the vfs.

## Invocation

You should be able to invoke nota by running "nota <module> <args...>" -> DONE!

Eventually, command line arguments should allow to specify the frontent module.

## Apps

An app in the context of nota is the applet which provides the actual interaction/content/etc..

Due to having the SQL VFS and having it integrated into the load path, you can load modules from the nota database too.

To use these features, use the "install" and "uninstall" applets included with nota.
