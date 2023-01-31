- dashboard: fashion_ly_summary_dashboard
  title: Fashion.ly Summary Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: kB9bd2VlXz5sUCMGG3ITye
  elements:
  - title: Total Revenue Yesterday
    name: Total Revenue Yesterday
    model: Fashionly
    explore: order_items
    type: single_value
    fields: [order_items.total_gross_margin, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 1 days ago for 1 days
    sorts: [order_items.created_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 1
    col: 9
    width: 4
    height: 4
  - title: Gross Margin %
    name: Gross Margin %
    model: Fashion.ly.0
    explore: order_items
    type: looker_line
    fields: [order_items.total_gross_margin_percentage, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 30 days
    sorts: [order_items.created_date desc]
    limit: 500
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_gross_margin_percentage,
            id: order_items.total_gross_margin_percentage, name: Total Gross Margin
              Percentage}], showLabels: true, showValues: true, maxValue: !!null '',
        minValue: 0, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: false
    y_axis_zoom: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    ordering: none
    show_null_labels: false
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 1
    col: 0
    width: 9
    height: 8
  - title: Total Number of New Users Yesterday
    name: Total Number of New Users Yesterday
    model: Fashion.ly.0
    explore: order_items
    type: single_value
    fields: [users.count, users.created_date]
    fill_fields: [users.created_date]
    filters:
      users.created_date: 7 days ago for 7 days
    sorts: [users.created_date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 5
    col: 9
    width: 4
    height: 4
  - title: Average Spending per Customer
    name: Average Spending per Customer
    model: Fashion.ly.0
    explore: order_items
    type: looker_area
    fields: [order_items.avg_spend_per_customer, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 30 days
    sorts: [order_items.avg_spend_per_customer desc 0]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      order_items.avg_spend_per_customer: "#12B5CB"
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen: {}
    row: 1
    col: 13
    width: 10
    height: 8
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Key Performance Indicators (KPIs)"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 23
    height: 1
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Yearly Trends (YoY)"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 9
    col: 0
    width: 23
    height: 1
  - title: Total Sales by Months YoY
    name: Total Sales by Months YoY
    model: Fashion.ly.0
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.created_year, order_items.created_month_name]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_year, order_items.created_month_name]
    filters:
      order_items.created_date: before 0 days ago
      order_items.created_year: 4 years
    sorts: [order_items.created_year, order_items.total_sale_price desc 0]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types: {}
    discontinuous_nulls: false
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 10
    col: 0
    width: 11
    height: 7
  - title: Revenue and Profit Past 12 months
    name: Revenue and Profit Past 12 months
    model: Fashion.ly.0
    explore: order_items
    type: looker_column
    fields: [order_items.created_month, order_items.total_gross_margin, order_items.total_sale_price]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 12 months
    sorts: [order_items.created_month]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_gross_margin,
            id: order_items.total_gross_margin, name: Total Gross Margin}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 10
    col: 11
    width: 12
    height: 7
  - title: Daily User Addition
    name: Daily User Addition
    model: Fashion.ly.0
    explore: order_items
    type: looker_line
    fields: [users.count, users.created_day_of_month, users.created_month]
    pivots: [users.created_month]
    fill_fields: [users.created_day_of_month, users.created_month]
    filters:
      users.created_month: 2 months
    sorts: [users.created_month, users.created_day_of_month, users.count desc 0]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    series_colors:
      2022-12 - users.count: "#80868B"
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 17
    col: 0
    width: 11
    height: 7
  - title: 'Gross Revenue by Age and Gender '
    name: 'Gross Revenue by Age and Gender '
    model: Fashion.ly.0
    explore: order_items
    type: looker_donut_multiples
    fields: [users.age_tier, order_items.total_gross_margin, users.gender]
    pivots: [users.age_tier]
    fill_fields: [users.age_tier]
    sorts: [users.age_tier, users.gender]
    limit: 500
    query_timezone: America/Los_Angeles
    show_value_labels: true
    font_size: 18
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_pivots: {}
    listen: {}
    row: 24
    col: 16
    width: 7
    height: 7
  - title: Revenue Source Comparison
    name: Revenue Source Comparison
    model: Fashion.ly.0
    explore: order_items
    type: looker_column
    fields: [order_items.avg_spend_per_customer, users.traffic_source]
    pivots: [users.traffic_source]
    filters:
      users.age_tier: ''
      users.gender: ''
    sorts: [users.traffic_source]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    hidden_pivots: {}
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 24
    col: 9
    width: 7
    height: 7
  - title: New Customer vs Long Term Customer
    name: New Customer vs Long Term Customer
    model: Fashion.ly.0
    explore: order_items
    type: looker_line
    fields: [users.created_day_of_month, order_items.total_gross_margin, users.customer_type]
    pivots: [users.customer_type]
    fill_fields: [users.created_day_of_month]
    sorts: [users.customer_type, order_items.total_gross_margin desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 17
    col: 11
    width: 12
    height: 7
  - title: Revenue by States
    name: Revenue by States
    model: Fashion.ly.0
    explore: order_items
    type: looker_map
    fields: [users.state, order_items.total_gross_margin]
    sorts: [order_items.total_gross_margin desc 0]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    hidden_pivots: {}
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 24
    col: 0
    width: 9
    height: 13
  - title: Top Brands
    name: Top Brands
    model: Fashion.ly.0
    explore: order_items
    type: looker_grid
    fields: [products.brand, order_items.total_gross_margin]
    filters:
      products.category: ''
      products.name: ''
    sorts: [order_items.total_gross_margin desc 0]
    limit: 10
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(${order_items.total_gross_margin})',
        label: Total Gross Margin of All, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: total_gross_margin_of_all, _type_hint: number,
        is_disabled: false}, {category: table_calculation, expression: "${order_items.total_gross_margin}\
          \ / ${total_gross_margin_of_all}", label: Percentage of Gross Margin, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, table_calculation: percentage_of_gross_margin,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 31
    col: 9
    width: 14
    height: 6
