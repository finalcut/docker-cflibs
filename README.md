docker-cflibs
=============

Docker container that contains mxunit(2.1.3), coldspring (2A1), and fw1 (2.5) mounted at /var/cflibs


This is really just a  proof of concept.  I'll probably split this into separate containers.  One with frameworks needed for production and another for mxunit.

All of the libraries in this container are exposed through the volume of `/var/cflibs`


# Basic Usage

```sh
docker run -i -t  --name cflibs finalcut/cflibs_mxunit_coldspring
```

That will fire up the container. Once it starts just exit the bash shell it starts.  This container does not need to be running to be useful.


Once started you can use it in conjunction with a container running coldfusion like so:

```sh
 docker run -d -p 8880:80 -v /var/www:/var/www --volumes-from cflibs finalcut/coldfusion10
```

the `--volumes-from` part says that the cflibs directory on the cflibs container will be available in the coldfusion10 container.


You can learn more about this contianer at the [blog post I wrote about it](http://code.rawlinson.us/2014/08/data-only-docker-container.html).

You can learn more about the coldfusion10 container at it's [github repo](https://github.com/finalcut/docker-coldfusion10) and it's [docker hub page](https://registry.hub.docker.com/u/finalcut/coldfusion10/)
