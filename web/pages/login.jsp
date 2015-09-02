<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.ufjf.model.Usuario"%>
<%

try {
     Usuario u = (Usuario)request.getSession().getAttribute("usuario");
                            %>
                        <% if (!u.getNome().isEmpty()){%>
                        <h1>Bem Vindo <font color="blue" ><b><%= u.getNome() %>! </b><a href="?action=logof"><b>Sair!</b></a></font></h1>
                        <%}%>
                                     
                            <jsp:include page="administracao.jsp" />
                            <%
}catch (Exception e){
    
%>

<br><h2>Acesso Restrito!</h2>
<div class="login">
    <center>
    <form method="post" action="?">
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
        <input type="submit" name="btnLogar" value="Logar" /> 
        <%
        if (request.getAttribute("msg") != null){
            out.print("<br /><span style=\"text-align:center;color:red;"
                    + "font-size:10px;\">"+
                    request.getAttribute("msg")+"</span>");
        }        
        %>
    </form></center>
</div>
    <br><br><br><br><br><br><br><br><br><br><br>


<%
}

%>
