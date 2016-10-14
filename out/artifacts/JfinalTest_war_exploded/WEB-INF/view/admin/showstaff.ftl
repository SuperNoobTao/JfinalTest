
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

    <form action="/staff" method="post" enctype="multipart/form-data">
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


    <form method="post" action="/staff">
        <tr>
            <td>
                姓名:<input name="name" value="${name}" />
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
<#list staffs.list as s>
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
    <#if staffs.pageNumber gt 1>
        <div class="left">
            <a onclick="gotopage(${staffs.pageNumber}-1)">
                <i class="flaticon-left207"></i>
                <span>上一页</span>
            </a>
        </div>
    </#if>


    <#if staffs.pageNumber lt staffs.totalPage>
        <div class="right">
            <a onclick="gotopage(${staffs.pageNumber}+1)">
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
        <a onclick="gotopage(${staffs.totalPage})">
            <span>尾页</span>
        </a>
    </div>

</div>
<script src="../../../static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="../../../static/js/common/ui.js"></script>
<form method="post" action="/staff" id="f" style="display: none">
    <input name="page" id="p"/>
    <input name="name" value="${name}"/>

</form>
<script>

    function gotopage(page){
        $("#p").val(page);
        $("#f").submit();
    }

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

