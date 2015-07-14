#################################################################
# This docker image build file creates an image that contains
# nginx, passenger, rvm with ruby on rails. It is intended for you
# to use as a base for your project. Or as a template for your dockerfile.
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
# Component:    nginx php mysql redis mongo ruby elasticsearch 
# Author:       lavender <lavendergeng@gmail.com>
#################################################################

#####
# Building: sudo docker build -t localhost:5000/webapp .
# Open it up: sudo docker run -t -i -p 80:80 -p 443:443 -p 4000:22 bash -l

FROM localhost:5000/ubuntu:latest
MAINTAINER lavender <lavendergeng@gmail.com>

# Update the default application repository sources list
RUN apt-get update

# Install Memcached
RUN apt-get install -y memcached

# Port to expose (default: 11211)
EXPOSE 11211

# Default Memcached run command arguments
# Change to limit memory when creating container in Tutum 
CMD ["-u", "root", "-m", "64"]

# Set the user to run Memcached daemon
USER daemon

# Set the entrypoint to memcached binary
ENTRYPOINT memcached
