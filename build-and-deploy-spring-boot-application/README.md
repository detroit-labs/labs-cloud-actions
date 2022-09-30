This action generates a single page HTML from your project's specific markdown files and pushes that to Google Cloud Storage.

## Including this action in your workflow

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