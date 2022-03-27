// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"

import "./controllers"
import * as mdb from 'mdb-ui-kit'; 

import "trix"
import "@rails/actiontext"

Rails.start()
ActiveStorage.start()