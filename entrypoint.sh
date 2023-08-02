#!/bin/bash

# install the extensions
code-server --install-extension /copilot.vsix
#code-server --install-extension /ms-python.vsix
chown -R coder:coder /home/coder

#remove the files
#cp rm /copilot.vsix
#RUN rm /ms-python.vsix


code-server --auth none --host=0.0.0.0 --port=8080