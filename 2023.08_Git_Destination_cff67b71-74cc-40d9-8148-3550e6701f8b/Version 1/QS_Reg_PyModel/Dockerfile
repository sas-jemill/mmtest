FROM registry.unx.sas.com/oscr/viya-4-x64_oci_linux_2-docker-testready/sas-decisions-runtime-base:1.58.20-20230814.1692024571957
LABEL model container image
USER root
RUN chown sas:sas /modules
USER sas
ENV SAS_SCR_APP_PATH=/qs_reg_pymodel
COPY --chown=sas:sas unzipped/ /modules/
COPY --chown=sas:sas manifest/ /manifest/
ENV LD_LIBRARY_PATH=/opt/scr/viya/home/SASFoundation/utilities/bin:/opt/scr/viya/home/SASFoundation/sasexe
