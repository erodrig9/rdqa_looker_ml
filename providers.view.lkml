view: providers {
  sql_table_name: dbo.Providers ;;

  dimension: backup_provider_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.BackupProviderId ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.Address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.Address2 ;;
  }

  dimension: address3 {
    type: string
    sql: ${TABLE}.Address3 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: contact {
    type: string
    sql: ${TABLE}.Contact ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.CountryId ;;
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

  dimension: daily_cut_off {
    type: string
    sql: ${TABLE}.DailyCutOff ;;
  }

  dimension: default_inv_acct_methods_id {
    type: number
    sql: ${TABLE}.DefaultInvAcctMethodsId ;;
  }

  dimension: dynamic_record_id {
    type: number
    sql: ${TABLE}.DynamicRecordId ;;
  }

  dimension: electronic_integration {
    type: string
    sql: ${TABLE}.ElectronicIntegration ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.EndDate ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.Fax ;;
  }

  dimension: fed_ex_account {
    type: string
    sql: ${TABLE}.FedExAccount ;;
  }

  dimension: include_in_low_stock {
    type: string
    sql: ${TABLE}.IncludeInLowStock ;;
  }

  dimension: max_orders_released_by_day {
    type: number
    sql: ${TABLE}.MaxOrdersReleasedByDay ;;
  }

  dimension: max_orders_released_in_batch {
    type: number
    sql: ${TABLE}.MaxOrdersReleasedInBatch ;;
  }

  dimension: merchant_default_provider {
    type: string
    sql: ${TABLE}.MerchantDefaultProvider ;;
  }

  dimension: optimization_enabled {
    type: string
    sql: ${TABLE}.OptimizationEnabled ;;
  }

  dimension: optimization_rank {
    type: number
    sql: ${TABLE}.OptimizationRank ;;
  }

  dimension: phone_warehouse1 {
    type: string
    sql: ${TABLE}.PhoneWarehouse1 ;;
  }

  dimension: phone_warehouse2 {
    type: string
    sql: ${TABLE}.PhoneWarehouse2 ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: project_default_provider {
    type: string
    sql: ${TABLE}.ProjectDefaultProvider ;;
  }

  dimension: provider_code {
    type: string
    sql: ${TABLE}.ProviderCode ;;
  }

  dimension: provider_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ProviderId ;;
  }

  dimension: provider_name {
    type: string
    sql: ${TABLE}.ProviderName ;;
  }

  dimension: return_default_provider {
    type: string
    sql: ${TABLE}.ReturnDefaultProvider ;;
  }

  dimension: sing_post_account {
    type: string
    sql: ${TABLE}.SingPostAccount ;;
  }

  dimension: sladays {
    type: number
    sql: ${TABLE}.SLAdays ;;
  }

  dimension: smart_provider {
    type: string
    sql: ${TABLE}.SmartProvider ;;
  }

  dimension: sort_order {
    type: number
    sql: ${TABLE}.SortOrder ;;
  }

  dimension: st_pr_id {
    type: number
    sql: ${TABLE}.StPrId ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.StartDate ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.StatusId ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.TimeZone ;;
  }

  dimension: upsaccount {
    type: string
    sql: ${TABLE}.UPSAccount ;;
  }

  dimension: warehouse_integration_software_id {
    type: number
    sql: ${TABLE}.WarehouseIntegrationSoftwareId ;;
  }

  dimension: warehouse_management_software {
    type: string
    sql: ${TABLE}.WarehouseManagementSoftware ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      backup_provider_id,
      provider_name,
      providers.provider_name,
      providers.backup_provider_id,
      inventory_provider_xref.count,
      providers.count
    ]
  }
}
