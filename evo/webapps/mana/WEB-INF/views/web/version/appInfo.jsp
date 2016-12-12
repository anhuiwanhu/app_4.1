<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@ include file="/include/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=4.0, user-scalable=no">
	<title>客户端下载</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/pro.css" />
</head>
<script type="text/javascript" src="${ctx}/jslib/jquery/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
			var sw = $(window).width();
			var sh = $(window).height();
			$('body').append("<div id='subBg' style='position:fixed; left:0; top:0; background:rgba(0,0,0,0.8);z-index:9999; cursor:default;width:100%;height:100%;display:none;'><p style='text-align:center; color:#fff;font-size:16px;font-family:microsoft yahei; display:block;line-height:2em;padding-top:70px;'>非常抱歉，微信不允许直接下载，请点击“...”并选择在浏览器中打开</p></div>");
			$('#subBg').width(sw);
			$('#subBg').height(sh); 
			
			$('.active').mousedown(function(){
				$(this).css('background','#f5f5f5');
			})
			$('.active').mouseup(function(){
				$(this).css('background','');
			})
			var isOpenTip = is_weixin();
			if(isOpenTip){
				$('#subBg').show();
				$('#subBg').click(function(){
					$(this).hide();
				});
				$(".container").css("display","none");
			}else{
				$(".container").css("display","block");
			}

		})

	//判断是否微信
	function is_weixin(){
		var ua = navigator.userAgent.toLowerCase();
		if(ua.match(/MicroMessenger/i)=="micromessenger") {
			return true;
		} else {
			return false;
		}
	}
</script>
<!-- <body>
	<header>
		<div class="title">${appAlias.appName}</div>
		<div class="back">
			<a href="javascript:void(window.history.back())"><img src="${ctx}/images/download/CZicon_ht.png" /></a>
		</div>
	</header>
	<div id="content" class="container">
	   <c:forEach items="${versions}" var="version">
	   <c:if test="${version.appPlatform.platform.code== type}">
	   
			<div class="appInfo">
				<div class="appIcon"></div>
				<div class="appIntroduce">
					<p>${version.appPlatform.platform.code}</p>
					<div><p></p><p></p><p></p><p></p><p></p></div>
					<div><span>为您提供方便的移动办公</span></div>
				</div>
				<div class="downIcon"><a href="${app}/${version.code}/${version.appPlatform.app.appCode}/version_down"><img src="${ctx}/images/download/sj_xzan01.png" /></a></div>
			</div>
	   </c:if>
	
	   </c:forEach>
	</div>	
</body>   -->
<body class="ios">
	<div class="ios-img"><img src="${ctx}/static/PCload/bg3.png"></div>
	<div id="content" class="container">
		<c:forEach items="${versions}" var="version">
			<c:if test="${version.appPlatform.platform.code== type}">
				<div class="foot"><a href="${app}/${version.code}/${version.appPlatform.app.appCode}/version_down" style="font-size:2rem;width:40%;padding-bottom:1rem;">立即安装</a></div>
			</c:if>
		</c:forEach>
	</div>
</body>
</html>