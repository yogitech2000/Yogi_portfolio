# Yogaganapathi Terminal Portfolio

A sleek terminal-style portfolio website built with HTML, CSS, and JavaScript, containerized with Docker for easy deployment.

## 🚀 Quick Start

### Using Deployment Scripts

#### Linux/Mac
```bash
# Make script executable (first time only)
chmod +x deploy.sh

# Full deployment
./deploy.sh deploy

# Or individual commands
./deploy.sh build    # Build Docker image
./deploy.sh start    # Start application
./deploy.sh stop     # Stop application
./deploy.sh status   # Check status
```

#### Windows
```cmd
# Full deployment
deploy.bat deploy

# Or individual commands
deploy.bat build
deploy.bat start
deploy.bat stop
deploy.bat status
```

### Manual Docker Commands

```bash
# Build and run the application
docker-compose up --build

# Access the application at http://localhost:8080
```

### Manual Docker Build

```bash
# Build the Docker image
docker build -t yogaganapathi-terminal .

# Run the container
docker run -d -p 8080:80 --name terminal-portfolio yogaganapathi-terminal

# Access at http://localhost:8080
```

## ☁️ Cloud Deployment Instructions

### Prerequisites
- Docker installed on your VM
- Git (optional, for cloning)
- Cloud VM with at least 512MB RAM and 1GB storage

### AWS EC2 Deployment

#### 1. Launch EC2 Instance
```bash
# Choose Amazon Linux 2 or Ubuntu
# t2.micro or t3.micro is sufficient
# Security Group: Allow HTTP (80) and SSH (22)
```

#### 2. Connect to your instance
```bash
ssh -i your-key.pem ec2-user@your-instance-ip
```

#### 3. Install Docker
```bash
# Update system
sudo yum update -y  # Amazon Linux
# or
sudo apt update && sudo apt upgrade -y  # Ubuntu

# Install Docker
sudo yum install -y docker  # Amazon Linux
# or
sudo apt install -y docker.io  # Ubuntu

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group (optional)
sudo usermod -aG docker $USER
```

#### 4. Deploy the Application
```bash
# Clone or upload your project files
git clone https://github.com/yourusername/terminal-portfolio.git
cd terminal-portfolio

# Build and run with Docker Compose
sudo docker-compose up -d --build

# Or build manually
sudo docker build -t terminal-portfolio .
sudo docker run -d -p 80:80 --name terminal-app --restart unless-stopped terminal-portfolio
```

#### 5. Access your application
- Open your browser to `http://your-instance-public-ip`
- The application will be running on port 80

### Azure VM Deployment

#### 1. Create Azure VM
- Choose Ubuntu Server 20.04 LTS
- Size: Standard_B1s (1 vCPU, 1 GB RAM)
- Allow HTTP (80) and SSH (22) in Network Security Group

#### 2. Connect via SSH
```bash
ssh yourusername@your-vm-ip
```

#### 3. Install Docker
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
sudo apt install -y docker.io

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER
```

#### 4. Deploy Application
```bash
# Upload files or clone repository
# Then run:
sudo docker-compose up -d --build
```

### Google Cloud VM Deployment

#### 1. Create Compute Engine VM
- OS: Ubuntu 20.04 LTS
- Machine type: e2-micro (0.2 vCPU, 1 GB RAM)
- Firewall: Allow HTTP traffic

#### 2. Connect via SSH (Cloud Console or gcloud)
```bash
gcloud compute ssh your-instance-name
```

#### 3. Install Docker
```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
```

#### 4. Deploy
```bash
sudo docker-compose up -d --build
```

## 🔧 Configuration

### Environment Variables
```yaml
# docker-compose.yml
environment:
  - NGINX_PORT=80
  - NGINX_WORKER_PROCESSES=1
```

### Custom Domain (Optional)
To use a custom domain, update your DNS to point to your VM's public IP, then configure nginx if needed.

### SSL Certificate (Recommended for Production)
```bash
# Install certbot for Let's Encrypt
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com
```

### Nginx Configuration
The included `nginx.conf` provides:
- Gzip compression
- Security headers
- Static asset caching
- Health check endpoint

## 📊 Monitoring

### Health Checks
```bash
# Linux/Mac
./health-check.sh

# Windows
health-check.bat

# Manual check
curl http://localhost/health
```

### Check container status
```bash
docker ps
docker logs yogaganapathi-terminal
```

### View resource usage
```bash
docker stats yogaganapathi-terminal
```

## � Docker Configuration

### Image Details
- **Base Image**: `nginx:alpine` (~20MB)
- **Total Size**: ~25MB uncompressed
- **Architecture**: Multi-platform support
- **Security**: Non-root user, minimal attack surface

### Optimizations
- **Gzip Compression**: Enabled for text files
- **Caching Headers**: 1-year cache for static assets
- **Security Headers**: XSS protection, content type sniffing prevention
- **Health Check**: `/health` endpoint for monitoring

### Performance Benefits
- **Fast Startup**: Sub-second container startup
- **Low Memory**: ~10MB RAM usage
- **High Concurrency**: Handles thousands of concurrent connections
- **CDN Ready**: Optimized for cloud deployment with CDNs

## 📝 Features

- ✅ Blinking cursor animation
- ✅ Command history with arrow keys
- ✅ Auto-scroll to bottom
- ✅ Responsive design
- ✅ Smooth output rendering
- ✅ Clear/cls commands
- ✅ Docker containerization
- ✅ Cloud-ready deployment

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with Docker
5. Submit a pull request

## 📄 License

MIT License - feel free to use this project for your portfolio!