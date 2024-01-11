FROM repulpmaster.unx.sas.com/viya-4-x64_oci_linux_2-docker-testready/sas-decisions-runtime-base:1.68.22-20240111.1704950567675
LABEL model container image
USER root
RUN chown sas:sas /modules
USER sas
ENV SAS_SCR_APP_PATH=/decision_tree_ep_rc_git
COPY --chown=sas:sas unzipped/ /modules/
COPY --chown=sas:sas manifest/ /manifest/
ENV LD_LIBRARY_PATH=/opt/scr/viya/home/SASFoundation/utilities/bin:/opt/scr/viya/home/SASFoundation/sasexe
