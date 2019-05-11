import $ from 'jquery'
import Rails from 'rails-ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from 'activestorage'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(() => {
  $("#jquery_tell").append("<p>jQuery is loaded.</p>")
})
