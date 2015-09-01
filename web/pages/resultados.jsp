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
        
        <%
        if(!request.getParameter("codigoCli").isEmpty()){
        out.print("<h1>Aqui nossa pagina de Resultados</h1>");}else{out.print(
                "<h1>Bem Vindo Visitante!</h1>"
              + "<h1>Aqui nossa pagina de Resultados</h1>"
              + "<h1>Para ver sues Resultados siga os passos abaixo:</h1>"
              + "<h1>Clique no Campo de Resultado Online ao lado com seu CPF e Codigo de Acesso!</h1>");}
        
        %>
        <br>
        
        <br>
        <% 
            if(!request.getParameter("codigoCli").isEmpty() && !request.getParameter("senhaCli").isEmpty()){
                ClienteDAO x = new ClienteDAO(BancoDados.retornaBanco());
                Boolean logado=false;
                Cliente eu=new Cliente();
                
                try{
                eu = x.getClientePorLoginESenha(request.getParameter("codigoCli"), request.getParameter("senhaCli"));
                out.println("<h1><font color=blue >Bem vindo Sr(a): "+eu.getNome()+"</font><br></h1>");
                    logado=true;
                }catch (Exception e){
                    out.print("Codigo de acesso ou senha incorretos... ");
                    logado=false;
                }
                
                
                if (logado==true){
                ExamesDAO ex = new ExamesDAO();
        
        String resultado="<div><table width='300px' class='borda1'><tr><td><b>Tipo de Exame</b></td><td><b>Data do Exame</b></td></tr>";
        List<Exame> lista = ex.retornaExames(eu.getCodigo());
        Double soma=0.0;
         for (Exame exame: lista){
         resultado += "<tr><td>"+"<a href='?action=resultadoDetalhe&codigoExame="+exame.getCodigo()+"'>"+exame.getCodigoTipo().getNomeExame()
                 +"</a><td>"+exame.getDataExame()+"</td><tr>";
         soma+=exame.getCodigoTipo().getCusto();
         }
         resultado += "<tr><td>Custo para o Cliente</td><td>R$ "+soma+"</td><tr>";
         resultado+="</table></div>";
         out.print(resultado);
        //JOptionPane.showMessageDialog(null, resultado);
        
        
                
                
                }
                            }        
                
        
         
         
         %>
        
    </body>
</html>
