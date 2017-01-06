## -*- docker-image-name: "alpine-asdf-phoenix" -*-

FROM alpine:3.5

ENV PHX_VER 1.2.1

RUN apk --no-cache add \
        g++ \
        make \
        ncurses-dev \
        openssl-dev \
        perl \
        bash \
        curl \
        git \
        ca-certificates \
        && update-ca-certificates

ENV USER asdf

RUN adduser -D $USER

USER $USER

# RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1 && \
#     echo "PATH=$HOME/.asdf/bin:$HOME/.asdf/shims"':$PATH' >> ~/.bashrc

RUN ["/bin/bash", "-c", "git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1 && \
      echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
      echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc"]

RUN ["/bin/bash", "-c", "source ~/.bashrc && \
      asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
      asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
      asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
      asdf plugin-add elm    https://github.com/vic/asdf-elm.git && \
      sed -i 's/curl -Lo/curl -kLo/' ~/.asdf/plugins/elm/bin/install"]

RUN ["/bin/bash", "-c", "source ~/.bashrc && \
      asdf install nodejs 6.9.4 && \
      asdf install nodejs 7.4.0 && \
      asdf install erlang 19.2 && \
      asdf install elixir 1.4.0 && \
      asdf install elm    0.18.0"]

RUN ["/bin/bash", "-c", "source ~/.bashrc && \
      asdf global nodejs 6.9.4 && \
      asdf global erlang 19.2 && \
      asdf global elixir 1.4.0 && \
      asdf global elm    0.18.0"]

RUN ["/bin/bash", "-c", "source ~/.bashrc && \
      mix local.hex --force && \
      mix local.rebar --force && \
      mix archive.install \
       https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHX_VER.ez \
       --force"]

ENTRYPOINT ["/bin/bash"]
