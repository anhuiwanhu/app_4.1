<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@ include file="/include/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=4.0, user-scalable=no">
	<title>客户端下载</title>
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/static/PCload/down.css">
</head>
<body>
	<div class="top">
		<div class="top_title">${appAlias.appName}</div>
	</div>
	<div class="content">
		<div class="bound">
			<div class="app_detailed">
				<div class="app_icon">
					<div class="zsy_icon"><img src="${ctx}/static/PCload/icon.png"></div>
				</div>
				<div class="app_det">
					<div class="app_name">${appAlias.appName}</div>
					<div class="app_level">
						<p><img src="${ctx}/static/PCload/tb_xx.png"></p>
						<p><img src="${ctx}/static/PCload/tb_xx.png"></p>
						<p><img src="${ctx}/static/PCload/tb_xx.png"></p>
						<p><img src="${ctx}/static/PCload/tb_xx.png"></p>
						<p><img src="${ctx}/static/PCload/tb_xx.png"></p>
					</div>
					<div style="clear: both;overflow:hidden;height: auto;">
						<div class="app_instr">
							<div class="app_instruction">
								<p>版&nbsp;本&nbsp;号：</p>
								<p>${versionCode }</p> 
							</div>
						
						</div>
						<div class="app_instr">
							<div class="app_instruction">
								<p>语&nbsp;&nbsp;&nbsp;&nbsp;言：</p>
								<p>简体中文</p> 
							</div>
							
						</div>
					</div>
				</div>
				<div class="app_inst_right"> 
				</div> 
			</div>  
			<div class="apps_title">
				应用下载
			</div>
			<div class="apps_downLoad">
			 <c:forEach items="${versions}" var="version">
			   <c:if test="${version.appPlatform.platform.code=='android'}">
					<div class="app" style="border-right:1px dashed #ccc;">
						<div style="padding-left:30px;"><img src="${ctx}/static/PCload/img_Android.png"></div>
						<div style="padding-top:20px;padding-left:33px;cursor: pointer;"><a href="${app}/${version.code}/${version.appPlatform.app.appCode}/version_down" target="blank"><img src="${ctx}/static/PCload/an_Android.png"></a></div>
					</div>
				</c:if>
				<c:if test="${version.appPlatform.platform.code=='ios'}">
					<div class="app" style="border-right:1px dashed #ccc;"> 
						<div><img src="${ctx}/static/PCload/img_iphone.png"></div>
						<div style="padding-top:20px;padding-left:33px;cursor: pointer;"><a href="${app}/${version.code}/${version.appPlatform.app.appCode}/version_down_pc" target="blank"><img src="${ctx}/static/PCload/an_iphone.png"></a></div>
					</div>
				</c:if>
			</c:forEach>
				<div class="app">
					<div style="padding-left:10px;"><img src="${ctx}/static/file/qrcode/${versions[0].appPlatform.app.appCode}/qrcode.png" width="178"></div>
					<div style="padding-top:20px;padding-left:33px;cursor: pointer;"><img src="${ctx}/static/PCload/erwmsm.png"></div>
				</div>
			</div>
		</div>
	</div>

</body></html>