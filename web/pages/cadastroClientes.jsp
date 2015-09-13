<%@page import="java.io.IOException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.ufjf.dao.EnderecoDAO"%>
<%@page import="br.ufjf.dao.UsuarioDAO"%>
<%@page import="br.ufjf.model.Usuario"%>
<%@page import="br.ufjf.model.Endereco"%>
<%@page import="br.ufjf.dao.ClienteDAO"%>
<%@page import="br.ufjf.model.Cliente"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
    </head>
    <body><sql:setDataSource var="ds"
                           driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/laboratorio?zeroDateTimeBehavior=convertToNull"
                           user="root"
                           password="12345"
                           scope="session"/>
        
        <form id="formbasico" name="cadastroClientes" method="post" action="?action=cadastroClientes">

        

            <br><h1 id="login" >Cadastro e alteração de Clientes</h1>

        <h1>Cadastro e alteração de Clientes</h1>
      

            <label>Nome: </label>
            <input type="text" name="nome" value="" size="80" /><br><br>
            <label>CPF: </label>
            <input type="text" name="cpf" value="" size="15" />
            <label>Sexo: </label>
            <input type="text" name="sexo" value="" size="3" />
            <label>Telefone: </label>
            <input type="text" name="telefone" value="" size="10" /><br><br>
            <label>Logradouro: </label>
            <input type="text" name="logradouro" value="" size="60" />
            <label>Numero: </label>
            <input type="text" name="numero" value="" size="5" /><br><br>
            <label>Bairro: </label>
            <input type="text" name="bairro" value="" size="30" />
            <label>Cidade: </label>
            <input type="text" name="cidade" value="" size="30" />
            <label>UF: </label>
            <input type="text" name="uf" value="" size="2" /><br><br>
            <label>CEP: </label>
            <input type="text" name="cep" value="" size="10" /><br><br>
            <label>Email: </label>
            <input type="text" name="email" value="" size="50" /><br><br>
            <label>Digite a senha de acesso: </label>
            <input type="password" name="senha" value="" size="30" /><br>
            <input type="submit" value="INCLUIR" name="enviar" />
            <br><br>
        </form>
        
        
        <form id="formbasico" name="alterarCliente" method="post" action="?action=alteraClientes" onSubmit="return validaForm()">
            <h1 id="login">Alteração de Cliente.</h1>
            
            <sql:query var="qryClienteCPF" dataSource="${ds}">
                select * from cliente order by codigo
            </sql:query>
            <label>Cliente cod/cpf: </label>
            <select name="codigo">
                <option value="0">Selecione...</option>
                    <c:forEach var="codigoCliente" items="${qryClienteCPF.rows}">
                    <option value="${codigoCliente.codigo}">${codigoCliente.codigo} - ${codigoCliente.cpf} - ${codigoCliente.nome}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="acao" value="ALTERAR">
            <input type="submit" value="ALTERAR" name="alterar" />
        </form>
        
        
        
            <form id="formbasico" name="excluirCliente" method="post" action="?action=excluirCliente" onSubmit="return validaForm()">
            <br><h1 id="login">Exclusão de Cliente.</h1>

            <sql:query var="qryCliente" dataSource="${ds}">
                select * from cliente order by codigo
            </sql:query>
            <label>Cliente cod/cpf: </label>
            <select name="codigo">
                <option value="0">Selecione...</option>
                    <c:forEach var="codigoCliente" items="${qryCliente.rows}">
                    <option value="${codigoCliente.codigo}">${codigoCliente.codigo} - ${codigoCliente.cpf} - ${codigoCliente.nome}</option>
                </c:forEach>
            </select>
            <input type="submit" value="EXCLUIR" name="excluir" /><br><br>
        </form> 
          
        <%try{
            if (request.getParameter("enviar").equals("INCLUIR")){
                String nome = request.getParameter("nome");
            

                try {

                    Cliente cliente = new Cliente();
                    ClienteDAO dao = new ClienteDAO();
                    Endereco end = new Endereco();
                    EnderecoDAO endao = new EnderecoDAO();

                    String cpf = request.getParameter("cpf");

                    end.setLogradouro(request.getParameter("logradouro"));
                    end.setNumero(request.getParameter("numero"));
                    end.setBairro(request.getParameter("bairro"));
                    end.setCep(request.getParameter("cep"));
                    end.setCidade(request.getParameter("cidade"));
                    end.setUf(request.getParameter("uf"));


                    cliente.setEndereco(end);
                    cliente.setNome(request.getParameter("nome"));
                    cliente.setCpf(request.getParameter("cpf"));
                    cliente.setSexo(request.getParameter("sexo"));
                    cliente.setTelefone(request.getParameter("telefone"));
                    cliente.setEmail(request.getParameter("email"));
                    cliente.setSenha(request.getParameter("senha"));

                dao.salvarCliente(cliente);

             %> <script> alert('Cliente cadastrado com sucesso!');</script>
             <script>location.href="?action=cadastroClientes";</script><%
        } catch (Exception e) {
        %><script> log = <%=nome%> if (log == null)alert('Cliente não cadastrado!\nTente novamente!');log = null</script>
        <script>location.href="?action=cadastroClientes";</script><%        ;
            }
            }
        }catch (Exception e){}
        %>
        
    </body>
</html>
