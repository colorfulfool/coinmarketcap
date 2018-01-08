window.loadingStarted = ->
  document.querySelector('#found_coins').style.opacity = 0.2
  
window.loadingFinished = (message) ->
  foundCoints = document.querySelector('#found_coins')
  foundCoints.style.opacity = 1
  foundCoints.innerHTML = message