source jim.env_vars.txt
export ANSIBLE_VAULT_PASSWORD_FILE=~/.ssh/j-vault-pass.txt
echo "${GUID} is the guid"
ansible-playbook main.yml \
  -e "guid=${GUID}" \
  -e "env_type=${ENVTYPE}" \
  -e "osrelease=${OSRELEASE}" \
  -e "repo_version=${REPO_VERSION}" \
  -e "cloud_provider=${CLOUDPROVIDER}" \
  -e "aws_region=${REGION}" \
  -e "HostedZoneId=${HOSTZONEID}" \
  -e "master_instance_type=${NODE_MASTER_TYPE}" \
  -e "infranode_instance_type=${NODE_INFRA_TYPE}" \
  -e "support_instance_type=${NODE_NFS_TYPE}" \
  -e "node_instance_type=${NODE_INSTANCE_TYPE}" \
  -e "key_name=${KEYNAME}" \
  -e "subdomain_base_suffix=${BASESUFFIX}" \
  -e "node_instance_count=${NODE_COUNT}" \
  -e "bastion_instance_type=${NODE_BASTION_TYPE}" \
  -e "repo_method=${REPO_METHOD}"  \
  -e "software_to_deploy=openshift"\
  -e "ANSIBLE_REPO_PATH=${DEPLOYER_REPO_PATH}" \
  -e "install_idm=htpasswd" \
  -e "install_glusterfs=${GLUSTERFS}" \
  -e "install_dyamic_nfs=${DYNAMIC_NFS}" \
  -e "enable_workshops_catalog=${WORKSHOPS_CATALOG}" \
  -e "admin_user=${ADMIN_USER}" \
  -e "admin_password=$i{ADMIN_PASSWORD}" \
  -e "user_password=${USER_PASSWORD}" \
  -e "osm_use_cockpit=false" \
  -e "install_prometheus=${WANT_PROMETHEUS}" \
  -e "install_lets_encrypt_certificates=true" \
  -e "email=eran.sery@delta.com" \
  -e "output_dir=/home/934037/awsopenshift/" \
  -e @${SECRET_FILE} --skip-tags=opentlc-integration,remove_self_provisioners -v ##--ask-vault-pass -v

# Notes: ToDO
# admin_user: opentlc-mgr
# install_openshiftapb: false
# install_lets_encrypt_certificates: false
# # Set the next variable to false to run tests.
#   This prevents hitting the rate limiter of
#   Let's Encrypt when requesting lots of certificates
#   Set to true for "real" certificates
#   No effect when install_lets_encrypt_certificates=false
# lets_encrypt_production: true


