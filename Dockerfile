FROM codercom/code-server:latest

COPY extensions/copilot.vsix /copilot.vsix
#COPY extensions/ms-python.vsix /ms-python.vsix

USER coder

RUN mkdir -p /home/coder/workspace
WORKDIR /home/coder/workspace

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]