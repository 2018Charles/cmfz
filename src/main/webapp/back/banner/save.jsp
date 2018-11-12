<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<div style="text-align: center;">
<form id="editUserInputForm" class="easyui-form" enctype="multipart/form-data" method="post">
    <div style="margin-top: 50px">
        <input type="text" name="title" class="easyui-textbox" data-options="width:360,height:35,label:'标题'">
    </div>
    <div style="margin-top: 10px">
        <input  name="imgsPath" class="easyui-filebox" data-options="width:360,height:35,label:'图片'">
    </div>
    <div style="margin-top: 10px">
        <input type="text" name="desc" class="easyui-textbox" data-options="width:360,height:35,label:'描述'">
    </div>
    <div style="margin-top: 10px">
        <input type="text" name="status" class="easyui-textbox" data-options="width:360,height:35,label:'状态'">
    </div>
</form>
</div>
