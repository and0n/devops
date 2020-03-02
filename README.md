# Deploy a highly available web application using CloudFormation

The scripts in this folder will deploy the infrastructure and 4 web servers in AWS for a highly available web app using CloudFormation.
A bastion host can be deployed in one of the public networks in case of troubleshooting is needed.

## Infrastructure Overview
![Diagram](Project-2/Udagram%20infra.jpeg)

## Prerequisites

- AWS account

- [Install awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

- [Configure awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#cli-quick-configuration)

- s3 bucket

- create and copy to your s3 bucket udacity.zip file containg basic index.html

## Usage
`cloudFormAWS.sh` will create/update a stack in AWS. 3 arguments are requiered - stack name, file containig template body and file containing the parameters.

Clone the Github repository and run create.sh or update.sh:
```
git clone https://github.com/donkodimov/devops.git
cd devops/Project-2
```
Make file executable:
```
sudo chmod +x cloudFormAWS.sh
```
Replace the name of the s3 bucket in `udagram-servers.yaml` with the name of your s3 bucket:
```
aws s3 cp s3://YOUR-S3-BUCKET/udacity.zip .
```
### Examples

To deploy the networking components run command:
```
./cloudFormAWS.sh udagram-net udagram-infra.yaml udagram-infra.json
```

To deploy the servers, security roles and software run command:
```
./cloudFormAWS.sh udagram-servers udagram-servers.yaml udagram-servers.json
```

To deploy the bastion host run command:
```
./cloudFormAWS.sh Bastion jumpbox.yaml jumpbox-parameters.json
```

## License

The contents of this repository are covered under the [GNU General Public License](LICENSE).
