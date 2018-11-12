<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/material/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script>
      $(function () {
            $("#login-button").click(function () {
                        $.post("${pageContext.request.contextPath}/admin/login",$("#form").serialize(),
                            function(result) {
                            console.log(result);
                            if(result.bool){
                                location.href='${pageContext.request.contextPath}/back/main/main.jsp';
                            }else {
                                $.messager.alert('提示',result.msg,'info');

                            }
                        });



            });
        })

       function genTimestamp() {
           var time = new Date();
           return time.getTime();
       }
       function changeImage() {
           $('#verifyCodeImage').attr('src',
               '${pageContext.request.contextPath }/login/getVerifyCode?timestamp=' + genTimestamp());
       }

    </script>

    <style>
        #verifyCodeImage,#user_input_verifyCode{
            vertical-align: top;

        }
    </style>
</head>
<body style="text-align: center;background-image: url('${pageContext.request.contextPath}/back/main/image/bg.jpg');">
    <div class="login_form" style="margin-top: 200px">
        <form method="post" id="form">
            <div>
                <input type="text" id="uname" name="username"  class="easyui-textbox" data-options="width:300,height:45,required:true,validType:'uname',prompt:'用户名'" >
            </div>
            <div  style="margin-top: 10px">
                <input type="text" id="pwd" name="password" class="easyui-passwordbox" data-options="width:300,height:45,required:true,validType:'pwd',prompt:'密码'">
            </div>
            <%----%>
            <div style="margin-top: 10px">
                <input type="text" class="easyui-textbox" data-options="deltaX:45,validateOnBlur:true,width:100,height:45,required:true" id="user_input_verifyCode"
                       name="user_input_verifyCode" placeholder="验证码" maxlength="4">

                <span class="code_img" >
                    <img
                        src="${pageContext.request.contextPath }/login/getVerifyCode"
                        width="110" height="45" id="verifyCodeImage">
                </span> <span> <a href="javascript:void(0)" id="changeVerifImageRegister"
                                      onclick="javascript:changeImage();">换一张</a>
					    </span>

            </div>
            <%----%>
            <div style="margin-top: 10px;">
                <a id="login-button" href="javascript:void(0)">Login</a>
            </div>
        </form>



    </div>
        <script>
            $("#login-button").linkbutton({
                width:300,
                height:45,
            })

        </script>
</body>
</html>