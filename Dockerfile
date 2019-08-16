FROM erlang:22-slim

RUN apt update \
    && apt install -y \
        git-core \
        curl \
    && apt autoremove -y \
    && apt clean

ADD https://s3.amazonaws.com/rebar3/rebar3 /usr/local/bin/
RUN chmod +x /usr/local/bin/rebar3

COPY websocket_chat /tmp/websocket_chat
RUN cd /tmp/websocket_chat \
    && rebar3 as prod release -o /build

WORKDIR /build/websocket_chat/bin
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s  CMD curl -f http://localhost:8080 || exit 1
ENTRYPOINT ["./websocket_chat", "foreground"]
