<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/tarefas.css">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.js"></script>
</head>
<body>
	<h3>Alterar tarefa - ${tarefa.id}</h3>
	<form action="alteraTarefa" method="post">
		<input type="hidden" name="id" value="${tarefa.id}">
		
		Descricao: <br />
		<textarea name="descricao" rows="5" cols="100">
			${tarefa.descricao}
		</textarea> <br />
		
		Finalizado? <input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado?'checked':''} /> <br />
		
		Data de Finalizacao: <br />
		<fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataFinalizacao.time}" var="formatedDate" />
		<caelum:campoData id="dataFinalizacao" value="${formatedDate}" />
		<br />
		
		<input type="submit" value="Alterar">
	</form>
</body>
</html>