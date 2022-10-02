# navcog-conv-ear

This repository is an example project to build an EAR file that consists of MapService and ConversationServiceWatson.
It also contains an example script to push the EAR to IBM Code Engine service.

# Build EAR

```
git submodule init
git submodule update
./build.sh
```

- This builds MapService WAR and ConversationServiceWatson WAR and put them in an EAR file
  - The EAR file can be found at `./NavCogConvEAR/target`

# Edit your environment variables

- edito `code-engine.env` file

# Deplogy

```
./deploy.sh
```
