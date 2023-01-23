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

  measure: days_between {
    type: number
    sql: ${TABLE}.days_between ;;
  }


  set: detail {
    fields: [user_id, order_id, created_at_time, order_sequence, days_between]
  }
}
