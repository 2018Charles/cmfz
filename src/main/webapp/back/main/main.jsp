<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
	<!--菜单处理-->

        $(function () {
            $.post("${pageContext.request.contextPath}/menu",function (m2) {

                /*遍历一级菜单*/
                $.each(m2,function (indx,m) {
                    var content="<div style='text-align: center;'>";
                    /*遍历二级菜单*/
                    $.each(m.menus,function (idx,menu) {

                        content+="<a onclick=\"addTabs('"+menu.title+"','"+menu.iconCls+"','"+menu.href+"')\" style='width:95%;margin:10px 0px; border: 2px #00ee00 solid;' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+menu.iconCls+"'\">"+menu.title+"</a></br>";

                    });
                    content+="</div>"
                    $("#aa").accordion('add',{
                        title:m.title,
                        iconCls:m.iconCls,
                        content:content,
                    })
                })
            })



            /*更改密码*/
           $("#changPwd").click(function(){
               var id=${sessionScope.login_admin.id}
                $("#changPwdDialog").dialog({
                    title:"修改密码",
                    width:460,
                    height:400,
                    href:"${pageContext.request.contextPath}/back/main/changePwd.jsp",
                    buttons:[{
                        text:'保存',
                        handler:function(){
                            $("#fors").form('submit',{
                                queryParams:{"id":id},
                                url:"${pageContext.request.contextPath}/admin/changePwd",
                                    success:function (data) {
                                        var da=$.parseJSON(data);
                                    if(da.bool){
                                        $.messager.alert('提示',da.msg,'info',function () {
                                            window.location.href="${pageContext.request.contextPath}/back/main/login.jsp"
                                        });
                                        $("#changPwdDialog").dialog('close');
                                    }else {
                                        $.messager.alert('提示', da.msg, 'info')
                                    }
                                }
                            })
                        }
                    },{
                        text:'关闭',
                        handler:function(){
                            $("#changPwdDialog").dialog('close');
                        }
                    }],
                })
            })





        })

        function addTabs(title,icon,href) {
            if(!$("#tt").tabs('exists',title)){

                $("#tt").tabs('add',{
                    title:title,
                    iconCls:icon,
                    closable:true,
                    fit:true,
                    href:"${pageContext.request.contextPath}/"+href,

                })
            }else{
                $("#tt").tabs('select',title);
            }
        }

</script>

</head>
<body class="easyui-layout">   
    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.login_admin.username} &nbsp;<a href="javascript:void(0)" id="changPwd" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/loginout" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>
    </div>   
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>   
       
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">
    		
		</div>  
    </div>   
    <div data-options="region:'center'">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">   
		    <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
		</div>  
    </div>

    <%--更改密码对话框--%>dialo
    <div id="changPwdDialog"></div>
</body> 
</html>