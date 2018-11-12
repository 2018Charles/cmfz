<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
        $("#guruEditForm").form('load','${pageContext.request.contextPath}/guru/queryoneById?id=${param.id}'
        )
    })

</script>
<div style="text-align: center;">

<form id="guruEditForm" class="easyui-form" enctype="multipart/form-data" method="post">
    <div><input type="text" name="id" value="${param.id}"></div>
    <div style="margin-top: 50px">
        <input type="text" name="name" class="easyui-textbox" data-options="width:360,height:35,label:'姓名'">
    </div>
    <div style="margin-top: 10px">
        <input  name="headPics" class="easyui-filebox" data-options="width:360,height:35,label:'头像'">
    </div>
    <div style="margin-top: 10px">
        <input type="text" name="sex" class="easyui-textbox" data-options="width:360,height:35,label:'性别'">
    </div>

</form>
</div>
