<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#userDg").datagrid({
            title:'用户',
            url:'${pageContext.request.contextPath}/user/findAll',
            fit:true,
            columns:[[
                {field:'id',title:'编号',width:30},
                {field:'phoneNum',title:'电话',width:80,align:'center'},
                {field:'username',title:'真实姓名',width:100,align:'center'},
                {field:'password',title:'密码',width:100,align:'center'},
                {field:'nickName',title:'法名',width:80,align:'center'},
                {field:'province',title:'省份',width:80,align:'center'},
                {field:'city',title:'城市',width:100,align:'center'},
                {field:'gender',title:'性别',width:50,align:'center'},
                {field:'sign',title:'签名',width:200,align:'center'},
                {field:'headPic',title:'头像',width:200,align:'center'},
                {field:'status',title:'状态',width:50,align:'center'},
                {field:'onlineDate',title:'时间',width:100,align:'center'},
                {field:'options',title:'操作',width:100,align:'center',
                    formatter:function(value,row,index){
                        return "<a href='javascript:;' class='options' onclick=\"openEditUserDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>";
                    }
                }
            ]],
            onLoadSuccess:function () {
                $(".options").linkbutton();
            },


        })
    })


    //打开修改用户的对话框
    function openEditUserDialog(id){
        $("#editUserDialog").dialog({
            href:'${pageContext.request.contextPath}/back/user/edit.jsp?id='+id,
            buttons:[
                {
                    iconCls:'icon-save',
                    text:"修改",
                    handler:function(){
                        $("#UserForm").form('submit',{
                            url:"${pageContext.request.contextPath}/user/update",
                            success:function (result) {//注意一定是json字符串  使用需要转为js对象
                                alert(result)
                                //关闭dialog
                                $("#editUserDialog").dialog('close');
                                //刷新datagrid
                                $("#userDg").datagrid('reload');//刷新当前datagrid
                                //提示修改信息
                                $.messager.show({title:'提示',msg:"用户信息修改成功!!!"});
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
</script>

<table id="userDg"></table>

<%--更新用户对话框--%>
<div id="editUserDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新用户信息'"></div>