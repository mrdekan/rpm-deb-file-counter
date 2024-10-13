FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER jenkins

RUN git clone https://github.com/mrdekan/rpm-deb-file-counter.git /opt/count_files

WORKDIR /opt/count_files
RUN dpkg -i /opt/count_files/debbuild.deb || true

RUN chmod +x /opt/count_files/count_files.sh

ENTRYPOINT ["/opt/count_files/count_files.sh"]
