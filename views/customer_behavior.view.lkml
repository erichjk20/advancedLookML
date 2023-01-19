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
    type: count_distinct
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
    label: "Total Lifetime Orders"
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
      WHEN ${lifetime_orders}  > 9 THEN '10+ Orders'
    END;;
  }

  dimension: lifetime_revenue {
    label: "Total Sum of Revenue"
    type: number
    sql:${TABLE}.lifetime_revenue ;;
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


}