# ckad-infra
AWS Infrastructure for CKAD


# Install / Config

## Set up

- [TF](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Named AWS CLI Profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-profiles)


## Terraform Config

- Add a `terraform.tfvars` to project root. Below is an example:

```terraform
profile = "ckad-account"
region = "eu-west-1"
lab_solution_url = "https://training.linuxfoundation.org/cm/LFD259/LFD259_V2022-11-23_SOLUTIONS.tar.xz"
lab_solution_username = "???????"
lab_solution_password = "???????"
enable_registry = true
```


### Create

#### Init

```sh
terraform validate
```


#### Validate

```sh
terraform validate
```


#### Plan

```sh
terraform plan
```


#### Apply

```sh
terraform apply -auto-approve
```


### Destroy
```sh
terraform destroy -auto-approve
```