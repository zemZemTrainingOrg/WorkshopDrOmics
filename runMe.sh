 # Install Docker
      sudo apt-get update
      sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

      # Add Docker's official GPG key and repository
      sudo mkdir -p /etc/apt/keyrings
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null
      echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

      sudo apt-get update
      sudo apt-get install -y docker.io
      sudo groupadd docker || true
      sudo usermod -aG docker $USER

      # Install Singularity (Apptainer)
      sudo apt install -y golang
      export VERSION=1.2.2  # Check for the latest version on GitHub
      curl -LO https://github.com/apptainer/apptainer/releases/download/v${VERSION}/apptainer-${VERSION}.tar.gz
      tar -xzf apptainer-${VERSION}.tar.gz
      cd apptainer-${VERSION}
      ./mconfig && make -C builddir && sudo make -C builddir install
      cd ..

      # Install Nextflow
      curl -s https://get.nextflow.io | bash
      sudo mv nextflow /usr/local/bin/
      
      curl -o Miniconda3-latest-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
      bash Miniconda3-latest-Linux-x86_64.sh -b -f -p $PWD/miniconda
      export PATH="$PWD/miniconda/bin:$PATH"
      
      # Install Mamba
      conda install -y mamba -c conda-forge

      # Verify installations
      docker --version
      singularity --version
      nextflow -version
      conda --version
      mamba --version
      