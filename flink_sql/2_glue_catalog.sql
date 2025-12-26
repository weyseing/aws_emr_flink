CREATE CATALOG glue_catalog WITH (
    'type'='iceberg',
    'catalog-impl'='org.apache.iceberg.aws.glue.GlueCatalog',
    'warehouse'='s3://poc-iceberg-20251123/iceberg-warehouse/',
    'io-impl'='org.apache.iceberg.aws.s3.S3FileIO'
);

