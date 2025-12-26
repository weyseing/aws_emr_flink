USE CATALOG glue_catalog;
USE glue_db;

CREATE TABLE IF NOT EXISTS sink_table (
  id INT,
  product STRING,
  amount INT,
  buyer_id INT,
  create_date STRING,
  update_date STRING,
  PRIMARY KEY (id) NOT ENFORCED
) WITH (
  'format-version' = '2',
  'write.upsert.enabled' = 'true'
);