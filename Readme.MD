<ul>
    <li> 5t   - smartup5_trade </li>
    <li> xc   - smartup5x_core </li>
    <li> xa   - smartup5x_anor </li>
    <li> xt   - smartup5x_trade </li>
</ul>

<code>
docker image build -t xt:latest -f xt.Dockerfile .
docker container run -itd -p 9090:8080 -v E:\projects\active:/opt/tomcat/projects --name xa xa:latest
</code>