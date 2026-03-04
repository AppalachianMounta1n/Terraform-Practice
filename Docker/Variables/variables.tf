variable "container_name" {
    description = "Name for the Docker container"
    type = string
    default = "tutorial"
}

variable "docker_host" {
    description = "Host for the Docker container(s)"
    type = string
    default = "npipe:////.//pipe//docker_engine"
}