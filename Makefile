.PHONY: build live clean

build:
	@docker build -t docker-asdf-elixir .

live:
	@docker pull timefairy/docker-asdf-elixir:latest
	@docker run -ti --rm timefairy/docker-asdf-elixir:latest

clean:
	@docker-delete-stopped-containers
	@docker-purge-unnamed-images
