document.addEventListener 'turbolinks:load', ->
  document.querySelectorAll('#filters_form input').forEach (input) ->
    input.addEventListener 'input', -> 
      form = input.parentElement
      Rails.fire(form, 'submit')
      loadingStarted()