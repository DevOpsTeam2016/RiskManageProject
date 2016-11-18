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

    $('.deleteRisk').click(function() {
        var riskPlanId = $(this).parent().closest('tr').find('.riskPlanId').text();
        $.ajax({
            type: "POST",
            url: "/manage/risk",
            data: {"operation": "delete", "riskPlanId": riskPlanId},
            dataType: "json",
            success: function() {
                location.reload();
            },
            error: function() {
                alert('Error');
            }
        });
    });

    $('.updateRisk').click(function() {
        var riskPlanId = $(this).parent().closest('tr').find('.riskPlanId').text();
        $('#modifyModal input[name="riskPlanId"]').val(riskPlanId);
        var riskName = $(this).parent().closest('tr').find('.riskName').text();
        $('#modifyModal input[name="riskName"]').val(riskName);
        var description = $(this).parent().closest('tr').find('.description').text();
        $('#modifyModal input[name="description"]').val(description);
        var threshold = $(this).parent().closest('tr').find('.threshold').text();
        $('#modifyModal input[name="threshold"]').val(threshold);
        var creator = $(this).parent().closest('tr').find('.creator').text();
        $('#modifyModal input[name="creator"]').val(creator);
        // $.ajax({
        //     type: "POST",
        //     url: "/manage/risk",
        //     data: {"operation": "update", "riskPlanId": riskPlanId},
        //     dataType: "json",
        //     success: function() {
        //         location.reload();
        //     },
        //     error: function() {
        //         alert('Error');
        //     }
        // });
    });

});