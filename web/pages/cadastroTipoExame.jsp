<%@page import="br.ufjf.dao.TipoExameDAO"%>
<%@page import="br.ufjf.model.TipoExame"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Tipo de Exame</title>
    </head>
    <body>
        
        <h1>Cadastro de Tipo de Exame</h1>
        <%--<h2><a href="?action=login">Voltar para Administração</a></h2>--%>
        <form name="cadastroTipoExame" method="post" action="?action=cadastroTipoExame">
            <br><label>Código Tipo: </label>
            <input type="text" name="codigoTipo" value="" size="10" /><br><br>
            <label>Nome do Exame: </label>
            <input type="text" name="nomeExame" value="" size="50" /><br><br>
            <label>Custo: </label>
            <input type="text" name="custo" value="" size="10" /><br><br>
            <label>Tempo de Jejum (em Horas) </label>
            <input type="text" name="horaJejum" value="" size="2" /><br><br>
            <label>Prazo para entrega: </label>
            <input type="text" name="prazoEntrega" value="" size="10" /><br><br>
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" />
        </form>
        <%         
           // String nomeExame = request.getParameter("nomeExame");
try{
                TipoExame tipoExame = new TipoExame();
                TipoExameDAO dao = new TipoExameDAO();
                
                String codigoTipo = request.getParameter("codigoTipo");
               
                tipoExame.setCodigoTipo(Integer.parseInt(request.getParameter("codigoTipo")));
                tipoExame.setNomeExame(request.getParameter("nomeExame"));
                tipoExame.setCusto(Double.parseDouble(request.getParameter("custo")));
                tipoExame.setHoraJenjum(Integer.parseInt(request.getParameter("horaJejum")));
                tipoExame.setPrazoEntrega(Integer.parseInt(request.getParameter("prazoEntrega")));
                
                //if(!select a seguir) {  -- colocar select * from usuario where matricula = matricula;
                dao.salvarTipoExame(tipoExame);
                  
                %> <script> alert('Tipo do Exame:  '+<%=codigoTipo%>+' cadastrado com sucesso!'); </script> <%
                    }catch(Exception e){
                 %><script> alert('Tipo do Exame não cadastrado!\nTente novamente!'); </script><%
                ;
            }
        %>
        
                 
    </body>
</html>
