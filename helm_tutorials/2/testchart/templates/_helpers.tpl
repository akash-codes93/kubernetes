{{- define "mychart.systemlables" }}
  labels:
    drive: ssd
    machine: frontdrive
    rack: 4c
    vcard: 8g
    helm.sh/chart: "{{ $.Chart.Name }}-{{ $.Chart.Version }}"  # these values will be blank if you do not pass the root context [global varibales]
    app.kubernetes.io/instance: "{{ $.Release.Name }}"
    app.kubernetes.io/version: "{{ $.Chart.AppVersion }}"
    app.kubernetes.io/managed-by: "{{ $.Release.Service }}"
{{- end }}
{{- define "mychart.version" -}}
app_name: {{ .Chart.Name }}
app_version: "{{ .Chart.Version }}"
{{- end -}}