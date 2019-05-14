import jstree from 'jstree'
import Rails from 'rails-ujs'
import * as ActiveStorage from 'activestorage'
import {} from './utl_files_common'

console.log("hello from javascript/application/javascripts/index")

Rails.start()
ActiveStorage.start()

console.log("goodbye from javascript/application/javascripts/index")
