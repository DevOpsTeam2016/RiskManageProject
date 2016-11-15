/**
 * Created by J on 2016/11/10.
 */

$(document).ready(function() {

    $('select[name="assignRiskSelect"]').change(function() {
        var selected = $(this).val();
        var riskId = $(this).parent().closest('tr').find('.riskId').text();
        $(this).parent().closest('tr').find('.assignItem').replaceWith(selected);
        $.ajax({
            type: "POST",
            url: "/developer/assign_risk",
            data: {"riskId": riskId, "trackerName": selected},
            dataType: "json",
            success: function() {
                location.reload();
            },
            error: function() {
                alert('Error');
            }
        });
    });

});