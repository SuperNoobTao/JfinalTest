<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../../../static/css/flaticon/flaticon.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/common/reset.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/common/public.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/common/media856.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/common/content.css">
    <style>
        input[type="radio"] {
            -webkit-appearance: radio;
            width: 15px;
            height: 15px;
        }
    </style>
</head>
<body>
<div class="line">
    <h1>项目列表</h1>
    <button class="btn ui-green"
            onclick="location.href='project/addui'"
    >
        新增
    </button>

</div>


<form action="" method="post">
    <tr>
        <td>
            项目名称:<input name="name" value=""/>
        </td>
        <td>
            <input id="startdate" type="date" required/>
        </td>
        <td colspan="6" style="text-align: left">
            <input name="page" value="1" type="hidden"/>
            <button type="submit" class="btn ui-green">搜索</button>
        </td>


    </tr>
</form>
<br>
<table class="tableA">
    <tr>
        <th>项目编号</th>
        <th>项目名</th>
        <th>状态</th>
        <th>编辑</th>
    </tr>
<#list projects as p>
    <tr>
        <td>
        ${p.project_id}
        </td>
        <td>
            <input id="name${p.project_name}" value="${p.project_name}" placeholder="请在此键入活动名"/>
        </td>
        <td>
            <#if p.project_state == 0 >
                <input type="radio" name="state${p.project_id}" value="${p.project_state}" checked/>已完成
                <input type="radio" name="state${p.project_id}" value="${p.project_state}">进行中
            </#if>
            <#if p.project_state == 1 >
                <input type="radio" name="state${p.project_id}" value="${p.project_state}" />已完成
                <input type="radio" name="state${p.project_id}" value="${p.project_state}" checked>进行中
            </#if>

        </td>

        <td>
            <button type="button" onclick="update(${p.project_id})" class="btn ui-green">修改</button>
        </td>
    </tr>

</#list >


</table>

<script src="../../../static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="../../../static/js/common/ui.js"></script>


<script>


    function update(activityid) {
        if (confirm("您确认要修改编号为" + activityid + "的活动吗?修改为" +
                        "\r\n活动名:" + $("#name" + activityid).val() +
                        "\r\n活动内容:" + $("#content" + activityid).val() +
                        "\r\n参与分组:" + $("#groupname" + activityid + " option:selected").text() +
                        "\r\n开始日期:" + $("#startdate" + activityid).val() +
                        "\r\n结束日期:" + $("#finishdate" + activityid).val()
                )) {

            $.ajax({
                type: "post",
                url: "updateactivity.action",
                dataType: "json",
                timeout: 200000,
                data: {
                    activityid: activityid,
                    name: $("#name" + activityid).val(),
                    content: $("#content" + activityid).val(),
                    groupid: $("#groupname" + activityid).val(),
                    startdate: $("#startdate" + activityid).val(),
                    finishdate: $("#finishdate" + activityid).val()
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
                    else if (data.state == '10000') {
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

