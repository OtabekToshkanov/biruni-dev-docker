Build docker image
<code>
docker build -t [name]:[tag] -f [name].Dockerfile .
</code>

Run docker container
<code>
docker run -itd -p [port]:8080 -v [projects_path]:/opt/tomcat/projects --rm --name [name] smartup5x_trade:[tag]
</code>