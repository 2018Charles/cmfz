<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function(){
        $("#album").treegrid({
            url:"${pageContext.request.contextPath}/album/findAll",
            idField:'id',
            treeField:'title',
            singleSelect:false,
            ctrlSelect:true,
            fit:true,
            fitColumns:true,
            toolbar:toolbar,
            pagination:true,
            toolbar:"#tool",
            columns:[[
                {field:'cb',checkbox:true},
                {field:'id',title:'ID',width:100,align:'center'},
                {field:'title',title:'名称',width:100,align:'center'},
                {field:'size',title:'大小',width:80},
                {field:'duration',title:'时长',width:80},
                {field:'uploadDate',title:'时间',width:120},
                {field:'downPath',title:'路径',width:180},
                {field:'album_id',title:'专辑ID',width:100},
                {field:'options',title:'操作',width:80,align:'center',
                    formatter:function(value,row,index){
                        return "<a href='javascript:;' class='options' onclick=\"delRow('"+row.id+"','"+row.album_id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>"
                    }
                } ,
            ]],
            onLoadSuccess:function () {
                $(".options").linkbutton();
            },
        });



    });
    //删除一行的事件
    function delRow(id,album_id){
        alert(album_id)
        if (album_id=="null"){

            //获取当前点击id发送ajax请求删除id这个人的信息
            $.post("${pageContext.request.contextPath}/album/delete",{"id":id},function (result) {//响应成功之后回调
                //刷新datagrid数据
                alert("aaaaaa")
                $("#album").treegrid('reload');//刷新当前datagrid
            });
        } else {
            $.post("${pageContext.request.contextPath}/chapter/delete",{"id":id},function (result) {//响应成功之后回调
                //刷新datagrid数据
                alert("aaaaaa")
                $("#album").treegrid('reload');//刷新当前datagrid
            });
        }
    }
/*添加章节*/
    $("#chapter_dialog").dialog({
        iconCls:'icon-save',
        resizable:true,
        modal:true,
        closed:true,
        href:"${pageContext.request.contextPath}/back/chapter/edit.jsp",
        buttons:[{
            text:'SAVE',
            iconCls:'icon-save',
            handler:function(){
                $('#chapter_form').form('submit',{
                    url:'${pageContext.request.contextPath}/chapter/save',
                    success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                        alert(result)
                        /* var resultObj = $.parseJSON(result);*/
                        //关闭对话框
                        $("#chapter_dialog").dialog('close');
                        //刷新datagrid
                        $("#album").treegrid('reload');
                    }
                })
            }
        },{
            text:'CLOSE',
            iconCls:'icon-cancel',
            handler:function(){
                $('#chapter_dialog').dialog('close');
            }
        }],
    })
    function show() {
        var selectRow1=$("#album").treegrid("getSelected");
        if(selectRow1!=null){
            if(selectRow1.size==null){
                $("#album_dialog").dialog("open");
                $("#album_form").form("load",selectRow1);
                $("#album_img").prop("src",selectRow1.img);
            }else{
                alert('请选择您要了解的专辑');
            }
        }else{
            alert('请选择您要了解的专辑');
        }
    }
    function add1() {
        $("#saveAlbum").dialog({
            width:560,
            height:470,
            title:'添加专辑',
            href:'${pageContext.request.contextPath}/back/album/saveAlbum.jsp',
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function(){
                    //保存用户信息
                    $("#albumSaveForm").form('submit',{
                        url:'${pageContext.request.contextPath}/album/save',
                        success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            alert(result)
                            /* var resultObj = $.parseJSON(result);*/
                            //关闭对话框
                            $("#saveAlbum").dialog('close');
                            //刷新datagrid
                            $("#album").treegrid('reload');
                        }
                    });
                }
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#saveAlbum").dialog('close');
                }
            }],
        })
    }
    function add2() {
        var selectRow1=$("#album").treegrid("getSelected");
        if(selectRow1==null){
            alert('请选中一行数据');
        }else{
            if(selectRow1.size==null){
                $("#chapter_dialog").dialog("open");
                $("#album_id").textbox("setValue",selectRow1.id);
            }else{
                alert('请选中一张专辑');
            }

        }
    }
    function down() {
        var selectRow1=$("#album").treegrid("getSelected");
        if(selectRow1==null){
            alert('请选中一行数据');
        }else{
            location.href= "${pageContext.request.contextPath}/chapter/download?filename="+selectRow1.title+"&filepath="+selectRow1.downPath;
        }
    }
    $(function () {
        $("#album_form").form('load','${pageContext.request.contextPath}/album/queryone?id=${param.id}'
        )
    })
</script>

<table id="album"></table>

<div id="tool">
    <a href="javascript:void(0)" onclick="show()" class="easyui-linkbutton" data-options=" iconCls: 'icon-edit',">专辑详情</a>
    <a href="javascript:void(0)" onclick="add1()" class="easyui-linkbutton"  data-options="  iconCls: 'icon-add',">添加专辑</a>
    <a href="javascript:void(0)"onclick="add2()" class="easyui-linkbutton" data-options=" iconCls: 'icon-add',">添加章节</a>
    <a href="javascript:void(0)" onclick="down()" class="easyui-linkbutton" data-options=" iconCls: 'icon-undo',">下载音频</a>
</div>

<div id="album_dialog" class="easyui-dialog" title="专辑详情展示" style="padding-top: 8px;text-align:center;width:400px;height:200px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">

    <form id="album_form" method="post">
        <input type="hidden" name="id" value="${param.id}">
        <div style="padding-top: 8px">
            <label for="name">专辑名称:</label>
            <input class="easyui-validatebox" type="text" id="name" name="title" />
        </div>
        <div style="padding-top: 8px">
            <label for="count">专辑集数:</label>
            <input class="easyui-validatebox" type="text" name="count" id="count" />
        </div>

    </form>
</div>
<div id="chapter_dialog" class="easyui-dialog" title="添加章节" style="width:400px;height:200px;">
</div>
<%--添加专辑--%>
<div id="saveAlbum"></div>
