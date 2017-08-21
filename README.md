# WildFly 10 Docker Image for Raspbian

This docker image based on [raspbian-jdk8](https://hub.docker.com/r/manicmonkey/raspbian-jdk8/) image from manicmonkey. Builds a docker image with a Wildfly 10 server.

## Build Container

```
git clone https://github.com/Nepitwin/DockerWildFlyPI.git
cd DockerWildFlyPI
docker build --rm=true --tag=pi/jboss/wildfly .
```

After build is complete create a docker container and expose port 8080.

```
docker run -d -p 8080:8080 pi/jboss/wildfly
```

## License

The MIT License (MIT)

Copyright 2017 Andreas Sekulski

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
