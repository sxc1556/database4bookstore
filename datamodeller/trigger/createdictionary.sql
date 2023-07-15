SELECT a.TABLE_NAME "table",
a.COLUMN_NAME "column",
a.COLUMN_TYPE "type",
a.COLUMN_DEFAULT "default_value",
a.IS_NULLABLE "is_mandatory",
a.CHARACTER_SET_NAME "CharsetName",
a.COLLATION_NAME "CollationName",
CONCAT_WS(',',a.COLUMN_COMMENT,a.COLUMN_KEY, a.EXTRA) "column_comments",

b.TABLE_COMMENT "table_comments" 
FROM information_schema.COLUMNS a,information_schema.TABLES b
WHERE a.TABLE_SCHEMA=b.TABLE_SCHEMA
AND a.TABLE_SCHEMA='errorfree'
AND a.TABLE_NAME=b.TABLE_NAME
order by a.ORDINAL_POSITION;
