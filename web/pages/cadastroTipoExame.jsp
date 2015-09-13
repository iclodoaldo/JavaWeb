<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.ufjf.dao.TipoExameDAO"%>
<%@page import="br.ufjf.model.TipoExame"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Tipo de Exame</title>
    </head>
    <body><sql:setDataSource var="ds"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/laboratorio?zeroDateTimeBehavior=convertToNull"
        user="root"
        password="12345"
        scope="session"/>
        
        <%--<h2><a href="?action=login">Voltar para Administração</a></h2>--%>
        <form id="formbasico" name="cadastroTipoExame" method="post" action="?action=cadastroTipoExame">
            <br><h1 id="login">Cadastro de Tipo de Exame</h1>
            <sql:query var="qrytipoExames" dataSource="${ds}">
                SELECT * FROM laboratorio.tipoExame order by codigoTipo
            </sql:query>
                <label>Codigo de Tipo: </label>
                <select name="codigoTipo">
                    <option value=""></option>
                    <c:forEach var="codigoDosExames" items="${qrytipoExames.rows}">
                    <option value="${codigoDosExames.codigoTipo}">${codigoDosExames.nomeExame}</option>
                </c:forEach>
                </select>  Preencha este campo somente se necessitar ALTERAR um tipo de exame já cadastrado!<br><br>
            
            <label>Nome do Exame: </label>
            <input type="text" name="nomeExame" value="" size="50" /><br><br>
            <label>Custo: </label>
            <input type="text" name="custo" value="" size="10" /><br><br>
            <label>Tempo de Jejum (em Horas) </label>
            <input type="text" name="horaJejum" value="" size="2" /><br><br>
            <label>Prazo para entrega: </label>
            <input type="text" name="prazoEntrega" value="" size="10" /><br><br>
            <div id="login">
                <input type="submit" value="ENVIAR" name="enviar" />
                <input type="submit" value="CANCELAR" name="carcelar" />
                <br><br>
                </form>
                <%
                   
                    try {
                        TipoExame tipoExame = new TipoExame();
                        TipoExameDAO dao = new TipoExameDAO();
                        String codigoTipo = request.getParameter("codigoTipo");
                                          
                        tipoExame.setCodigoTipo(Integer.parseInt(request.getParameter("codigoTipo")));
                        tipoExame.setNomeExame(request.getParameter("nomeExame"));
                        tipoExame.setCusto(Double.parseDouble(request.getParameter("custo")));
                        tipoExame.setHoraJenjum(Integer.parseInt(request.getParameter("horaJejum")));
                        tipoExame.setPrazoEntrega(Integer.parseInt(request.getParameter("prazoEntrega")));

                        dao.salvarTipoExame(tipoExame);

                %> <script> alert('Exame Tipo ' +<%=codigoTipo%> + ' cadastrado com sucesso!');</script> <%
        } catch (Exception e) {
        %><script> alert('Exame  não cadastrado!\nTente novamente!');log = null</script><%        ;
            }
        %>


                </body>
                </html>
