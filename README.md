# navcog-conv-ear

This repository is an example project to build an EAR file that consists of MapService and ConversationServiceWatson.
It also contains an example script to push the EAR to IBM Code Engine service.

# Build

```
git submodule init
git submodule update
./build.sh
```

- This builds MapService WAR and ConversationServiceWatson WAR and put them in an EAR file
  - The EAR file can be found at `./NavCogConvEAR/target`
- The script copies the file into liberty-build directory
- Then build liberty application image

# Local Test

- edit `liberty-build/local-test.env` to test Watson Assistant with your local server

```
cd liberty-build
docker-compose up
```

- open [http://localhost:9080/map/mobile.jsp?id=test](browser to see the map)

# Deplogy

## Preparation
- Firstly, you need to upload your docker image to a public docker registry (like dockerhub) or a private docker registry (on IBM Cloud).
- Tag the docker image named `liberty-build_liberty:latest` for your registry (like cmucal/navcog-conv:latest)
- Push the tagged image to the your registry

## Edit your environment variables

- edit `code-engine.env` file

## Use IBM Cloud CLI to deploy

- You can install ibmcloud on your machine or you can use docker image
  ```
  cd ibm-cloud-cli-build
  docker-compose build --build-arg UID=$UID
  docker-compose run ibmcloud-cli
  ```
- `ibmcloud login`
- select a region (`REGION`)
- if you do not have any resource group, create a group (`RGROUP`)
  - `ibmcloud resource group-create RGROUP`
- `ibmcloud target -g RGROUP`
- if you do not have Code Engine project, create a project (`PROJECT`)
  - `ibmcloud ce project create -n PROJECT`
- `ibmcloud ce project select -n PROJECT`
- ibmcloud ce app create -n navcog-conv -i cmucal/navcog-conv:latest --env-cm navcog-conv.env --min 1 --max 1 --cpu 0.5 -m 1G -p 9080
- if you do not have DB on IBM Cloud, create a DB (`DBNAME`)then bind it to the code engine project
- `ibmcloud ce app bind -n PROJECT --si DBNAME'
