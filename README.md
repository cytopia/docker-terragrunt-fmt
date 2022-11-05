# Docker image for `terragrunt-fmt`

[![Tag](https://img.shields.io/github/tag/cytopia/docker-terragrunt-fmt.svg)](https://github.com/cytopia/docker-terragrunt-fmt/releases)
[![](https://img.shields.io/badge/github-cytopia%2Fdocker--terragrunt--fmt-red.svg)](https://github.com/cytopia/docker-terragrunt-fmt "github.com/cytopia/docker-terragrunt-fmt")
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

[![lint](https://github.com/cytopia/docker-terragrunt-fmt/workflows/lint/badge.svg)](https://github.com/cytopia/docker-terragrunt-fmt/actions?query=workflow%3Alint)
[![build](https://github.com/cytopia/docker-terragrunt-fmt/workflows/build/badge.svg)](https://github.com/cytopia/docker-terragrunt-fmt/actions?query=workflow%3Abuild)
[![nightly](https://github.com/cytopia/docker-terragrunt-fmt/workflows/nightly/badge.svg)](https://github.com/cytopia/docker-terragrunt-fmt/actions?query=workflow%3Anightly)


> #### All [#awesome-ci](https://github.com/topics/awesome-ci) Docker images
>
> [ansible-lint][alint-git-lnk] **•**
> [ansible][ansible-git-lnk] **•**
> [awesome-ci][aci-git-lnk] **•**
> [bandit][bandit-git-lnk] **•**
> [black][black-git-lnk] **•**
> [checkmake][cm-git-lnk] **•**
> [eslint][elint-git-lnk] **•**
> [file-lint][flint-git-lnk] **•**
> [gofmt][gfmt-git-lnk] **•**
> [goimports][gimp-git-lnk] **•**
> [golint][glint-git-lnk] **•**
> [jsonlint][jlint-git-lnk] **•**
> [kubeval][kubeval-git-lnk] **•**
> [linkcheck][linkcheck-git-lnk] **•**
> [mypy][mypy-git-lnk] **•**
> [php-cs-fixer][pcsf-git-lnk] **•**
> [phpcbf][pcbf-git-lnk] **•**
> [phpcs][pcs-git-lnk] **•**
> [phplint][plint-git-lnk] **•**
> [pycodestyle][pycs-git-lnk] **•**
> [pydocstyle][pyds-git-lnk] **•**
> [pylint][pylint-git-lnk] **•**
> [terraform-docs][tfdocs-git-lnk] **•**
> [terragrunt-fmt][tgfmt-git-lnk] **•**
> [terragrunt][tg-git-lnk] **•**
> [yamlfmt][yfmt-git-lnk] **•**
> [yamllint][ylint-git-lnk]

View **[Dockerfiles](https://github.com/cytopia/docker-terragrunt-fmt/blob/master/Dockerfiles/)** on GitHub.


**Available Architectures:**  `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x`

Tiny Alpine-based multistage-build dockerized version of [Terraform](https://github.com/hashicorp/terraform)<sup>[1]</sup> with the ability to do `terraform fmt` on Terragrunt files (`.hcl`).
This is achieved by creating a temporary file within the container with an `.tf` extension and then running `terraform fmt` on it.
Additionally the wrapper has been extended with a **`-ignore` argument** to be able to ignore files and directory or wildcards.
The image is built nightly against multiple stable versions and pushed to Dockerhub.

<sub>[1] Official project: https://github.com/hashicorp/terraform</sub>

## :whale: Available Docker image versions

[![](https://img.shields.io/docker/pulls/cytopia/terragrunt-fmt.svg)](https://hub.docker.com/r/cytopia/terragrunt-fmt)
[![Docker](https://badgen.net/badge/icon/:latest?icon=docker&label=cytopia/terragrunt-fmt)](https://hub.docker.com/r/cytopia/terragrunt-fmt)

#### Rolling releaess

The following Docker image tags are rolling releases and are built and updated every night.

[![nightly](https://github.com/cytopia/docker-terragrunt-fmt/workflows/nightly/badge.svg)](https://github.com/cytopia/docker-terragrunt-fmt/actions?query=workflow%3Anightly)

| Docker Tag           | Git Ref   | terraform    | Available Architectures                      |
|----------------------|-----------|--------------|----------------------------------------------|
| `latest`             | master    | latest       | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `1.3`                | master    | **`1.3.x`**  | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `1.2`                | master    | **`1.2.x`**  | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `1.1`                | master    | **`1.1.x`**  | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `1.0`                | master    | **`1.0.x`**  | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `0.15`               | master    | **`0.15.x`** | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `0.14`               | master    | **`0.14.x`** | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `0.13`               | master    | **`0.13.x`** | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `0.12`               | master    | **`0.12.x`** | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |

#### Point in time releases

The following Docker image tags are built once and can be used for reproducible builds. Its version never changes so you will have to update tags in your pipelines from time to time in order to stay up-to-date.

[![build](https://github.com/cytopia/docker-terragrunt-fmt/workflows/build/badge.svg)](https://github.com/cytopia/docker-terragrunt-fmt/actions?query=workflow%3Abuild)

| Docker Tag           | Git Ref      | terraform    | Available Architectures                      |
|----------------------|--------------|--------------|----------------------------------------------|
| `latest-<tag>`       | tag: `<tag>` | latest       | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `1.3-<tag>`          | tag: `<tag>` | **`1.3.x`**  | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `1.2-<tag>`          | tag: `<tag>` | **`1.2.x`**  | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `1.1-<tag>`          | tag: `<tag>` | **`1.1.x`**  | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `1.0-<tag>`          | tag: `<tag>` | **`1.0.x`**  | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `0.15-<tag>`         | tag: `<tag>` | **`0.15.x`** | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `0.14-<tag>`         | tag: `<tag>` | **`0.14.x`** | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `0.13-<tag>`         | tag: `<tag>` | **`0.13.x`** | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |
| `0.12-<tag>`         | tag: `<tag>` | **`0.12.x`** | `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`, `ppc64le`, `s390x` |

> Where `<tag>` refers to the chosen git tag from this repository.


## :open_file_folder: Docker mounts

The working directory inside the Docker container is **`/data/`** and should be mounted locally to
the root of your project.


## :computer: Usage

Ignore all directories named `dev/` and `testing/` and everything inside.
```bash
$ docker run --rm -v $(pwd):/data cytopia/terragrunt-fmt -recursive -ignore=*/dev/,*/testing/

[INFO] Finding files: find . -not \( -path "./*/dev/*" -o -path "./*/testing/*" \) -name '*.hcl' -type f
terraform fmt -list=true -write=false ./prod/eu-central-1/microservice/terragrunt.hcl
../tmp/terragrunt.hcl.tf
terraform fmt -list=true -write=false ./prod/eu-central-1/infra/terragrunt.hcl
../tmp/terragrunt.hcl.tf
```


## Project and CI integration

#### Makefile
You can add the following Makefile to your project for easy linting anf fixing of Terragrunt `.hcl` files.
```make
ifneq (,)
.error This Makefile requires GNU Make.
endif

.PHONY: help lint fix _pull

CURRENT_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# Adjust according to your needs
IGNORE      = */.terragrunt-cache/,*/.terraform/
FMT_VERSION = latest

help:
	@echo "help    Show this help"
	@echo "lint    Exit > 0 if any files have wrong formatting"
	@echo "fix     Fix all .hcl files"

lint: _pull
	docker run --rm -v $(CURRENT_DIR):/data cytopia/terragrunt-fmt:$(FMT_VERSION) \
		-check -diff -recursive -ignore='$(IGNORE)'

fix: _pull
	docker run --rm -v $(CURRENT_DIR):/data cytopia/terragrunt-fmt:$(FMT_VERSION) \
		-write -diff -recursive -ignore='$(IGNORE)'

_pull:
	docker pull cytopia/terragrunt-fmt:$(FMT_VERSION)
```

#### Travis CI integration
With the above Makefile in place, you can easily add a Travis CI rule to ensure the Terragrunt code
uses correct coding style.

```yml
---
sudo: required
language: minimal
services:
  - docker
script:
  - make lint
```


## :arrows_counterclockwise: Related [#awesome-ci](https://github.com/topics/awesome-ci) projects

### Docker images

Save yourself from installing lot's of dependencies and pick a dockerized version of your favourite
linter below for reproducible local or remote CI tests:

| GitHub | DockerHub | Type | Description |
|--------|-----------|------|-------------|
| [awesome-ci][aci-git-lnk]        | [![aci-hub-img]][aci-hub-lnk]         | Basic      | Tools for git, file and static source code analysis |
| [file-lint][flint-git-lnk]       | [![flint-hub-img]][flint-hub-lnk]     | Basic      | Baisc source code analysis |
| [linkcheck][linkcheck-git-lnk]   | [![linkcheck-hub-img]][flint-hub-lnk] | Basic      | Search for URLs in files and validate their HTTP status code |
| [ansible][ansible-git-lnk]       | [![ansible-hub-img]][ansible-hub-lnk] | Ansible    | Multiple versions and flavours of Ansible |
| [ansible-lint][alint-git-lnk]    | [![alint-hub-img]][alint-hub-lnk]     | Ansible    | Lint Ansible |
| [gofmt][gfmt-git-lnk]            | [![gfmt-hub-img]][gfmt-hub-lnk]       | Go         | Format Go source code **<sup>[1]</sup>** |
| [goimports][gimp-git-lnk]        | [![gimp-hub-img]][gimp-hub-lnk]       | Go         | Format Go source code **<sup>[1]</sup>** |
| [golint][glint-git-lnk]          | [![glint-hub-img]][glint-hub-lnk]     | Go         | Lint Go code |
| [eslint][elint-git-lnk]          | [![elint-hub-img]][elint-hub-lnk]     | Javascript | Lint Javascript code |
| [jsonlint][jlint-git-lnk]        | [![jlint-hub-img]][jlint-hub-lnk]     | JSON       | Lint JSON files **<sup>[1]</sup>** |
| [kubeval][kubeval-git-lnk]       | [![kubeval-hub-img]][kubeval-hub-lnk] | K8s        | Lint Kubernetes files |
| [checkmake][cm-git-lnk]          | [![cm-hub-img]][cm-hub-lnk]           | Make       | Lint Makefiles |
| [phpcbf][pcbf-git-lnk]           | [![pcbf-hub-img]][pcbf-hub-lnk]       | PHP        | PHP Code Beautifier and Fixer |
| [phpcs][pcs-git-lnk]             | [![pcs-hub-img]][pcs-hub-lnk]         | PHP        | PHP Code Sniffer |
| [phplint][plint-git-lnk]         | [![plint-hub-img]][plint-hub-lnk]     | PHP        | PHP Code Linter **<sup>[1]</sup>** |
| [php-cs-fixer][pcsf-git-lnk]     | [![pcsf-hub-img]][pcsf-hub-lnk]       | PHP        | PHP Coding Standards Fixer |
| [bandit][bandit-git-lnk]         | [![bandit-hub-img]][bandit-hub-lnk]   | Python     | A security linter from PyCQA
| [black][black-git-lnk]           | [![black-hub-img]][black-hub-lnk]     | Python     | The uncompromising Python code formatter |
| [mypy][mypy-git-lnk]             | [![mypy-hub-img]][mypy-hub-lnk]       | Python     | Static source code analysis |
| [pycodestyle][pycs-git-lnk]      | [![pycs-hub-img]][pycs-hub-lnk]       | Python     | Python style guide checker |
| [pydocstyle][pyds-git-lnk]       | [![pyds-hub-img]][pyds-hub-lnk]       | Python     | Python docstyle checker |
| [pylint][pylint-git-lnk]         | [![pylint-hub-img]][pylint-hub-lnk]   | Python     | Python source code, bug and quality checker |
| [terraform-docs][tfdocs-git-lnk] | [![tfdocs-hub-img]][tfdocs-hub-lnk]   | Terraform  | Terraform doc generator (TF 0.12 ready) **<sup>[1]</sup>** |
| [terragrunt][tg-git-lnk]         | [![tg-hub-img]][tg-hub-lnk]           | Terraform  | Terragrunt and Terraform |
| [terragrunt-fmt][tgfmt-git-lnk]  | [![tgfmt-hub-img]][tgfmt-hub-lnk]     | Terraform  | `terraform fmt` for Terragrunt files **<sup>[1]</sup>** |
| [yamlfmt][yfmt-git-lnk]          | [![yfmt-hub-img]][yfmt-hub-lnk]       | Yaml       | Format Yaml files **<sup>[1]</sup>** |
| [yamllint][ylint-git-lnk]        | [![ylint-hub-img]][ylint-hub-lnk]     | Yaml       | Lint Yaml files |

> **<sup>[1]</sup>** Uses a shell wrapper to add **enhanced functionality** not available by original project.

[aci-git-lnk]: https://github.com/cytopia/awesome-ci
[aci-hub-img]: https://img.shields.io/docker/pulls/cytopia/awesome-ci.svg
[aci-hub-lnk]: https://hub.docker.com/r/cytopia/awesome-ci

[flint-git-lnk]: https://github.com/cytopia/docker-file-lint
[flint-hub-img]: https://img.shields.io/docker/pulls/cytopia/file-lint.svg
[flint-hub-lnk]: https://hub.docker.com/r/cytopia/file-lint

[linkcheck-git-lnk]: https://github.com/cytopia/docker-linkcheck
[linkcheck-hub-img]: https://img.shields.io/docker/pulls/cytopia/linkcheck.svg
[linkcheck-hub-lnk]: https://hub.docker.com/r/cytopia/linkcheck

[jlint-git-lnk]: https://github.com/cytopia/docker-jsonlint
[jlint-hub-img]: https://img.shields.io/docker/pulls/cytopia/jsonlint.svg
[jlint-hub-lnk]: https://hub.docker.com/r/cytopia/jsonlint

[ansible-git-lnk]: https://github.com/cytopia/docker-ansible
[ansible-hub-img]: https://img.shields.io/docker/pulls/cytopia/ansible.svg
[ansible-hub-lnk]: https://hub.docker.com/r/cytopia/ansible

[alint-git-lnk]: https://github.com/cytopia/docker-ansible-lint
[alint-hub-img]: https://img.shields.io/docker/pulls/cytopia/ansible-lint.svg
[alint-hub-lnk]: https://hub.docker.com/r/cytopia/ansible-lint

[kubeval-git-lnk]: https://github.com/cytopia/docker-kubeval
[kubeval-hub-img]: https://img.shields.io/docker/pulls/cytopia/kubeval.svg
[kubeval-hub-lnk]: https://hub.docker.com/r/cytopia/kubeval

[gfmt-git-lnk]: https://github.com/cytopia/docker-gofmt
[gfmt-hub-img]: https://img.shields.io/docker/pulls/cytopia/gofmt.svg
[gfmt-hub-lnk]: https://hub.docker.com/r/cytopia/gofmt

[gimp-git-lnk]: https://github.com/cytopia/docker-goimports
[gimp-hub-img]: https://img.shields.io/docker/pulls/cytopia/goimports.svg
[gimp-hub-lnk]: https://hub.docker.com/r/cytopia/goimports

[glint-git-lnk]: https://github.com/cytopia/docker-golint
[glint-hub-img]: https://img.shields.io/docker/pulls/cytopia/golint.svg
[glint-hub-lnk]: https://hub.docker.com/r/cytopia/golint

[elint-git-lnk]: https://github.com/cytopia/docker-eslint
[elint-hub-img]: https://img.shields.io/docker/pulls/cytopia/eslint.svg
[elint-hub-lnk]: https://hub.docker.com/r/cytopia/eslint

[cm-git-lnk]: https://github.com/cytopia/docker-checkmake
[cm-hub-img]: https://img.shields.io/docker/pulls/cytopia/checkmake.svg
[cm-hub-lnk]: https://hub.docker.com/r/cytopia/checkmake

[pcbf-git-lnk]: https://github.com/cytopia/docker-phpcbf
[pcbf-hub-img]: https://img.shields.io/docker/pulls/cytopia/phpcbf.svg
[pcbf-hub-lnk]: https://hub.docker.com/r/cytopia/phpcbf

[pcs-git-lnk]: https://github.com/cytopia/docker-phpcs
[pcs-hub-img]: https://img.shields.io/docker/pulls/cytopia/phpcs.svg
[pcs-hub-lnk]: https://hub.docker.com/r/cytopia/phpcs

[plint-git-lnk]: https://github.com/cytopia/docker-phplint
[plint-hub-img]: https://img.shields.io/docker/pulls/cytopia/phplint.svg
[plint-hub-lnk]: https://hub.docker.com/r/cytopia/phplint

[pcsf-git-lnk]: https://github.com/cytopia/docker-php-cs-fixer
[pcsf-hub-img]: https://img.shields.io/docker/pulls/cytopia/php-cs-fixer.svg
[pcsf-hub-lnk]: https://hub.docker.com/r/cytopia/php-cs-fixer

[bandit-git-lnk]: https://github.com/cytopia/docker-bandit
[bandit-hub-img]: https://img.shields.io/docker/pulls/cytopia/bandit.svg
[bandit-hub-lnk]: https://hub.docker.com/r/cytopia/bandit

[black-git-lnk]: https://github.com/cytopia/docker-black
[black-hub-img]: https://img.shields.io/docker/pulls/cytopia/black.svg
[black-hub-lnk]: https://hub.docker.com/r/cytopia/black

[mypy-git-lnk]: https://github.com/cytopia/docker-mypy
[mypy-hub-img]: https://img.shields.io/docker/pulls/cytopia/mypy.svg
[mypy-hub-lnk]: https://hub.docker.com/r/cytopia/mypy

[pycs-git-lnk]: https://github.com/cytopia/docker-pycodestyle
[pycs-hub-img]: https://img.shields.io/docker/pulls/cytopia/pycodestyle.svg
[pycs-hub-lnk]: https://hub.docker.com/r/cytopia/pycodestyle

[pyds-git-lnk]: https://github.com/cytopia/docker-pydocstyle
[pyds-hub-img]: https://img.shields.io/docker/pulls/cytopia/pydocstyle.svg
[pyds-hub-lnk]: https://hub.docker.com/r/cytopia/pydocstyle

[pylint-git-lnk]: https://github.com/cytopia/docker-pylint
[pylint-hub-img]: https://img.shields.io/docker/pulls/cytopia/pylint.svg
[pylint-hub-lnk]: https://hub.docker.com/r/cytopia/pylint

[tfdocs-git-lnk]: https://github.com/cytopia/docker-terraform-docs
[tfdocs-hub-img]: https://img.shields.io/docker/pulls/cytopia/terraform-docs.svg
[tfdocs-hub-lnk]: https://hub.docker.com/r/cytopia/terraform-docs

[tg-git-lnk]: https://github.com/cytopia/docker-terragrunt
[tg-hub-img]: https://img.shields.io/docker/pulls/cytopia/terragrunt.svg
[tg-hub-lnk]: https://hub.docker.com/r/cytopia/terragrunt

[tgfmt-git-lnk]: https://github.com/cytopia/docker-terragrunt-fmt
[tgfmt-hub-img]: https://img.shields.io/docker/pulls/cytopia/terragrunt-fmt.svg
[tgfmt-hub-lnk]: https://hub.docker.com/r/cytopia/terragrunt-fmt

[yfmt-git-lnk]: https://github.com/cytopia/docker-yamlfmt
[yfmt-hub-img]: https://img.shields.io/docker/pulls/cytopia/yamlfmt.svg
[yfmt-hub-lnk]: https://hub.docker.com/r/cytopia/yamlfmt

[ylint-git-lnk]: https://github.com/cytopia/docker-yamllint
[ylint-hub-img]: https://img.shields.io/docker/pulls/cytopia/yamllint.svg
[ylint-hub-lnk]: https://hub.docker.com/r/cytopia/yamllint


### Makefiles

Visit **[cytopia/makefiles](https://github.com/cytopia/makefiles)** for dependency-less, seamless project integration and minimum required best-practice code linting for CI.
The provided Makefiles will only require GNU Make and Docker itself removing the need to install anything else.


## :page_facing_up: License


**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)
