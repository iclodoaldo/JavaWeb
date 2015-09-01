<%@page import="br.ufjf.dao.EnderecoDAO"%>
<%@page import="br.ufjf.dao.ClienteDAO"%>
<%@page import="br.ufjf.model.Cliente"%>
<%@page import="org.apache.catalina.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de Clientes</title>
    </head>
    <body>
        <h1>Exclusão de Clientes do sistema</h1>
        <h2><a href="?action=login">Voltar para Administração</a></h2>
        <form name="excluirCliente" method="post" action="?action=excluirCliente">



            <br><label>Digite o codigo do cliente: </label>
            <input type="text" name="codigo" value="" size="10" /><br><br>
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" /> 
            <br><br>
            <%

                try {
                    Cliente cliente = new Cliente();
                    ClienteDAO dao = new ClienteDAO();
                   
                    cliente.setCodigo(Integer.parseInt(request.getParameter("codigo")));
                   
                    dao.removerCliente(Integer.parseInt(request.getParameter("codigo")));
                   
                    //out.print("removeu" + cliente.getNome());

                } catch (Exception e) {
                    
                    out.print("Cliente não removido");

                }

            %>
        </form>

    </body>
</html>
