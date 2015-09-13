<%@page import="javax.swing.JOptionPane"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="br.ufjf.dao.UsuarioDAO"%>
<%@page import="br.ufjf.model.Usuario"%>
<%@page import="org.apache.catalina.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de Usuários</title>
    </head>
    <body>
         <%
                
            
try{String excluir= request.getParameter("excluir");

if (excluir.equals("EXCLUIR")){
Usuario usuario = new Usuario();
                UsuarioDAO dao = new UsuarioDAO();

                String matricula = request.getParameter("matricula");

                usuario.setMatricula(Integer.parseInt(request.getParameter("matricula")));
                

                dao.removerUsuario(usuario.getMatricula());
                out.print("removeu" + usuario.getNome());

                %><script> alert('Usuário EXCLUIDO com sucesso!');</script><%
}
}catch(Exception e){
%><script> alert('Nao foi possivel excluir o Usuario!');</script><%
}

            %>
           
        
        <script>location.href="?action=cadastroUsuarios";</script>

    </body>
</html>
