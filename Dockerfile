FROM prom/prometheus:v2.54.1

USER root
RUN mkdir -p /data/prometheus && chown -R 1000660000:1000660000 /data/prometheus
COPY prometheus.yml /etc/prometheus/prometheus.yml

USER 1000660000
CMD ["--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/data/prometheus"]

