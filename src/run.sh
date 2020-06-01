#!/usr/bin/env bash

findFile()
{
    for file in ./$1; do
        [[ ! -e $file ]] && continue
        return 0
    done
    return 1
}

sonar_ops="-Dsonar.projectKey=${SONAR_PROJECT_KEY} -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.login=${SONAR_TOKEN} -Dsonar.qualitygate.wait=true"

# detect project type
if findFile "pom.xml"; then
    echo "Maven projecte detected"
    mvn sonar:sonar ${sonar_ops}
elif findFile "build.gradle"; then
    echo "Gradle projecte detected"
    ./gradlew sonarqube ${sonar_ops}
else
    export SONAR_PROJECT_BASE_DIR=${FLOWCI_GIT_REPO}
    sonar-scanner ${sonar_ops}
fi