[![Docker Pulls](https://img.shields.io/docker/pulls/589290/debian-shell.svg)](https://hub.docker.com/repository/docker/589290/debian-shell)

Debian Docker Shell
=======================================

Builds a Debian 11 (bullseye-slim) docker image that includes a few other packages. It also copies in my public RSA keys and a convenient apt update script (yup). It then starts the ssh daemon and finally goes into a sleep loop to keep the container running.  

A prebuilt image of this is here: https://hub.docker.com/r/589290/debian-shell

You can run it using:  
```
docker run -d \
    --name deb \
    --restart unless-stopped \
    -p 0.0.0.0:2222:22 \
    -e TZ=America/Chicago \
    589290/debian-shell:latest
```  
  
Then ```ssh``` into your new <del>box</del> container and enjoy!  
  
If you'd like to modify the `Dockerfile` and build your own custom image:

```
docker build -t 589290/debian-shell:latest .
```  
Then push the image up to your container registry:

```
docker push 589290/debian-shell:latest
```