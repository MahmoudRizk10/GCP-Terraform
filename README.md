# GCP-Terraform
1- Create VPC

- subnets (management subnet & restricted subnet)

- Management subnet has the (NAT gateway , Private vm)

- Restricted subnet has the (Private standard GKE cluster (private control plan)) Notes:Restricted subnet must not have access to internet

2- All images deployed on GKE must come from GCR or Artifacts registry.

3- The VM must be private.

4- Deployment must be exposed to public internet with a public HTTP load balancer.

5- All infra is to be created on GCP using terraform.

6- Deployment on GKE can be done by terraform or manually by kubectl tool.

7- Don’t use default compute service account while creating the gke cluster, create custom SA and attach it to your nodes.

8- Only the management subnet can connect to the gke cluster.

--------------------------------------------------------------------------------------------------------------------------------------

Deploy Python Application ![Project link] (https://github.com/atefhares/DevOps-Challenge-Demo-Code)

Docrize python web application using docker

Pull redis image from docker Hub

push 2 image to gcr on GCP

