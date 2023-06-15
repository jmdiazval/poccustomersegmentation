view: sales_orders_cluster_data {
  sql_table_name: `POC_CUSTOMER_SEGMENTATION.SALES_ORDERS_CLUSTER_DATA`
    ;;

  dimension: cluster {
    type: string
    sql: ${TABLE}.cluster ;;
  }

  dimension: cluster_distance {
    type: number
    sql: ${TABLE}.cluster_distance ;;
  }

  dimension_group: creation_date {
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
    sql: ${TABLE}.CreationDate ;;
  }

  dimension: creation_time {
    type: string
    sql: ${TABLE}.CreationTime ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.Currency ;;
  }

  dimension: distribution_channel {
    type: string
    sql: ${TABLE}.DistributionChannel ;;
  }

  measure: frequency {
    type: sum
    sql: ${TABLE}.frequency ;;
    html:
    {% if value > 1000000000 %}
    {{ value | divided_by: 1000000000 | round:0}}B days
    {% elsif value >= 1000000 and value < 1000000000 %}
    {{ value | divided_by: 1000000 | round:0}}M days
    {% elsif value >= 1000 and value < 1000000 %}
    {{ value | divided_by: 1000 | round:0}}K days
    {% elsif value >= 0 and value < 1000 %}
    {{ value | round:0}} days
    {% endif %}
    ;;
  }

  dimension: item_id {
    type: string
    sql: ${TABLE}.Item_ID ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: material_number {
    type: string
    sql: ${TABLE}.MaterialNumber ;;
  }

  measure: monetary_value {
    type: sum
    sql: ${TABLE}.monetary_value ;;
    html:
    {% if value > 1000000000 %}
    {{ value | divided_by: 1000000000 | round:0}}B €
    {% elsif value >= 1000000 and value < 1000000000 %}
    {{ value | divided_by: 1000000 | round:0}}M €
    {% elsif value >= 1000 and value < 1000000 %}
    {{ value | divided_by: 1000 | round:0}}K €
    {% elsif value >= 0 and value < 1000 %}
    {{ value | round:0}} €
    {% endif %}
    ;;
  }

  measure: net_price {
    type: sum
    sql: ${TABLE}.NetPrice ;;
    html:
    {% if value > 1000000000 %}
    {{ value | divided_by: 1000000000 | round:0}}B €
    {% elsif value >= 1000000 and value < 1000000000 %}
    {{ value | divided_by: 1000000 | round:0}}M €
    {% elsif value >= 1000 and value < 1000000 %}
    {{ value | divided_by: 1000 | round:0}}K €
    {% elsif value >= 0 and value < 1000 %}
    {{ value | round:0}} €
    {% endif %}
    ;;
  }

  dimension: net_weight_of_item {
    type: number
    sql: ${TABLE}.NetWeightOfItem ;;
  }

  measure: recency {
    type: sum
    sql: ${TABLE}.recency ;;
    html:
    {% if value > 1000000000 %}
      {{ value | divided_by: 1000000000 | round:0}}B days
    {% elsif value >= 1000000 and value < 1000000000 %}
      {{ value | divided_by: 1000000 | round:0}}M days
    {% elsif value >= 1000 and value < 1000000 %}
      {{ value | divided_by: 1000 | round:0}}K days
    {% elsif value >= 0 and value < 1000 %}
      {{ value | round:0}} days
    {% endif %}
    ;;
  }

  dimension: sales_document_id {
    type: string
    sql: ${TABLE}.SalesDocument_ID ;;
  }

  dimension: sold_to_party_header_id {
    type: string
    sql: ${TABLE}.SoldToPartyHeader_ID ;;
  }

  dimension: sold_to_party_header_name {
    type: string
    sql: ${TABLE}.SoldToPartyHeaderName ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: weight_unit {
    type: string
    sql: ${TABLE}.WeightUnit ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}.CUSTOMER_SEGMENT ;;
  }

  measure: count {
    type: count
    drill_fields: [sold_to_party_header_name]
  }
## custom fields

  measure: monetary_value_avg {
    type: average
    sql: ${TABLE}.monetary_value ;;
    value_format_name:  eur
    html:
    {% if value > 1000000000 %}
    {{ value | divided_by: 1000000000 | round:0}}B €
    {% elsif value >= 1000000 and value < 1000000000 %}
    {{ value | divided_by: 1000000 | round:0}}M €
    {% elsif value >= 1000 and value < 1000000 %}
    {{ value | divided_by: 1000 | round:0}}K €
    {% elsif value >= 0 and value < 1000 %}
    {{ value | round:0}} €
    {% endif %}
    ;;
  }

  measure: net_price_avg {
    type: average
    sql: ${TABLE}.NetPrice ;;
    value_format_name:  eur
    html:
    {% if value > 1000000000 %}
    {{ value | divided_by: 1000000000 | round:0}}B €
    {% elsif value >= 1000000 and value < 1000000000 %}
    {{ value | divided_by: 1000000 | round:0}}M €
    {% elsif value >= 1000 and value < 1000000 %}
    {{ value | divided_by: 1000 | round:0}}K €
    {% elsif value >= 0 and value < 1000 %}
    {{ value | round:0}} €
    {% endif %}
    ;;
  }

  measure: recency_avg {
    type: average
    sql: ${TABLE}.recency ;;
    html:
    {% if value > 1000000000 %}
    {{ value | divided_by: 1000000000 | round:0}}B days
    {% elsif value >= 1000000 and value < 1000000000 %}
    {{ value | divided_by: 1000000 | round:0}}M days
    {% elsif value >= 1000 and value < 1000000 %}
    {{ value | divided_by: 1000 | round:0}}K days
    {% elsif value >= 1.5 and value < 1000 %}
    {{ value | round:0}} days
    {% elsif value >= 0.5 and value < 1.5 %}
    {{ value | round:0}} day
    {% elsif value <= 0.5 %}
    {{ value | round:0}} days
    {% endif %}
    ;;
  }

  measure: frequency_avg {
    type: average
    sql: ${TABLE}.frequency ;;
    html:
    {% if value > 1000000000 %}
    {{ value | divided_by: 1000000000 | round:0}}B days
    {% elsif value >= 1000000 and value < 1000000000 %}
    {{ value | divided_by: 1000000 | round:0}}M days
    {% elsif value >= 1000 and value < 1000000 %}
    {{ value | divided_by: 1000 | round:0}}K days
    {% elsif value >= 1.5 and value < 1000 %}
    {{ value | round:0}} days
    {% elsif value >= 0.5 and value < 1.5 %}
    {{ value | round:0}} day
    {% elsif value <= 0.5 %}
    {{ value | round:0}} days
    {% endif %}
    ;;
  }

  measure: number_of_customers {
    type: count_distinct
    sql: ${TABLE}.SoldToPartyHeaderName ;;
  }

  parameter: filter_dynamic_measure {
    hidden: no
    type:  unquoted
    allowed_value: {
      label: "Sales"
      value: "Sales"
    }
    allowed_value: {
      label: "Recency"
      value: "Recency"
    }
    allowed_value: {
      label: "Frequency"
      value: "Frequency"
    }
    allowed_value: {
      label: "MonetaryValue"
      value: "MonetaryValue"
    }
  }

  measure: dynamic_measure {
    hidden: no
    type: number
    label_from_parameter: filter_dynamic_measure
    sql:
      {% if     filter_dynamic_measure._parameter_value == 'Sales' %}
        ${net_price}
      {% elsif  filter_dynamic_measure._parameter_value == 'Recency' %}
        ${recency_avg}
      {% elsif  filter_dynamic_measure._parameter_value == 'Frequency' %}
        ${frequency_avg}
      {% elsif  filter_dynamic_measure._parameter_value == 'MonetaryValue' %}
        ${monetary_value_avg}
      {% else %}
        NULL
      {% endif %};;
    html:
    {% if value > 1000000000 %}
    {{ value | divided_by: 1000000000 | round:0}}B
    {% elsif value >= 1000000 and value < 1000000000 %}
    {{ value | divided_by: 1000000 | round:0}}M
    {% elsif value >= 1000 and value < 1000000 %}
    {{ value | divided_by: 1000 | round:0}}K
    {% elsif value >= 1.5 and value < 1000 %}
    {{ value | round:0}}
    {% elsif value >= 0.5 and value < 1.5 %}
    {{ value | round:0}}
    {% elsif value <= 0.5 %}
    {{ value | round:0}}
    {% endif %}
    ;;
  }

}
