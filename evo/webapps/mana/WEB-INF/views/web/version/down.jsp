<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@ include file="/include/taglibs.jsp" %>
<script type="text/javascript" src="${ctx}/jslib/jquery/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
	<meta name="viewport" content="target-densitydpi=device-dpi,width=device-width, initial-scale=1, user-scalable=no">
	<title>版本列表</title>
	<style type="text/css">
		.all{
			font-size:18px;
			/**width:250px;***/
			width:100%;
			text-align:center;
		}
		.top{
			width:100%;
			height:30px;
			background:#c0c0c0;
		}
		.mid{
			width:100%;
		}
		.y{
			cursor:pointer;
			width:100%;
			height:50px;
			line-height:50px;
			background:#DCDCDC;
			margin-top:2px;
		}
		a { text-decoration: none} 
	</style>
</head>
<body>
	<iframe style="display:none;" id="xx" name="xx"></iframe>
	<div class="all">
		<div class="top">
			<div style="height:4px;"></div>
			<lable style="margin-top:10px;">${appAlias.appName}</label>
		</div>
	
		<div class="mid">
			<c:forEach items="${versions}" var="version">
				<div class="y"><a href="${app}/${version.code}/${version.appPlatform.app.appCode}/version_down">${version.appPlatform.platform.code}</a></div>
				<c:if test="${version.appPlatform.platform.code=='ios' || version.appPlatform.platform.code=='iphone' || version.appPlatform.platform.code=='ipad'}">
					<div class="y"><a href="${app}/${version.code}/${version.appPlatform.app.appCode}/version_down_pc">${version.appPlatform.platform.code} PC端下载</a></div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".y").each(
    			 function(){
     				$(this).bind("mouseover", function(){
      			 		$(this).css('background','#c0c0c0');
    				}); 
    				$(this).bind("mouseout", function(){
      			 		$(this).css('background','#DCDCDC');
    				});
    				$(this).mousedown(function(){
    					$(this).css('background','#c0c0c0');
    				});
    				$(this).mouseup(function(){
    					$(this).css('background','#DCDCDC');
    				});
     			}
			);
		});
	</script>
	
</body>
</html>