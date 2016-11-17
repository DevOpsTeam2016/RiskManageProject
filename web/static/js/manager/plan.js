/**
 * Created by J on 2016/11/10.
 */

$(document).ready(function() {

    $('select[name="assignRiskSelect"]').change(function() {
        var selected = $(this).val();
        var riskPlanId = $(this).parent().closest('tr').find('.riskPlanId').text();
        $(this).parent().closest('tr').find('.assignItem').replaceWith(selected);
        $.ajax({
            type: "POST",
            url: "/manage/assign_risk",
            data: {"riskPlanId": riskPlanId, "trackerName": selected},
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