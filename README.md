# 🚀 Interactive DevOps Portfolio & CI/CD Pipeline

Welcome to my DevOps portfolio repository! Instead of deploying a static website manually, I engineered this project to test my knowledge.

This project consists of an interactive, terminal-themed frontend UI and an automated **Continuous Integration / Continuous Deployment (CI/CD)** pipeline that pushes assets straight to AWS cloud infrastructure upon every code modification.


## 🏗️ System Architecture

The workflow is completely decoupled, secure, and event-driven:
[ Local Machine ] ──(git push)──> [ GitHub Repository ]
│
(Triggers Workflow)
▼
[ AWS S3 Bucket ] <──(Sync Assets)── [ GitHub Actions ]

**Version Control**: Application assets and pipeline workflows are managed using Git & GitHub.
2. **CI/CD Automation Engine:** GitHub Actions listens for code modifications on the `main` branch.
3. **Identity & Access Management:** GitHub authenticates securely to AWS using encrypted repository secrets via least-privilege principles.
4. **Cloud Native Hosting:** Infrastructure utilizes an AWS S3 bucket optimized for high-availability static web hosting within the `eu-central-1` region.

---

🛠️ Tech Stack Matrix

* **Cloud Provider:** Amazon Web Services (AWS S3)
* **Automation / CI/CD:** GitHub Actions
* **Frontend UI:** Vanilla JavaScript, HTML5, TailwindCSS (Responsive Terminal Interface)
* **Configuration Syntax:** YAML

---

💻 Frontend Features

The portfolio behaves like a functional command-line terminal interface to showcase engineering proficiency dynamically:
* ⌨️ **Interactive CLI:** Type commands like `help`, `skills`, or `projects` directly into the web UI browser terminal.
* 🚀 **GitOps Pipeline Simulator:** Includes an asynchronous live build-log simulation pane that mimics a Kubernetes microservice rollout.
* 🕒 **Dynamic Metrics:** Includes automated uptime tracking simulations.

---

🔧 CI/CD Pipeline Configuration Details

The pipeline resides inside `.github/workflows/deploy.yml` and automates the entire delivery cycle:

```yaml
name: Deploy Portfolio

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: eu-central-1

      - name: Deploy to S3
        run: |
          aws s3 sync ./public s3://YOUR-BUCKET-NAME --exclude ".git/*" --exclude ".github/*"
