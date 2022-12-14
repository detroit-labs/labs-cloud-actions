This action packages and pushes a Spring Boot app to Google Container Registry. In order to update the running deployment to the latest image, please use the
[update GKE deployment](../update-gke-deployment/action.yaml) action.

## Setting up your Spring Boot Application

### Java Version

This action allows you to specify the java version you want by providing an option. By default it runs on JDK 17.

### Environment Variables

Before you use this action in your workflow please make sure to evaluate if you need to pass in environment variables to your application. Under the hood, this
custom action uses the `bootBuildImage` command to dockerize your application. In order to pass in environment variables (if any), make sure to update and
add the following block to code to your `build.gradle` file:

```groovy
bootBuildImage {
    environment = [
            "BPE_DELIM_JAVA_TOOL_OPTIONS" : " ",
            "BPE_APPEND_JAVA_TOOL_OPTIONS" : "-Denvironment_variable_key_1=environment_variable_value_1 -Denvironment_variable_key_2=environment_variable_value_2"
    ]
}
```

For a full list of other options to customize your docker image please refer to this [documentation](https://docs.spring.io/spring-boot/docs/current/gradle-plugin/reference/htmlsingle/#build-image.customization).

To set the version of Java, please use the following code block and update the version of Java to the one you would like to use:

```groovy
bootBuildImage {
    targetJavaVersion = JavaVersion.VERSION_17
}
```

## Including this action in your workflow

To use this action in your project's workflow please include the following lines of code as a step to the `jobs` section:

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-spring-boot-application@main
  with:
    gcloud-service-auth: <Google Cloud credentials file stored as a secret>
    project-id: <Google Cloud project ID>
    deployment-name: <Name of the Google Cloud deployment>
```

## Action Customizations

In order to provide a Java version please include the `java-version`:

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-spring-boot-application@main
  with:
    java-version: 18
```

If you have multiple modules in your Gradle project you can specify which module to build and push using `gradle-module-name`:

```yaml
- name: Build and push app to Google Container Registry
  uses: detroit-labs/labs-cloud-actions/build-and-push-spring-boot-application@main
  with:
    gradle-module-name: 'my-application'
```