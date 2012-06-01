Cobalt Calibur 2.x
===

![Cobalt Calibur 2.x Screenshot](https://github.com/tlhunter/Cobalt-Calibur-2/blob/master/screenshot.png?raw=true)

Obligatory Screenshot

Disclaimer
==

I built this in 2006. It was one of the first things I ever built
using PHP. It is in no way an example of the programming ability of Thomas
Hunter.

Overview
==

This game is really simple. All you can do is walk around. You can also
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

Setup
==

You'll want to add your MySQL connection settings to:

    includes_ajax/mysql.ssi.php

One thing I had done to keep the MySQL server from crashing so much was to
store character positions into a MEMORY table, and plan on writing to disk
occasionally (every few minutes) and reading when the server restarts. Here's
the command to get the positions restored:

    INSERT INTO map_locations SELECT * FROM map_locations_perm

Or, you can just modify _map_locations_ so that it is no longer a MEMORY table.

Lessons Learned
==

One thing I learned is that polling for updates is bad. Also, allowing player
movement based on how fast their connection is is bad. Using PHP for this sort
of game engine is bad. Storing this kind of data in MySQL is bad. Opening so
many connections and running so many queries over and over in such a small
amount of time is bad.

The good way to build this sort of game would be to use web sockets (which
didn't exist at the time) and an event-based server. There should also be a
lot more JavaScript going on.

Future Development
==

This version of the game is being totally scrapped. I will one day build
Cobalt Calibur 3 using the latest and greatest web technologies, and it will
be good. Keep an eye on renownedmedia.com and hopefully you'll one day see
an announcement for it.
