<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.ufjf.dao.EnderecoDAO"%>
<%@page import="br.ufjf.dao.UsuarioDAO"%>
<%@page import="br.ufjf.model.Usuario"%>
<%@page import="br.ufjf.model.Endereco"%>
<%@page import="br.ufjf.dao.ClienteDAO"%>
<%@page import="br.ufjf.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Clientes</title>
    </head>
    <body>

        <h1>Cadastro e alteração de Clientes</h1>
        <h2><a href="?action=login">Voltar para ADMINISTRAÇÃO</a></h2>

        <form name="cadastroClientes" method="post" action="?action=cadastroClientes">

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
            <input type="password" name="senha" value="" size="30" /><br><br>
            * campos obrigatórios<br><br>
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" /> <br><br>

        </form>
        <%
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

               // endao.salvarEndereco(end);
                //end = EnderecoDAO.getUltimoEndereco();
                // cliente.setEndereco(end);
                dao.salvarCliente(cliente);

        %>

        <script> alert('Cliente CPF: ' +<%=cpf%> + ' cadastrado com sucesso!');</script>
        <%
        } catch (Exception e) {
        %>
        <script> alert('Cliente não cadastrado!\nTente novamente!');</script> 
        <%
            }
        %>

    </body>
