// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


var lis = document.querySelectorAll("div.pagination > ul > li");

for (var i = 0; i < lis.length; i++) {
  lis[i].style.margin = "2px";
}
