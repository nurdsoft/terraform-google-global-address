# terraform-google-global-address

## Overview

This Terraform module provisions a reserved GCP external IP address using `google_compute_global_address`. It standardises static IP reservation across projects so that the address does not need to be defined as an inline raw resource in each project's deploy configuration.

## Usage

`Basic (EXTERNAL)`:

```hcl
module "static_ip" {
  source     = "nurdsoft/global-address/google"
  version    = "1.0.0"
  project_id = "my-gcp-project"
  component  = "frontend"
}
# Resulting address name: "frontend-static-ip"
```

`Internal (Private Service Connect)`:

```hcl
module "static_ip" {
  source       = "nurdsoft/global-address/google"
  version      = "1.0.0"
  project_id   = "my-gcp-project"
  component    = "frontend"
  address_type = "INTERNAL"
}
```

`With Name Override`:

```hcl
module "static_ip" {
  source        = "nurdsoft/global-address/google"
  version       = "1.0.0"
  project_id    = "my-gcp-project"
  component     = "frontend"
  name_override = "my-custom-static-ip"
}
```

## Assumptions

- A basic understanding of [Git](https://git-scm.com/). Git version `>= 2.33.0`.
- An existing GCP IAM user or role with permission to create/update/delete `google_compute_global_address` resources.
- [GCloud CLI](https://cloud.google.com/sdk/docs/install) `>= 465.0.0`
- A basic understanding of [Terraform](https://www.terraform.io/). Terraform version `>= 1.0`.
- (Optional - for local testing) A basic understanding of [Make](https://www.gnu.org/software/make/manual/make.html#Introduction).
  - Make version `>= GNU Make 3.81`.
  - **Important Note**: This project includes a [Makefile](https://github.com/nurdsoft/terraform-google-global-address/blob/main/Makefile) to speed up local development in Terraform. The `make` targets act as a wrapper around Terraform commands. As such, `make` has only been tested/verified on **Linux/Mac OS**.

## Test

```sh
gcloud init
gcloud auth application-default login
make plan COMP=basic
make apply COMP=basic
make destroy COMP=basic
```

## Contributions

Contributions are always welcome. As such, this project uses the `main` branch as the source of truth to track changes.

**Step 1**. Clone this project.

```sh
# Using Git
$ git clone git@github.com:nurdsoft/terraform-google-global-address.git

# Using HTTPS
$ git clone https://github.com/nurdsoft/terraform-google-global-address.git
```

**Step 2**. Checkout a feature branch: `git checkout -b feature/abc`.

**Step 3**. Validate the change/s locally by executing the steps defined under [Test](#test).

**Step 4**. If testing is successful, commit and push the new change/s to the remote.

```sh
$ git add file1 file2 ...

$ git commit -m "Adding some change"

$ git push --set-upstream origin feature/abc
```

**Step 5**. Once pushed, create a [PR](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) and assign it to a member for review.

- **Important Note**: It can be helpful to attach the `terraform plan` output in the PR.

**Step 6**. A team member reviews/approves/merges the change/s.

**Step 7**. Once merged, deploy the required changes as needed.

**Step 8**. Once deployed, verify that the changes have been deployed.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| google | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 6.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The GCP project ID where the static IP will be reserved | `string` | n/a | yes |
| component | Component name used to generate the address name. Resulting name: `<component>-static-ip`. Lowercase letters, numbers, hyphens; max 53 characters | `string` | n/a | yes |
| name\_override | If set, overrides the auto-generated address name entirely. Must comply with GCP naming rules; max 63 characters | `string` | `null` | no |
| address\_type | The type of address to reserve. `EXTERNAL` for public IPs used with load balancers; `INTERNAL` for Private Service Connect endpoints | `string` | `"EXTERNAL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| address\_name | The name of the reserved global address resource |
| ip\_address | The reserved external IP address |

## Authors

Module is maintained by [Nurdsoft](https://github.com/nurdsoft).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/nurdsoft/terraform-google-global-address/blob/main/LICENSE) for full details.
