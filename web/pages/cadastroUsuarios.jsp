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
        <title>Cadastro Usuários</title>
    </head>
    <body><sql:setDataSource var="ds"
                           driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/laboratorio?zeroDateTimeBehavior=convertToNull"
                           user="root"
                           password="12345"
                           scope="session"/>

  
        <form id="formbasico" name="cadastrarUsuarios" method="post" action="?action=cadastroUsuarios" onSubmit="return validaForm()">
            <br><h1 id="login">Cadastro de Usuários do sistema</h1>
            <input type="hidden" name="matricula" value="0">
            <label>Nome: </label><input type="text" name="nome" value="" size="50" /><br><br>
            <label>Login: </label><input type="text" name="login" value="" size="40" /><br><br>
            <label>Senha: </label><input type="password" name="senha" value="" size="20" /><br><br>
            <label>CPF: </label><input type="text" name="cpf" value="" size="15" /><br><br>
            <input type="submit" value="INCLUIR" name="enviar" />
            <br>

        </form>
    
        <form id="formbasico" name="alterarUsuario" method="post" action="?action=alteraUsuario" onSubmit="return validaForm()">
            <h1 id="login">Alteração de Usuario.</h1>
            <sql:query var="qryUsuarios" dataSource="${ds}">
                select * from usuario order by matricula
            </sql:query>
            <label>Usuario: </label>
            <select name="matricula">
                <option value="0">Selecione...</option>
                    <c:forEach var="codigoUsuario" items="${qryUsuarios.rows}">
                    <option value="${codigoUsuario.matricula}">${codigoUsuario.matricula} - ${codigoUsuario.nome}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="acao" value="ALTERAR">
            <input type="submit" value="ALTERAR" name="alterar" />
        </form>
            
        <form id="formbasico" name="excluirUsuario" method="post" action="?action=excluirUsuario" onSubmit="return validaForm()">
            <br><h1 id="login">Exclusão de Usuario.</h1>
            <sql:query var="qryUsuarios" dataSource="${ds}">
                select * from usuario order by matricula
            </sql:query>
            <label>Usuario: </label>
            <select name="matricula">
                <option value="0">Selecione...</option>
                    <c:forEach var="codigoUsuario" items="${qryUsuarios.rows}">
                    <option value="${codigoUsuario.matricula}">${codigoUsuario.matricula} - ${codigoUsuario.nome}</option>
                </c:forEach>
            </select>
            <input type="submit" value="EXCLUIR" name="excluir" />
        </form>    
        <%

try{
    String enviar= request.getParameter("enviar");
    String nome = request.getParameter("nome");
    String matricula = request.getParameter("matricula");
    if (matricula.equals("")) { matricula = "0";}
    Usuario usuario = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();
        
if (enviar.equals("INCLUIR")){
            
                try{
                    if ((!request.getParameter("cpf").equals("")) | (!request.getParameter("nome").equals(""))){
                        usuario.setMatricula(Integer.parseInt(matricula));
                        usuario.setNome(request.getParameter("nome"));
                        usuario.setLogin(request.getParameter("login"));
                        usuario.setSenha(request.getParameter("senha"));
                        usuario.setCpf(request.getParameter("cpf"));
                        dao.salvar(usuario);

                        %> <script> alert('Usuário INCLUIDO com sucesso!');</script> <script>location.href="?action=cadastroUsuarios";</script><%
                    }else{%><script> alert('Nome ou CPF invalido!');</script><script>location.href="?action=cadastroUsuarios";</script><%}
            } catch (Exception e) {
        %><script> alert('Usuário não cadastrado!\nTente novamente!');</script><%        ;
            }
    }
}catch(Exception e){}
%>

    </body>
</html>
