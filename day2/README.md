# Docker Exercise
Setting up and getting to know Docker

## What is Docker?
Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. It makes sure that an application will run on any other Linux machine regardless of any customized settings that machine might have that could differ from the machine used for writing and testing the code.

## What is the difference between:
* Virtual Machine
* Docker Container
* Docker Image
Virtual machines and containers both look like their own complete system to the outside world. But unlike virtual machines, containers don't need to replicate an entire operating system, but only the individual components they need to operate.

An image is a set of layers as you describe. A container is an instance of an image. If you start an image you have a running container of that image. There can be multiple running containers of the same image


## What is docker-compose:
It's a tool for defining and running multi-container Docker applications. With one command you can create and start all the services from your configuration 

## Results
Created a docker image and a running container for that image. The image was shared to Docker Cloud, tagged and published. A docker-compose file was created and the app built with compose.