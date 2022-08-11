# Secure mlflow
A repo to quickly deploy a mlflow server on heroku with artifact storage on GCP.
Based and inspired off https://github.com/soundsensing/mlflow-easyauth with stripped back
Docker image.

## Instructions

### Create a bucket
Create a GCP bucket for mlflow to store the artifacts.

### Create a service account
Create a service account for mlflow to access that bucket and download the key.

### Deploying to Heroku

Now deploy to heroku! Press the button and fill in the enviroment variables.

- ARTIFACT_URL
The url for your gcp bucket.
- GCLOUD_JSON
The json for your service account.
- MLFLOW_TRACKING_PASSWORD
The password for your server.
- MLFLOW_TRACKING_USERNAME
The username for your server.


[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Usage

### Sleeping
Remember to wake up your dyno before logging experiments to your server.

### Python

python```
mlflow.set_tracking_uri(<your heroku address>)
```
MLFLOW_TRACKING_PASSWORD and MLFLOW_TRACKING_USERNAME need to be set as enviroment variables no way to interact in python.
