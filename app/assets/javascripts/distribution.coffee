# document.addEventListener 'turbolinks:load', ->
#   recalculate()
#
#   document.querySelector('[name=amount]').addEventListener('input', recalculate)
#   document.querySelectorAll('[type=checkbox]').forEach (input) -> input.addEventListener('change', recalculate)
  
readText = (parent, name) ->
  parseFloat parent.querySelector("[name=\"#{name}\"]").innerHTML.replace('$', '')
  
readInput = (name) ->
  parseFloat document.querySelector("[name=\"#{name}\"]").value
  
  
recalculate = ->
  amount = readInput('amount')
  dollarAmount = readInput('dollarAmount')
  
  selectedTotal = 0
  
  document.querySelectorAll('[name=share]').forEach (shareCell) ->
    coinRow = shareCell.parentElement
    dollarShare = readText(coinRow, 'dollarShare')
    
    share = amount * dollarShare / dollarAmount
    shareCell.innerHTML = share
    
    if coinRow.querySelector("[type=checkbox]").checked
      selectedTotal += share
      
  distributionCurrency = document.querySelector("[name=distributionCurrency]").innerHTML
  document.querySelector("[name=selectedTotal]").innerHTML = "#{selectedTotal} #{distributionCurrency}"