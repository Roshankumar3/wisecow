# Cow wisdom web server

## Prerequisites

```
sudo apt install fortune-mod cowsay -y
```

## How to use?

1. Run `./wisecow.sh`
2. Point the browser to server port (default 4499)

## What to expect?
![wisecow](https://github.com/nyrahul/wisecow/assets/9133227/8d6bfde3-4a5a-480e-8d55-3fef60300d98)

# Problem Statement
Deploy the wisecow application as a k8s app

## Requirement
1. Create Dockerfile for the image and corresponding k8s manifest to deploy in k8s env. The wisecow service should be exposed as k8s service.
2. Github action for creating new image when changes are made to this repo
3. [Challenge goal]: Enable secure TLS communication for the wisecow app.

## Expected Artifacts
1. Github repo containing the app with corresponding dockerfile, k8s manifest, any other artifacts needed.
2. Github repo with corresponding github action.
3. Github repo should be kept private and the access should be enabled for following github IDs: nyrahul  





Cow wisdom web server

Step 1 : I create a ec2 server in aws image

Step 2 : Install dependencies # Ubuntu ---> sudo apt-get update -y ----> sudo apt-get install -y curl apt-transport-https ----> sudo apt-get install -y docker.io -y ----> curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 ----> sudo install minikube-linux-amd64 /usr/local/bin/minikube

step 2 : install docker & minikube & check version image ----> docker --version ----> kubectl version --output=yaml

step : 3 dockerfile build ----> docker build -t wisecow .

step 4 : I create a cluster aws eks create-cluster
--name Cow-wisdom
--region us-west-2
--kubernetes-version 1.28
--role-arn arn:aws:iam::455025092545:role/cow-wisdom \ #AWSServiceRoleForAmazonEKS role name --resources-vpc-config subnetIds=subnet-0a9f143cca6a07f21,securityGroupIds=sg-022478bd94306276dws
step 5 : I cerate a nodegroup aws eks create-nodegroup
--cluster-name Cow-wisdom
--nodegroup-name Cow-wisdom-nodes
--subnets subnet-06632f49852d6f844 subnet-0314da887d8a1acde
--node-role arn:aws:iam::455025092545:role/cow-wisecow-node
--scaling-config minSize=1,maxSize=3,desiredSize=2
--instance-types t3.medium {

----> I setup like this k8/mainfest# ls -rw-r--r-- 1 root root 336 Sep 16 07:00 deployment.yml -rw-r--r-- 1 root root 458 Sep 16 07:00 ingress.yaml -rw-r--r-- 1 root root 186 Sep 16 07:00 service.yaml

----> kubectl apply -f deployement.yml output : deployment.apps/wisecow-deployment created 
----> kubectl apply -f service.yml output : service/wisecow-service created
 ----> kubectl apply -f ingress.yml output : ingress.networking.k8s.io/wisecow-ingress created kubectl get svc 
-----> kubectl get deployment wisecow-deployment -o yaml | grep image:  output :  - image: roshan/wisecow:latest
     
step 6 : i check my pod which service is running ---> kubectl get svc root@ip-172-31-40-16:~/Cow-wisdom-web-server/wisecow# kubectl get nodes NAME STATUS ROLES AGE VERSION ip-172-31-45-194.us-west-2.compute.internal Ready 46h v1.29.15-eks-3abbec1 ip-172-31-50-121.us-west-2.compute.internal Ready 46h v1.29.15-eks-3abbec1

root@ip-172-31-40-16:~/Cow-wisdom-web-server/wisecow# kubectl get svc
NAME              TYPE           CLUSTER-IP    EXTERNAL-IP                                                              PORT(S)        AGE
kubernetes        ClusterIP      10.100.0.1    <none>                                                                   443/TCP        47h
wisecow-service   LoadBalancer   10.100.32.1   a939ddf3cc3bc4ea88407535b83c7f53-521939326.us-west-2.elb.amazonaws.com   80:32041/TCP   46h
----> My Load Balancer is successfully running & copy DNS name : a939ddf3cc3bc4ea88407535b83c7f53-521939326.us-west-2.elb.amazonaws.com
paste in browser a939ddf3cc3bc4ea88407535b83c7f53-521939326.us-west-2.elb.amazonaws.com
output : image 


Create a cloudwatch for log & monitor:
<img width="1891" height="777" alt="image" src="https://github.com/user-attachments/assets/3f173f76-67e9-4b1f-852d-10b94340f56a" />




