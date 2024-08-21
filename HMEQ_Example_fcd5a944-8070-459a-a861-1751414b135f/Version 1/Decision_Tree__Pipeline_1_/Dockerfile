FROM repulpmaster.unx.sas.com/viya-4-x64_oci_linux_2-docker/sas-decisions-runtime-base:1.84.12-20240716.1721129255472
LABEL model container image
USER root
RUN chown sas:sas /modules
USER sas
ENV SAS_SCR_APP_PATH=/decision_tree__pipeline_1_0
COPY --chown=sas:sas unzipped/ /modules/
COPY --chown=sas:sas manifest/ /manifest/
ENV LD_LIBRARY_PATH=/opt/scr/viya/home/SASFoundation/utilities/bin:/opt/scr/viya/home/SASFoundation/sasexe
