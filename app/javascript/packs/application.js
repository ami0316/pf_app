// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// bootstrap追加記述
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

// 評価機能での追加記述
import "jquery-raty-js";
// yarn add jquery-raty-js

import Swiper from 'swiper/swiper-bundle.js';
import 'swiper/swiper-bundle.css';
window.Swiper = Swiper;

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

