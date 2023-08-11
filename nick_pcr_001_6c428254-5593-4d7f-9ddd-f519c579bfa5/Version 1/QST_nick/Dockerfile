#FROM repulpmaster.unx.sas.com/viya-4-x64_oci_linux_2-docker-testready/sas-decisions-runtime-base:1.58.11-20230727.1690431186632
#LABEL model container image
#USER root
#RUN chown sas:sas /modules
#USER sas
#ENV SAS_SCR_APP_PATH=/qst_nick
#COPY --chown=sas:sas unzipped/ /modules/
#COPY --chown=sas:sas manifest/ /manifest/
#ENV LD_LIBRARY_PATH=/opt/scr/viya/home/SASFoundation/utilities/bin:/opt/scr/viya/home/SASFoundation/sasexe

FROM registry.unx.sas.com/oscr/pcr-py310:v8

COPY QST_nick/dmcas_fitstat.json /pybox/model
COPY QST_nick/dmcas_lift.json /pybox/model
COPY QST_nick/dmcas_roc.json /pybox/model
COPY QST_nick/hmeq_logistic.pickle /pybox/model
COPY QST_nick/hmeq_logistic_score.py /pybox/model
COPY QST_nick/inputVar.json /pybox/model
COPY QST_nick/ModelProperties.json /pybox/model
COPY QST_nick/outputVar.json /pybox/model
COPY QST_nick/requirements.json /pybox/model
COPY QST_nick/settings.py /pybox/model

USER root
RUN chown sas:sas /pybox/model/
RUN chown sas:sas /tmp/
# for now copy what is in requirements.txt here
RUN pip3 install statsmodels
USER sas
 
ENTRYPOINT ["/bin/bash", "startServer.sh"]
