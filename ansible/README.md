# Spring Petclinic Deployment using Vagrant, Ansible & Docker Compose

This project demonstrates the automated deployment of the **Spring Petclinic** application using **Vagrant**, **Ansible**, and **Docker Compose**.  
It provisions a **Ubuntu VM** via Vagrant, configures it using Ansible, and deploys the Spring Petclinic application inside a Docker container.

---

## **Project Overview**

- **Vagrant**: Creates and manages a local Ubuntu VM.
- **Ansible**: Automates installation, configuration, and deployment tasks.
- **Docker Compose**: Orchestrates the Spring Petclinic application container.
- **Spring Petclinic**: A sample Spring Boot application for demonstration and learning purposes.

---

## **Project Structure**

```bash
spring-petclinic/
├── Vagrantfile                # Vagrant configuration for VM provisioning
├── ansible/
│   ├── ansible.cfg           # Ansible configuration file
│   ├── inventory.ini         # Ansible inventory file
│   ├── playbook.yml          # Main Ansible playbook
│   ├── group_vars/
│   │   └── dev.yml           # Environment-specific variables
│   └── roles/
│       └── spring_app/       # Role to deploy Spring Petclinic
│           ├── tasks/
│           │   ├── main.yml  # Main tasks entrypoint
│           │   └── docker.yml # Docker installation & setup tasks
│           └── templates/
│               └── compose.j2 # Docker Compose template
````

---

## **Ansible Role: `spring_app`**

The **spring\_app** role automates:

* **Docker installation** (via `docker.yml`)
* **Docker Compose installation**
* Generating a `docker-compose.yml` file from `compose.j2`
* Deploying the Spring Petclinic application container

---

## **How It Works**

1. **Vagrant spins up the VM**

   * Launches an Ubuntu 20.04 VM.
   * Configures private networking (`192.168.56.10`).

2. **Ansible provisions the VM**

   * Installs Docker & Docker Compose.
   * Deploys the Spring Petclinic app using Docker Compose.

3. **Application runs inside a container**

   * Spring Petclinic runs on port **8080** inside the VM.
   * Accessible from the host at:
     **[http://192.168.56.10:8080](http://192.168.56.10:8080)**

---

## **Usage**

### **1. Clone the Repository**

```bash
git clone https://github.com/abdullahhamada7/spring-petclinic-deploy.git

cd spring-petclinic-ansible-vagrant
```

### **2. Start the VM and Deploy**

```bash
vagrant up
```

* Vagrant provisions the VM and automatically runs the Ansible playbook.

### **3. Access the Application**

```bash
http://192.168.56.10:8080
```
---

## **Commands**

### **Start the environment**

```bash
vagrant up
```

### **SSH into VM**

```bash
vagrant ssh
```

### **Stop the environment**

```bash
vagrant halt
```

### **Destroy the environment**

```bash
vagrant destroy -f
```

---

## **Technologies Used**

* **Vagrant** - VM provisioning
* **VirtualBox** - Virtualization provider
* **Ansible** - Automation & configuration management
* **Docker Compose** - Multi-container orchestration
* **Spring Petclinic** - Demo application
