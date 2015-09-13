<%@page import="br.ufjf.model.Usuario"%>
<%@page import="org.apache.catalina.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = (Usuario) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratorio de Pos!</title>
    </head>
    <body>
        <form id="formbasico">
        <div id="mainnav" >
            <ul >
                <li><a href="?action=cadastroUsuarios"><span>Cadastro de Usuarios</span></a></li>
                <li><a href="?action=cadastroClientes"><span>Cadastro de Clientes</span></a></li>
                <li><a href="?action=cadastroExame"><span>Cadastro de Exames</span></a></li>
                <li><a href="?action=cadastroTipoExame"><span>Cadastro de Tipos de Exames</span></a></li>
                <li><a href="?action=contabilidade"><span>Contabilidade</span></a></li>

            </ul>
        </div>
        </form>
        <br><br><br><br><br><br><br>
    </body>
</html>