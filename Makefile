.PHONY: build live clean

build:
	docker build -t alpine-asdf-phoenix .

live:
	docker pull timefairy/alpine-asdf-phoenix:latest
	docker run -ti --rm timefairy/alpine-asdf-phoenix:latest

clean:
	docker-delete-stopped-containers; docker-purge-unnamed-images
