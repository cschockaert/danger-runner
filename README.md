# danger-runner
Provide a light docker image based on ruby with danger reviewer tool

https://hub.docker.com/r/cschockaert/docker-npm-maven/

#
## How to use

latest docker image version is 1.2.2

```
docker run --rm -it cschockaert/danger-runner:latest /bin/bash
```


## Example when using gitlab-ci pipelines

in you gitlab-ci.yml:

```
review:danger:
  image: cschockaert/danger-runner:latest
  stage: build
  variables:
      #DANGER_GITLAB_API_TOKEN: "XXXXXXXX" #provided by gitlab secret key
      DANGER_GITLAB_HOST: "git.host.com"
      DANGER_GITLAB_API_BASE_URL: "https://git.host.com/api/v4"
  script:
    - export CI_MERGE_REQUEST_ID=$(curl -s "${DANGER_GITLAB_API_BASE_URL}/projects/${CI_PROJECT_ID}/merge_requests?private_token=${DANGER_GITLAB_API_TOKEN}&state=opened" | jq -r ".[]|select(.sha == \"$CI_COMMIT_SHA\")|.iid")
    - echo $CI_MERGE_REQUEST_ID
    - danger --fail-on-errors=true --verbose
```
