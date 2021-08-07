# #/bin/sh
# ## Update values.yaml file

# ## Remove empty lines from the file
# sed -i '/^$/d' ${HELM_TEMPLATES_PATH}/values.yaml

# ## Enter the environment varialbe based on environment
# echo -e "Updating values.yaml...\n"
# echo -n "environment:" >> ${HELM_TEMPLATES_PATH}/values.yaml
# echo " ${ENVIRONMENT}" >> ${HELM_TEMPLATES_PATH}/values.yaml

# ## Print content of values.yaml
# echo -e "Content of values.yaml\n"
# cat ${HELM_TEMPLATES_PATH}/values.yaml

# ## Update Chart.yaml file
# echo -e "\nUpdating Chart.yaml...\n"

# ## Remove empty lines from the file
# sed -i '/^$/d' ${HELM_TEMPLATES_PATH}/Chart.yaml
# sed -i '/version/d' ${HELM_TEMPLATES_PATH}/Chart.yaml

# ## Enter the version varialbe based on gitlab-ci specification
# echo -n "version:" >> ${HELM_TEMPLATES_PATH}/Chart.yaml
# echo " ${APP_VERSION}" >> ${HELM_TEMPLATES_PATH}/Chart.yaml

# ## Print content of Chart.yaml
# echo -e "Content of Chart.yaml\n"
# cat ${HELM_TEMPLATES_PATH}/Chart.yaml

# ## Update values.yaml file
# sed -i "s/DOCKERUSER/gitlab-ci-token/" ${HELM_TEMPLATES_PATH}/values.yaml
# sed -i "s/DOCKERPASS/$REG_TOKEN/" ${HELM_TEMPLATES_PATH}/values.yaml
