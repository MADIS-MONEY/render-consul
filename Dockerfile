# Use Consul official image
FROM consul:1.14.2

# Set Consul data directory
ENV CONSUL_DATA_DIR /consul/data
ENV CONSUL_CONFIG_DIR /consul/config

# Create data directory
RUN mkdir -p ${CONSUL_DATA_DIR} ${CONSUL_CONFIG_DIR}

# Expose default Consul ports
EXPOSE 8500 8501 8600 8300 8301 8302 8400 

# Copy your production config
COPY ./consul-config /consul/config

# Start Consul agent with custom config
ENTRYPOINT ["consul", "agent", "-config-dir", "/consul/config"]
