// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'bootstrap';
import './stylesheets/application.scss';

require("trix")
require("@rails/actiontext")

require('./chart');
import { hello } from './hello'

function greet_user(last_name, first_name) {
  hello(last_name + " " + first_name);
}

function readyFn() {
  console.log("Hello World!")
};

$(document).on('turbolinks:load', readyFn)

$(document).ready(() => {
  greet_user('steve', 'jobs')
  //$('button#greet-user-button').on('click', () => greet_user('steve', 'jobs'))
})

