FROM codercom/code-server:4.100.2-39

USER root

# Install dependencies that might be needed for extensions
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY extensions/copilot.vsix /copilot.vsix
COPY extensions/copilot-chat.vsix /copilot-chat.vsix
COPY setup.sh /setup.sh

RUN /bin/bash /setup.sh

# Add configuration to make the Copilot authentication easier
ENV GITHUB_TOKEN=""

USER coder
RUN mkdir -p /home/coder/workspace
WORKDIR /home/coder/workspace

EXPOSE 8080

ENTRYPOINT ["/usr/bin/env", "sh", "/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]

