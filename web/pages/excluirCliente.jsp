<%@page import="javax.swing.JOptionPane"%>
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
       
            <%
String nome="";

                try {
                    
                         if(Integer.parseInt(request.getParameter("codigo"))==0){
        
      %><script> alert('Selecione um CLIENTE VALIDO!');</script>
        <script>location.href="?action=cadastroClientes";</script><%      
            
        }
                    
                    Cliente cliente = new Cliente();
                    ClienteDAO dao = new ClienteDAO();

                    String codigo = request.getParameter("codigo");

                    //cliente.setCodigo(Integer.parseInt(request.getParameter("codigo")));
                    
                    cliente = ClienteDAO.getEntityManager().find(Cliente.class, Integer.parseInt(codigo));
                   nome = cliente.getNome();
                    
                    dao.removerCliente(Integer.parseInt(request.getParameter("codigo")));
                    
                    %><script> alert('Cliente EXCLUIDO com sucesso!');</script><%
           
                                   

                } catch (Exception e) {
                   
              %><script> alert('Nao foi possivel excluir o Cliente!');</script><%
//JOptionPane.out.print("<script> alert('Cliente não pode ser removido!'); </script>");
                }
                
                    
                    %> 
                    <script>location.href="?action=cadastroClientes";</script>

    </body>
</html>
