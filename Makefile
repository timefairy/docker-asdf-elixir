.PHONY: build

build:
	docker build -t alpine-asdf-phoenix .

live:
	docker pull timefairy/alpine-asdf-phoenix:latest
	docker run -ti --rm timefairy/alpine-asdf-phoenix:latest
