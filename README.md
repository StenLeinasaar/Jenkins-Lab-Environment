# Jenkins-Lab-Environment
This repository is a growing lab environment for jenkins lab practice. Feel free to use it, fork it, add on to it. I am growing it as I go along.




Service	URL
Frontend	http://fastbuy.local
API Gateway	http://gateway.fastbuy.local
Backend API	http://api.fastbuy.local
Jenkins	http://jenkins.fastbuy.local
Traefik Dashboard	http://localhost:8080



ADD TO HOST FILE
/etc/hosts
127.0.0.1 fastbuy.local
127.0.0.1 api.fastbuy.local



Task ideas for jenkins:

1. Set up jenkins deployment to trigger frontend update when there is a github merge with a tag "frontend". Remember that first there has to be a pull request which then is merged into the main. 

