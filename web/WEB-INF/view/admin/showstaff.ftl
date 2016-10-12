
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
        <th>编号</th>
        <th>账号</th>
        <th>姓名</th>

    </tr>
    <#list staffs as staffs>
   <tr>
            <td>
            ${staffs.staff_id}
            </td>
            <td>
            ${staffs.staff_account}
            </td>
            <td>
            ${staffs.staff_name}
            </td>

        </tr>

    </#list>

</table>
<div class="line ui-pagenav">

</div>
<script src="../../../static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="../../../static/js/common/ui.js"></script>






</body>
</html>

