/**
 * Created by zsmy on 16/11/15.
 */

$(document).ready(function() {

    $(".checkAll").click(function () {
        var isChecked = this.checked;
        for (var i = 0; i < $(".checkOne").length; i++) {
            $(".checkOne")[i].checked = isChecked;
        }
    });
    $(".checkAll_index").click(function () {
        var isChecked = this.checked;
        for (var i = 0; i < $(".checkOne_index").length; i++) {
            $(".checkOne_index")[i].checked = isChecked;
        }
    })
});