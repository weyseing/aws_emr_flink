# Create AWS EMR Cluster
- **Name & choose bundle**

![image](./assets/1.PNG)

- **Uniform instance group**

![image](./assets/2.PNG)

- **Manual cluster scaling**

![image](./assets/3.PNG)

- **Create SSH key pair**
    - Save .pem key to `/keys` folder

![image](./assets/4.PNG)

- **Create new service role**

![image](./assets/5.PNG)

- **Create IAM role with IAM policies below**
    - `AmazonS3FullAccess`
    - `AmazonSSMManagedInstanceCore`
    - `AWSGlueConsoleFullAccess`

![image](./assets/6.PNG)

# Download Custom Flink Libs Jar
- **SSH into Primary Node**
    - MUST update **PUBLIC_NODES_DNS** below
```bash
ssh -i ./keys/poc_emr_flink.pem hadoop@<PUBLIC_NODES_DNS>
```

![image](./assets/7.PNG)

- **Download Flink Libs Jar**
```bash
# jars folder
mkdir -p ~/flink_jars/kafka 
mkdir -p ~/flink_jars/iceberg

# download
wget -P ~/flink_jars/kafka/ https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-kafka/3.2.0-1.19/flink-sql-connector-kafka-3.2.0-1.19.jar

wget -P ~/flink_jars/iceberg/ https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-flink-runtime-1.18/1.5.0/iceberg-flink-runtime-1.18-1.5.0.jar
```

# Create Flink Job

- **Start Flink session**
```bash
flink-yarn-session -d \        
    -nm "iceberg_order" \                   # session name      
    -tm 4096 \                              # 4GB RAM per Worker
    -s 2 \                                  # allows 2 parallel tasks per node
    -t /home/hadoop/flink_jars/kafka/ \   
    -t /home/hadoop/flink_jars/iceberg/   
```

- **Check Flink session list**
```bash
yarn application -list
```

- **Reconnect Flink session**
```bash
flink-sql-client.sh embedded -yid <APPLICATION_ID>
```

- **Delete Flink session**
```bash
yarn application -kill <APPLICATION_ID>
```