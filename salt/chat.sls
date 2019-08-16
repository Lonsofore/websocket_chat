pull-chat:
  cmd.run:
    - name: docker pull lonsofore/websocket_chat:latest

remove-containers:
  cmd.run:
    - name: docker ps -aq | xargs --no-run-if-empty docker rm -f

run-chat:
  cmd.run:
    - name: docker run -d -p 8080:8080 lonsofore/websocket_chat:latest


# for some reason, it works only from second run
#
#lonsofore/websocket_chat:
#  docker_image.present:
#    - tag: latest
#    - require:
#      - pip: docker

#chatcontainer:
#  docker_container.running:
#    - image: lonsofore/websocket_chat:latest
#    - port_bindings:
#      - 8080:8080
#    - require:
#      - pip: docker
