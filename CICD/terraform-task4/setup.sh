#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run -d -p 80:1337 nikampradyumna/strapi-app4:latest
