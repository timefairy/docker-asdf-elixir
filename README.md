# docker-asdf-elixir

Docker image for CI, build w/ `asdf, nodejs, erlang, elixir, elm`


## Try it

```bash
docker run -ti --rm timefairy/docker-asdf-elixir:latest
```


## References

1.  <https://hub.docker.com/r/philcryer/min-wheezy/>
2.  <https://github.com/MonsantoCo/docker-min-jessie>
3.  <https://hub.docker.com/_/debian/> - Locales


### `asdf-erlang` dependencies

1.  <https://github.com/asdf-vm/asdf-erlang>


### asdf install new version in CI

1.  <https://github.com/parroty/circle_sample/blob/master/circle.yml>

```yaml
- erlang_version=$(awk '/erlang/ { print $2 }' .tool-versions) && asdf install erlang ${erlang_version}
- elixir_version=$(awk '/elixir/ { print $2 }' .tool-versions) && asdf install elixir ${elixir_version}
```


### Something about alpine

1.  <http://blog.zot24.com/tips-tricks-with-alpine-docker/>
