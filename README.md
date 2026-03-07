# Yogaganapathi Terminal Portfolio

A sleek, interactive terminal-style portfolio website built with vanilla HTML, CSS, and JavaScript. Features a fully functional command-line interface with smooth animations, command history, and responsive design. Containerized with Docker for easy deployment across any platform.

![Terminal Portfolio](https://img.shields.io/badge/Status-Production--Ready-green)
![Docker](https://img.shields.io/badge/Docker-Ready-blue)
![GitHub](https://img.shields.io/badge/github-repo-blue?logo=github)
![javaScript](https://img.shields.io/badge/logo-javascript-blue?logo=javascript)
![HTML](https://img.shields.io/badge/Status-Production--Ready-green)
 

## ✨ Features

- 🎯 **Interactive Terminal Interface** - Fully functional command-line experience
- ⌨️ **Command History** - Navigate with arrow keys (↑/↓)
- 👁️ **Blinking Cursor** - Authentic terminal cursor animation
- 📱 **Responsive Design** - Works on desktop, tablet, and mobile
- ⚡ **Smooth Animations** - Typewriter effects and fade transitions
- 🐳 **Docker Containerized** - Ready for cloud deployment
- 🔒 **Production Ready** - Optimized nginx configuration
- 📊 **Health Monitoring** - Built-in health check endpoints

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start](#-quick-start)
- [Installation](#installation)
- [Usage](#usage)
- [Available Commands](#available-commands)
- [Deployment](#deployment)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)
- [Development](#development)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)

##  Prerequisites📋

Before you begin, ensure you have the following installed:

### For Local Development
- **Docker** (version 20.10 or later)
- **Docker Compose** (optional, for easier management)
- **Git** (for cloning the repository)

### For Cloud Deployment
- **SSH access** to your cloud VM
- **Docker** installed on the target VM
- **sudo/root access** for system-level operations

### System Requirements
- **RAM**: Minimum 512MB (recommended 1GB)
- **Storage**: 500MB free space
- **Network**: Internet connection for Docker pulls

##  Quick Start🚀

### Option 1: One-Command Deployment (Recommended)

#### Linux/Mac
```bash
git clone https://github.com/yourusername/terminal-portfolio.git
cd terminal-portfolio
chmod +x deploy.sh
./deploy.sh deploy
```

#### Windows
```cmd
git clone https://github.com/yourusername/terminal-portfolio.git
cd terminal-portfolio
deploy.bat deploy
```

**That's it!** Your portfolio will be running at `http://localhost`

### Option 2: Manual Docker Commands

```bash
# Clone the repository
git clone https://github.com/yourusername/terminal-portfolio.git
cd terminal-portfolio

# Build and run with Docker Compose
docker-compose up --build -d

# Or build manually
docker build -t yogaganapathi-terminal .
docker run -d -p 80:80 --name terminal-portfolio yogaganapathi-terminal
```

## 📦 Installation

### Step 1: Clone the Repository

```bash
# HTTPS (recommended for most users)
git clone https://github.com/yourusername/terminal-portfolio.git

# SSH (if you have SSH keys set up)
git clone git@github.com:yourusername/terminal-portfolio.git

# Or download ZIP from GitHub
# Extract and navigate to the folder
```

### Step 2: Navigate to Project Directory

```bash
cd terminal-portfolio
```

### Step 3: Verify Files

Ensure you have all necessary files:
```bash
ls -la
# Should show: Dockerfile, docker-compose.yml, index.html, script.js, styles.css, etc.
```

### Step 4: Make Scripts Executable (Linux/Mac)

```bash
chmod +x deploy.sh health-check.sh
```

## 🎮 Usage

### Accessing the Portfolio

Once deployed, open your browser and navigate to:
- **Local**: `http://localhost` or `http://localhost:8080`
- **Cloud VM**: `http://your-vm-public-ip`

### Terminal Interface

The portfolio simulates a Linux terminal with the following features:

#### Basic Navigation
- **Type commands** and press Enter to execute
- **Arrow keys** (↑/↓) to navigate command history
- **Clear screen** with `clear` or `cls` commands
- **Responsive design** adapts to screen size

#### Interactive Elements
- **Blinking cursor** indicates input readiness
- **Smooth animations** for command output
- **Auto-scroll** keeps latest content visible
- **Click anywhere** to focus input field

## 📖 Available Commands

| Command | Description |
|---------|-------------|
| `help` | Display all available commands |
| `profile` | View professional summary |
| `skills` | List technical skills |
| `experience` | Show work experience overview |
| `experience tcs` | Detailed TCS experience |
| `experience trimble` | Detailed Trimble experience |
| `social` | Display social media links |
| `clear` / `cls` | Clear the terminal screen |

### Example Usage

```bash
visitor@yogaganapathi:~$ help
visitor@yogaganapathi:~$ profile
visitor@yogaganapathi:~$ skills
visitor@yogaganapathi:~$ experience
visitor@yogaganapathi:~$ social
```

## 🚀 Deployment

### Local Deployment

#### Using Deployment Scripts
```bash
# Full deployment (build + start)
./deploy.sh deploy

# Individual commands
./deploy.sh build    # Build Docker image
./deploy.sh start    # Start container
./deploy.sh stop     # Stop container
./deploy.sh restart  # Restart application
./deploy.sh status   # Check status
./deploy.sh logs     # View logs
```

#### Using Docker Compose
```bash
# Start in background
docker-compose up -d --build

# View logs
docker-compose logs -f

# Stop application
docker-compose down
```

### Cloud Deployment

#### AWS EC2 Deployment

1. **Launch EC2 Instance**
   ```bash
   # Choose t2.micro or t3.micro (free tier eligible)
   # AMI: Amazon Linux 2 or Ubuntu Server
   # Security Group: Allow HTTP (80) and SSH (22)
   ```

2. **Connect to Instance**
   ```bash
   ssh -i your-key.pem ec2-user@your-instance-ip
   ```

3. **Install Docker**
   ```bash
   # Amazon Linux
   sudo yum update -y
   sudo amazon-linux-extras install docker
   sudo systemctl start docker
   sudo systemctl enable docker
   sudo usermod -aG docker $USER

   # Ubuntu
   sudo apt update && sudo apt install -y docker.io
   sudo systemctl start docker
   sudo systemctl enable docker
   sudo usermod -aG docker $USER
   ```

4. **Deploy Application**
   ```bash
   # Clone repository
   git clone https://github.com/yourusername/terminal-portfolio.git
   cd terminal-portfolio

   # Deploy
   ./deploy.sh deploy
   ```

5. **Access Application**
   - Open `http://your-instance-public-ip` in browser

#### Azure VM Deployment

1. **Create VM**
   - Size: Standard_B1s (1 vCPU, 1 GB RAM)
   - OS: Ubuntu 20.04 LTS
   - Networking: Allow HTTP (80) inbound

2. **Connect via SSH**
   ```bash
   ssh yourusername@your-vm-ip
   ```

3. **Install Docker & Deploy**
   ```bash
   sudo apt update
   sudo apt install -y docker.io
   sudo systemctl start docker
   sudo systemctl enable docker
   sudo usermod -aG docker $USER

   git clone https://github.com/yourusername/terminal-portfolio.git
   cd terminal-portfolio
   ./deploy.sh deploy
   ```

#### Google Cloud VM Deployment

1. **Create Compute Engine Instance**
   - Machine type: e2-micro
   - OS: Ubuntu 20.04 LTS
   - Firewall: Allow HTTP traffic

2. **SSH Connection**
   ```bash
   gcloud compute ssh your-instance-name
   ```

3. **Install Docker & Deploy**
   ```bash
   sudo apt update
   sudo apt install -y docker.io
   sudo systemctl start docker
   sudo systemctl enable docker
   sudo usermod -aG docker $USER

   git clone https://github.com/yourusername/terminal-portfolio.git
   cd terminal-portfolio
   ./deploy.sh deploy
   ```

### Production Deployment Checklist

- [ ] **Security Groups/Firewalls** configured (ports 80, 443)
- [ ] **SSL Certificate** installed (Let's Encrypt recommended)
- [ ] **Domain Name** pointed to VM IP
- [ ] **Monitoring** set up (health checks)
- [ ] **Backups** configured (if needed)
- [ ] **Auto-scaling** considered for high traffic

## 🧪 Testing

### Automated Testing

#### Health Check Scripts
```bash
# Linux/Mac
./health-check.sh

# Windows
health-check.bat
```

#### Manual Health Checks
```bash
# Check container status
docker ps | grep yogaganapathi-terminal

# Check health endpoint
curl http://localhost/health

# Check application accessibility
curl http://localhost | grep "Yogaganapathi"

# View application logs
docker logs yogaganapathi-terminal
```

### Manual Testing Checklist

- [ ] **Application loads** in browser
- [ ] **Terminal interface** displays correctly
- [ ] **Commands work** (help, profile, skills, etc.)
- [ ] **Command history** functions with arrow keys
- [ ] **Clear/cls commands** work properly
- [ ] **Responsive design** on mobile/tablet
- [ ] **Animations** are smooth
- [ ] **No console errors** in browser dev tools

### Performance Testing

```bash
# Check resource usage
docker stats yogaganapathi-terminal

# Load testing (basic)
curl -s http://localhost > /dev/null && echo "Load test passed"

# Memory usage check
docker stats --no-stream yogaganapathi-terminal
```

## 🔧 Troubleshooting

### Common Issues & Solutions

#### ❌ "Docker command not found"
**Problem**: Docker is not installed or not in PATH
**Solution**:
```bash
# Check if Docker is installed
docker --version

# Install Docker (Ubuntu/Debian)
sudo apt update && sudo apt install -y docker.io

# Install Docker (CentOS/RHEL)
sudo yum install -y docker

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group (avoid sudo)
sudo usermod -aG docker $USER
# Logout and login again, or run: newgrp docker
```

#### ❌ "Permission denied" when running Docker
**Problem**: User doesn't have Docker permissions
**Solution**:
```bash
# Add user to docker group
sudo usermod -aG docker $USER

# Restart Docker service
sudo systemctl restart docker

# Logout and login again, or use:
newgrp docker
```

#### ❌ "Port 80 already in use"
**Problem**: Another service is using port 80
**Solution**:
```bash
# Check what's using port 80
sudo netstat -tulpn | grep :80
sudo lsof -i :80

# Stop conflicting service (example: apache2)
sudo systemctl stop apache2
sudo systemctl disable apache2

# Or run on different port
docker run -d -p 8080:80 yogaganapathi-terminal
```

#### ❌ "Build fails" during Docker build
**Problem**: Docker build process fails
**Solution**:
```bash
# Clear Docker cache
docker system prune -a

# Check available disk space
df -h

# Rebuild without cache
docker build --no-cache -t yogaganapathi-terminal .

# Check build logs
docker build -t yogaganapathi-terminal . 2>&1 | tee build.log
```

#### ❌ "Container exits immediately"
**Problem**: Container starts and stops immediately
**Solution**:
```bash
# Check container logs
docker logs yogaganapathi-terminal

# Run in foreground to see errors
docker run -p 80:80 yogaganapathi-terminal

# Check nginx configuration
docker run -it yogaganapathi-terminal nginx -t
```

#### ❌ "Application not accessible"
**Problem**: Can't access the application in browser
**Solution**:
```bash
# Check if container is running
docker ps

# Check container port mapping
docker port yogaganapathi-terminal

# Test local connectivity
curl http://localhost

# Check firewall settings
sudo ufw status  # Ubuntu
sudo firewall-cmd --list-all  # CentOS

# Cloud: Check security groups/firewall rules
```

#### ❌ "Slow performance" or "High memory usage"
**Problem**: Application is slow or using too much memory
**Solution**:
```bash
# Check resource usage
docker stats yogaganapathi-terminal

# Limit container resources
docker run -d -p 80:80 --memory=256m --cpus=0.5 yogaganapathi-terminal

# Optimize nginx configuration
# Edit nginx.conf and rebuild container
```

#### ❌ "SSL/HTTPS not working"
**Problem**: SSL certificate issues
**Solution**:
```bash
# Install certbot
sudo apt install -y certbot python3-certbot-nginx

# Get certificate
sudo certbot --nginx -d yourdomain.com

# Test renewal
sudo certbot renew --dry-run
```

### Getting Help

If you encounter issues not covered here:

1. **Check the logs**:
   ```bash
   docker logs yogaganapathi-terminal
   ```

2. **Run health checks**:
   ```bash
   ./health-check.sh
   ```

3. **Check system resources**:
   ```bash
   df -h  # Disk space
   free -h  # Memory
   uptime  # System load
   ```

4. **Browser debugging**:
   - Open Developer Tools (F12)
   - Check Console tab for JavaScript errors
   - Check Network tab for failed requests

5. **Community support**:
   - Check GitHub Issues for similar problems
   - Create a new issue with detailed information

## 💻 Development

### Project Structure

```
terminal-portfolio/
├── index.html          # Main HTML file
├── script.js           # Terminal logic and commands
├── styles.css          # CSS styling and animations
├── Dockerfile          # Docker container configuration
├── docker-compose.yml  # Docker Compose setup
├── nginx.conf          # Nginx web server config
├── deploy.sh           # Linux/Mac deployment script
├── deploy.bat          # Windows deployment script
├── health-check.sh     # Health monitoring script
├── .dockerignore       # Docker build exclusions
└── README.md           # This file
```

### Local Development Setup

```bash
# Clone repository
git clone https://github.com/yourusername/terminal-portfolio.git
cd terminal-portfolio

# Run with live reload (requires Node.js)
npm install -g live-server
live-server --port=3000

# Or use Python server
python3 -m http.server 3000

# Or use Docker for development
docker-compose up --build
```

### Making Changes

1. **Edit files** in your favorite code editor
2. **Test locally** with live server or Docker
3. **Build and test** Docker image
4. **Commit changes** and push to repository

### Adding New Commands

To add new commands to the terminal:

1. **Edit `script.js`**
2. **Add to `commands` object**:
   ```javascript
   commands: {
     // ... existing commands
     "newcommand": "Command description and output"
   }
   ```

3. **Update help text** in the `help` command
4. **Test the new command**

### Customizing Styling

- **Colors**: Edit CSS custom properties in `styles.css`
- **Animations**: Modify keyframes and transition properties
- **Layout**: Adjust responsive breakpoints and sizing

## ⚙️ Configuration

### Environment Variables

```yaml
# docker-compose.yml
services:
  terminal-portfolio:
    environment:
      - NGINX_PORT=80
      - NGINX_WORKER_PROCESSES=1
```

### Nginx Configuration

The `nginx.conf` includes:
- **Gzip compression** for faster loading
- **Security headers** (XSS protection, content type)
- **Static asset caching** (1 year for JS/CSS)
- **Health check endpoint** at `/health`

### Docker Configuration

- **Base image**: `nginx:alpine` (~20MB)
- **Total size**: ~25MB uncompressed
- **Multi-platform**: Supports AMD64, ARM64
- **Security**: Non-root container execution

## 🤝 Contributing

We welcome contributions! Here's how to get started:

### Development Workflow

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/your-feature`
3. **Make** your changes
4. **Test** thoroughly (Docker + manual testing)
5. **Commit** with clear messages: `git commit -m "Add: new feature"`
6. **Push** to your fork: `git push origin feature/your-feature`
7. **Create** a Pull Request

### Contribution Guidelines

- **Code Style**: Follow existing patterns in HTML/CSS/JS
- **Testing**: Test on multiple browsers and devices
- **Documentation**: Update README for new features
- **Commits**: Use conventional commit format
- **Issues**: Check existing issues before creating new ones

### Areas for Contribution

- [ ] **New terminal commands**
- [ ] **Additional themes/color schemes**
- [ ] **Mobile app version**
- [ ] **Internationalization (i18n)**
- [ ] **Accessibility improvements**
- [ ] **Performance optimizations**
- [ ] **Additional deployment platforms**

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

### Permissions
- ✅ **Commercial use**
- ✅ **Modification**
- ✅ **Distribution**
- ✅ **Private use**

### Limitations
- ❌ **No liability**
- ❌ **No warranty**

## 🙏 Acknowledgments

- **Inspiration**: Classic terminal interfaces
- **Technologies**: HTML5, CSS3, ES6+, Docker, nginx
- **Community**: Open source contributors

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/terminal-portfolio/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/terminal-portfolio/discussions)
- **Email**: your.email@example.com

---

**Built with ❤️ by Yogaganapathi**

*Showcase your DevOps and SRE expertise with this interactive terminal portfolio!*

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
