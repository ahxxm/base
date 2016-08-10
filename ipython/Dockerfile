# Set $PASSWORD and $NOTEBOOK_PORT before use

FROM alpine:latest
WORKDIR /home/root/.jupyter/
ADD config.py ./jupyter_notebook_config.py
RUN build.sh
CMD ["jupyter", "notebook"]
