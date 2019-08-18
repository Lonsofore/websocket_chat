lonsofore/websocket_chat:
  docker_image.present:
    - tag: latest

chat-container:
  docker_container.running:
    - image: lonsofore/websocket_chat:latest
    - port_bindings:
      - 8080:8080
