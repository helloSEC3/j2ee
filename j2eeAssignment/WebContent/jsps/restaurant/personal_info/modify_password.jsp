<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/foundation/5.5.3/css/foundation.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/foundation/5.5.3/js/foundation.min.js"></script>
    <script src="https://cdn.bootcss.com/foundation/5.5.3/js/vendor/modernizr.js"></script>

    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">

    <style rel="stylesheet">
        .one, .two{
            width: 50%;
            height: 45px;
            float: left;
            box-sizing: border-box;
        }
        .bt{
            background-color: lightgreen;
            height: 50px; width: 24.5%;
            border: 0px;
            font-size: 15px;
            border-radius: 5px;
        }

        .bt_rest_type{
            width: 60%;
            height: 40px;
            border: 0px; border-radius: 5px;
            background-color: rgba(0, 0, 255, 0.47);
            color: white;
        }
        /*图片和简介的div的属性*/

        .show {
            border-radius: 5px;
            width: auto;
            height: auto;
            margin: 10% 10%;
            text-align: center;
        }

        div.img {
            margin: 5px;
            border: 1px solid #ccc;
            float: left;
            width: 200px;
        }

        div.img:hover {
            border: 1px solid #777;
        }

        div.img img {
            width: 100%;
            height: 160px;
        }

        div.desc {
            padding: 15px;
            text-align: left;
            font-size: 16px;
            font-family: 楷体;
            height: 80px;
        }
    </style>
</head>
<body>

<%
	//获得修改密码的结果
	String err_modify_info=(String)session.getAttribute("err_modify_info");
%>

<!--待开发-->
<div style="height: 100px;background-color: darkcyan">
    <br>
    <div align="center"><b style="font-size: 25px;color: white">修改密码</b></div>
</div>

<!--选择按钮-->
<form action="/j2eeAssignment/restaurant/to4functions" method="get">
<div align="center">
    <button class="bt" type="submit" name="func" value="orders">订单</button>
    <button class="bt" type="submit" name="func" value="publish_info">发布信息</button>
    <button class="bt" type="submit" name="func" value="look_over_sum_info">查看统计信息</button>
    <button class="bt" type="submit" name="func" value="personal_info">基本信息</button>
</div>
</form>

<!--商家信息-->
<div>
    <!--商家分类-->
    <form action="/j2eeAssignment/restaurant/to2functions" method="get">
    <div style="height:800px; width: 20%;border: 1px solid green;float:left;box-sizing: border-box">
        <b>商品分类：</b>
        <hr>
        <div align="center">
            <button class="bt_rest_type" type="submit" name="func" value="personal_info">基本信息</button>
            <br>
            <br>
            <button class="bt_rest_type" type="submit" name="func" value="modify_pass">修改密码</button>
            <br>
            <br>
            <button class="bt_rest_type" type="submit" name="func" value="logout">退出登录</button>
            <br>
            <br>
        </div>
    </div>
    </form>

    <!--商家-->
	<form action="/j2eeAssignment/restaurant/modify_rest_pass" method="get">
    <div style="min-height:800px; width: 80%;border: 1px solid green;float:left;box-sizing: border-box">
        <div style="width: 80%;border: 1px solid green;height: 80%;">
            <b>原密码：<input style="width: 50%" id="raw_pass" name="raw_pass" type="password"></b><br>
            <b>新密码：<input style="width: 50%" id="new_pass" name="new_pass" type="password"></b><br>
            <b>再次输入新密码：<input style="width: 50%" id="re_new_pass" name="re_new_pass" type="password"></b><br>
            <div style="background-color: orange;width: 100%;height: 25px"><%=err_modify_info %></div>
            <button onclick="encrypt()" type="submit">确认修改</button>
        </div>
    </div>
    </form>
    
</div>
<script>
	//按过发送验证码的按钮之后，为两次输入的密码，以及网银的密码加密
	function encrypt(){
		var new_password=document.getElementById("raw_pass").value;
		var new_re_password=document.getElementById("new_pass").value;
		var new_bank_pass=document.getElementById("re_new_pass").value;
		var value1="",value2="",value3="";//三个密码转化过后的数据
		for(var i=0;i<new_password.length;i++){
			value1+=new_password.charCodeAt(i);
		}
		for(var i=0;i<new_re_password.length;i++){
			value2+=new_re_password.charCodeAt(i);
		}
		for(var i=0;i<new_bank_pass.length;i++){
			value3+=new_bank_pass.charCodeAt(i);
		}
		document.getElementById("raw_pass").value=value1;
		document.getElementById("new_pass").value=value2;
		document.getElementById("re_new_pass").value=value3;
	}
</script>
</body>
</html>