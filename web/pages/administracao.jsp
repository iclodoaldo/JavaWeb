<%-- 
    Document   : administracao
    Created on : 01/06/2015, 11:34:43
    Author     : clodoaldo
--%>

<%@page import="br.ufjf.model.Usuario"%>
<%@page import="org.apache.catalina.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = (Usuario)session.getAttribute("usuario");
    
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratorio de Pos!</title>
    </head>
    <body>
       <% if (!u.getNome().isEmpty()){%>
          <h1>Bem Vindo <font color="blue" ><b><%= u.getNome() %>! </b><a href="?action=logof"><b>Sair!</b></a></font></h1>
       <%}%>
        <br>
        <br>
        <h2> <a href="?action=cadastroUsuarios"> <font color="red">Cadastro de Usuarios.</font></h2>
        <h2> <a href="?action=cadastroClientes"> <font color="green">Cadastro de Clientes.</font></h2>
        <h2> <a href="?action=cadastroExame"> <font color="blue">Cadastro de Exames.</font></h2>
        <h2> <a href="?action=cadastroTipoExame"> <font color="orange">Cadastro de Tipos de Exames.</font></h2>
        <h2> <a href="?action=contabilidade"> <font color="red">Contabilidade.</font></h2>
       
        <br><br><br><br><br><br><br><br><br>
        
        
    </body>
</html>
