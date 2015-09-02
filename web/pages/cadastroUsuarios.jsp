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
        <sql:setDataSource var="ds"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/laboratorio?zeroDateTimeBehavior=convertToNull"
        user="root"
        password="12345"
        scope="session"/>
    
    </head>
    <body>
        <h1>Cadastro e alteração de Usuários do sistema</h1>
        
        <form name="cadastroUsuarios" method="post" action="?action=cadastroUsuarios">
            <br>            <sql:query var="qryUsuarios" dataSource="${ds}">
                select * from usuario order by nome
            </sql:query>
                <label>Matricula: </label>
                <select name="matricula">
                    <option value=""></option>
                    <c:forEach var="codigoUsuario" items="${qryUsuarios.rows}">
                    <option value="${codigoUsuario.matricula}">${codigoUsuario.nome}</option>
                </c:forEach>
                </select>  Preencha este campo somente se necessitar ALTERAR um usuario já cadastrado!<br>
                

            <label>Nome: </label>
            <input type="text" name="nome" value="" size="50" /><br><br>
            <label>Login: </label>
            <input type="text" name="login" value="" size="40" /><br><br>
            <label>Senha: </label>
            <input type="password" name="senha" value="" size="20" /><br><br>
            <label>CPF: </label>
            <input type="text" name="cpf" value="" size="15" /><br><br>
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" />
            <br><br>            
            <h2><a href="?action=alteraUsuario">Para alterar um usuário CLIQUE AQUI</a></h2>
            <br>
 
        </form>


        <%
           
            
            String nome = request.getParameter("nome");
try{
                Usuario usuario = new Usuario();
                UsuarioDAO dao = new UsuarioDAO();
                
                String matricula = request.getParameter("matricula");
                if (matricula.equals("")){matricula="0";}
                //JOptionPane.showMessageDialog(null, matricula);
                usuario.setMatricula(Integer.parseInt(matricula));
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
