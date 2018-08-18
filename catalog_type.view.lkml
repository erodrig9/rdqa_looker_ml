view: catalog_type {
  sql_table_name: edgeMaster.dbo.CatalogType ;;

  dimension: catalog_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.CatalogTypeId ;;
  }

  dimension: catalog_type_code {
    type: string
    sql: ${TABLE}.CatalogTypeCode ;;
  }

  dimension: catalog_type_name {
    type: string
    sql: ${TABLE}.CatalogTypeName ;;
  }

  dimension_group: create {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CreateDate ;;
  }

  dimension: sort_order {
    type: string
    sql: ${TABLE}.SortOrder ;;
  }

  measure: count {
    type: count
    drill_fields: [catalog_type_id, catalog_type_name]
  }
}
