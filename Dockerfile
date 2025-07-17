FROM Ubuntu:latest

RUN MKDIR /app

RUN apt-get update && apt-get install -y python3 python3-pip

