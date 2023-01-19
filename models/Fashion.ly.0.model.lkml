connection: "looker-private-demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
#include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: order_items {
  label: "(1) Summary"
  join: users {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${users.id} = ${order_items.user_id} ;;
   }

  join: inventory_items {
    type: left_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }

  join: distribution_centers {
    type: left_outer
    relationship: one_to_many
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id};;
  }

  join: products {
    type: left_outer
    relationship: one_to_many
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }

  join: customer_behavior {
    type: left_outer
    relationship: many_to_many
    sql_on: ${customer_behavior.user_id} = ${order_items.user_id} ;;
  }
}
