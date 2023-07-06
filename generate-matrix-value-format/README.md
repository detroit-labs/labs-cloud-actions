This action accepts list of elements and converts into an array format useable by github actions matrix strategy.

## Including this action in your workflow

To use this action in your project's workflow, here is an example of how to configure the action in a job and retreive the action's output:

```yaml
generate-matrix-job:
  runs-on: ubuntu-latest
  steps:
    - name: Generate Matrix Value Format
      uses: detroit-labs/labs-cloud-actions/generate-matrix-value-format@main
      id: <step-id>
      with:
        element-list: <List of elements seperated by coma ('us-central1, us-east1, us-west1')>

  outputs:
    elements-matrix: ${{ steps.<step-id>.outputs.formatted_values }}
```

Here is an example of how to configure the Matrix Job using the output of this action

```yaml
the-matrix-job:
  runs-on: ubuntu-latest
  needs: generate-matrix-job
  strategy:
    matrix:
      regions: ${{ fromJSON(needs.generate-matrix-job.outputs.elements-matrix) }}
  steps:
    - name: Checkout Source Code
      run: echo ${{ matrix.regions }}
```