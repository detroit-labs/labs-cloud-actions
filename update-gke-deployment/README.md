Updates the GKE deployment to match the version of the source control that this job is run in. For example if you are running this job on a branch with commit hash `a83jdse`, this 
job will look for an image with that tag and deploy it to GKE. Depending on what application you are deploying please use the appropriate build and push action from this repo.

## Including this action in your workflow

To use a custom action from this repo in your project's workflow please at least include the following lines of code as a step to the `jobs` section:

```yaml
- name: Updates the GKE deployment to the current version of the source code.
  uses: detroit-labs/labs-cloud-actions/update-gke-deployment@main
  with:
    gcloud-service-auth: <Google Cloud credentials file stored as a secret>
    project-id: <Google Cloud project ID>
    cluster-name: <Name of the Kubernetes cluster>
    deployment-name: <Name of the Google Cloud deployment>
    deployment-environment: <The environment being deployed to. For example - Production>
    deployment-location: <The region being deployed to if this is a regional cluster or the zone if this is a single zone cluster>
```

## Action Customizations

If you do not want to use the `default` Kubernetes namespace you can provide a custom namespace with the followin action option.

```yaml
- name: Updates the GKE deployment to the current version of the source code.
  uses: detroit-labs/labs-cloud-actions/update-gke-deployment@main
  with:
    deployment-namespace: <The k8s namespace your deployment is in>
```

If your application takes a long time to complete its rollout you can adjust teh amount of time the build will wait before marking it as a failure. This is 10 minutes by default.

```yaml
- name: Updates the GKE deployment to the current version of the source code.
  uses: detroit-labs/labs-cloud-actions/update-gke-deployment@main
  with:
    deployment-rollout-timeout: 15m
```
