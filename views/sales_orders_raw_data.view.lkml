view: sales_orders_raw_data {
  sql_table_name: `POC_CUSTOMER_SEGMENTATION.SALES_ORDERS_RAW_DATA`
    ;;

  dimension_group: creation_date_erdat {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CreationDate_ERDAT ;;
  }

  dimension: creation_time_erzet {
    type: string
    sql: ${TABLE}.CreationTime_ERZET ;;
  }

  dimension: currency_waerk {
    type: string
    sql: ${TABLE}.Currency_WAERK ;;
  }

  dimension: distribution_channel_vtweg {
    type: string
    sql: ${TABLE}.DistributionChannel_VTWEG ;;
  }

  dimension: item_posnr {
    type: string
    sql: ${TABLE}.Item_POSNR ;;
  }

  dimension: material_number_matnr {
    type: string
    sql: ${TABLE}.MaterialNumber_MATNR ;;
  }

  dimension: net_price_netwr {
    type: number
    sql: ${TABLE}.NetPrice_NETWR ;;
  }

  dimension: net_weight_of_item_ntgew {
    type: number
    sql: ${TABLE}.NetWeightOfItem_NTGEW ;;
  }

  dimension: sales_document_vbeln {
    type: string
    sql: ${TABLE}.SalesDocument_VBELN ;;
  }

  dimension: sold_to_party_header_kunnr {
    type: string
    sql: ${TABLE}.SoldToPartyHeader_KUNNR ;;
  }

  dimension: sold_to_party_header_name_kunnr {
    type: string
    sql: ${TABLE}.SoldToPartyHeaderName_KUNNR ;;
  }

  dimension: weight_unit_gewei {
    type: string
    sql: ${TABLE}.WeightUnit_GEWEI ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
