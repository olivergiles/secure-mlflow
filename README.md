# Secure mlflow
A repo to quickly deploy a mlflow server on heroku with artifact storage on GCP.
Based and inspired off https://github.com/soundsensing/mlflow-easyauth with stripped back
Docker image. **You do not need to clone the repo everything can be done from heroku and gcp.**

![Alt text](/images/mlflow.png?raw=true)

## Instructions

### Create a bucket
Create a GCP bucket for mlflow to store the artifacts(i.e. your models!).

https://cloud.google.com/storage/docs/creating-buckets

### Create a service account
Create a service account for mlflow to access that bucket and download the key.

https://cloud.google.com/iam/docs/service-accounts

In our case we want the service account to just have the permission Storage Object Admin for
our created bucket.

### Deploying to Heroku

Now deploy to heroku! Press the button and fill in the enviroment variables.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/ogiles1999/secure-mlflow)

![Alt text](/images/config.png?raw=true)

- ARTIFACT_URL
The url for your gcp bucket. Which will be used by mlflow to store the artifacts you upload!

![Alt text](/images/gcloud.png?raw=true)

- GCLOUD_JSON
The json for your service account.
- MLFLOW_TRACKING_PASSWORD
The password for your server.
- MLFLOW_TRACKING_USERNAME
The username for your server.

## Usage

### Sleeping
Remember to wake up your dyno before logging experiments to your server.

https://devcenter.heroku.com/articles/free-dyno-hours

This can be solved with a simple requests.get("<your mlflow server url>")

### Python

You just set the uri in the normal way.
```
mlflow.set_tracking_uri(<your heroku address>)
```
But you also need MLFLOW_TRACKING_PASSWORD and MLFLOW_TRACKING_USERNAME to be set as enviroment variables no way to interact in python directly. I recommend adding them to your .env file.
