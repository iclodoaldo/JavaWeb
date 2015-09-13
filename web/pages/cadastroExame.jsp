
<%@page import="javax.swing.JOptionPane"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="br.ufjf.dao.TipoExameDAO"%>
<%@page import="br.ufjf.model.TipoExame"%>
<%@page import="br.ufjf.dao.ClienteDAO"%>
<%@page import="br.ufjf.model.Cliente"%>
<%@page import="br.ufjf.model.Exame"%>
<%@page import="br.ufjf.dao.ExamesDAO"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Exames</title>
    </head>
    <body>
    <sql:setDataSource var="ds"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/laboratorio?zeroDateTimeBehavior=convertToNull"
        user="root"
        password="12345"
        scope="session"/>

        <form name="cadastroExame" method="post" action="?action=cadastroExame" id="formbasico">
            <br><h1 id="login">Cadastro de Exames no sistema</h1>
            
            <%--<br><label>Código: </label>
            <input type="text" name="codigoExame" value="" size="10" /><br><br>--%>
            <sql:query var="qryExames" dataSource="${ds}">
                select * from exame order by codigo
            </sql:query>
                <label>Codigo de Exame: </label>
                <select name="codigoExame">
                    <option value=""></option>
                    <c:forEach var="codigoDosExames" items="${qryExames.rows}">
                    <option value="${codigoDosExames.codigo}">${codigoDosExames.codigo}</option>
                </c:forEach>
                </select>  Preencha este campo somente se necessitar ALTERAR um exame já cadastrado!<br><br>
                
            <%--<label>Código Tipo do Exame: </label>
            <input type="text" name="codigoTipo" value="" size="10" /><br><br>--%>
            <sql:query var="qryTipoExames" dataSource="${ds}">
                select * from tipoExame order by codigoTipo
            </sql:query>
            <label>Tipo de Exame: </label>
            <select name="codigoTipo">
                <c:forEach var="tipoExames" items="${qryTipoExames.rows}">
                    <option value="${tipoExames.codigoTipo}">${tipoExames.codigoTipo} - ${tipoExames.nomeExame}</option>
                </c:forEach>
            </select>
            <%--<label>Código do Cliente: </label>
            <input type="text" name="codigoCliente" value="" size="10" /><br><br>--%>
            
            <sql:query var="qryClientes" dataSource="${ds}">
                select * from cliente order by codigo
            </sql:query>
                <br><br><label>Codigo/CPF do Cliente: </label><select name="codigoCliente">
                <c:forEach var="clientes" items="${qryClientes.rows}">
                    <option value="${clientes.codigo}">cpf: ${clientes.cpf} -  Cliente ${clientes.codigo}</option>
                </c:forEach>
            </select><br>
            <br><label>Data de realização do Exame: </label>
            <input type="text" name="dataExame" value="" size="10" /><br>
            <br><label>Data prevista de Entrega: </label>
            <input type="text" name="dataEntrega" value="" size="10" /><br><br>
           <div id="login">
                <input type="submit" value="ENVIAR" name="enviar" />
                <input type="submit" value="CANCELAR" name="carcelar" />
                <br><br>
            </div>
        </form>
        <%         
            String codigoExame = request.getParameter("codigoExame");
try{
                Exame exame = new Exame();
                ExamesDAO dao = new ExamesDAO();
                
                Cliente cliente = ClienteDAO.getClientePorCodigo(Integer.parseInt(request.getParameter("codigoCliente")));
                TipoExame tipoExame = TipoExameDAO.getExamePorCodigo(Integer.parseInt(request.getParameter("codigoTipo")));
                
                
                if(codigoExame.equals("")){codigoExame="0";}
                exame.setCodigo(Integer.parseInt(codigoExame));
                exame.setCodigoCliente(cliente);
                exame.setCodigoTipo(tipoExame);
                exame.setDataExame(request.getParameter("dataExame"));
                exame.setDataEntrega(request.getParameter("dataEntrega"));
                             
                    //if(!select a seguir) {  -- colocar select * from usuario where matricula = matricula;
                dao.salvarExame(exame);
                  
                %> <script> alert('Exame ' +<%=codigoExame%> + ' cadastrado com sucesso!');</script> <%
        } catch (Exception e) {
        %><script> log = <%=codigoExame%> if (log == null)alert('Exame não cadastrado!\nTente novamente!');log = null</script><%        ;
            }
        %>
        
                 
    </body>
</html>
