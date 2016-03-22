This is just a super simple example of how to get a php site up and running in
a docker container.

Before gettign started, the mysql and reverse proxy containers should be
running. To run this container:

```bash
docker-compose up
```

If you haven't done so already, you should update your host's host file:

```bash
# From your host computer (i.e., not inside vagrant)
sudo nano /etc/hosts
# Add the following line to the bottom of that file
192.168.168.168 sample.dev
```

You shouln now be able to visit http://sample.dev from your browser!
