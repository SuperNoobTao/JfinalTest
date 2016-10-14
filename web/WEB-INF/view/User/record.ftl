
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
    <h1>当天工作列表</h1>

</div>
<table class="tableA">

    <form action="" method="post">
        <tr>
            <td>
                <input id="startdate" type="date" required/>
            </td>
            <td colspan="6" style="text-align: left">
                <input name="page" value="1" type="hidden"/>
                <button type="submit" class="btn ui-green">搜索</button>
            </td>
        </tr>
    </form>

    <tr>
        <th>员工id</th>
        <th>项目id</th>
        <th>工作时长</th>
        <th>日期</th>
    </tr>
<#list works as w>
    <tr>
        <td>
        ${w.staff_name}
        </td>
        <td>
        ${w.project_name}
        </td>
        <td>
        ${w.work_time}
        </td>
        <td>
        ${w.work_date}
        </td>

    </tr>

</#list >



</table>

<script src="../../../static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="../../../static/js/common/ui.js"></script>



<script>





</script>

</body>
</html>

