docker-clean:
  pkg.removed:
    - pkgs:
      - docker
      - docker-engine
      - docker.io
      - containerd
      - runc

docker-requires:
  pkg.latest:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - bridge-utils
      - gnupg-agent
      - software-properties-common
    - refresh: True

docker-repo:
  pkgrepo.managed:
    - humanname: Docker
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
    - file: /etc/apt/sources.list.d/docker.list
    - gpgcheck: 1
    - key_url: https://download.docker.com/linux/ubuntu/gpg

docker:
  pkg.latest:
    - pkgs:
      - docker-ce 
      - docker-ce-cli 
      - containerd.io
    - refresh: True
  require:
    - pkgrepo: docker-repo
    - pkg: docker-requires

docker-run:
  service.running:
    - name: docker
    - enable: True
    - restart: True

python-pip:
  pkg.latest:
    - name: python-pip
    - refresh: True

docker-pip:
  pip.installed:
    - pkgs:
      - docker
    - reload_modules: true
    - require:
      - pkg: python-pip
