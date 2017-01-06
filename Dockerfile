## -*- docker-image-name: "alpine-asdf-phoenix" -*-

FROM alpine:3.5

RUN apk --no-cache add \
        bash \
        ca-certificates \
        curl \
        gcc \
        git \
        && update-ca-certificates

ENV USER asdf

RUN adduser -D $USER

USER $USER

# RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1 && \
#     echo "PATH=$HOME/.asdf/bin:$HOME/.asdf/shims"':$PATH' >> ~/.bashrc

RUN ["/bin/bash", "-c", \
     "git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1 && \
      echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
      echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc"]

RUN ["/bin/bash", "-c", \
     "source ~/.bashrc && \
      asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
      asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
      asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git"]

RUN ["/bin/bash", "-c", \
     "source ~/.bashrc && \
      asdf install nodejs 6.9.1 && \
      asdf install erlang 19.2 && \
      asdf install elixir 1.4.0"]

ENTRYPOINT ["/bin/bash"]
