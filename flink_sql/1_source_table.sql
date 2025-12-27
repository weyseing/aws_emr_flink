USE CATALOG default_catalog;
USE default_database;

CREATE TABLE source_table (
  id INT,
  product STRING,
  amount INT,
  buyer_id INT,
  create_date STRING,
  update_date STRING,
  row_time BIGINT,
  PRIMARY KEY (id) NOT ENFORCED
) WITH (
  'connector' = 'upsert-kafka',
  'topic' = 'stream_order_intake',
  'properties.bootstrap.servers' = '0.tcp.ap.ngrok.io:11150',
  'key.format' = 'json',
  'value.format' = 'json'
);