This action packages and pushes a Node / React app to Google Container Registry. In order to update the running deployment to the latest image, please use the
[update GKE deployment](../update-gke-deployment/action.yaml) action.

## Setting up your Node / React Application

This action by default uses the `build` command from your `package.json` scripts section, if you want to leverage a different build command or customer Dockerfile look at the action customizations section below.

### Node Version

This action allows you to specify the node version you want by providing a `.nvmrc` file in the root of your projects directory.

### Runtime Environment Variables

The default Docker container packaged with this action allows you to provide runtime environment variables for your application. This generates an `env.js` file in your `/public` folder that can be leveraged to pull runtime variables from Javascript code as shown below. The variables are defined within the `DLGlobals` object.  Eg:

```js
const DLGLobals = {};
DLGlobals.REACT_APP_MY_VAR = "Bobblahbah";
```

In the `<head>` tag of you `index.hml` file within the `/public` diretory, add a src link to the `env.js` file.  Eg:

```html
<head>
  <meta name="description" content="My App" />
  <meta ... />
  <link ... />

  <script src="/env.js" type="text/javascript"></script>
</head>
```

## Including this action in your workflow

To use this action in your project's workflow please include the following lines of code as a step to the `jobs` section:

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-node-application@main
  with:
    gcloud-service-auth: <Google Cloud credentials file stored as a secret>
    project-id: <Google Cloud project ID>
    deployment-name: <Name of the Google Cloud deployment>      
```

## Action Customizations

If you do not want to use `npm run build` to build your application you can override that command with the following action option.

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-node-application@main
  with:
    build-command: 'npm run build-deployment'  
```

If you do not want to use the provided Dockerfile with runtime variable support you can provide a custom Docker file with the following action option.

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-node-application@main
  with:
    docker-file-path: 'MyCustomDockerfile'
```

If you do not want to use the provided Nginx config you can provide a custom config file with the following action option.

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-node-application@main
  with:
    nginx-config-path: './config/nginx.conf'
```
