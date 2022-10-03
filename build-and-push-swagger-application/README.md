This action packages and pushes a Swagger spec to Google Container Registry. In order to update the running deployment to the latest image, please use the
[update GKE deployment](../update-gke-deployment/action.yaml) action.

## Setting up your Swagger spec

This action allows you to specify the location of your Swagger spec inside your repo. By default, it looks for a folder called `swagger` with a root spec file called `spec.yaml` inside.

## Including this action in your workflow

To use this action in your project's workflow please include the following lines of code as a step to the `jobs` section:

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-node-application@main
  with:
    gcloud-service-auth: <Google Cloud credentials file stored as a secret>
    project-id: <Google Cloud project ID>
```

## Action Customizations

If you have spec files in a custom location inside your project you can override the default with the following action option.

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-node-application@main
  with:
    spec-file-path: 'documentation/mySwaggerSpec.yaml'  
```

If you do not want to use the default deployment name of `swagger` you can override it with the following action option.

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-node-application@main
  with:
    deployment-name: 'documentation'
```
