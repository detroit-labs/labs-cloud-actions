Updates the GKE deployment to match the version of the source control that this job is run in. For example if you are running this job on a branch with commit hash `a83jdse`, this 
job will look for an image with that tag and deploy it to GKE. Depending on what application you are deploying please use the appropriate build and push action from this repo.

## Including this action in your workflow

To use a custom action from this repo in your project's workflow please include the following lines of code as a step to the `jobs` section:

```yaml
- name: Updates the GKE deployment to the current version of the source code.
    uses: detroit-labs/labs-cloud-actions/update-gke-deployment@main
    with:
      gcloud-service-auth: <Google Cloud credentials file stored as a secret>
      project-id: <Google Cloud project ID>
      deployment-name: <Name of the Google Cloud deployment>
      deployment-environment: <The environment being deployed to. For example - Production>
      cluster-name: <Name of the Kubernetes cluster>
      deployment-region: <The region being deployed to>
      deployment-zone: <The zone within the region being deployed to>
      deployment-namespace: <Name of the namespace>
```