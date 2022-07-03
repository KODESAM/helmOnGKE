
Welcome to Cloud Shell! Type "help" to get started.
Your Cloud Platform project in this session is set to wide-retina-346520.
Use “gcloud config set project [PROJECT_ID]” to change to a different project.
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project wide-retina-346520
Fetching cluster endpoint and auth data.
kubeconfig entry generated for cluster-1.
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ kubectl get nodes
W0703 07:52:57.912241     528 gcp.go:120] WARNING: the gcp auth plugin is deprecated in v1.22+, unavailable in v1.25+; use gcloud instead.
To learn more, consult https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
NAME                                       STATUS   ROLES    AGE     VERSION
gke-cluster-1-default-pool-11a3958a-cjk0   Ready    <none>   2m28s   v1.22.8-gke.202
gke-cluster-1-default-pool-11a3958a-fc80   Ready    <none>   2m28s   v1.22.8-gke.202
gke-cluster-1-default-pool-11a3958a-klkm   Ready    <none>   2m28s   v1.22.8-gke.202
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ source <(kubectl completion bash)
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ echo "source <(kubectl completion bash)" >> ~/.bashrc
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ helm repo add nextcloud https://nextcloud.github.io/helm/
"nextcloud" has been added to your repositories
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ helm install my-release nextcloud/nextcloud
NAME: my-release
LAST DEPLOYED: Sun Jul  3 07:57:53 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
#######################################################################################################
## WARNING: You did not provide an external database host in your 'helm install' call                ##
## Running Nextcloud with the integrated sqlite database is not recommended for production instances ##
#######################################################################################################

For better performance etc. you have to configure nextcloud with a resolvable database
host. To configure nextcloud to use and external database host:


1. Complete your nextcloud deployment by running:

  export APP_HOST=127.0.0.1
  export APP_PASSWORD=$(kubectl get secret --namespace default my-release-nextcloud -o jsonpath="{.data.nextcloud-password}" | base64 --decode)

  ## PLEASE UPDATE THE EXTERNAL DATABASE CONNECTION PARAMETERS IN THE FOLLOWING COMMAND AS NEEDED ##

  helm upgrade my-release nextcloud/nextcloud \
    --set nextcloud.password=$APP_PASSWORD,nextcloud.host=$APP_HOST,service.type=ClusterIP,mariadb.enabled=false,externalDatabase.user=nextcloud,externalDatabase.database=nextcloud,externalDatabase.host=YOUR_EXTERNAL_DATABASE_HOST
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ export APP_HOST=127.0.0.1
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ export APP_PASSWORD=$(kubectl get secret --namespace default my-release-nextcloud -o jsonpath="{.data.nextcloud-password}" | base64 --decode)
W0703 07:58:28.956071     589 gcp.go:120] WARNING: the gcp auth plugin is deprecated in v1.22+, unavailable in v1.25+; use gcloud instead.
To learn more, consult https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ elm upgrade my-release nextcloud/nextcloud \
    --set nextcloud.password=$APP_PASSWORD,nextcloud.host=$APP_HOST,service.type=ClusterIP,mariadb.enabled=false,externalDatabase.user=nextcloud,externalDatabase.database=nextcloud,externalDatabase.host=YOUR_EXTERNAL_DATABASE_HOST
-bash: elm: command not found
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ helm upgrade my-release nextcloud/nextcloud \
    --set nextcloud.password=$APP_PASSWORD,nextcloud.host=$APP_HOST,service.type=ClusterIP,mariadb.enabled=false,externalDatabase.user=nextcloud,externalDatabase.database=nextcloud,externalDatabase.host=YOUR_EXTERNAL_DATABASE_HOST
Release "my-release" has been upgraded. Happy Helming!
NAME: my-release
LAST DEPLOYED: Sun Jul  3 07:58:59 2022
NAMESPACE: default
STATUS: deployed
REVISION: 2
TEST SUITE: None
NOTES:
1. Get the nextcloud URL by running:

  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=nextcloud" -o jsonpath="{.items[0].metadata.name}")
  echo http://127.0.0.1:8080/
  kubectl port-forward $POD_NAME 8080:80

2. Get your nextcloud login credentials by running:

  echo User:     admin
  echo Password: $(kubectl get secret --namespace default my-release-nextcloud -o jsonpath="{.data.nextcloud-password}" | base64 --decode)
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ echo http://127.0.0.1:8080/
http://127.0.0.1:8080/
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=nextcloud" -o jsonpath="{.items[0].metadata.name}")
W0703 07:59:50.227458     614 gcp.go:120] WARNING: the gcp auth plugin is deprecated in v1.22+, unavailable in v1.25+; use gcloud instead.
To learn more, consult https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ echo http://127.0.0.1:8080/
http://127.0.0.1:8080/
s_aamir_mail@cloudshell:~ (wide-retina-346520)$ kubectl port-forward $POD_NAME 8080:80
W0703 08:00:07.210473     624 gcp.go:120] WARNING: the gcp auth plugin is deprecated in v1.22+, unavailable in v1.25+; use gcloud instead.
To learn more, consult https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
Forwarding from 127.0.0.1:8080 -> 80
Handling connection for 8080
Handling connection for 8080

