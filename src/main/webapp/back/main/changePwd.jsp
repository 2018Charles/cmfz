<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
        $.extend($.fn.validatebox.defaults.rules,{
            confirmPwd:{
                validator:function(value,param){
                    console.log(value)
                    console.log(param[0]);
                    return $(param[0]).val() == value;
                },
                message:"两次输入密码不一致!!!"
            }
        });
    })
</script>

<div style="text-align: center;padding-top: 100px">

    <form id="fors"  class="easyui-form" method="post">

        <div style="padding-top: 15px">
            <input type="text" id="pwd" name="password" class="easyui-validatebox" data-options="width:280,height:30,required:true,label:'更改密码'">
        </div>

        <div style="padding-top: 15px">
            <input type="text" class="easyui-validatebox" data-options="validType:'confirmPwd[\'#pwd\']',width:280,height:30,required:true,label:'确认密码'">
        </div>
    </form>

</div>
