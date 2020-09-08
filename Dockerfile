FROM chambm/pwiz-skyline-i-agree-to-the-vendor-licenses

MAINTAINER Alan Race 

RUN apt-get update && \
    apt upgrade -y --allow-unauthenticated && \
    apt install -y openjdk-8-jre-headless

RUN java -version

RUN wget https://github.com/AlanRace/imzMLConverter/releases/download/2.1.0/jimzMLConverter-2.1.0.zip
RUN unzip jimzMLConverter-2.1.0.zip
RUN mv jimzMLConverter/target/* ./
RUN rm -r jimzMLConverter

RUN echo "#!/bin/bash\njava -jar jimzMLConverter-2.1.0.jar \"\$@\"" > jimzMLConverter
RUN chmod 775 jimzMLConverter

# ENV PATH="/data:${PATH}"


