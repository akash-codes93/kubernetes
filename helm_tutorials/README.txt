# create chart
- helm create mychart


# install chart
- helm install chartname ./mychart


# uninstall helm chart
- helm uninstall chartname


# list all the charts
- helm ls


# generates manifest [kubernetes resources used] of a given release
- helm get manifest helm-configmap

# dry run
- helm install --debug --dry-run chartname ./testchart


# setting value at runtime
- helm install --debug --dry-run --set costCode=CD34566 chartname ./testchart


# helm predefined function:
- quote
- upper
-- use sprig function documentation

