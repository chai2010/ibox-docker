[![Docker Build Status](https://img.shields.io/docker/build/chai2010/plantuml.svg)](https://hub.docker.com/r/chai2010/plantuml/)

# plantuml on docker

Docker Container for [PlantUML](http://plantuml.com)

## Motivation

To use plantuml, it needs to be downloaded, java needs to be installed, graphviz needs to be installed, and these things need to be chained.
This docker container does this for you. And allows you to pipe by default into plantuml, so it's neat for script usage.

## Usage

```
cat test.uml | docker run --rm -i chai2010/plantuml > test.svg
```

The default will output svg. If png output is wanted, call it like this:

```
cat test.uml | docker run --rm -i chai2010/plantuml -tpng > test.png
```
