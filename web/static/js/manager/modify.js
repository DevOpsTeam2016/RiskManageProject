/**
 * Created by zsmy on 16/11/18.
 */
//点击修改
var a = new Array();
$(".checkOne_index").click(function(){
    if(this.checked == true){
        var $check = $(this);
        $check.parent().siblings("td").each(function(i){
            console.log("ss")
            a[i]=$(this).text();
        })
        $("#modify").click(function(){
            console.log($(".checkOne_index:checked").length);
            if($(".checkOne_index:checked").length == 1){
                console.log("click");
                console.log(a);
                $("#modifyModal").find("input").each(function(i){
                    console.log("input");
                    $(this).val(a[i]);
                })
            }else if($(".checkOne_index:checked").length == 0){
                alert("请选择要修改的条目！！");
            }else {
                alert("只能选择一条哦~~");
            }
        })
    }
})
//点击删除
var id ;
$(".checkOne_index").click(function(){
    if(this.checked == true){
        var $check = $(this);
        $check.parent().siblings("td").each(function(i){
            id=a[0];
        })
        $("#delete").click(function(){
            console.log("click");
            console.log(id);
        })
    }
})