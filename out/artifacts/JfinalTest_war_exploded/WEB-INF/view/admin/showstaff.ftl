
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../../../static/css/flaticon/flaticon.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/common/reset.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/common/public.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/common/media856.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/common/content.css">
</head>
<body>
<div class="line">
    <h1>员工列表</h1>

    <form action="#" method="post" enctype="multipart/form-data">
        <div class="line">
            员工列表
            <a class="btn file ui-white">
                导入
                <input type="file" name="file" data-maxsize="1000000" />
            </a>

            <br />
            <button class="btn ui-green" type="submit">
                <a>
                    提交
                </a>
            </button>

        </div>
    </form>

</div>


    <form method="post" action="showstuff.action">
        <tr>
            <td>
                账号:<input name="workno" value=""/>
            </td>
            <td>
                姓名:<input name="realname" value="" />
            </td>



            <td>
                <button type="submit" class="btn ui-green">搜索</button>
            </td>
        </tr>
    </form>
   <br>

<table class="tableA">
    <tr>
        <th>员工编号</th>
        <th>员工账号</th>
        <th>员工名</th>
        <th>编辑</th>
    </tr>
<#list staffs as s>
    <tr>
        <td>
        ${s.staff_id}
        </td>
        <td>
        ${s.staff_account}
        </td>
        <td>
        ${s.staff_name}
        </td>

        <td>
            <button type="button" onclick="location.href='/work/staff_work?staffid='+${s.staff_id}" class="btn ui-green">查看</button>
        </td>
    </tr>

</#list >



</table>
<div class="line ui-pagenav">

</div>
<script src="../../../static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="../../../static/js/common/ui.js"></script>

<script>
    function query(staffid){
        if(confirm("您确认要查看编号为"+staffid+"的员工吗?" )) {

            $.ajax({
                type: "post",
                url: "updateactivity.action",
                dataType: "json",
                timeout: 200000,
                data: {
                    activityid:activityid,

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

        }}

</script>



</body>
</html>

