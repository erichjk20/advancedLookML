view: customer_behavior {
    derived_table: {
      sql: SELECT
          order_items.user_id  AS user_id,
          COUNT(DISTINCT order_items.order_id ) AS lifetime_orders,
          COALESCE(SUM(order_items.sale_price ), 0) AS lifetime_revenue,
              CAST(MIN(order_items.created_at) AS TIMESTAMP) AS first_order,
              CAST(MAX(order_items.created_at) AS TIMESTAMP) AS latest_order
      FROM `looker-private-demo.thelook.order_items`
           AS order_items
      GROUP BY
          user_id
       ;;
    }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [user_id, lifetime_orders, lifetime_revenue, first_order_date, latest_order_date]
  }

  dimension: user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: lifetime_orders {
    label: "Lifetime Orders"
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension: customer_lifetime_orders {
    label: "Customer Lifetime Order Groups"
    type: string
    sql: CASE
      WHEN ${lifetime_orders} = 1 THEN '1 Order'
      WHEN ${lifetime_orders}  = 2 THEN '2 Orders'
      WHEN ${lifetime_orders}  BETWEEN 2 AND 5 THEN '3-5 Orders'
      WHEN ${lifetime_orders}  BETWEEN 5 AND 9 THEN '6-9 Orders'
      WHEN ${lifetime_orders}  >= 10 THEN (5) '10+ Orders'
    END;;
  }

  dimension: lifetime_revenue {
    label: "Lifetime Revenue"
    type: number
    sql:${TABLE}.lifetime_revenue ;;
  }

  dimension: lifetime_revenue_group {
    label: "Lifetime Revenue Groups"
    type: tier
    tiers: [0,5,20,50,100,500,1000]
    style: integer
    value_format_name: usd
    sql: ${lifetime_revenue} ;;
  }

  dimension_group: first_order {
    label: "First Order Date"
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.first_order ;;
  }

  dimension_group: latest_order {
    label: "Latest Order Date"
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.latest_order ;;
  }

  measure: total_lifetime_orders {
    label: "Total Lifetime Orders"
    type: sum
    sql: ${lifetime_orders} ;;
  }

  measure: average_lifetime_orders {
    label: "Average Lifetime Orders"
    type: average
    sql: ${lifetime_orders} ;;
  }

  measure: total_lifetime_revenue {
    label: "Total Lifetime Revenue"
    type: sum
    value_format_name: usd_0
    sql: ${lifetime_revenue} ;;
  }

  measure: average_lifetime_revenue {
    label: "Average Lifetime Revene"
    type: average
    value_format_name: usd_0
    sql: ${lifetime_revenue} ;;
  }

  dimension: is_active {
    label: "Is Customer Active"
    description: "Has the customer purchased from the website within the last 90 days"
    type: yesno
    sql: ${days_since_latest_order} <= 90  ;;
  }

  dimension: days_since_latest_order {
    label: "Days Since Latest Order"
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), ${latest_order_date}, day;;
  }

  measure: average_days_since_latest_order {
    label: "Average Days Since Latest Order"
    type: average
    sql: ${days_since_latest_order} ;;
  }

  dimension: repeate_customer {
    label: "Repeat Customer"
    type: yesno
    sql: ${lifetime_orders} >= 2 ;;
  }

  measure: repeat_purchase_rate {
    label: "Repeat Purchase Rate"
    type: number
    value_format_name: percent_2
    sql: ${repeate_customer} / ${lifetime_orders} >=1, 0 ;;
  }

}
