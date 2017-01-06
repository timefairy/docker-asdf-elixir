.PHONY: build

build:
	docker build -t alpine-asdf-phoenix .

run:
	docker run -ti --rm timefairy/alpine-asdf-phoenix:latest
