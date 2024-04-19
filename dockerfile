FROM openjdk:8-jre-slim

# Install required packages
RUN apt-get update && \
    apt-get install -y wget python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Download and extract Cassandra
ENV CASSANDRA_VERSION=3.11.17
RUN wget https://www.apache.org/dist/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz && \
    tar -xzf apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz && \
    rm apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz

# Set environment variables
ENV CASSANDRA_HOME=/apache-cassandra-${CASSANDRA_VERSION}
ENV PATH=$PATH:$CASSANDRA_HOME/bin

# Copy configuration files
COPY cassandra.yaml $CASSANDRA_HOME/conf/
COPY cassandra-env.sh $CASSANDRA_HOME/conf/
COPY event_data/ /event_data/
COPY images/ /images/
COPY notebooks/ /notebooks/

# Expose Cassandra ports
EXPOSE 7000 7001 7199 9042 9160

# Install Jupyter Notebook
RUN pip3 install jupyter cassandra-driver

# Start Cassandra and Jupyter Notebook
CMD ["sh", "-c", "cassandra -f & jupyter notebook --ip=0.0.0.0 --no-browser --allow-root"]