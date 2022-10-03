This action packages and deploys a Spring Boot app to Google Kubernetes Engine (GKE).

## Including this action in your workflow

To use a custom action from this repo in your project's workflow please include the following lines of code as a step to the `jobs` section:

```yaml
- name: Build and deploy Spring Boot App to GKE
    uses: detroit-labs/labs-cloud-actions/build-and-push-spring-boot-application@main
    with:
      gcloud-service-auth: <Google Cloud credentials file stored as a secret>
      project-id: <Google Cloud project ID>
      deployment-name: <Name of the Google Cloud deployment>      
      artifactory-username: <Articatory Username to fetch artifacts required by your project>
      artifactory-password: <Articatory Password to fetch artifacts required by your project>
```