FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y docker.io && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY count_files.sh /usr/local/bin/count_files.sh

RUN chmod +x /usr/local/bin/count_files.sh

USER jenkins
