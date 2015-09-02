<%-- 
    Document   : administracao
    Created on : 01/06/2015, 11:34:43
    Author     : clodoaldo
--%>

<%@page import="java.util.List"%>
<%@page import="br.ufjf.model.Exame"%>
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
        
        
        <br>
        <% String resultado="";
            if(!request.getParameter("codigoExame").isEmpty()){
                Integer codigoExame = Integer.parseInt(request.getParameter("codigoExame"));
                ExamesDAO ex = new ExamesDAO();
                
                Exame exame = ex.retornaDetalheExame(codigoExame);
                out.println("<h1><font color=blue >Sr(a): "+exame.getCodigoCliente().getNome()+"</font><br></h1>");
        
        resultado="<div><table width='300px' class='borda1'><tr><td colspan='2'><center><b>Exames Realizados</b></center></td></tr>";
        
         resultado += "<tr><td>"+"Cliente: "+"</td><td>"+exame.getCodigoCliente().getNome()+"</td><tr>"
                 +"<tr><td>"+"Codigo Cliente: "+"</td><td>"+exame.getCodigoCliente().getCodigo()+"</td><tr>"
                 +"<tr><td>"+"Codigo Exame: "+"</td><td>"+exame.getCodigo()+"</td><tr>"
                 +"<tr><td>"+"Tipo de Exame"+"</td><td>"+exame.getCodigoTipo().getNomeExame()+"</td></tr>"
                 +"<tr><td>"+"Data do Exame"+"</td><td>"+exame.getDataExame()+"</td></tr>"
                 +"<tr><td>"+"Previsao de Entrega"+"</td><td>"+exame.getDataEntrega()+"</td></tr>"
                 +"<tr><td>"+"Custo"+"</td><td>"+exame.getCodigoTipo().getCusto()+"</td></tr>";
         }
         resultado+="</table></div>";
         out.print(resultado);
        //JOptionPane.showMessageDialog(null, resultado);
        
         %>
         
    </body>
</html>
