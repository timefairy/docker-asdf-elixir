## -*- docker-image-name: "alpine-asdf-phoenix" -*-

FROM alpine:3.5

RUN apk --no-cache add \
        bash \
        git

ENV USER asdf

RUN adduser -D $USER

USER $USER

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1 && \
    echo "PATH=$HOME/.asdf/bin:$HOME/.asdf/shims"':$PATH' >> ~/.bashrc

RUN ["/bin/bash", "-c", "source ~/.bashrc && \
                         asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
                         asdf plugin-add elm https://github.com/vic/asdf-elm.git && \
                         asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
                         asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git"]
