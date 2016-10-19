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
            项目名称:<input name="name" value="${name}"/>
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
<#list projects.list as p>
    <tr>
        <td>
        ${p.project_id}
        </td>
        <td>
            <input id="name${p.project_id}" value="${p.project_name}" placeholder="请在此键入活动名"/>
        </td>
        <td>
            <#if p.project_state == 0 >
                <input type="radio" id="state${p.project_id}" name="state${p.project_id}" value="0" checked/>已完成
                <input type="radio" id="state${p.project_id}" name="state${p.project_id}" value="1">进行中
            </#if>
            <#if p.project_state == 1 >
                <input type="radio" id="state${p.project_id}" name="state${p.project_id}" value="0"/>已完成
                <input type="radio" id="state${p.project_id}" name="state${p.project_id}" value="1" checked>进行中
            </#if>

        </td>

        <td>
            <button type="button" onclick="update(${p.project_id})" class="btn ui-green">修改</button>
        </td>
    </tr>

</#list >


</table>
<div class="line ui-pagenav">
<#if projects.pageNumber gt 1>
    <div class="left">
        <a onclick="gotopage(${projects.pageNumber}-1)">
            <i class="flaticon-left207"></i>
            <span>上一页</span>
        </a>
    </div>
</#if>


<#if projects.pageNumber lt projects.totalPage>
    <div class="right">
        <a onclick="gotopage(${projects.pageNumber}+1)">
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
        <a onclick="gotopage(${projects.totalPage})">
            <span>尾页</span>
        </a>
    </div>

</div>
<script src="../../../static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="../../../static/js/common/ui.js"></script>
<form method="post" action="/project" id="f" style="display: none">
    <input name="page" id="p"/>
    <input name="name" value="${name}"/>
</form>

<script>

    function gotopage(page) {
        $("#p").val(page);
        $("#f").submit();
    }


    function update(projectid) {
        var chkObjs = document.getElementsByName("state" + projectid);
        var radio;
        for (var i = 0; i < chkObjs.length; i++) {
            if (chkObjs[i].checked) {
                radio = chkObjs[i].value;
            }
        }

        if (confirm("您确认要修改编号为" + projectid + "的活动吗?修改为" +
                        "\r\n项目名称:" + $("#name" + projectid).val() +
                        "\r\n状态:" + radio    )) {
            $.ajax({
                type: "post",
                url: "project/update",
                dataType: "json",
                timeout: 200000,
                data: {
                    projectid: projectid,
                    name: $("#name" + projectid).val(),
                    state: radio
                },
                success: function (data) {

                    if (data.state == '00000') {
                        alert("操作成功");
                        location.reload(false);
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

