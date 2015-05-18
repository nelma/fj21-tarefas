<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista Tarefas</title>

<link rel="stylesheet" type="text/css" href="resources/css/tarefas.css">
</head>
<body>
	
	<a href="novaTarefa">Criar nova tarefa</a>
	
	<br />
	
	<table>
		<tr>
			<th>Id</th>
			<th>Descricao</th>
			<th>Finalizado</th>
			<th>Data de finalizacao</th>
			<th>Alterar</th>
			<th>Remover</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr id="tarefa_${tarefa.id}">
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				
				<c:if test="${tarefa.finalizado eq true }">
					<td>Finalizado</td>
				</c:if>

				<c:if test="${tarefa.finalizado eq false }">
					<td>
						<a href="#" onclick="finalizaAgora(${tarefa.id})">Finalizar</a>
					</td>
				</c:if>

				<td>
					<fmt:formatDate value="${tarefa.dataFinalizacao.time }"
					pattern="dd/MM/yyyy"/>
				</td>
				<td>
					<a href="mostraTarefa?id=${tarefa.id}">Alterar</a>
				</td>
				<td>
					<a href="removeTarefa?id=${tarefa.id}">Remove</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<script type="text/javascript" src="resources/js/jquery.js"></script>

	<script type="text/javascript">
		function finalizaAgora(id) {
			event.preventDefault();
			$.post("finalizaTarefa", {'id': id}, function(respota) {
				$('#tarefa_'+id).html(respota);
			})
		}
	</script>
</body>
</html>