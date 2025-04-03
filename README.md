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



# Docker Swarm Setup for FastBuy

This guide explains how to set up a Docker Swarm cluster to deploy the FastBuy services, including Traefik as a reverse proxy.

## Prerequisites

- Install Docker and Docker Compose
- Initialize Docker Swarm. (We are using single node manager to test our swarm configs)

## Steps to Setup Docker Swarm

### 1. Initialize Docker Swarm

On the manager node, run:

```sh
docker swarm init
```

### 2. Deploy the Stack

Run the following command in the directory containing `docker-compose_swarm.yml`:

```sh
docker stack deploy -c docker-compose_swarm.yml fastbuy
```

### 3. Verify the Deployment

Check the running services:

```sh
docker stack services fastbuy
```

Check logs of a specific service:

```sh
docker service logs fastbuy_traefik
```

### 4. Access Services

- Traefik Dashboard: `http://localhost:8080`
- Frontend: `http://fastbuy.local`
- Backend API: `http://api.fastbuy.local`

### 5. Scale Services

To scale a service, use:

```sh
docker service scale fastbuy_frontend=3
```

### 6. Remove the Stack

To remove the entire setup:

```sh
docker stack rm fastbuy
```

### Notes
- Ensure `fastbuy.local` and `api.fastbuy.local` are mapped in `/etc/hosts` or use a proper DNS setup.
- For a multi-node Swarm, join worker nodes using the command shown in `docker swarm init` output.





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

