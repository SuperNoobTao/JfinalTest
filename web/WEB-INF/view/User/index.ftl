
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../static/css/flaticon/flaticon.css">
    <link rel="stylesheet" type="text/css" href="../static/css/common/reset.css">
    <link rel="stylesheet" type="text/css" href="../static/css/common/public.css">
    <link rel="stylesheet" type="text/css" href="../static/css/common/media856.css">
    <link rel="stylesheet" type="text/css" href="../static/css/common/content.css">
</head>
<body>
<div class="line">
    <h1>新增活动</h1>

</div>
<table class="tableA">
    <tbody>
    <tr>
        <td>
            项目名称:
        </td>
        <td>
            <input id="name" />
        </td>
    </tr>
    </tr>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="4" style="text-align: center">
            <button type="button" onclick="history.go(-1)" style="color:#000000" class="btn ui-white">返回</button>
            <button type="button" onclick="update()" class="btn ui-green">提交修改</button>
        </td>
    </tr>
    </tfoot>


</table>
<script src="../static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="../static/js/common/ui.js"></script>

<script>


    function update(){
        if(confirm("您确认要新增活动吗?修改为" +
                        "\r\n项目名:"+$("#name").val()
                )) {

            $.ajax({
                type: "post",
                url: "addactivityapi.action",
                dataType: "json",
                timeout: 200000,
                data: {
                    name:$("#name").val()
                },
                success: function (data) {

                    if (data.state == '00000') {
                        alert("操作成功");
                        location.reload(false);
                    }
                    else if (data.state == '20001') {
                        alert("登入过期,请重新登入");
                        location.href = "index.action";
                    }
                    else if(data.state=='10000'){
                        alert("系统故障");
                    }
                    else {
                        alert(data.message);
                    }

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("网络异常");
                }
            });

        }
    }


</script>

</body>
</html>

