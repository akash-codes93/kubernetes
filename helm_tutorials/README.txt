# create chart
- helm create mychart


# install chart
- helm install chartname ./mychart

# install chart from repo
-  helm install install-upgrade-rbkl mychartmuseumrepo/upgrade-rlbk

# uninstall helm chart
- helm uninstall chartname [same as helm delete]

# helm lint [to verify if the charts are ok]
 - helm lint hooktest/


# list all the charts
- helm ls


# generates manifest [kubernetes resources used] of a given release
- helm get manifest helm-configmap

# dry run
- helm install --debug --dry-run chartname ./testchart


# setting value at runtime
- helm install --debug --dry-run --set costCode=CD34566 chartname ./testchart

# setting two values at runtime
--set costCode=CD34566 --set contact="1230-12312-12"


# helm predefined function:
- quote
- upper
-- use sprig function documentation

# pipeline function
 - value | upper | quote

# default value
default "2348-234-234"

# if else
{{- if eq .Values.infra.region "us-e" }}ha: true {{end}}

# {{-  <-- this minus symbol remove blank line}}

# for loop
LangUsed: |-
    {{- range .Values.LangUsed }}
    - {{ . | title | quote }}
    {{- end }}   

NOTES.txt will pe printed at the end of chart release.

# to list all the repo added
- helm repo list

# to add the repo
- helm repo add mychartmuseumrepo http://0.0.0.0:8080

# to search a chart inside repos added
- helm search repo nginx
- helm search repo repo_name [shows only latest version of chart]
- helm search repo repo_name [to list all version of chart]

# creating package from charts
- helm package repotest  [this will create a tgz file]

# saving charts to this repo
- curl --data-binary "@repotest-0.1.0.tgz" 0.0.0.0:8080/api/charts

# pushing directly 
- helm push chart_name repo_name

# update the repo chart list
- helm repo update

# to genrate the index file [use when using git as helm repo] 
- helm repo index .

# add github as chart repo
helm repo add --username <> --password <> <repo_name> '<url>'
Eg.
helm repo add --username <> --password <> git_helm_repo 'https://raw.githubusercontent.com/akash-codes93/kubernetes/master/helm_tutorials/helm_git_repo/'

# upgrade the deployment
- helm upgrade <deployment_name> <location_of_chart>
- helm upgrade install-upgrade-rbkl mychartmuseumrepo/upgrade-rlbk
[will only apply delta]


# to find history of the deployments
- helm install <deployment_name>

# rollback
- helm rollback <deployment_name> 1

# adding dependencies
dependencies:
  - name: mariadb
    version: 11.x.x
    repository: https://charts.bitnami.com/bitnami

# building dependencies
- helm dependency build ./dependencytest


# less weightage will be executed first


# get notes of a deployment
- helm get notes hooktestjob
- helm get values hooktestjob