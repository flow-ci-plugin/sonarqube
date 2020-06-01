# sonarqube plugin

## For Maven project

```yml
envs:
  FLOWCI_GIT_URL: "your_git_project_url"
  FLOWCI_GIT_BRANCH: "master"
  FLOWCI_GIT_REPO: "project_name"

steps:
  - name: sonarqube check
    docker:
      image: maven:latest
    envs:
      SONAR_HOST_URL: "localhost:9000"
      SONAR_PROJECT_KEY: "your_project_key"
      SONAR_TOKEN_SECRET: "your_token" # ex: 263c571e392ce0df5235ca47b326537f1f2a42d4
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
      SONAR_HOST_URL: "localhost:9000"
      SONAR_PROJECT_KEY: "your_project_key"
      SONAR_TOKEN_SECRET: "your_token" # ex: 263c571e392ce0df5235ca47b326537f1f2a42d4
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
      SONAR_HOST_URL: "localhost:9000"
      SONAR_PROJECT_KEY: "your_project_key"
      SONAR_TOKEN_SECRET: "your_token" # ex: 263c571e392ce0df5235ca47b326537f1f2a42d4
    plugin: "sonarqube"
```