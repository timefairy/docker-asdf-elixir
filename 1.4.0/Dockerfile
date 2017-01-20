FROM debian:jessie

RUN apt-get update -qq && \
    apt-get upgrade -qq -y && \
    apt-get install -qq -y \
            build-essential \
            autoconf \
            libncurses5-dev \
            libssh-dev \
            unixodbc-dev \
            git \
            curl \
            unzip && \
    apt-get clean -qq -y && \
    apt-get autoclean -qq -y && \
    apt-get autoremove -qq -y && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*

ENV LANG C.UTF-8

RUN useradd -ms $(which bash) asdf

USER asdf

RUN /bin/bash -c "git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1"

ENV PATH /home/asdf/.asdf/bin:/home/asdf/.asdf/shims:$PATH

RUN /bin/bash -c "asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
                  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git"

RUN /bin/bash -c "asdf install erlang 19.2 && \
                  rm -rf  /tmp/* && \
                  asdf install elixir 1.4.0 && \
                  asdf global erlang 19.2 && \
                  asdf global elixir 1.4.0"

# ENV PHX_VER 1.2.1

# RUN ["/bin/bash", "-c", "source ~/.bashrc && \
#       mix local.hex --force && \
#       mix local.rebar --force && \
#       mix archive.install \
#        https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHX_VER.ez \
#        --force"]

# CMD ["/bin/bash"]
