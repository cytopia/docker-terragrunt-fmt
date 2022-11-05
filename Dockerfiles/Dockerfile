FROM alpine:3.16 as builder

# Install build dependencies
RUN set -eux \
	&& apk add --no-cache \
		ca-certificates \
		coreutils \
		curl \
		unzip

# Get Terraform
ARG VERSION=latest
RUN set -eux \
	&& if [ "${VERSION}" = "latest" ]; then \
		VERSION="$( curl -sS https://releases.hashicorp.com/terraform/ \
			| tac | tac \
			| grep -Eo '/[.0-9]+/' \
			| grep -Eo '[.0-9]+' \
			| sort -V \
			| tail -1 )"; \
	else \
		VERSION="$( curl -sS https://releases.hashicorp.com/terraform/ \
			| tac | tac \
			| grep -Eo "/${VERSION}\.[.0-9]+/" \
			| grep -Eo '[.0-9]+' \
			| sort -V \
			| tail -1 )"; \
	fi \
	&& curl -sS -L -O \
		https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip \
	&& unzip terraform_${VERSION}_linux_amd64.zip \
	&& mv terraform /usr/bin/terraform \
	&& chmod +x /usr/bin/terraform \
	\
	&& terraform --version

# Use a clean tiny image to store artifacts in
FROM alpine:3.16 as production
LABEL \
	maintainer="cytopia <cytopia@everythingcli.org>" \
	repo="https://github.com/cytopia/docker-terragrunt-fmt"

COPY --from=builder /usr/bin/terraform /usr/bin/terraform
COPY data/terragrunt-fmt.sh /terragrunt-fmt.sh
COPY data/fmt.sh /fmt.sh

WORKDIR /data
ENTRYPOINT ["/terragrunt-fmt.sh"]
