## A quick how-to of how I would approach observing Apache using Prometheus and Grafana

### kube-prometheus-stack setup
In case of no previous kube stack setup, I would install the kube-prometheus-stack helm chart (prometheus && grafana && alertmanager).

In this case, we need to configure the `values.yaml` file.

Install can be done with helm cli or with a GitOps tool such as argoCD (What I used in previous companies). In a professional setting, I would also mirror the chart in internal CR before installing, this can be done manually or through a git-repo CI.

```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/prometheus -f custom-values-env.yaml
```
**Warning:** Values need to be customized per environment (example configs: Grafana URL, scrape job which is Apache in our case).

### Apache Prometheus Metrics Exporter
Configure, build, and install the appropriate Apache metrics exporter and configure it to listen to our Apache instance: [Apache Exporter GitHub Repository](https://github.com/Lusitaniae/apache_exporter).

### Setup the Grafana Dashboard
I would opt for an out-of-the-box Apache Grafana dashboard that is based on the previous exporter example: [Apache HTTP Mixin GitHub Repository](https://github.com/grafana/jsonnet-libs/tree/master/apache-http-mixin). This dashboard already has useful insights but can also be customized based on metrics/business case.

### Setup Alerts if Necessary
Add to the Apache manifests the relevant Prometheus rules for our use-case: [Apache HTTP Mixin Alerts GitHub Repository](https://github.com/grafana/jsonnet-libs/blob/master/apache-http-mixin/alerts/alerts.libsonnet). We can of course add/delete/silence alerts based on our use-case.
