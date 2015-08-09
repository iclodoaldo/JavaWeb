<%-- 
    Document   : administracao
    Created on : 01/06/2015, 11:34:43
    Author     : clodoaldo
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="br.ufjf.dao.ClienteDAO"%>
<%@page import="br.ufjf.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratorio de Pos!</title>
    </head>
    <body>
        <h1>Bem Vindo Visitante!</h1>
        <br>
        <h1>Aqui nossa pagina de Resultados</h1>
        <br>
        <% 
            if(!request.getParameter("codigoCli").isEmpty() && !request.getParameter("senhaCli").isEmpty()){
            out.println("<h1><font color=blue >Cliente: "+request.getParameter("codigoCli")
                    +"<br> Senha: "+request.getParameter("senhaCli")+"</font><br></h1>");
            }        
         
         
         
         %>
         <br>
        <font color="red">
        <h1>EXIBIR AQUI OS RESULTADOS DOS EXAMES FEITOS PELOS CLIENTES!</h1>
        <h1>EXIBIR UMA LISTA PARA O CLIENTE SELECIONAR OS EXAMES QUE QUER IMPRIMIR!</h1>
        <h1>EXIBIR APENAS SE CLIENTE E SENHA EXISTIREM NO BANCO DE DADOS DE EXAMES REALIZADOS
            CASO CONTRARIO EXIBIR MENSAGEM DE INFORMACAO AO CLIENTE!</h1>
        </font>
        <br><br><br><br><br><br><br><br><br>
        
    </body>
</html>
