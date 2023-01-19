# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thelook.order_items`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.


  dimension_group: created {
    type: time
    timeframes: [time, hour, date, week, month, year, hour_of_day, day_of_week, day_of_month, month_num, raw, week_of_year,month_name]
    sql: ${TABLE}.created_at ;;

  }

  dimension_group: delivered {
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
    sql: ${TABLE}.delivered_at ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: revenue_percentile {
    type: percent_of_total
    sql: ${total_sale_price} ;;
  }

  measure: total_sale_price {
    type: sum
    value_format: "[>=1000000]$0,,\"M\";[>=1000]$0,\"K\";$0"
    sql: ${sale_price} ;;
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
  }

  dimension: gross_margin {
    label: "Gross Margin"
    type: number
    value_format_name: usd
    sql: ${sale_price} - ${inventory_items.cost};;
  }

  measure: total_gross_margin {
    label: "Total Gross Margin"
    type: sum
    value_format: "[>=1000000]$0,,\"M\";[>=1000]$0,\"K\";$0"
    sql: ${gross_margin} ;;
  }

  measure: average_gross_margin {
    label: "Average Gross Margin"
    type: average
    value_format_name: usd
    sql: ${gross_margin} ;;
  }

  measure: total_gross_margin_percentage {
    label: "Total Gross Margin Percentage"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_gross_margin}/ nullif(${total_sale_price},0) ;;
  }

  measure: returned_count {
    type: count_distinct
    sql: ${id} ;;
    filters: [status: "Returned"]
  }

  measure: return_rate {
    label: "Return Percentage"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${returned_count} / ${count} ;;
  }

  measure: customer_returned_count {
    label: "Number of Customers Returning"
    type: count_distinct
    sql: ${user_id};;
    filters: [status: "Returned"]
  }

  measure: percentage_users_returning {
    label: "% of Users with Returns"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${customer_returned_count} / ${users.count} ;;
  }

  measure: avg_spend_per_customer {
    label: "Average Spending per Customer"
    type: number
    value_format_name: usd
    sql: 1.0 * ${total_sale_price} / ${users.count};;
  }

  dimension_group: shipped {
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
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: customer_lifetime_orders {
    label: "Customer Life Time Order Groups"
    type: string
    case: {
      when: {
        sql: ${order_count} = 1;;
        label: "1 Order"
      }
      when: {
        sql: ${order_count} = 2;;
        label: "2 Orders"
      }
      when: {
        sql: ${order_count} > 2 AND <= 5;;
        label: "3-5 Orders"
      }
      when: {
        sql: ${order_count} > 5 AND <= 9;;
        label: "5-9 Orders"
      }
      when: {
        sql: ${order_count} >= 10;;
        label: "10+ Orders"
      }
    }
  }

      #WHEN ${order_count} = 1 THEN '1 Order'
      #WHEN ${order_count} = 2 THEN '2 Orders'
      #WHEN ${order_count} > 2 AND <= 5 THEN '3-5 Orders'
      #WHEN ${order_count} > 5 AND <= 9 THEN '6-9 Orders'
      #WHEN ${order_count} => 10 THEN '10+ Orders'
      #END;;


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.last_name,
      users.id,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name,
      orders.order_id
    ]
  }
}
