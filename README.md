# 🚀 HTML Portfolio Deployment on Kubernetes with GitHub Actions CI/CD

This project demonstrates how to deploy a simple static HTML portfolio on a local Kubernetes cluster using **Minikube**, and how to automate the build and deployment process using **GitHub Actions** for CI/CD.

> ⚠️ Due to Minikube's resource limitations, logging and monitoring were deferred. Future enhancements will be implemented on a multi-node kubeadm cluster.

---

## 📌 Features

- 🐳 Dockerized HTML Portfolio
- ☸️ Kubernetes Deployment & Service (via Helm)
- 🤖 GitHub Actions CI/CD on push to `main`
- 🔄 Automatic image tagging and rolling updates
- 🧪 Local testing with Minikube


## 📂 Project Structure

.
├── .github/workflows/main.yaml # GitHub Actions CI/CD workflow
├── webapp_pipeline/app/ # Helm chart for Kubernetes deployment
│ ├── Chart.yaml
│ ├── values.yaml
│ └── templates/
├── src/index.html # Static HTML portfolio page
├── Dockerfile # Docker image definition



## 🛠️ Prerequisites

Ensure the following tools are installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Minikube](https://minikube.sigs.k8s.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/)
- [Git](https://git-scm.com/)

Also, create GitHub Secrets for Docker authentication:

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

## 🚀 Getting Started

### 1. Start Minikube

```bash
minikube start --cpus=2 --memory=409

# Deploy portfolio with default image tag
helm upgrade --install webapp_pipeline/app --namespace default

# forward port to have access into the pod where the web container is runnning, i created the cluster in a vm hence the reason for the port forwarding
kubectl port-forward --address 0.0.0.0 -n ingress-nginx service/ingress-nginx-controller 8080:80

NOTE: After a change is made to the html file in the src directory, push it to your repository, automatically the workflow start, performing CICD, after
      it's done, check the page, you should see the update.


#On each push to the main branch:

Build the Docker image.

Tag with both latest and short SHA.

Push to Docker Hub.

Deploy via Helm with updated image tag.

Wait for the rollout to complete.

#workflow location
.github/workflows/main.yaml

Future Plans
Due to limited resources on Minikube, the following will be implemented later on a multi-node kubeadm setup:

📊 Log Monitoring with Fluent Bit + Elasticsearch + Kibana

📈 Metrics Monitoring with Prometheus + Grafana

🧪 Load Testing and Auto-scaling

🔁 Blue/Green or Canary Deployment Strategies
