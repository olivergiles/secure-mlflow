#!/bin/bash -x
DATABASE_URL=${DATABASE_URL//postgres:/postgresql:}

export GOOGLE_APPLICATION_CREDENTIALS=/app/credentials.json

echo ${GOOGLE_APPLICATION_CREDENTIALS_JSON} > ${GOOGLE_APPLICATION_CREDENTIALS}

exec mlflow server --backend-store-uri=$DATABASE_URL --default-artifact-root=$ARTIFACT_URL
