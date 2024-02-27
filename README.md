# frontend-deploy

## Usage

- `git submodule init`

  > Initializes a Git submodule in your repository. This command sets up the submodule, but it does not fetch the submodule's contents yet.

- `git submodule update --recursive --remote`

  > Updates the submodule to the latest commit in the submodule's repository. The --recursive flag ensures that nested submodules are also updated.

- `git submodule add git@github.com:knull-a/frontend-deploy.git deploy`

  > Adds a new submodule to your Git repository. If you're using HTTPS: `https://github.com/knull-a/frontend-deploy.git`

## docker-compose.yml

Example usage with docker compose

```yml
version: '3.8'

networks:
  default: {}

services:
  front-end:
    container_name: front-end
    build:
      context: .
      dockerfile: deploy/Dockerfile
    ports:
      - 8080:80
```
