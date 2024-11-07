# Use the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Set user to root to install dependencies
USER root

# Install Node.js, npm, and other necessary tools
RUN apt-get update && \
    apt-get install -y \
    curl \
    gnupg \
    lsb-release \
    ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# Install Docker inside the Jenkins container (optional for building Docker images)
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    apt-get clean

# Set user back to Jenkins user
USER jenkins

# Install Docker Client (so Jenkins can use Docker commands)
RUN sudo usermod -aG docker jenkins
