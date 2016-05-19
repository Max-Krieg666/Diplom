$(document).ready(function(){
    $('table').tablesorter();
    $('#choose-rating-element').multiselect();
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