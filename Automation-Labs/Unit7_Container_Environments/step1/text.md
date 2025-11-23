### Lab Activities

THIS LAB IS UNDER CONSTRUCTION

This lab is designed as part of a larger set of instruction that is free from the Professional Linux Users Group (ProLUG). The lab book for this course can be found here: https://professionallinuxusersgroup.github.io/course-books/pcae/unitindex

Your development teams have decided to deploy environments in Kubernetes. You have decided to look into ensuring that automation supports the different tasks they will need your team to complete.

Ensure you have the Ansible module for kubernetes core.

<br>
<details>
<summary>Solution</summary>

Install the module for kubernetes core.

```plain
ansible-galaxy collection install kubernetes.core
```{{exec}}

Was this already installed?

Install the other dependencies

```plain
apt -y install python3-kubernetes
```{{exec}}

Create a basic test to see ansible communicate with your kubernetes cluster.

vi unit7_kubernetes_1.yaml and add the following lines

```plain
- hosts: localhost
  gather_facts: true
  vars:
  tasks:
   
  - name: Create a k8s namespace
    kubernetes.core.k8s:
      name: testing
      api_version: v1
      kind: Namespace
      state: present
```

View your current namespaces before the change

```plain
kubectl get ns
```{{exec}}

Execute your change


```plain
ansible-playbook unit7_kubernetes_1.yaml
```{{exec}}

Verify the new namespace

```plain
kubectl get ns
```{{exec}}

Now, put in a variable and create another namespace.

```plain
cp unit7_kubernetes_1.yaml unit7_kubernetes_2.yaml
```{{exec}}

vi unit7_kubernetes_2.yaml

Modify as follows

```plain
- hosts: localhost
  gather_facts: true
  vars:
  tasks:
   
  - name: Create a k8s namespace
    kubernetes.core.k8s:
      name: "{{ prolug_namespace }}"
      api_version: v1
      kind: Namespace
      state: present
```

Execute this and pass in a variable at the command line

```plain
ansible-playbook unit7_kubernetes_2.yaml --extra-vars "prolug_namespace=dev-app2-v1"
```{{exec}}

Verify that your new namespace has been created.

```plain
kubectl get ns
```{{exec}}

Now, think about all the ways that variables can be passed into Ansible. Where else might you get these variables passed in as you create these environments? What other ways can teams present variables to your automations?

</details>
