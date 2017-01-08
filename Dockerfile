FROM debian:jessie

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            build-essential \
            autoconf \
            libncurses5-dev \
            libssh-dev \
            unixodbc-dev \
            git \
            curl \
            unzip && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*

RUN useradd -ms $(which bash) asdf

USER asdf

RUN /bin/bash -c "git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1"

ENV PATH /home/asdf/.asdf/bin:/home/asdf/.asdf/shims:$PATH

RUN /bin/bash -c "asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
                  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
                  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git"

RUN /bin/bash -c "asdf install nodejs 6.9.4 && \
                  asdf install erlang 19.2 && \
                  asdf install elixir 1.4.0 && \
                  rm -rf  /tmp/*"

# ENV PHX_VER 1.2.1

# RUN ["/bin/bash", "-c", "source ~/.bashrc && \
#       mix local.hex --force && \
#       mix local.rebar --force && \
#       mix archive.install \
#        https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHX_VER.ez \
#        --force"]

# CMD ["/bin/bash"]
