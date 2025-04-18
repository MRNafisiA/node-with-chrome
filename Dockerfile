FROM node:20.19.0-bookworm

RUN   wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O /tmp/google.pub &&\
    gpg --no-default-keyring --keyring /etc/apt/keyrings/google-chrome.gpg --import /tmp/google.pub &&\
    echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list &&\
    apt update &&\
    apt install -y google-chrome-stable &&\
    apt autoremove --purge -y &&\
    apt clean all

