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
    <body><form id="formbasico">
        <br><h1 id="login">Contabilidade</h1><br>
        <%
            List <Exame> lista = ExamesDAO.retornaTodosExames();
            int contador=0;
            Double valor=0.0;
        for (int i = 0; i < lista.size(); i++) {
                
                valor+=lista.get(i).getCodigoTipo().getCusto();
                contador++;
    }
        out.println("<br><h3>Foram realizados um total de "+contador+" Exames.</h3>");
        out.println("<h3>Arrecadação total de R$ "+valor+".</h3><br>"
                + "<h1 id='login'>Detalhamento por Especialidade:<br></h1>  "+TipoExameDAO.retornaFaturamento());
        
        
        %>
         </form>
    </body>
</html>