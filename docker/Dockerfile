FROM fedora:36

COPY check-vault-seal.sh /scripts/check-vault-seal.sh
RUN chmod +x /scripts/check-vault-seal.sh
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin
RUN dnf install -y dnf-plugins-core 
RUN dnf install -y jq 
RUN dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo 
RUN dnf install -y vault 
RUN setcap -r /usr/bin/vault
		