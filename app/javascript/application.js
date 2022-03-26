// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import "./controllers"
import * as mdb from 'mdb-ui-kit'; 
import "trix"
import "@rails/actiontext"


Rails.start()
Turbolinks.start()
ActiveStorage.start()