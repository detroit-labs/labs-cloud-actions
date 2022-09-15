# labs-cloud-actions

Repository that contains all the Github actions needed to package Labs Cloud offerings.

# Using a Github action

To use a custom action from this repo in your project's workflow please include the following lines of code as a step to the `jobs` section:

```yaml
- name: Generate aggregated HTML from specified mark down files and pushes that to a Google Cloud storage bucket
  uses: detroit-labs/labs-cloud-actions/publish-documentation
  with:
    gcloud-service-auth: <Google Cloud credentials file stored as a secret>
    bucket-name: <Name of the Google Storage Bucket>
    markdown-files-path: <List of mark down files to include>
    css-file-path: <Path to CSS file (optional)>
    documentation-page-title: <Title of the generated single page HTML doc>
    documentation-file-storage-name: <Name for the single page HTML that will be used in Google Cloud>
```
 
# Adding a new Github action

To add a new action to this repo follow the following steps:

- Make a new directory with the name of action.
- Create an `action.yaml` file in that directory and specify a name, description, inputs and steps to run. An example can be found [here](publish-documentation/action.yaml)
- If the new action requires script files, make sure to add them to a `scripts` directory inside your actions specific directory.

