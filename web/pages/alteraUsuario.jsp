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
        <title>Alteração de Usuários</title>
    </head>
    <body><% String acao= request.getParameter("acao");
     %>
        <sql:setDataSource var="ds"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/laboratorio?zeroDateTimeBehavior=convertToNull"
        user="root"
        password="12345"
        scope="session"/>
        
        <h1>Alteração de Usuários do sistema</h1>
        <%--<h2><a href="?action=login">Voltar para Administração</a></h2>--%>
        <% Integer matricula = Integer.parseInt(request.getParameter("matricula"));
        Usuario user = new Usuario();
        if(Integer.parseInt(request.getParameter("matricula"))>0){
        user = UsuarioDAO.getEM().find(Usuario.class, matricula);}
        else{
      %><script> alert('Selecione um USUARIO VALIDO!');</script>
        <script>location.href="?action=cadastroUsuarios";</script><%      
            
        }
            
        %>
        
        <form name="alteraUsuario" method="post" action="?action=alteraUsuario">
            <br>
            <input type="hidden" name="matricula" value="<%=user.getMatricula()%>" /><br><br>
            <label>Altera Nome (se necessário): </label>
            <input type="text" name="nome" value="<%=user.getNome()%>" size="80" /><br><br>
            <label>Altera Login (se necessário): </label>
            <input type="text" name="login" value="<%=user.getLogin()%>" size="40" /><br><br>
            <label>Altera Senha (se necessário): </label>
            <input type="password" name="senha" value="<%=user.getSenha()%>" size="20" /><br><br>
            <label>Altera CPF (se necessário): </label>
            <input type="text" name="cpf" value="<%=user.getCpf()%>" size="15" /><br><br>
            <input type="hidden" name="acao" value="alterar">
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" /> 
            <br><br>


            
        </form>
        <%  
try{
    if (request.getParameter("acao").equals("alterar")){
    
    
            try {
                Usuario usuario = new Usuario();
                UsuarioDAO dao = new UsuarioDAO();
                usuario.setMatricula(Integer.parseInt(request.getParameter("matricula")));
                usuario.setNome(request.getParameter("nome"));
                usuario.setLogin(request.getParameter("login"));
                usuario.setSenha(request.getParameter("senha"));
                usuario.setCpf(request.getParameter("cpf"));
                String nome = usuario.getNome();
                if(usuario.getMatricula()>0){
                dao.salvar(usuario);}
                    
                 
                    
                
                

        %> 
        <script> alert('Usuário alterado com sucesso!');
        </script>
        <script>location.href="?action=cadastroUsuarios";</script>
        <%
        } catch (Exception e) {
        %>
        <script> alert('Usuário não cadastrado!\nTente novamente!');</script>
        <script>location.href="?action=cadastroUsuarios";</script>
        <%        ;
           }
}
}catch(NullPointerException e){
    //JOptionPane.showMessageDialog(null, "ponteiro null");
    %><script> alert('Usuário não cadastrado!\nTente novamente!');</script>
        <script>location.href="?action=cadastroUsuarios";</script><%
    
}    

        
        
        %>
    </body>
</html>
