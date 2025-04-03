

# **AWS DevOps Project: Deploying a Static Web App with Docker, Amazon ECR, and ECS**  

## **Project Overview**  
This project demonstrates the deployment of a static web application on **AWS** using **Docker, Amazon Elastic Container Registry (ECR), and Amazon Elastic Container Service (ECS)**. The web application is containerized and hosted on AWS infrastructure, leveraging key AWS services for scalability and reliability.  

## **Architecture**  
The deployment follows a **three-tier architecture**, as illustrated in the reference diagram. It includes:  

- **Docker** for containerizing the application  
- **Git & GitHub** for version control and source code management  
- **AWS ECR** to store the Docker image  
- **AWS ECS (Fargate)** to run the containerized application  
- **AWS VPC** with public and private subnets across two availability zones  
- **Internet Gateway & NAT Gateway** for connectivity  
- **Amazon RDS (MySQL)** for relational database storage  
- **Application Load Balancer (ALB)** for traffic distribution  
- **AWS IAM Roles & Security Groups** for access control  
- **AWS Route 53** for domain name resolution  
- **AWS S3** to store configuration files  
- **AWS Certificate Manager** for SSL/TLS encryption  

## **Prerequisites**  
Before deploying the project, ensure you have the following:  
- An **AWS account** with access to **ECR, ECS, and IAM**  
- **Docker** installed on your local machine  
- **AWS CLI** configured with necessary permissions  
- **Git** installed for version control  

## **Project Setup**  

### **1. Clone the Repository**  
```bash
git clone https://github.com/yourusername/project-repo.git  
cd project-repo  
```

### **2. Configure Git**  
```bash
git config --global user.name "Your Name"  
git config --global user.email "youremail@example.com"  
```

### **3. Build the Docker Image**  
```bash
docker build -t my-web-app .  
```

### **4. Tag and Push to Amazon ECR**  
Authenticate Docker to the ECR repository:  
```bash
aws ecr get-login-password | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com  
```

Tag and push the image:  
```bash
docker tag my-web-app:latest <aws_account_id>.dkr.ecr.<region>.amazonaws.com/my-web-app  
docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/my-web-app  
```

### **5. Deploy to Amazon ECS**  
- Create an **ECS Cluster**  
- Define a **Task Definition** using the pushed ECR image  
- Configure **Service and Load Balancer**  
- Deploy the containerized application  

## **Dockerfile Used in the Project**  
```dockerfile
FROM amazonlinux:latest  

# Install dependencies  
RUN yum update -y && \  
    yum install -y httpd && \  
    yum install wget -y && \  
    yum install unzip -y  

# Change directory  
RUN cd /var/www/html  

# Download web files  
RUN wget https://github.com/azeezsalu/techmax/archive/refs/heads/main.zip  

# Unzip folder  
RUN unzip main.zip  

# Copy files into html directory  
RUN cp -r techmax-main/* /var/www/html/  

# Remove unwanted folder  
RUN rm -rf techmax-main main.zip  

# Expose port 80  
EXPOSE 80  

# Set default application  
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]  
```

## **Conclusion**  
This project showcases the **containerization and deployment** of a static web app on AWS using **Docker, ECR, and ECS**. By leveraging **AWS services**, we ensure a **scalable, reliable, and secure** deployment.  

---

Let me know if you want any modifications! 🚀
