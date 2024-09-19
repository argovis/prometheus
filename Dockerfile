FROM prom/prometheus:v2.54.1 as base
USER root
RUN mkdir -p /data/prometheus && chown -R 1000660000:1000660000 /data/prometheus

FROM base as core
COPY prometheus.core.yml /etc/prometheus/prometheus.yml
USER 1000660000
CMD ["--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/data/prometheus"]

FROM base as drifters
COPY prometheus.drifters.yml /etc/prometheus/prometheus.yml
USER 1000660000
CMD ["--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/data/prometheus"]
