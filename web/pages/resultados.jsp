<%-- 
    Document   : administracao
    Created on : 01/06/2015, 11:34:43
    Author     : clodoaldo
--%>

<%@page import="br.ufjf.dao.ExamesDAO"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.ufjf.dao.BancoDados"%>
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
                ClienteDAO x = new ClienteDAO(BancoDados.retornaBanco());
                try{
                Cliente eu = x.getClientePorLoginESenha(request.getParameter("codigoCli"), request.getParameter("senhaCli"));
                out.println("<h1><font color=blue >Bem vindo Sr(a): "+eu.getNome()+"</font><br></h1>");
                
                %>
                <table style="width: 100%;">
                    <tr style="background-color: graytext;font-weight: bolder;
                        color: white">
                        <td>Codígo</td>
                        <td>Exame</td>
                        <td>Feito dia</td>
                        <td>Prazo de entrega</td>
                        <td>resultado</td>
                    </tr>
                    <c:if test="${listaExamesPorCliente.size() == 0}">
                        <tr><td colspan="4"> Não há exames cadastrados</td></tr>
                    </c:if>
                    <c:if test="${listaExamesPorCliente.size() != 0}">
                        <c:forEach items="${listaExamesPorCliente}" var="n">
                            <tr>
                                <td>${n.codigoExame}</td>
                                <td>${n.nomeExame}</td>
                                <td>${n.dataExame}</td>
                                <td>${n.prazoExame}</td>
                                <td>
                                    <a href="control?action=">
                                        Resultado

                                    </a>
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </c:if>

                </table>
                <%
                }catch (Exception e){
                    out.print("Codigo de acesso ou senha incorretos... ");
                }
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
