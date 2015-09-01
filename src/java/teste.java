
import br.ufjf.dao.BancoDados;
import br.ufjf.dao.ClienteDAO;
import br.ufjf.dao.EnderecoDAO;
import br.ufjf.dao.ExamesDAO;
import br.ufjf.dao.TipoExameDAO;
import br.ufjf.model.Cliente;
import br.ufjf.model.Endereco;
import br.ufjf.model.Exame;
import br.ufjf.model.TipoExame;
import java.util.List;
import javax.persistence.EntityManager;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author clodoaldo
 */
//commit
public class teste {
    
    public static void main(String[] args) {
        
     
        EntityManager conexao =  BancoDados.retornaBanco().createEntityManager();
        /**
                ExamesDAO ex = new ExamesDAO();
        Integer x = 5;///new Cliente();
        JOptionPane.showMessageDialog(null, ClienteDAO.getClientePorLoginESenha("2", "2"));
         //x.setCodigo(1);
        String resultado="";
        List<Exame> lista = ex.retornaExames(x);
         for (Exame exame: lista){
         resultado += "Cliente: "+exame.getCodigoCliente().getNome()+" - Exame de "+exame.getCodigoTipo().getNomeExame()
                 +" - Exame colhido em "+exame.getDataExame()+" - Entregar em "+exame.getDataEntrega()+"\n";
         }
        JOptionPane.showMessageDialog(null, resultado);
        
        //EnderecoDAO endDao = new EnderecoDAO();
        
        Endereco end = EnderecoDAO.getEnderecoPorId(1);
                JOptionPane.showMessageDialog(null, end.getCep());
        
        Exame exame = ExamesDAO.retornaDetalheExame(1);
        JOptionPane.showMessageDialog(null, exame.getCodigoCliente().getNome());
        
          
        ////////////////////////////////////////////////////////////////////////
        Exame exame2 = new Exame();
        ExamesDAO dao = new ExamesDAO();
                Cliente cliente = ClienteDAO.getClientePorCodigo(1);
                TipoExame tipoExame = TipoExameDAO.getExamePorCodigo(2);
                JOptionPane.showMessageDialog(null, cliente.getNome());
                
                exame2.setCodigo(4);
                exame2.setCodigoCliente(cliente);
                exame2.setCodigoTipo(tipoExame);
                exame2.setDataExame("datasssssExame");
                exame2.setDataEntrega("dataEntrega");
                
               
                dao.salvarExame(exame2);
                
           */
        
                    Cliente cliente = new Cliente();
                    ClienteDAO dao = new ClienteDAO();
                    Endereco end = new Endereco();
                    EnderecoDAO endao = new EnderecoDAO();

                    
                    
                    end.setLogradouro("rua1");
                    end.setNumero("1");
                    end.setBairro("bairro");
                    end.setCep("cep");
                    end.setCidade("cidade");
                    end.setUf("uf");
                    
                    cliente.setCodigo(0);
                    cliente.setNome("nomeoooooocliente");
                    cliente.setCpf("cpf");
                    cliente.setSexo("sexo");
                    cliente.setTelefone("telefone");
                    cliente.setEmail("email");
                    //cliente.setLogin(request.getParameter("login"));
                    cliente.setSenha("senha");
                   
                    end=EnderecoDAO.getUltimoEndereco();
                    Endereco endSalvo = endao.salvarEndereco(end);
                    cliente.setEndereco(endSalvo);
                    JOptionPane.showMessageDialog(null, endSalvo.getIdEndereco());
                    
                    dao.salvarCliente(cliente);
 
        
        
            
    }





}