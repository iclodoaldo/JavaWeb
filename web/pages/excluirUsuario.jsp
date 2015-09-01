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
        <h1>Exclusão de Usuários do sistema</h1>
        <h2><a href="?action=login">Voltar para Administração</a></h2>
        <form name="excluirUsuario" method="post" action="?action=excluirUsuario">



            <br><label>Matrícula do Usuário: </label>
            <input type="text" name="matricula" value="" size="50" /><br><br>
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" /> 
            <br><br>
            <%
                
            try {
                Usuario usuario = new Usuario();
                UsuarioDAO dao = new UsuarioDAO();

                String matricula = request.getParameter("matricula");

                usuario.setMatricula(Integer.parseInt(request.getParameter("matricula")));
              
                dao.removerUsuario(usuario);
                out.print("removeu" + usuario.getNome());
            
    } catch (Exception e) {

    }

            %>
        </form>

    </body>
</html>
