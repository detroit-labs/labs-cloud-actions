# labs-cloud-actions

Repository that contains all the GitHub actions needed to package Labs Cloud offerings.

# Supported Actions

- [Building and Publishing Documentation](publish-documentation/README.md)
- [Packaging and Pushing a Spring Boot App](build-and-push-spring-boot-application/README.md)
- [Packaging and Pushing a Node/React App](build-and-push-node-application/README.md)
- [Updating GKE Deployment](update-gke-deployment/README.md)
 
# Adding a new GitHub action

To add a new action to this repo follow the following steps:

- Make a new directory with the name of action.
- Create an `action.yaml` file in that directory and specify a name, description, inputs and steps to run. An example can be found [here](publish-documentation/action.yaml)
- If the new action requires script files, make sure to add them to a `scripts` directory inside your actions specific directory.

