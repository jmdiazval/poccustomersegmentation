connection: "poc_customer_segmentation"

# include all the views
include: "/views/**/*.view"

datagroup: poc_customer_segmentation_final_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: poc_customer_segmentation_final_default_datagroup

explore: sales_orders_raw_data {}

explore: sales_orders_cluster_data {}
