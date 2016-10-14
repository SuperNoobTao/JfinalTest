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
    <h1>你好-${staff.staff_name}-${today}</h1>

</div>
<br>
<button class="btn ui-green" type="submit">
    <a>
        查看历史记录
    </a>
</button>
<div class="line">

    <h1>工作日志</h1>

</div>

<table class="tableB">
    <#list works as w>
    <tbody>
    <tr>
        <td>
            项目名称:
        </td>
        <td>
            <select id="project${w.work_id}">
                <option value="${w.project_id}">${w.project_name}</option>
            <#list projects as p>
                <option value="${p.project_id}">${p.project_name}</option>
            </#list>
            </select>

        </td>

        <td>
            工作时长:
        </td>
        <td>
            <input id="time${w.work_id}" value="${w.work_time}"/>
        </td>

        <td>
            <button type="button" onclick="update(${w.work_id})" class="btn ui-green">提交修改</button>
            <button type="button" onclick="del(${w.work_id})" class="btn ui-red">删除</button>
        </td>
    </tr>
    </tbody>
    </#list>
</table>


<br><br><br><br><br>



<table class="tableA">

    <tbody>
    <tr>
        <td>
            项目名称:
        </td>
        <td>
            <select id="project">
                <option value="all">请选择项目</option>
            <#list projects as p>
                <option value="${p.project_id}">${p.project_name}</option>
            </#list>
            </select>

        </td>
    </tr>
    <tr>
        <td>
            工作时长:
        </td>
        <td>
            <input id="time"/>
        </td>
    </tr>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="4" style="text-align: center">
            <button type="button" onclick="history.go(-1)" style="color:#000000" class="btn ui-white">返回</button>
            <button type="button" onclick="insert()" class="btn ui-green">提交</button>
        </td>
    </tr>
    </tfoot>

</table>
<script src="../static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="../static/js/common/ui.js"></script>

<script>


    function insert() {
        if (confirm("您确认要新增活动吗?修改为" +
                        "\r\n项目名:" + $("#project").val() +
                        "\r\n工作时长:" + $("#time").val()
                )) {

            $.ajax({
                type: "post",
                url: "addwork",
                dataType: "json",
                timeout: 200000,
                data: {
                    projectid: $("#project").val(),
                    time: $("#time").val(),

                },
                success: function (data) {

                    if (data.state == '00000') {
                        alert("操作成功");
                        location.reload(true);
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
    function  del(workid) {

        if (confirm("您确认要删除 "+workid+"  吗?"
                )) {

            $.ajax({
                type: "post",
                url: "delwork",
                dataType: "json",
                timeout: 200000,
                data: {
                    workid: workid
                },
                success: function (data) {

                    if (data.state == '00000') {
                        alert("操作成功");
                        location.reload(true);
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
    function update(workid) {
        if (confirm("您确认要修改活动吗?修改为" +
                        "\r\n项目名:" + $("#project"+workid).val() +
                        "\r\n工作时长:" + $("#time"+workid).val()
                )) {

            $.ajax({
                type: "post",
                url: "updatework",
                dataType: "json",
                timeout: 200000,
                data: {
                    projectid: $("#project").val(),
                    time: $("#time").val(),

                },
                success: function (data) {

                    if (data.state == '00000') {
                        alert("操作成功");
                        location.reload(true);
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

