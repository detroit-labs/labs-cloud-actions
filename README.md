# labs-cloud-actions

Repository that contains all the GitHub actions needed to package Labs Cloud offerings. These actions should be used in conjunction with the [LabsCloud Helm Charts](https://github.com/detroit-labs/labs-cloud-helm-repo) as the naming convention for GKE resources match up.

# Supported Actions

- [Building and Publishing Documentation](publish-documentation/README.md)
- [Packaging and Pushing a Spring Boot App](build-and-push-spring-boot-application/README.md)
- [Packaging and Pushing a Node/React App](build-and-push-node-application/README.md)
- [Packaging and Pushing a Swagger Spec](build-and-push-swagger-application/README.md)
- [Updating GKE Deployment](update-gke-deployment/README.md)
 
# Adding a new GitHub action

To add a new action to this repo follow the following steps:

- Make a new directory with the name of action.
- Create an `action.yaml` file in that directory and specify a name, description, inputs and steps to run. An example can be found [here](publish-documentation/action.yaml)
- If the new action requires script files, make sure to add them to a `action-scripts` directory inside your actions specific directory.
- Provide a README in your action directory describing your action and what customization options it allows.

# Contributing To Documentation
As a workaround to ensure that links work in both GitHub and the generated single page documentation, you'll need to add a specifically formatted top level heading to every markdown file.

If you are adding a new markdown file, just follow this pattern: add `# parent-folder-name Markdown-File-Name` as the top heading of the file and if you are linking to that file, please use relative path only or full path from repo root (i.e. do not use `../`).

Examples:

| Top Heading format                                                            | Link from repo level README                              |
|-------------------------------------------------------------------------------|----------------------------------------------------------|
| `/authentication-jwt/README.md -> # authentication-jwt README`                | `[This can be anything](./authentication-jwt/README.md)` |
| `/docs/spring-boot-documentation/csrf.md -> # spring-boot-documentation csrf` | `[Test link](./docs/spring-boot-documentation/csrf.md)`  |
