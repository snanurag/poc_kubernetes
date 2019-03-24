# To create cluster
gcloud container clusters create example-cluster --zone us-east1-b --node-locations us-east1-b --num-nodes 2 --enable-autoscaling --min-nodes 2 --max-nodes 4
