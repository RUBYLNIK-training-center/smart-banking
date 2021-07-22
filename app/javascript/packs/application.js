// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require chartkick
//= require Chart.bundle

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "chartkick/chart.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import 'bootstrap'
import './src/application.scss'

import {
    enable as enableDarkMode,
    disable as disableDarkMode,
    isEnabled as isDarkReaderEnabled
} from 'darkreader';

document.addEventListener("turbolinks:load", function() {
    let button = document.getElementById("changeTheme")
    button.onclick = () => {
        if(isDarkReaderEnabled()) {
            disableDarkMode();
            button.textContent = 'DarkTheme'
        } else {
            enableDarkMode({
                brightness: 100,
                contrast: 90,
                sepia: 10,
            });
            button.textContent = 'LightTheme'
        }
    }
  });