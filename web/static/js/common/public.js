
$(function(){
	// 设置iframe高度
	var innerh = $("#content").height()-parseInt($("#content").css("padding-top"))-20;
	$("#content iframe").height(innerh);
	// 菜单开关控制函数
		var menuclose = localStorage.getItem("menuclose")?localStorage.getItem("menuclose"):false;
		//如果页面宽度小于986px则关闭菜单，若上一次菜单是关闭的则这次打开同样保持关闭
		if(986>=$("body").width()){
			$("body").addClass('menuclose');
		}
		else{
			if(menuclose){
				$("body").addClass('menuclose');
			}
		}
	// 从本地读取pagehref变量，若没有则加载welcome/welcome
	var pagehref = sessionStorage.getItem("pagehref")?sessionStorage.getItem("pagehref"):"showstuff.action?minscore=0&maxscore=99999999&page=1&order=user_id%20asc";
	setmenuliclass(pagehref);
	$("#content iframe").attr("src",pagehref);
	pagehref = null;
	
	//检测设备旋转
	// $(window).bind("orientationchange",function(){
	// 	setcontentheight();
	// });
		$(".menutoggler").bind("click",function(e){
		    if($("body").hasClass('menuclose')){
		    	localStorage.removeItem("menuclose");
		    }
		    else{
		    	localStorage.setItem("menuclose","true");
		    }
		    $("body").removeClass('usermenuopen').toggleClass("menuclose");
		});
		$(".usermenutoggler").bind("click",function(e){
			$("body").addClass("menuclose").toggleClass('usermenuopen');
		})
		//菜单点击的一系列事件
		$(".leftside .menu li").bind("click",function(e){
			var t = e.target||e.srcElement;
			//只有当点击的元素是menu直接子元素时
			if($(t).closest('ul').hasClass('menu')){
				if($(this).children("ul").hasClass('submenu')){}
				else{
					$(this).siblings().find(".submenu li").removeClass('set');
				}
				$(this).toggleClass('open');
			}
			//被点的是子菜单
			else{
				$(this).closest(".menu").find(".submenu li").removeClass('set');
				$(t).closest("li").addClass('set');
			}
		})
		$(".rightside .menu li").bind("click",function(e){
			var t = e.target||e.srcElement;
			//只有当点击的元素是menu直接子元素时
			if($(t).closest('ul').hasClass('menu')){
				if($(this).children("ul").hasClass('submenu')){}
				else{
					// $(this).siblings().find(".submenu li").removeClass('set');
				}
				$(this).toggleClass('open');
			}
			//被点的是子菜单
			else{
				// $(this).closest(".menu").find(".submenu li").removeClass('set');
				// $(t).closest("li").addClass('set');
			}
		})

			// 清除touchend和click对滑动与拖动的影响
			var istouchmove = false;
			$(document).on('touchmove',"[data-href]",function(e){
				istouchmove = true;
			})
			// 给所有含有data-href属性的元素绑定跳转页面事件
		 	$(document).on('click',"[data-href]",function(e){
		 		if(istouchmove){
		 			istouchmove = false;
		 		}
		 		else{
		 			e.stopPropagation();
		 			var pagehref = $(this).attr("data-href");
		 			$(this).loadpage();
		 		}
			});
		//给所有contline中的展开、关闭icon绑定函数
		$(document).on("click",".contline .td1 i",function(e){
			e.stopPropagation();
			$(this).closest('.contline').toggleClass('open');
		});
		//屏蔽迅雷插件给页面带来的影响
		$("[id^='xunlei']").remove();

		
		//给innerbox里的line绑定函数，选中添加set类
		$(document).on("click",".ctrlbox .left .line,.ctrlbox .right .rleft .line",function(){
			$(this).addClass("set").siblings(".line").removeClass('set');
		})
		//给innerbox里的contline绑定函数，选中添加set类
		//请把属于一个系列的contline放到同一个.scrollbox里
		$(document).on("click",".contline",function(e){
			e.stopPropagation();
			$(this).closest(".scrollbox").find(".contline").removeClass('set');
			$(this).addClass("set");
		})

		

})
/*
 	下面定义一些公关的函数
*/	

	// 下拉菜单绑定函数，请统一用.selector表示
		$(document).on("click",".selector",function(e){
			if($(this).hasClass('disabled')){}
			else{
				var t = $(this), target = e.target||e.srcElement;
			    t.toggleClass('open');
			    $(".selector").not(this).removeClass('open');
			    e.stopPropagation();
			    $(document).one("click",function(){
			        t.removeClass('open');
			    })
			}
		})
		$(document).on("click",".selector>ul>li",function(e){
			e.stopPropagation();
			var value = $(this).attr("data-value")?$(this).attr("data-value"):$(this).text();
			$(this).closest('ul').siblings("span").html(value);
			$(this).addClass("selected").siblings('li').removeClass('selected');
			$(".selector").removeClass('open');
		})
		
	// 载入新页面函数
	// 点击时调用
	$.fn.loadpage=function(){
			var pagehref = $(this).attr("data-href");
			var pagehrefid = $(this).attr("data-hrefid")?$(this).attr("data-hrefid"):$(this).attr("data-href");
			if(pagehref){
				$("#content iframe").attr("src",pagehref);
				setmenuliclass(pagehrefid);
				sessionStorage.setItem("pagehref",pagehrefid);
				if(986>=$("body").width()){
					$("body").addClass('menuclose');
				}
			}
		}
	//给scrolltop绑定函数
	$(window).bind("scroll.top",function(){
		var top = $(window).scrollTop();
		top > 150 ? $('.ui-scroll').fadeIn() : $('.ui-scroll').fadeOut();
	});
	$('.ui-scroll').on("click", function(e){
		$('html,body').animate({scrollTop:0},300);
	});
	//悬浮层
	//悬浮层的关闭 × 按钮和取消按钮
	$(".masklayer .title i,.masklayer .btngroup .cancelbtn").on("click",function(e){
		artalerthide();
	})
	//悬浮层出现
	//调用方法，首先克隆你想要的内容代码，然后调用artalert函数
	  //artalert函数接受3个参数，
	  //第一个参数是alert框的标题
	  //第二个参数是你复制的内容
	  //第三个参数可不传入；若传入则只显示一个按钮；
	//下面是相关js代码
	  // var cont = $("#suremessage").clone();
	  // artalert("Success!",cont,"OK");
	function artalert(title,cont,btngroup){
		artalerthide();
		$(".masklayer .title>span").html(title);
		//请使用appendTo方法插入内容
		cont.appendTo('.masklayer .cont');
		if(btngroup){
			$(".masklayer").addClass('showokbtn').find(".okbtn").empty().text(btngroup);
		}
		$(".masklayer").addClass('show');
		$("body").addClass("notscroll");
	}
	//悬浮层初始化，兼具悬浮层消失功能
	function artalerthide(){
		$(".masklayer").removeClass("show").removeClass('showokbtn');
		$(".masklayer .title>span").empty();
		$(".masklayer .cont").empty();
		$(".masklayer .confirmbtn").unbind();
		$(".masklayer .okbtn").unbind();
		$("body").removeClass("notscroll");
	}
	//设置内容高度函数
	function setcontentheight(){
		var H = $(window).height();
		var a=(986>=$("body").width())?44:0;
		$("#content").css("min-height",H-a);
		$("*[data-subheight]").each(function(){
			$(this).css("height",H-$(this).attr('data-subheight')+'px');
		});
	}
	// #content加载页面后调用的菜单加样式函数
	function setmenuliclass(pagehref,id){
		var li = $("li[data-href='"+pagehref+"']");
		if(li.closest('ul').hasClass('submenu')){
			li.closest('.menu').find(".submenu li").removeClass('set');
			li.addClass('set').closest('ul').closest('li').addClass('open');
			$(".menu li").removeClass('lipage');
		}
		else{
			li.addClass("lipage").siblings('li').removeClass('lipage');
		}
	}
	//.ui-checkbox联动检查函数，传入一个jQuery对象，包含任意个.allcheckbox，
	//将检查这些.allcheckbox的次级.ui-checkbox
	//并给.allcheckbox添加正确的类
	//任意一个若被改变，则返回true；若未改变，返回false
	function checkboxcheck(obj,s){
		$.each(obj,function(i){
			var _s = s?s:$($(this).attr("data-scope"));
			var count = _s.find('.ui-checkbox').length,
			checknum = _s.find('.ui-checkbox.checked').length;
			if(count == checknum){
				$(this).removeClass("state2").addClass('checked');
			}
			else if(checknum !=0){
				$(this).removeClass('checked').addClass("state2");
			}
			else{
				$(this).removeClass("state2").removeClass('checked');
			}
		})
	}

	// 通用下拉刷新函数
	$.fn.getscrolldata = function(url,params){
		var $this = $(this);
		$.get(url, params, function(data) {
			$this.append(data);
		});
	}






