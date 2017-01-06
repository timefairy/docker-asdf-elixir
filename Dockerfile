## -*- docker-image-name: "alpine-asdf-phoenix" -*-

FROM alpine:3.5

RUN apk --no-cache add \
        bash \
        ca-certificates \
        curl \
        git

ENV USER asdf

RUN adduser -D $USER

USER $USER

# RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1 && \
#     echo "PATH=$HOME/.asdf/bin:$HOME/.asdf/shims"':$PATH' >> ~/.bashrc

# RUN ["/bin/bash", "-c", "source ~/.bashrc && \
#       asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
#       asdf plugin-add elm    https://github.com/vic/asdf-elm.git && \
#       asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
#       asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git"]

# RUN ["/bin/bash", "-c", "source ~/.bashrc && \
#                          asdf install nodejs 6.9.1 && \
#                          asdf install elm    0.18.0 && \
#                          asdf install erlang 19.2 && \
#                          asdf install elixir 1.3.4"]

ENTRYPOINT ["bin/bash"]
