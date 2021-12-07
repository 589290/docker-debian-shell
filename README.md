[![Docker Pulls](https://img.shields.io/docker/pulls/589290/debian-shell.svg)](https://hub.docker.com/repository/docker/589290/debian-shell)

Debian Docker Shell
=======================================

Builds a Debian 11 (bullseye-slim) docker image that includes an ssh server, htop, and tmux. It also copies in my public RSA keys and an htop config file, starts the ssh daemon, and then finally goes into a sleep loop to keep the container running.  

Build the image with something like:    
```docker build -t 589290/debian-shell:latest .```  
  
Run it with something like:  
```docker run -d -p 0.0.0.0:2222:22 --name deb 589290/debian-shell```  
  
Then ```ssh``` into your new <del>box</del> container and enjoy!  
  

Hosted image is here: https://hub.docker.com/r/589290/debian-shell  
