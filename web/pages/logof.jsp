
<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.ufjf.model.Usuario"%>

<html><body>
        
            <%

                try {
                    Usuario u = (Usuario) request.getSession().getAttribute("usuario");

                    int x = u.getNome().length();

        if (x > 0) {%>
        <form id="formbasico">
            <br><h1 id="login">Bem Vindo <%= u.getNome()%>! Para sair clique em <a href="?action=logof"><b>Sair!</b></a></h1>
            <% } else {
                JOptionPane.showMessageDialog(null, "message");
                %><h1>Bem Vindo <b><%= u.getNome()%>! Para sair clique em <a href="?action=logof"><b>Sair!</b></a></h1><%}%><%
                   } catch (Exception e) {
                       
                   }%>
        </form></body></html>