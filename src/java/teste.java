
import br.ufjf.dao.BancoDados;
import br.ufjf.dao.ClienteDAO;
import br.ufjf.dao.ExamesDAO;
import br.ufjf.model.Cliente;
import br.ufjf.model.Exames;
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
    
    public static void main(String[] args) {
        
        //ClienteDAO x = new ClienteDAO(Persistence.createEntityManagerFactory("LaboratorioPU"));
        ClienteDAO x = new ClienteDAO(BancoDados.retornaBanco());
        if(ClienteDAO.getClientePorLoginESenha("clodoaldo", "12345").getClass().isInstance(new Cliente())){
        Cliente eu = ClienteDAO.getClientePorLoginESenha("clodoaldo", "12345");
        JOptionPane.showMessageDialog(null, eu.getNome());
        }else{System.out.println("cliente ou senha incorretos...");}
        
        EntityManager conexao =  BancoDados.retornaBanco().createEntityManager();
        ExamesDAO ex = new ExamesDAO();
        
        List<Exames> lista = conexao.createNamedQuery("Exames.findByCodigoCliente").getResultList();
         for (Exames exames: lista){
         JOptionPane.showMessageDialog(null, exames.getCodigoExame());
         }
        
        
        
        
        
        
        
    }
    
}
