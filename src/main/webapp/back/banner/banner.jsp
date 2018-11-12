<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {
        $('#dg').datagrid({

            fit:true,
            remoteSort:false,
            singleSelect:true,
            nowrap:false,
            fitColumns:true,
            toolbar:"#tb",
            url:'${pageContext.request.contextPath}/banner/findAll',
            columns:[[
                {field:'title',title:'标题',width:80},
                {field:'imgPath',title:'图片',width:100,sortable:true},
                {field:'status',title:'状态',width:60,align:'center'},
                {field:'desc',title:'描述',width:100,align:'center'},
                {field:'href',title:'路径',width:80,align:'right',sortable:true},
                {field:'createDate',title:'创建时间',width:80,align:'right',sortable:true},
                {title:'options',field:'options',width:200,
                    formatter:function(value,row,index){
                        return "<a href='javascript:;' class='options' onclick=\"delRow('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" +
                            "<a href='javascript:;' class='options' onclick=\"openEditUserDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>";
                    }
                }
            ]],
            onLoadSuccess:function () {
                $(".options").linkbutton();
            },
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="/pic/' + rowData.imgPath +'" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>title: ' + rowData.title + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '<p>title: ' + rowData.desc + '</p>' +
                    '<p>Status: ' + rowData.createDate + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    })
    //打开修改用户的对话框
    function openEditUserDialog(id){
        $("#editUserDialog").dialog({
            href:'${pageContext.request.contextPath}/back/banner/update.jsp?id='+id,
            buttons:[
                {
                    iconCls:'icon-save',
                    text:"修改",
                    handler:function(){
                        $("#updateInputForm").form('submit',{
                            url:"${pageContext.request.contextPath}/banner/update",
                            success:function (result) {//注意一定是json字符串  使用需要转为js对象
                                alert(result)
                                //关闭dialog
                                $("#editUserDialog").dialog('close');
                                //刷新datagrid
                                $("#dg").datagrid('reload');//刷新当前datagrid
                                //提示修改信息
                                $.messager.show({title:'提示',msg:"轮播图信息修改成功!!!"});
                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:"取消",
                    handler:function(){
                        $("#editUserDialog").dialog('close');
                    }
                },
            ]
        });

    }

    //删除一行的事件
    function delRow(id){
        //获取当前点击id发送ajax请求删除id这个人的信息
        $.post("${pageContext.request.contextPath}/banner/delete",{"id":id},function (result) {//响应成功之后回调
            //刷新datagrid数据
            alert("aaaaaa")
            $("#dg").datagrid('reload');//刷新当前datagrid
        });
    }

    //打开保存用户对话框函数
    function openSaveUserDialog(){
        $("#saveUserDialog").dialog({
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function(){
                    //保存用户信息
                    $("#editUserInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/banner/save',
                        success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            alert(result)
                            var resultObj = $.parseJSON(result);
                            //关闭对话框
                            $("#saveUserDialog").dialog('close');
                            //刷新datagrid
                            $("#dg").datagrid('reload');
                        }
                    });
                }
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#saveUserDialog").dialog('close');
                }
            }]
        });
    }
</script>





<%--datagrid数据表格--%>
<table id="dg"></table>

<%--datagrid工具栏--%>
<div id="tb">
    <a href="#" class="easyui-linkbutton" onclick="openSaveUserDialog();" data-options="iconCls:'icon-add',plain:true">添加</a>

    <a href="#" class="easyui-linkbutton" onclick="openSaveUserDialog();" data-options="iconCls:'icon-save',plain:true">保存</a>
</div>

<%--保存用户对话框--%>
<div id="saveUserDialog" data-options="href:'${pageContext.request.contextPath}/back/banner/save.jsp',draggable:false,iconCls:'icon-save',width:600,height:400,title:'保存用户信息'">
</div>

<%--更新用户对话框--%>
<div id="editUserDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新用户信息'"></div>