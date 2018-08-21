connection: "rdqa-int_edgerelease6i155trunk"

# include all the views
include: "*.view"

datagroup: rdqa_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;; trigger alert if there is a result & different from last run
  max_cache_age: "1 hour"
}

persist_with: rdqa_default_datagroup

explore: order_header  {
  join: order_line  {
    type: inner
    relationship: one_to_many
    sql_on: ${order_header.order_header_id} = ${order_line.order_header_id} ;;
  }

  join: catalog {
    type: inner
    relationship: one_to_one
    sql_on: ${order_line.catalog_id} = ${catalog.catalog_id} ;;
  }

  join: catalog_type {
    type: inner
    relationship: one_to_one
    sql_on: ${catalog.catalog_type_id} = ${catalog_type.catalog_type_id} ;;
  }

  join: order_type {
    type: inner
    relationship: one_to_one
    sql_on: ${order_header.order_type_id} = ${order_type.order_type_id} ;;
  }

  join: vw_order_total {
    type: inner
    relationship: one_to_one
    sql_on: ${order_header.order_header_id} = ${vw_order_total.order_header_id} ;;
  }

  join: vw_order_status {
    type: inner
    relationship: one_to_one
    sql_on: ${order_header.order_header_id} = ${vw_order_status.order_header_id} ;;
  }

  join: order_address{
    type:  inner
    relationship: one_to_one
    sql_on:  ${order_header.bill_order_address_id} = ${order_address.order_address_id} ;;
  }

  join: countries{
    type:  inner
    relationship: one_to_one
    sql_on:  ${order_address.country_id} = ${countries.country_id} ;;
  }

  join: state_prov{
    type:  inner
    relationship: one_to_one
    sql_on: ${order_address.st_pr_id} = ${state_prov.st_pr_id} ;;
  }

  join: members {
    type:  inner
    relationship: one_to_one
    sql_on:  ${order_header.member_id} = ${members.member_id} ;;
  }

  join: order_sources {
    type: inner
    relationship: one_to_one
    sql_on: ${order_header.order_source_id} = ${order_sources.order_source_id} ;;
  }
}


explore: inventory {
  join: inventory_provider_xref {
    type: inner
    relationship: one_to_many
    sql_on: ${inventory.inventory_id} = ${inventory_provider_xref.inventory_id} ;;
  }

  join: providers {
    type: inner
    relationship: one_to_many
    sql_on: ${inventory_provider_xref.provider_id} = ${providers.provider_id} ;;
  }

  join: sku_type{
    type: inner
    relationship: one_to_one
    sql_on: ${inventory.sku_type_id} = ${sku_type.sku_type_id} ;;
  }

  join: status{
    type: inner
    relationship: one_to_one
    sql_on: ${inventory.status_id} = ${status.status_id} ;;
  }

  join: users{
    type: left_outer
    relationship: one_to_one
    sql_on: ${inventory.custodian_id} = ${users.user_id} ;;
  }
}
