<%@page import="br.ufjf.model.TipoExame"%>
<%@page import="br.ufjf.dao.TipoExameDAO"%>
<%@page import="br.ufjf.dao.ExamesDAO"%>
<%@page import="br.ufjf.model.Exame"%>
<%@page import="java.util.List"%>
<%@page import="javax.swing.JOptionPane"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contabilidade</title>
    </head>
    <body>
        
        <h1>Contabilidade</h1>
        
        <%
            List <Exame> lista = ExamesDAO.retornaTodosExames();
            int contador=0;
            Double valor=0.0;
        for (int i = 0; i < lista.size(); i++) {
                
                valor+=lista.get(i).getCodigoTipo().getCusto();
                contador++;
    }
        out.println("<br><b>Foram realizados um total de "+contador+" Exames.");
        out.println("Sendo a arrecadacao total de R$ "+valor+".<br><br>"
                + "<center>Detalhamento por Especialidade:\n</center>  "+TipoExameDAO.retornaFaturamento()+"</b>");
        
        
        %>
        
            
    </body>
</html>