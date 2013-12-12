adjustPricingTableButton = ->
  $pricingTable = $('.pricing-table.type-a')
  return false if $pricingTable.length < 1 or $pricingTable.find('.plan-actions .btn').length < 2

  basicButtonMargin = $pricingTable.find('.plan-actions').css('margin-top')
  basicButtonMargin = parseInt basicButtonMargin.match(/\d+/)

  maxPlanBodyHeight = Math.max.apply null, ($(planBody).height() for planBody in $('.pricing-plan .plan-body'))

  $pricingTable.find('.pricing-plan').each (index, plan) ->
    bodyHeight = $(plan).find('.plan-body').height()
    marginAdjustment = maxPlanBodyHeight - bodyHeight + basicButtonMargin

    $(plan).find('.plan-actions').css('margin-top', marginAdjustment)

$ ->
  adjustPricingTableButton()