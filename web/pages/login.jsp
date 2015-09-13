<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.ufjf.model.Usuario"%>
<%

    try {
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
%>
<% if (!u.getNome().isEmpty()) {%>

<html><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <body>

        <div id="formbasico" >
            
            <br><h1 id="login">Bem Vindo <b><%= u.getNome()%>! Clique em </b><a href="?action=logof"><b>Sair!</b></a></h1>
           </div> <%}%>
            <jsp:include page="administracao.jsp" />
            <%
            } catch (Exception e) {
            %>
           <form method="post" action="?" id="formlogin">
                <br><br><h2 id="login">Acesso Restrito!</h2>
                <center>
                    <input type="hidden" name="action" value="logar" />
                    Login: 
                    <br />
                    <input type="text" name="cpLogin" value="" />
                    <br />
                    Senha
                    <br />
                    <input type="password" name="cpSenha" value="" />
                    <br />
                    <br />
                    <input type="submit" name="btnLogar" value="Logar" /><br>
                </center>
            </form>
        <br><br><br><br><br><br><br><br><br><br><br>
    </body>
</html>
<%    }

%>
