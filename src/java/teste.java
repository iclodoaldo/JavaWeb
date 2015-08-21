
import br.ufjf.dao.BancoDados;
import br.ufjf.dao.ClienteDAO;
import br.ufjf.dao.ExamesDAO;
import br.ufjf.dao.UsuarioDAO;
import br.ufjf.model.Cliente;
import br.ufjf.model.Exame;
import br.ufjf.model.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;
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
public class teste {
    
    public static void main(String[] args) throws Exception {
        
        Usuario u = new Usuario();
        
        
        u.setMatricula(8);
        u.setNome("Ranier");
        u.setLogin("8");
        u.setSenha("8");
        u.setCpf("8");
        
        
        
        UsuarioDAO dao = new UsuarioDAO();
        u = dao.salvar(u);
        
        
        System.out.println(u.toString()+ "salvou");
                
        /**  
        
        //ClienteDAO x = new ClienteDAO(Persistence.createEntityManagerFactory("LaboratorioPU"));
        ClienteDAO x = new ClienteDAO(BancoDados.retornaBanco());
        if(ClienteDAO.getClientePorLoginESenha("clodoaldo", "12345").getClass().isInstance(new Cliente())){
        Cliente eu = ClienteDAO.getClientePorLoginESenha("clodoaldo", "12345");
        JOptionPane.showMessageDialog(null, eu.getNome());
        }else{System.out.println("cliente ou senha incorretos...");}
        
        EntityManager conexao =  BancoDados.retornaBanco().createEntityManager();
        ExamesDAO ex = new ExamesDAO();
        
        List<Exame> lista = conexao.createNamedQuery("Exame.findByCodigoCliente").getResultList();
         for (Exame exame: lista){
         JOptionPane.showMessageDialog(null, exame.getCodigo());
         }
        **/
        
        
        
        
        
        
    }
    
}
