Check the kube-dns service running in the kube-system namespace.

Check the endpoints behind the service. 

Check the pods that serve the endpoints.

Are the pods on just one node or both? put your answer in /root/answer

<br>
<details>
<summary>Solution</summary>

Describe the service and look at information.
```plain
kubectl -n kube-system describe svc kube-dns
```{{exec}}

What labels do you see? What ports are used and which protocols are for each?

Check the endpoints behind the service
```plain
kubectl -n kube-system describe ep kube-dns
```{{exec}}

What labels do you see? What ports are used and which protocols are for each?

Check the pods that serve those endpoints
```plain
kubectl -n kube-system get pods -l k8s-app=kube-dns -o wide
```{{exec}}

Where are these pods located? What other information can you gather about coredns in this system?

```plain
kubectl -n kube-system get all | grep coredns
```{{exec}}

Answer the final lab question.

```plain
echo both > /root/answer
```{{exec}}

</details>