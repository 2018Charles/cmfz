<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<div style="text-align: center;">
<form id="albumSaveForm" class="easyui-form" enctype="multipart/form-data" method="post">
    <div style="margin-top: 35px">
        <label for="title">标题</label>
        <input type="text" name="title" id="title" class="easyui-textbox" data-options="width:300,height:35">
    </div>

    <div style="margin-top: 15px">
        <label for="count">数量</label>
        <input type="text" name="count" id="count" class="easyui-textbox" data-options="width:300,height:35">
    </div>
    <div style="margin-top: 15px">
        <label for="coverImg">封面</label>
        <input type="text" name="coverImgs" id="coverImg" class="easyui-filebox" data-options="width:300,height:35">
    </div>
    <div style="margin-top: 15px">
        <label for="score">评分</label>
        <input type="text" name="score" id="score" class="easyui-textbox" data-options="width:300,height:35">
    </div>
    <div style="margin-top: 15px">
        <label for="author">作者</label>
        <input type="text" name="author" id="author" class="easyui-textbox" data-options="width:300,height:35">
    </div>
    <div style="margin-top: 15px">
        <label for="broadCast">播音</label>
        <input type="text" name="broadCast" id="broadCast" class="easyui-textbox" data-options="width:300,height:35">
    </div>
    <div style="margin-top: 15px">
        <label for="brief">简介</label>
        <input type="text" name="brief" id="brief" class="easyui-textbox" data-options="width:300,height:35">
    </div>

</form>
</div>
