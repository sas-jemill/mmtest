FROM repulpmaster.unx.sas.com/viya-4-x64_oci_linux_2-docker/sas-score-python3-base:3.69.1-20240716.1721146013118
LABEL model container image

COPY *.* /pybox/model/

USER root
RUN chown sas:sas /pybox/model/
USER sas


ENTRYPOINT ["/bin/bash", "startServer.sh"]
