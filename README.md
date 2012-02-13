Cobalt Calibur 2.x
===

![Cobalt Calibur 2.x Screenshot](https://github.com/renownedmedia/Cobalt-Calibur-2/blob/master/screenshot.png?raw=true)
Obligatory Screenshot

*Disclaimer:* I built this in 2006. It was one of the first things I ever built
using PHP. It is in no way an example of the programming ability of Thomas
Hunter.

This game is really pretty simple. All you can do is walk around. You can also
see other people walking around at the same time. Everytime you move, the
screen is redrawn. Minimally, every 2 seconds, the screen is redrawn. There are
different 'world' screens, and a few 'town' screens. Stepping on the right kind
of tile will 'teleport' you to this different screen.

The project was developed almost entirely on a windows XP machine with 256MB of
RAM, 4GB HDD, 1.2 Ghz x 1 CPU. I really didn't know what I was doing at the
time, but at least I knew how to use JOIN's and hashed the passwords.

This is released under the BSD license, although you won't find much of any use
in here. The graphics do not fall under this license, as they are still copy-
written by their original authors (not sure who they are though).

One thing I had done to keep the MySQL server from crashing so much was to
store character positions into a MEMORY table, and plan on writing to disk
occasionally (every few minutes) and reading when the server restarts. Here's
the command to get the positions restored:

    INSERT INTO map_locations SELECT * FROM map_locations_perm

Or, you can just modify _map_locations_ so that it is no longer a MEMORY table.
