.PHONY: build run delete live clean

build:
	@docker build -t docker-asdf-elixir .

run:
	@docker run -ti --rm docker-asdf-elixir:latest /bin/bash

delete:
	@docker rmi docker-asdf-elixir:latest

live:
	@docker pull timefairy/docker-asdf-elixir:latest
	@docker run -ti --rm timefairy/docker-asdf-elixir:latest /bin/bash

clean:
	@docker-delete-stopped-containers
	@docker-purge-unnamed-images
