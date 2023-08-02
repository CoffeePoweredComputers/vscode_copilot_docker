FROM codercom/code-server:4.11.0

USER root
COPY extensions/copilot.vsix /copilot.vsix

COPY setup.sh /setup.sh
RUN /bin/bash /setup.sh

USER coder
RUN mkdir -p /home/coder/workspace
WORKDIR /home/coder/workspace
EXPOSE 8080
ENTRYPOINT ["/usr/bin/env", "sh", "/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]