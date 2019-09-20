GUID=delta1
ADMIN_USER=ocp-admin
ADMIN_PASSWORD='DeltaDusters1!'
WANT_PROMETHEUS=True
DEPLOYER_REPO_PATH=/home/jbarlow/trythree/agnosticd/ansible
ENVTYPE=ocp-workshop
KEYNAME=openshift-aws
USER_PASSWORD=openshift232
REGION=us-east-1
CLOUDPROVIDER=ec2
BASESUFFIX='.jimbarlow.com'
NODE_COUNT=2
INSTALLIPA=false
REPO_VERSION=3.11
REPO_METHOD=rhn
WORKSHOPS_CATALOG=False
DYNAMIC_NFS=False
OSRELEASE=3.11.141
INSTALL_GLUSTER=False
HOSTZONEID='ZFYU1USSS3ABS'
NODE_INSTANCE_TYPE=m4.xlarge   # for testing default if not specified is m4.4xlarge
NODE_INFRA_TYPE=m4.4xlarge
NODE_NFS_TYPE=m4.4xlarge
NODE_MASTER_TYPE=m4.4xlarge
NODE_BASTION_TYPE=t2.large
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
  -e "admin_password=$ADMIN_PASSWORD}" \
  -e user_password=USER_PASSWORD \
  -e "osm_use_cockpit=false" \
  -e "install_prometheus=${WANT_PROMETHEUS}" \
  -e "install_lets_encrypt_certificates=true" \
  -e "email=jbarlow@redhat.com" -e"output_dir=/opt/workdir" \
  -e @secret.yml --skip-tags=opentlc-integration,remove_self_provisioners --ask-vault-pass -v

# Notes: ToDO
# admin_user: opentlc-mgr
# install_dynamic_nfs: false
# install_prometheus: false
# install_openshiftapb: false
# install_lets_encrypt_certificates: false
# # Set the next variable to false to run tests.
#   This prevents hitting the rate limiter of
#   Let's Encrypt when requesting lots of certificates
#   Set to true for "real" certificates
#   No effect when install_lets_encrypt_certificates=false
# lets_encrypt_production: true


