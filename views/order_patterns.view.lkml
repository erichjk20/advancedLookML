view: order_patterns {
  derived_table: {
    sql: SELECT
      user_id,
      order_id,
      created_at,
      ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY created_at ASC) AS order_sequence,
      DATE_DIFF(DATE(created_at), DATE(LAG(created_at) OVER (PARTITION BY user_id ORDER BY created_at ASC)), DAY) AS days_between
      FROM `thelook.orders`
       ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week,month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  measure: count_user {
    type: count_distinct
    drill_fields: [detail*]
    sql: ${user_id} ;;
  }

  dimension: order_sequence {
    type: number
    sql: ${TABLE}.order_sequence;;
  }

  dimension: days_between {
    label: "Days Between Orders"
    type: number
    sql: ${TABLE}.days_between ;;
  }

  measure: average_days_between {
    label: "Average Days Between Orders"
    type: average
    sql: ${days_between} ;;
  }

  dimension: first_purchase {
    label: "Customer First Purchase"
    description: "Is this the first time customer has placed an order?"
    type: yesno
    sql: ${order_sequence} = 1 ;;
  }

  measure: within_60_days {
    label: "Number of Users Purchased Again Within 60 Days"
    type: count_distinct
    filters: [days_between: "<= 60"]
    sql: ${user_id} ;;
  }

  measure: percentage_within_60 {
    label: "Percentage of Customers Purchased Again Within 60 Days"
    type: number
    value_format_name: percent_2
    sql: ${within_60_days} / NULLIF ${count_user}, 0 ;;

  }

  set: detail {
    fields: [user_id, order_id, created_at_time, order_sequence, days_between]
  }

}
