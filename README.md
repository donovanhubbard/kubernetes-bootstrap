# kubernetes-bootstrap
A bootstrap script that will prepare everything you need in order to boot a kubernetes cluster via kubeadm. These instructions are from Will Boyd's excellent acloud.guru class *Certified Kubernetes Administrator (CKA)*

# Building your hosts
First create at least two EC2 nodes. 
* Use the Ubuntu 18.04 Bionic ami
* Use the t2.medium sized or greater instances
* I sized the storage at 50GB per instance. I have no idea if that is enough or too much
* Place the instances in a security group that has full access to all other hosts in the group.

# Hostnames
Assign the following names to your hosts.
* k8s-control
* k8s-worker1
* k8s-worker2
Use the following command.
```
sudo hostnamectl set-hostname k8s-control
```

Next edit the /etc/hosts to include all of the above hostnames. It should look something like this, but swap out the appropriate ip addresses. Do this on all nodes.

```
10.0.3.253 k8s-control
10.0.3.18  k8s-worker1
10.0.3.61  k8s-worker2
```

# git
Clone this repo onto all the servers.

# Run the scripts
Run the following on all hosts with root permissions:
``` 
bootstrap-all.sh
```

Next, on the control plane run: 

```
bash bootstrap-control.sh 
```

Then as a _non_-root user on the control plane, run the following commands to get your kubectl config setup.
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

Run the following command to ensure everything is up so far.
```
kubectl get svc
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   8m12s
```


Next run the network script on the control plane to setup the network. This does not have to be run as the root user if you setup the nonroot user's .kube config.

```
bash bootstrap-network.sh
```

Run this to make sure that your control node is in a ready status.
```
kubetcl get nodes
NAME          STATUS   ROLES                  AGE   VERSION
k8s-control   Ready    control-plane,master   12m   v1.21.0
```

Next you want to get the join command you'll need on the other worker nodes run this and copy the output:
```
kubeadm token create --print-join-command
```
Copy that output and run it on all the worker nodes.

Finally run get nodes again to make sure all the nodes are in a ready state.

