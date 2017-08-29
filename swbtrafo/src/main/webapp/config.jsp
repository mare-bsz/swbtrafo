<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="swbtrafo.css">
		<title>SWBtrafo - Datenverarbeitung im Web: Konfiguration der Pipeline</title>
	</head>
	<body>		
		<div>eingeloggt: ${pageContext.request.remoteUser}&nbsp;<a href="<c:url value='/logout' />">logout</a></div>
		<img src="logo.jpg" style="float: left; margin: 0 50px 30px 0;" />
		<h1>SWBtrafo - Datenverarbeitung im Web</h1>
		<h2>Konfiguration der Pipeline</h2>
		<div style="clear: both">				
			<p>Gewählte Pipeline: <c:out value="${pipeline.name}" /></p>
			<c:url value="/run" var="action">
				<c:param name="trafo" value="${param.trafo}" />
			</c:url>					
			<form enctype="multipart/form-data" action="${action}" method="post" accept-charset="utf-8">
				<div>					
					<div>
						<table>
						<c:forEach var="widget" items="${pipeline.configuration}" >
							<tr>
								<td>
									<label><c:out value="${widget.label}">: </c:out></label>
								</td>
								<td>
									<c:if test="${widget.typ eq 'text'}">
										<input type="text" id="${widget.name}" name="${widget.name}" />
									</c:if>
									<c:if test="${widget.typ eq 'file'}">
										<input type="file" name="${widget.name}"/>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>							
					</div>								
					<div>
						<input type="submit" value="Pipeline ausführen" style="margin: 30px;">
					</div>					
				</div>			
			</form>
		</div>
	</body>
</html>