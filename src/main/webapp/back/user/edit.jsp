<%@page isELIgnored="false" pageEncoding="UTF-8" %>

<script>
    $(function () {
        $("#UserForm").form('load','${pageContext.request.contextPath}/user/queryone?id=${param.id}'
        )
    })

</script>
<div style="text-align: center;">

    <form id="UserForm" class="easyui-form" enctype="multipart/form-data" method="post">
        <input type="hidden" name="id" value="${param.id}">
        <p style="margin-top: 30px">
            <input type="text" name="phoneNum" class="easyui-textbox" data-options="width:300,height:25,label:'手机'">
        </p>
        <p style="margin-top: 5px">
            <input type="text" name="password" class="easyui-textbox" data-options="width:300,height:25,label:'密码'">
        </p>
        <p style="margin-top: 5px">
            <input type="text" name="username" class="easyui-textbox" data-options="width:300,height:25,label:'姓名'">
        </p>
        <p style="margin-top: 5px">
            <input type="text" name="nickName" class="easyui-textbox" data-options="width:300,height:25,label:'法名'">
        </p>
        <p style="margin-top: 5px">
            <input  type="text" name="province" class="easyui-textbox" data-options="width:300,height:25,label:'省份'">
        </p>
        <p style="margin-top: 5px">
            <input type="text" name="city" class="easyui-textbox" data-options="width:300,height:25,label:'城市'">
        </p>
        <p style="margin-top: 5px">
            <input type="text" name="gender" class="easyui-textbox" data-options="width:300,height:25,label:'性别'">
        </p>
        <p style="margin-top: 5px">
            <input  name="headPics" class="easyui-filebox" data-options="width:300,height:25,label:'头像'">
        </p>
        <p style="margin-top: 5px">
            <input type="text" name="sign" class="easyui-textbox" data-options="width:300,height:25,label:'签名'">
        </p>
        <p style="margin-top: 5px">
            <input type="text" name="status" class="easyui-textbox" data-options="width:300,height:25,label:'状态'">
        </p>


    </form>
</div>
