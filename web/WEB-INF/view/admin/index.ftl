
<!DOCTYPE html>
<html lang="zh-CN" debug='true' style="height: 100%">
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
 <title>后台管理系統</title>
 <link href="" rel="icon">
 <link rel="stylesheet" type="text/css" href="../../../static/css/flaticon/flaticon.css">
 <link rel="stylesheet" type="text/css" href="../../../static/css/common/reset.css">
 <link rel="stylesheet" type="text/css" href="../../../static/css/common/public.css">
 <link rel="stylesheet" type="text/css" href="../../../static/css/common/media856.css">
 <script src="../../../static/js/jquery/jquery-1.7.2.min.js"></script>
</head>
<body style="height: 100%">
<div class="topbar">
 <div class="left menutoggler">
  <i class="flaticon-list95"></i>
 </div>
 <!-- <img src="../resource/img/logo.png" class="logo" /> -->

 <div class="right">
  <div class="navblock" style="display:none" ><i class="flaticon-contacts1"></i></div>
  <div class="navblock" style="display:none"><i class="flaticon-opened4"></i></div>
  <div class="navblock" style="display:none">
   <i class="flaticon-notify"></i>
   <i class="flaticon-social11 noticenumbox"></i>
   <span class="noticenum">10</span>
  </div>
  <div class="navblock usermenutoggler">Welcome</div>
  <!-- <div class="portrait usermenutoggler">
    <img src="../resource/img/portrait.jpg" alt="">
  </div> -->
 </div>
</div>

<div class="leftside">
 <div class="search">
  <p class="logo">后台管理系统</p>
 </div>
 <ul class="menu">

  <li class="havesub">
   <a>
    <span class="icon"><i class="flaticon-house3"></i></span>
    <span class="title">员工管理管理</span>
         <span class="arrow">
          <i class="flaticon-previous2"></i>
          <i class="flaticon-expand38"></i>
        </span>
   </a>
   <ul class="submenu">
    <li data-href="staff"><a>查看员工</a></li>
   </ul>
  </li>


  <li class="havesub">
   <a>
    <span class="icon"><i class="flaticon-tool14"></i></span>
    <span class="title">项目管理</span>
         <span class="arrow">
          <i class="flaticon-previous2"></i>
          <i class="flaticon-expand38"></i>
        </span>
   </a>
   <ul class="submenu">
    <li data-href="project"><a>查看项目</a></li>
   </ul>
  </li>

  <li class="havesub">
   <a>
    <span class="icon"><i class="flaticon-tool14"></i></span>
    <span class="title">工作管理</span>
         <span class="arrow">
          <i class="flaticon-previous2"></i>
          <i class="flaticon-expand38"></i>
        </span>
   </a>
   <ul class="submenu">
    <li data-href="#"><a>工作日报</a></li>

   </ul>
  </li>

  <li>
   <a>
    <span class="icon"><i class="flaticon-star8"></i></span>
    <span class="title">管理员管理</span>
          <span class="arrow">
          <i class="flaticon-previous2"></i>
          <i class="flaticon-expand38"></i>
        </span>
   </a>
   <ul class="submenu">
    <li data-href="#"><a>管理员管理</a></li>
   </ul>
  </li>


 </ul>
</div>

<div class="rightside">
 <ul class="menu">

  <li class="havesub">
   <a id="changepasswordbtn">
    <span class="icon"><i class="flaticon-key196"></i></span>
    <span class="title">更改密码</span>
   </a>
  </li>
  <li>
   <a id="signout" href="logout.action">
    <span class="icon"><i class="flaticon-sign4"></i></span>
    <span class="title">登出</span>
   </a>
  </li>
 </ul>
</div>

<div class="content" id="content">
 <iframe src="" width="100%" height="100%" frameborder="0"></iframe>
</div>
<div class="masklayer">
 <div class="alertbox">
  <div class="title"><span>Select Department</span>
   <i class="flaticon-cancel33"></i>
  </div>
  <div class="cont">
  </div>
  <div class="btngroup">
   <a class="btn confirmbtn" style="background-color:#dd4340;color:#fff;" onclick="changepass()">确认</a>
   <a class="btn cancelbtn">取消</a>
   <a class="btn okbtn"></a>
  </div>
 </div>
 <div class="loadingbox">
  <!-- <img src="../resource/img/loading.gif"></div> -->
 </div>
</div>
<div class="loadinglayer"></div>
<!-- 弹出的窗口需要嵌入的代码 弹出方法见下一个注释 -->
<div class="masklayercont">
 <table class="ui-message" id="infomessage">
  <tr>
   <td class="tipicon infocolor"><i class="flaticon-info27"></i></td>
   <td class="tipword">
    <p>Info</p>
    <p>This is an informative message.</p>
   </td>
  </tr>
 </table>
 <table class="ui-message" id="successmessage">
  <tr>
   <td class="tipicon successcolor"><i class="flaticon-circle108"></i></td>
   <td class="tipword">
    <p>Success!</p>
    <p>This is a successful message.</p>
   </td>
  </tr>
 </table>
 <table class="ui-message" id="errormessage">
  <tr>
   <td class="tipicon errorcolor"><i class="flaticon-close12"></i></td>
   <td class="tipword">
    <p>Error!</p>
    <p>This is a error message.</p>
   </td>
  </tr>
 </table>
 <table class="ui-message" id="warnmessage">
  <tr>
   <td class="tipicon errorcolor"><i class="flaticon-triangle38"></i></td>
   <td class="tipword">
    <p>Warning</p>
    <p>This is a warning message.</p>
   </td>
  </tr>
 </table>
 <form method="post" action="" id="f2" >
  <table id="changepasswordtable" class="formtable" style="width:520px;margin-left:30px;">


   <tr>
    <td width="155">
     旧密码
     <input name="ispass"  type="hidden" value="1" ></input>
     <input name="oldpass" id="o2" type="hidden" value="1" ></input>
    </td>
    <td><input  id="o1" type="password" ></input></td>
   </tr>
   <tr>
    <td>新密码</td>
    <td>
     <input  id="n1" type="password" ></input>
     <input name="newpass" id="n3" type="hidden" value="1" ></input>
    </td>
   </tr>
   <tr>
    <td style="vertical-align:top;padding-top:20px;">
     请再次输入新密码
    </td>
    <td>
     <input name="repeatnewpassword" id="n2" type="password" ></input>
    </td>
   </tr>


  </table>
 </form>
 <!--
   //方法：首先克隆你想要的内容代码，然后调用artalert函数
   //artalert函数接受3个参数，
   //第一个参数是alert框的标题
   //第二个参数是你复制的内容
   //第三个参数可不传入；若传入则只显示一个按钮；
   //请把alert需要展示的内容写在.masklayercont里；
   //各个页面所需alert内容不同，建议不写在public.html里，而是写在所需页面里，这里只作example
   //下面是相关js代码
   var cont = $("#suremessage").clone();
       artalert("Success!",cont,"OK");
 -->
</div>

<div class="ui-scroll"></div>
<script src="../../../static/js/common/public.js"></script>

<script src="../../../static/md5.js" ></script>

</body>
</html>