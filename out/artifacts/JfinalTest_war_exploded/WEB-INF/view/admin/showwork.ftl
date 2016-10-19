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
                员工名:<input name="name" value="${name}"/>
            </td>
            <td>
                <input id="date" name="date" type="date" value=${date}/>
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
<#list works.list as w>
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
<div class="line ui-pagenav">
<#if works.pageNumber gt 1>
    <div class="left">
        <a onclick="gotopage(${works.pageNumber}-1)">
            <i class="flaticon-left207"></i>
            <span>上一页</span>
        </a>
    </div>
</#if>


<#if works.pageNumber lt works.totalPage>
    <div class="right">
        <a onclick="gotopage(${works.pageNumber}+1)">
            <i class="flaticon-right218"></i>

            <span>下一页</span>
        </a>
    </div>
</#if>

    <div class="sy">
        <a onclick="gotopage(1)">
            <span>首页</span>
        </a>
    </div>


    <div class="wy">
        <a onclick="gotopage(${works.totalPage})">
            <span>尾页</span>
        </a>
    </div>

</div>
<script src="../../../static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="../../../static/js/common/ui.js"></script>
<form method="post" action="/work" id="f" style="display: none">
    <input name="page" id="p"/>
    <input name="name" value="${name}"/>
    <input name="date" value="${date}"/>
</form>

<script>
    function gotopage(page) {
        $("#p").val(page);
        $("#f").submit();
    }
</script>

</body>
</html>

