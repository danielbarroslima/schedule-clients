# System base utilized Ubuntu 22.04.2 LTS 64-bit

install_docker:
	# First, update your existing list of packages:
	sudo apt update
	# Next, install a few prerequisite packages which let apt use packages over HTTPS:
	sudo apt install apt-transport-https ca-certificates curl software-properties-common
	# Then add the GPG key for the official Docker repository to your system:
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	# Add the Docker repository to APT sources:
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	# Update your existing list of packages again for the addition to be recognized:
	sudo apt update
	# Finally install docker
	sudo apt install docker-ce

install_compose:
	sudo pip3 install docker-compose

add_user_group_docker:
	sudo usermod -aG docker ${USER}

compose_up:
	sudo docker-compose up -d
