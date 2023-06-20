FROM codercom/code-server

# Set the user to root to create the custom extensions folder
USER root

# Create a custom extensions folder
RUN mkdir -p /home/coder/custom-extensions && chown coder:coder /home/coder/custom-extensions

# Switch back to the default non-root user
USER coder

# Set the custom extensions folder as an environment variable
ENV CODE_EXTENSIONS_DIR=/home/coder/custom-extensions

# Copy the extension files to the custom extensions folder
COPY extensions/*.vsix /home/coder/custom-extensions/

# Install extensions from the custom extensions folder
RUN for extension in $(ls /home/coder/custom-extensions/*.vsix); do \
      code-server --extensions-dir "$CODE_EXTENSIONS_DIR" --install-extension "$extension"; \
    done

WORKDIR /home/coder

# Start Code Server with the custom extensions folder
#ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "--extensions-dir", "/home/coder/custom-extensions", "."]

