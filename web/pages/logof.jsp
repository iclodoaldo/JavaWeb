
<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.ufjf.model.Usuario"%>
<%

    try {
     Usuario u = (Usuario)request.getSession().getAttribute("usuario");
     
     int x = u.getNome().length();
     
     if (x > 0)   {  %>
          <h1>Bem Vindo <font color="blue" ><b><%= u.getNome() %>! </b><a href="?action=logof"><b>Sair!</b></a></font></h1>
       
          <% } else {JOptionPane.showMessageDialog(null, "message");
             %> <h1>Bem Vindo <font color="blue" ><b><%= u.getNome() %>! </b><a href="?action=logof"><b>Sair!</b></a></font></h1> <%}%>
                       
                        
        
     <%
}catch (Exception e){
    
}%>