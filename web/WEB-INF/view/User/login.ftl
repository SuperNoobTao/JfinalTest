
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Log In</title>

    <link rel="stylesheet" type="text/css" href="../../../static/css/common/reset.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/login/login.css">
</head>

<body>
<section class="logo-wrapper">
    <div class="brand-top"></div>
    <div class="brand-middle">

    </div>
</section>
<section class="login-wrapper">
    <div class="login-panel">
        <div class="login-title">
            <p>工作管理系统</p>
            <p>V1.0</p>
        </div>
        <div class="login-img" style="display: none">
            <img style="float:right;width: 100px;height: 100px;border-radius: 50px;margin-top:30px;" src="">

        </div>

        <div class="login-submit">
            <form action="admin" method="post">
                <label class="sign-in">登陆</label>
                <input type="text" name="account" placeholder="账号" id="account">
                <input type="password" name="pwd" placeholder="密码" id="password">
                <input class="btn-red" type="submit" value="Login">
            </form>

        </div>

        <div class="login-copyright">
            <p>Copyright 2016 Spreadtrum</p>
            <p>All rights reserved</p>
            <div class="clear"></div>
            <ul class="items">
                <!-- <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms of Use</a></li>
                <li><a href="#">Support</a></li> -->
            </ul>
        </div>
    </div>
</section>
<section class="brand-wrapper">
    <div class="brand-bottom"></div>
</section>
<script type="text/javascript" src="static/js/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="static/js/login/login.js"></script>
<script type="text/javascript" src="static/md5.js"></script>
<script>

    $("#loginbtn").bind('click',function() {

        username=$("#username").val();
        pass=hex_md5($("#password").val());

        $.ajax({
            type: "POST",
            dataType:"json",
            url: "admin/login.action",
            data: "username="+username+"&password="+pass,
            success: function(data){
                switch(data.state){
                    case "00000":
                        window.location.href="admin/index.action";
                        //alert("login success");
                        break;
                    case "20000": alert("账号或密码错误");break;
                    case "10000":alert("系统故障");
                }
            },
            error: function(data){
                alert("网络异常");
            }
        });

    })

</script>

</body>
</html>