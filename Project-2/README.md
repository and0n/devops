# Deploy a highly available web application using CloudFormation

The scripts in this folder will deploy the infrastructure and 4 web servers in AWS for a highly available web app using CloudFormation.
A bastion host can be deployed in one of the public networks in case of troubleshooting is needed.

## Infrastructure Overview
![Diagram](Udagram%20infra.jpeg)

## Prerequisites

You need to [install awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) 


## Usage
create.sh and update.sh will create/update a stack in AWS. 3 arguments are requiered - stack name, file containig template body and file containing the parameters.

### Exaples

To deploy the networking components run command:
```
./create.sh udagram-net udagram-infra.yaml udagram-infra.json
```

To deploy the servers, security roles and software run command:
```
./create.sh udagram-servers udagram-servers.yaml udagram-servers.json
```

To deploy the bastion host run command:
```
./create.sh Bastion jumpbox.yaml jumpbox-parameters.json
```
