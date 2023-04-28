FROM hocusdev/workspace

# Set up user
RUN sudo useradd -m -s /bin/bash yuhii 

USER yuhii

WORKDIR /home/yuhii

# Set up node
RUN { curl --retry-all-errors --connect-timeout 5 --retry 5 --retry-delay 0 --retry-max-time 40 -fsSL https://deb.nodesource.com/setup_18.x | sudo bash -; } \
    && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y nodejs \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && sudo npm install -g npm@latest

RUN ["ls"]