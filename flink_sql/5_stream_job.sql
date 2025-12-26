SET 'execution.checkpointing.interval' = '10s';
SET 'pipeline.name' = 'stream_job';

INSERT INTO glue_catalog.glue_db.sink_table
SELECT id, product, amount, buyer_id, create_date, update_date
FROM default_catalog.default_database.source_table;

RESET 'pipeline.name';