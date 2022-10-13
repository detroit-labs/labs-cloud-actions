This action posts a message with Github Workflow's status to a Slack channel. It leverages Workflow Builder in Slack and is meant to be a temporary measure as Github has plans to update their Slack app to report workflow jobs.

# Setting Up Your Slack Workflow
This action utilizes a Slack Workflow with a webhook. This will allow you to set the variables needed to communicate the status of the build and post the message in the desired channel. 

To create the workflow follow the directions found [here](https://slack.com/help/articles/360041352714-Create-more-advanced-workflows-using-webhooks)

You will need to set 4 variables in the Slack workflow:
* `status`: this will be used to report the status of the job
* `workflow`: this will be used to report the name of the Github Action Workflow
* `run_number`: this will be used to report the run number of the Github Action Workflow run
* `url`: this will be used to report the url link to the Github Action Workflow run

Each of the above variables are expected to be `string`.

Add a Step to post a message to the desired channel and design your message using the 4 variables created.

# Link Slack Workflow to Github
For this action to communicate with Slack you must add the webhook url provided by Slack as a secret in your Github repository. 

1. In your repository, click Settings
2. Click Secrets from the left hand bar
3. Click Actions from the expanded list
4. Click New Repository secret 
5. Enter a name for your secret
6. Copy the Slack Webhook from your Workflow and paste it in the Secret text box
7. Click Add secret

You can read more about using Github Secrets [here](https://docs.github.com/en/actions/security-guides/encrypted-secrets)

# Implement Post Build Status Slack Workflow
To use this action you must update the `.yml` file for the workflow you want the status report for. You will need to set the values to the 4 variables from the Setting Up Your Slack Workflow section.

## Define Status
This action is agnostic as to what status means to your workflow. You must determine which job status you want reported.

You can assign `status` the value of the `job.status` of a single job by defining `outputs` for the job and using `run` to set the value at the end of the job.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    outputs: 
         job_status: ${{ steps.gradle.outputs.job_status }}
    steps: 
         - name: first step
         - name: second step
         - name: Set Job Status
           run: echo "::set-output name=job_status::${{job.status}}"
```
You can read more about defining outputs for jobs [here](https://docs.github.com/en/actions/using-jobs/defining-outputs-for-jobs)

## Create Job for Post Build Status Workflow
In your `.yml` file you will need to add a job that will call this action and pass the required values. 

```yaml
send_slack_message:
      name: Slack Message
      needs: build
      uses: detroit-labs/labs-cloud-actions/post-job-status-slack@main
      secrets:
         slack: ${{ secrets.SLACK_WEBHOOK_URL }}
      with:
         status: ${{ needs.build.outputs.job_status }}
         workflow: ${{ github.workflow }}
         run_number: ${{ github.run_number }}
         url: ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}
```

You can read more about reusable workflows [here](https://docs.github.com/en/actions/using-workflows/reusing-workflows#overview)

