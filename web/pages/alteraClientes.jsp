
<%@page import="javax.swing.JOptionPane"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.ufjf.dao.EnderecoDAO"%>
<%@page import="br.ufjf.model.Endereco"%>
<%@page import="br.ufjf.dao.ClienteDAO"%>
<%@page import="br.ufjf.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        
        
            <%            
               
            if (request.getParameter("acao").equals("ALTERAR")){
              String codigo =request.getParameter("codigo");
              
              if(Integer.parseInt(request.getParameter("codigo"))==0){
        
      %><script> alert('Selecione um CLIENTE VALIDO!');</script>
        <script>location.href="?action=cadastroClientes";</script><%      
            
        }

                try {
                    Cliente cliente = new Cliente();
                    ClienteDAO dao = new ClienteDAO();

                    cliente = ClienteDAO.getClientePorCodigo(Integer.parseInt(codigo));
                    String nome = cliente.getNome();
                
            %>
            <form name="alteraClientes" method="post" action="?action=alteraClientes"><br><br>
            <label>Codigo: </label>
            <input type="text" name="codigo" value="<%=cliente.getCodigo()%>" />
            <label>Nome: </label>
            <input type="text" name="nome" value="<%=cliente.getNome()%>" size="80" /><br><br>
            <label>CPF: </label>
            <input type="text" name="cpf" value="<%=cliente.getCpf()%>" size="15" />
            <label>Sexo: </label>
            <input type="text" name="sexo" value="<%=cliente.getSexo()%>" size="3" />
            <label>Telefone: </label>
            <input type="text" name="telefone" value="<%=cliente.getTelefone()%>" size="10" /><br><br>
            <label>Logradouro: </label>
            <input type="text" name="logradouro" value="<%=cliente.getEndereco().getLogradouro()%>" size="60" />
            <label>Numero: </label>
            <input type="text" name="numero" value="<%=cliente.getEndereco().getNumero()%>" size="5" /><br><br>
            <label>Bairro: </label>
            <input type="text" name="bairro" value="<%=cliente.getEndereco().getBairro()%>" size="30" />
            <label>Cidade: </label>
            <input type="text" name="cidade" value="<%=cliente.getEndereco().getCidade()%>" size="30" />
            <label>UF: </label>
            <input type="text" name="uf" value="<%=cliente.getEndereco().getUf()%>" size="2" /><br><br>
            <label>CEP: </label>
            <input type="text" name="cep" value="<%=cliente.getEndereco().getCep()%>" size="10" />
            <label>Email: </label>
            <input type="text" name="email" value="<%=cliente.getEmail()%>" size="50" /><br><br>
            <label>Digite a senha de acesso: </label>
            <input type="password" name="senha" value="" size="30" /><br><br>
            * campos obrigatórios<br><br>
            <input type="hidden" name="acao" value="salvar">
            <input type="submit" value="ENVIAR" name="enviar" />
            <input type="submit" value="CANCELAR" name="carcelar" /> <br><br>

        </form>  
        <%    
            } catch (Exception e) {

                out.print("Cpf não encontrado!");
            }  
            }
                

              if (request.getParameter("acao").equals("salvar")){
                  Cliente cliente1 = new Cliente();
              
                Endereco end = new Endereco();
                EnderecoDAO endao = new EnderecoDAO();

                

                end.setLogradouro(request.getParameter("logradouro"));
                end.setNumero(request.getParameter("numero"));
                end.setBairro(request.getParameter("bairro"));
                end.setCep(request.getParameter("cep"));
                end.setCidade(request.getParameter("cidade"));
                end.setUf(request.getParameter("uf"));
                cliente1.setCodigo(Integer.parseInt(request.getParameter("codigo")));
                cliente1.setNome(request.getParameter("nome"));
                cliente1.setCpf(request.getParameter("cpf"));
                cliente1.setSexo(request.getParameter("sexo"));
                cliente1.setTelefone(request.getParameter("telefone"));
                cliente1.setEmail(request.getParameter("email"));
                cliente1.setSenha(request.getParameter("senha"));
                ClienteDAO.editCliente(cliente1);
                 %>
                    <script> alert('Cliente CPF: cadastrado com sucesso!');</script>
                    <script>location.href="?action=cadastroClientes";</script>
                    <%
              }
        %>
    </body>
</html>
