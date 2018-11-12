<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
         $("#chapter_form").form('load','${pageContext.request.contextPath}/chapter/queryoneById?id=${param.id}'
        )
        $("#zj").combobox({
            url:"${pageContext.request.contextPath}/album/allName",
            valueField: 'id',
            textField: 'title',
        })
    })

</script>

<div style="text-align: center;padding-top: 3px">
<form id="chapter_form" method="post" enctype="multipart/form-data">
    <div style="padding-top: 8px">
        <label for="album-id">章节名称:</label>
        <input class="easyui-textbox"  id="album-id" name="title" />
    </div>
    <div style="padding-top: 8px">
        <label for="zj">选择专辑:</label>
        <input class="easyui-combobox"  id="zj" name="album_id" >
    </div>
    <div style="padding-top: 8px">
        <label for="file">章节上传:</label>
        <input class="easyui-filebox"  name="downPaths" id="file" />
    </div>
</form>
</div>