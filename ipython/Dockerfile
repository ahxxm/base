# Set $PASSWORD and $NOTEBOOK_PORT before use

FROM alpine:latest
WORKDIR /home/root/.jupyter/
ADD . ./
RUN build.sh
CMD ["jupyter", "notebook"]
