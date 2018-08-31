# WildFly Docker Image for Raspbian

This docker image based on [debian](https://hub.docker.com/_/debian/) image. Builds a docker image with a Wildfly server.

## Build Container

Environment variables for administration passwords can be set from WILDFLY_USER and WILDFLY_PW.

```
git clone https://github.com/Nepitwin/DockerWildFlyPI.git
cd DockerWildFlyPI
docker build --rm=true --tag=pi/jboss/wildfly .
```

After build is complete create a docker container and expose port 8080 and 9990.

```
docker run -d -p 8080:8080 -p 9990:9990 pi/jboss/wildfly
```

A management user admin with password admin will be created. It is recommended to change this password!
Managment interface can be accessed from port 9990.

## License

The MIT License (MIT)

Copyright 2017 Andreas Sekulski

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
