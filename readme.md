## Base Vagrant/Docker Box

Before you get started you need:

* To install Vagrant and VirtualBox
* Have a folder at the root of your user's home directory called 'sites' -- or
  not (if not, you'll need to modify the Vagrantfile to fit your preferences).

That's mostly it. To start the vm, all you need to do is:

```bash
cd vagary
vagrant up
vagrant ssh
```

There are a couple of docker containers that come in the shared folder to help
bootstrap your dev:

1. A mysql container. To save on resources, most of the sites I dev connect to
   the same mysql container (as opposed to spinning up a mysql container for
   each site).
2. A reverse proxying nginx container. This is so you don't have to assign
   unique ports to each of the sites you're developing. All you have to do is
   supply a VIRTUAL_HOST env variable for whatever dev container you're working
   on, and then add that value to your host's host file (the host outside
   vagrant, e.g., your mac or windows host). *NOTE:* You'll need to create a
   docker network for this, but don't worry. Docker will throw an error and
   will tell you what you need to do.

To boot these two containers run the following after ssh'ing into your new box:

```bash
cd /var/shared
./start-base-services.sh
```

If you run into an issue, see above -- it could be that you need to create the
Docker network.

There's a sample dev site under /var/shared/php_example that ties all this
stuff together (see its readme for more info). To run it, cd to its directory and run:

```bash
docker-compose up
```

Note that to visit the site, you'll need to update your hosts host file:

```bash
# From your host computer (i.e., not inside vagrant)
sudo nano /etc/hosts
# Add the following line to the bottom of that file
192.168.168.168 sample.dev
```
