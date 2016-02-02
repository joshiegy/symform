# Symform
This is a simple dockercontainer for Symform.

During the setup process in the webinterface - user should select port 42666 under "Advanced"

# First run:
* docker run -v /mnt/docker/symform/data/:/data -p 42666:42666/tcp -p 59234:59234/tcp --name symform -tid joshiegy/symform

# Access webgui through:
* host-ip:59234

Portforward from outside to port host-ip:42666
