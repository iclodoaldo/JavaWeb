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
        
        
                <table border="1"><tr><td>Tipo de Exame</td><td>Custo total</td></tr>
                    
                        <tr><td>${codigoDosExames.codigoTipo}</td><td>${codigoDosExames.codigoTipo.custo}</td></tr>
               </table>
    </body>
</html>
