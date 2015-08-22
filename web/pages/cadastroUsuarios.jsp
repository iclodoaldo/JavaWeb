<%@page import="br.ufjf.dao.UsuarioDAO"%>
<%@page import="br.ufjf.model.Usuario"%>
<%@page import="org.apache.catalina.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Usuários</title>
    </head>
    <body>
        <h1>Cadastro e alteração de Usuários do sistema</h1>
        <h2><a href="?action=login">Voltar para Administração</a></h2>
        <form name="cadastroUsuarios" method="post" action="?action=cadastroUsuarios">
            <br><label>Matrícula: </label>
            <input type="text" name="matricula" value="" size="50" /><br><br>
            <label>Nome: </label>
            <input type="text" name="nome" value="" size="80" /><br><br>
            <label>Login: </label>
            <input type="text" name="login" value="" size="40" /><br><br>
            <label>Senha: </label>
            <input type="password" name="senha" value="" size="20" /><br><br>
            <label>CPF: </label>
            <input type="text" name="cpf" value="" size="15" /><br><br>
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" />
        </form>


        <%
           
            
            String nome = request.getParameter("nome");
try{
                Usuario usuario = new Usuario();
                UsuarioDAO dao = new UsuarioDAO();
                
                String matricula = request.getParameter("matricula");
               
                usuario.setMatricula(Integer.parseInt(request.getParameter("matricula")));
                usuario.setNome(request.getParameter("nome"));
                usuario.setLogin(request.getParameter("login"));
                usuario.setSenha(request.getParameter("senha"));
                usuario.setCpf(request.getParameter("cpf"));
               
                    //if(!select a seguir) {  -- colocar select * from usuario where matricula = matricula;
                dao.salvar(usuario);
                  
                %> <script> alert('Usuário '+<%=nome%>+' cadastrado com sucesso!'); </script> <%
                    }catch(Exception e){
                 %><script> alert('Usuário não cadastrado!\nTente novamente!'); </script><%
                ;
            }
        %>
        
                 
    </body>
</html>
