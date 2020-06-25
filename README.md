# sonarqube plugin

## Description

Execute Sonarqube scanner

## Inputs

- `SONAR_HOST_URL` (required): Sonarqube host url, ex: <http://ip:port>
- `SONAR_PROJECT_KEY` (required): Sonarqube project key
- `SONAR_TOKEN_SECRET` (required): a secret created from admin -> secret, that store token from Sonarqube

## For Maven project

```yml
envs:
  FLOWCI_GIT_URL: "your_git_project_url"
  FLOWCI_GIT_BRANCH: "master"

steps:
  - name: sonarqube check
    docker:
      image: maven:latest
    envs:
      SONAR_HOST_URL: "http://localhost:9000"
      SONAR_PROJECT_KEY: "your_project_key"
      SONAR_TOKEN_SECRET: "secret_name_created_from_ci_admin"
    plugin: "sonarqube"
```

## For Gradle project

> Config sonarqube plugin to `build.gradle`
>
> ```groovy
> plugins {
>    id "org.sonarqube" version "2.7"
>}
>```


```yml
envs:
  FLOWCI_GIT_URL: "your_git_project_url"
  FLOWCI_GIT_BRANCH: "master"
  FLOWCI_GIT_REPO: "project_name"

steps:
  - name: sonarqube check
    docker:
      image: gradle:latest
    envs:
      SONAR_HOST_URL: "http://localhost:9000"
      SONAR_PROJECT_KEY: "your_project_key"
      SONAR_TOKEN_SECRET: "secret_name_created_from_ci_admin"
    plugin: "sonarqube"
```

## For other project (JS, TS, Go, Python, PHP..)

```yml
envs:
  FLOWCI_GIT_URL: "your_git_project_url"
  FLOWCI_GIT_BRANCH: "master"
  FLOWCI_GIT_REPO: "project_name"

steps:
  - name: sonarqube check
    docker:
      image: sonarsource/sonar-scanner-cli:latest
    envs:
      SONAR_HOST_URL: "http://localhost:9000"
      SONAR_PROJECT_KEY: "your_project_key"
      SONAR_TOKEN_SECRET: "secret_name_created_from_ci_admin"
    plugin: "sonarqube"
```