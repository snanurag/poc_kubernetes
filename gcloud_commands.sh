# To create cluster
gcloud container clusters create cluster-1 --zone us-east1-b --node-locations us-east1-b --num-nodes 2 --enable-autoscaling --min-nodes 2 --max-nodes 4

# To configure current kubeconfig to the cluster
gcloud container clusters get-credentials cluster-1 --zone us-east1-b --project browsing-analytics-229818
