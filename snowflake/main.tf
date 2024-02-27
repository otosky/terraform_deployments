resource "snowflake_database" "more_snowpark" {
  name = "MORE_SNOWPARK"
}

resource "snowflake_schema" "more_snowpark__pytest" {
  database = snowflake_database.more_snowpark.name
  name     = "GHA_PYTEST"
  comment  = "For any automated pytest runs related to the more-snowpark lib."

  is_transient        = true
  is_managed          = false
  data_retention_days = 1

  lifecycle {
    prevent_destroy = true
  }
}
