<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
        $("#courseDG").datagrid({
            title:'必修课程',
            url:'${pageContext.request.contextPath}/allCourse',
            fit:true,
            columns:[[
                {field:'id',title:'编号',width:100},
                {field:'title',title:'课程名称',width:200,align:'center'},
                {field:'flag',title:'标志',width:200,align:'center'},
                {field:'createDate',title:'时间',width:200,align:'center'}
            ]]
        })
    })
</script>

<table id="courseDG"></table>