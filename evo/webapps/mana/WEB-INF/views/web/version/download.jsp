<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@page import="java.util.List"%>
<%@page import="cn.finalist.msl.entity.App"%>
<%@page import="cn.finalist.msl.entity.Version"%>
<%@page import="cn.finalist.msl.service.VersionService"%>
<%@page import="cn.finalist.msl.service.impl.VersionServiceImpl"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="/include/taglibs.jsp" %>
<script type="text/javascript" src="${ctx}/jslib/jquery/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=4.0, user-scalable=no">
	<title>客户端下载</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/pro.css" />
</head>
<script type="text/javascript">
	     function test(appCode,type,approveFlag,index){   
		    if(approveFlag == 0){
		      alert("该应用为子应用，无法下载!");
		    }else{
		         if(type == "android"){
		         	window.location = "${app}/"+$("#version_"+index).val()+"/"+appCode+"/version_down";
		         }else if(type == "ios"){
		         	 window.location = "${app}/"  + appCode +"/"+type+ "/versionList";
		         }
			  //   window.location =" ${app}/"+"${version.code}/"+"${version.appPlatform.app.appCode}/"+"version_down";
		    }
	     }
	    
		 $(function(){
		/* 		var sw = $(window).width();
				var sh = $(window).height();
		 	    $('#content').append("<div class='point-img'><img src='${ctx}/static/PCload/bg1.png'></div>");
		    	$('#subBg').width(sw);
			    $('#subBg').height(sh); 
			    $('.active').mousedown(function(){
					$(this).css('background','#f5f5f5');
				})
				$('.active').mouseup(function(){
					$(this).css('background','');
				})     */
				var isOpenTip = is_weixin();
				if(isOpenTip){
				/*	$('#subBg').show();
					$('#subBg').click(function(){
						$(this).hide();
					});  */
					document.getElementById("bodyId").className="point";
					$(".point-img").css("display","block");
					$(".container").css("display","none");
				}else{
					$(".point-img").css("display","none");
					$(".container").css("display","block");
				     document.getElementById("bodyId").className="android";
				//	$("bodyId").css("background","");
				//	$("content").css("background","url(../images/download/bg.png)");
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
<body class="" id="bodyId">
 	<div id="content" class="container" style="display:none">
	<!--  <header> 
	    	<div class="head"><img src="${ctx}/static/PCload/logo1.png"></div>
	  	</header>  -->
	  	<footer style="bottom:2rem;">
	  			<c:if test="${!empty versions}"> 
					<c:forEach items="${versions}" var="version" varStatus="j">
					    	<input type="hidden" id="version_${j.index}" value="${version.code}"/>
					</c:forEach>
				</c:if>
		        <c:forEach items="${appList}" var="appAlias" varStatus="i">
					<div class="foot"><a href="###" onclick="test('${appAlias.appCode}','${type}','${appAlias.approveFlag}','${i.index}')" style="font-size:1.5rem;width:30%;padding:1rem;">安装app</a></div>
			    </c:forEach>
	    </footer>
	 </div>  
	 <div class="point-img" id="subBg" style="display:none"><img src="${ctx}/static/PCload/bg1.png"></div>
</body>
</html>