//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-multiselect
//= require jquery-tablesorter
//= require_tree .

$(document).ready(function(){
    $('table').tablesorter();
    right_numers();
});

$(document).click(function(){
    right_numers();
});

function right_numers(){
    var tabel = document.getElementById('group_rating');
    if (tabel) {
        var size = tabel.rows.length;
        for (var i = 1; i < size; i++) {
            tabel.rows[i].cells[0].innerHTML = i;
        }
    }
}