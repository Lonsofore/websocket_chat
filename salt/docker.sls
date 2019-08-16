docker:
  cmd.run:
    - names:
      - wget -O get-docker.sh get.docker.com
      - bash get-docker.sh

run_docker:
  service.running:
    - name: docker
    - enable: True

python-pip:
  pkg.installed:
    - name: python-pip

docker-python-package:
  pip.installed:
    - name: docker
    - reload_modules: true
    - require:
      - pkg: python-pip

