FROM ubuntu:20.04

LABEL com.github.actions.name="PGSanity Action"
LABEL com.github.actions.description="GitHub Action for pgsanity CLI"
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="red"
LABEL repository="https://github.com/Blockost/pgsanity-action"

RUN apt-get update
RUN apt-get install -y libecpg-dev
RUN apt-get install -y python3-pip
RUN pip3 --no-cache install pgsanity==0.2.9  

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]