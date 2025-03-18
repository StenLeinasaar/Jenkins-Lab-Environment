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


## Future Developments

- [ ] Set up gateway service that allows practicing gateway configurations
- [ ] Monitor and update traefik, configure tasks and possibilities. 
- [ ] Add grafana and prometheus for monitoring practice
- [ ] Set up github actions for clear and consistent updating and linting. Enforce access controls. 
- [ ] Rebuild frontend using a more advanced framework and create a multipage application
- [ ] Add kubernetes deployments using minicube
- [ ] Add docker swarm deployments using one machine docker swarm deploy to practice
- [ ] Configure specific and controlled network settings in docker compose file
- [ ] Secure containers
    - [ ] Use user context
    - [ ] run automated security scans
- [ ] Add filebeat to gather the logs and implement logstash to monitor logging
- [ ] Create some attack scenarios that would trigger specific situations. Demonstrate the effectivness of the tools and test their capability and how to avoid detection. 
- [ ] Add suricata to monitor the network. 

