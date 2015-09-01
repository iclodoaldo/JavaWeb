<%@page import="br.ufjf.dao.UsuarioDAO"%>
<%@page import="br.ufjf.model.Usuario"%>
<%@page import="org.apache.catalina.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Usuários</title>
    </head>
    <body>
        <h1>Alteração de Usuários do sistema</h1>
        <h2><a href="?action=login">Voltar para Administração</a></h2>
        <form name="alteraUsuario" method="post" action="?action=alteraUsuario">



            <br><label>Matrícula do Usuário: </label>
            <input type="text" name="matricula" value="" size="50" /><br><br>
            <label>Altera Nome (se necessário): </label>
            <input type="text" name="nome" value="" size="80" /><br><br>
            <label>Altera Login (se necessário): </label>
            <input type="text" name="login" value="" size="40" /><br><br>
            <label>Altera Senha (se necessário): </label>
            <input type="password" name="senha" value="" size="20" /><br><br>
            <label>Altera CPF (se necessário): </label>
            <input type="text" name="cpf" value="" size="15" /><br><br>
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" /> 
            <br><br>


            <script>
                function mostraAlerta() {
                    resposta = "";
                    nomeusuario = "Fulano";
                    decisao = confirm("Clique em um botão!");
                    if (decisao == true) {
                        resposta = "Excluiu o usuário: ";
                        alert("Você clicou no botão OK,\n" +
                                "porque foi retornado o valor: " + resposta + nomeusuario);
                    } else {
                        resposta = "Não Excluiu o usuário: ";
                        alert("Você clicou no botão CANCELAR,\n" +
                                "porque foi retornado o valor: " + resposta + nomeusuario);
                    }
                }
            </script>
            <h2><a href="?action=excluirUsuario">Para EXCLUIR um usuário CLIQUE AQUI</a></h2>
        </form>
        <%
            String nome = request.getParameter("nome");
            try {
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


        %> <script> alert('Usuário ' +<%=nome%> + ' alterado com sucesso!');</script> <%
        } catch (Exception e) {
        %><script> alert('Usuário não cadastrado!\nTente novamente!');</script><%        ;
            }
        %>
    </body>
</html>
