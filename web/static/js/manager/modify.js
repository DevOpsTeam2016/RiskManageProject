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
            console.log("click");
            console.log(a);
            $("#modifyModal").find("input").each(function(i){
                console.log("input");
                $(this).val(a[i]);
            })
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