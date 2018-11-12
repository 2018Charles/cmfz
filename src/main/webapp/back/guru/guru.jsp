<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<script>
    $(function () {
        $("#guruDg").datagrid({
            url:'${pageContext.request.contextPath}/guru/findAll', //查询的Servlet（要返回分页查询的JSON）
            fit:true,
            singleSelect:false,
            ctrlSelect:true,
            pagination:true,//分页工具栏
            fitColumns:true,//列的宽度自适应
            view: detailview,//不需要详细表格可以不加
            idField:'id',//绑定主键这个是必须的，不绑定删除不了
            columns:[[
//列的绑定
                {field:'ck',checkbox:true},
                {field:'id',title:'编号',width:100,editor:{type:'text',options:{required:true}}},
//editor:{type:'validatebox（想使用说明验证框就给说明值）',options:、、//{required:true（验证规则）}
                {field:'name',title:'姓名',width:100,editor:{type:'text',options:{required:true}}},
                {field:'sex',title:'性别',width:100,align:'center',editor:{type:'text',options:{required:true}}} ,
                {field:'headPic',title:'头像',width:100,align:'center',editor:{type:'text',options:{required:true}}} ,
                {field:'options',title:'操作',width:180,align:'center',
                    formatter:function(value,row,index){
                        return "<a href='javascript:;' class='options' onclick=\"delRow('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;" +
                            "<a href='javascript:;' class='options' onclick=\"openEditUserDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>";
                    }
                } ,
            ]]  ,
            onLoadSuccess:function () {
                $(".options").linkbutton();
            },
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="/pic/' + rowData.headPic +'" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>title: ' + rowData.name + '</p>' +
                    '<p>sex: ' + rowData.sex + '</p>' +
                    '</td>' +
                    '</tr></table>';
            },

            toolbar:"#tb",
        });
    });
    //打开保存用户对话框函数
    function openSaveUserDialog(){
        $("#saveGuruDialog").dialog({
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function(){
                    //保存用户信息
                    $("#guruSaveForm").form('submit',{
                        url:'${pageContext.request.contextPath}/guru/save',
                        success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            alert(result)
                           /* var resultObj = $.parseJSON(result);*/
                            //关闭对话框
                            $("#saveGuruDialog").dialog('close');
                            //刷新datagrid
                            $("#guruDg").datagrid('reload');
                        }
                    });
                }
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#saveGuruDialog").dialog('close');
                }
            }]
        });
    }

    //打开修改用户的对话框
    function openEditUserDialog(id){
        $("#editGuruDialog").dialog({
            href:'${pageContext.request.contextPath}/back/guru/edit.jsp?id='+id,
            buttons:[
                {
                    iconCls:'icon-save',
                    text:"修改",
                    handler:function(){
                        $("#guruEditForm").form('submit',{
                            url:"${pageContext.request.contextPath}/guru/update",
                            success:function (result) {//注意一定是json字符串  使用需要转为js对象
                                alert(result)
                                //关闭dialog
                                $("#editGuruDialog").dialog('close');
                                //刷新datagrid
                                $("#guruDg").datagrid('reload');//刷新当前datagrid
                                //提示修改信息
                                $.messager.show({title:'提示',msg:"上师信息修改成功!!!"});
                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:"取消",
                    handler:function(){
                        $("#editGuruDialog").dialog('close');
                    }
                },
            ]
        });

    }

    //删除一行的事件
    function delRow(id){
        //获取当前点击id发送ajax请求删除id这个人的信息
        $.post("${pageContext.request.contextPath}/guru/delete",{"id":id},function (result) {//响应成功之后回调
            //刷新datagrid数据
            alert("aaaaaa")
            $("#guruDg").datagrid('reload');//刷新当前datagrid
        });
    }
</script>
<table id="guruDg" style="width:600px;height:200px" singleSelect="true">

</table>

<%--datagrid工具栏--%>
<div id="tb">
    <a href="#" class="easyui-linkbutton" onclick="openSaveUserDialog();" data-options="iconCls:'icon-add',plain:true">添加</a>

    <a href="#" class="easyui-linkbutton" onclick="openSaveUserDialog();" data-options="iconCls:'icon-save',plain:true">保存</a>
</div>


<%--保存用户对话框--%>
<div id="saveGuruDialog" data-options="href:'${pageContext.request.contextPath}/back/guru/save.jsp',draggable:false,iconCls:'icon-save',width:600,height:400,title:'保存上师信息'">
</div>

<%--更新用户对话框--%>
<div id="editGuruDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新上师信息'"></div>