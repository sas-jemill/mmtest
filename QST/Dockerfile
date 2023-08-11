FROM registry.unx.sas.com/oscr/pcr-py310:v8

COPY ./ /pybox/model

USER root
RUN chown sas:sas /pybox/model/
RUN chown sas:sas /tmp/
# for now copy what is in requirements.txt here
RUN pip3 install statsmodels
USER sas
 
ENTRYPOINT ["/bin/bash", "startServer.sh"]
