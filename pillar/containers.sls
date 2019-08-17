docker-containers:
  lookup:
    chat:
      image: "lonsofore/websocket_chat:latest"
      runoptions:
        - "-p 8080:8080"
