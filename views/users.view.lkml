# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thelook.users`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    label: "Age Tier"
    type: tier
    tiers: [0, 16, 26, 36, 51, 66]
    style: integer
    sql: ${age} ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [time, hour, date, week, month, year, hour_of_day, day_of_week, day_of_month, month_num, raw, week_of_year,month_name]
    sql: ${TABLE}.created_at ;;

  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: customer_type  {
    label: "Type of Customer"
    type: string
    sql: CASE
      WHEN ${days_as_customer} <= 90 THEN 'New Customer'
      WHEN ${days_as_customer} > 90 THEN 'Long Term Customer'
     END ;;
  }

  dimension: days_as_customer {
    label: "Days Since Sign Up"
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), ${created_date}, day);;
  }

  dimension: months_as_customer {
    label: "Months Since Sign Up"
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), ${created_date}, month ;;
  }

  measure: average_number_of_days {
    label: "Average Days since Sign Up"
    type: average
    sql: ${days_as_customer} ;;
  }

  measure: average_number_of_months {
    label: "Average Months Since Sign Up"
    type: average
    sql: ${months_as_customer} ;;
  }

  dimension: cohort_by_months {
    label: "Cohort by Months Signed Up"
    type: string
    sql: CASE
      WHEN ${months_as_customer} BETWEEN 0 AND 1 THEN "Less than 1 month"
      WHEN ${months_as_customer} BETWEEN 2 AND 3 THEN "2-3 months"
      WHEN ${months_as_customer} BETWEEN 4 AND 6 THEN "4-6 months"
      WHEN ${months_as_customer} BETWEEN 7 AND 9 THEN "7-9 months"
      WHEN ${months_as_customer} BETWEEN 10 AND 12 THEN "10-12 months"
      ELSE "12+ months";;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      events.count,
      order_items_test2.count,
      order_items_test.count,
      order_items.count,
      order_items_final.count,
      orders.count
    ]
  }
}
