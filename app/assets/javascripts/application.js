// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require js.cookie
//= require rails-ujs
//= require turbolinks
//= require twitter/bootstrap
//= require_tree .

function setSort(name) {
    if (Cookies.get('sort') == name) {
        if (Cookies.get('sort_index') == 'asc') {
            Cookies.set('sort_index', 'desc');
        } else {
            Cookies.set('sort_index', 'asc');
        }
    } else {
        Cookies.set('sort', name);
        Cookies.set('sort_index', 'asc');
    }
}

function delSort() {
    Cookies.remove('sort');
    Cookies.remove('sort_index');
}

function reloadGlyphicon() {
    var elements = document.getElementsByClassName('glyphicon-title');

    for (var i = 0; i < elements.length; i++) {
        elements[i].className = 'glyphicon-title glyphicon';
        if (elements[i].id == Cookies.get('sort')) {
            if (Cookies.get('sort_index') == 'asc') {
                elements[i].className += ' glyphicon-sort-by-attributes'
            } else {
                elements[i].className += ' glyphicon-sort-by-attributes-alt'
            }
        } else {
            elements[i].className += ' glyphicon-sort'
        }
    }
}