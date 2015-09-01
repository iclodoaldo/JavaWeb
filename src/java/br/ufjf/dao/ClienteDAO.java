
package br.ufjf.dao;

import br.ufjf.model.Cliente;
import br.ufjf.model.Endereco;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.swing.JOptionPane;

/**
 *
 * @author clodoaldo
 */

public class ClienteDAO{
    
    public ClienteDAO (EntityManagerFactory emf){
        ClienteDAO.emf=emf;
    }
    private static EntityManagerFactory emf=BancoDados.retornaBanco();
    
    public static EntityManager getEntityManager(){
        return emf.createEntityManager();
    }
    public ClienteDAO() {
    }
    
    public static Cliente getClientePorLoginESenha(String cpf, String senha){
        Query c = getEntityManager().createNamedQuery("Cliente.findExistsCliente");
        c.setParameter("cpf", cpf);
        c.setParameter("senha", senha);
        
        try{
            return (Cliente) c.getSingleResult();
        }catch (NoResultException e){
            return null;
        }catch (NonUniqueResultException e){
            List<Cliente> lista =c.getResultList();
            return lista.get(0);
        }
    }  
    
    public static Cliente getClientePorCodigo(Integer codigo){
        Query cli = getEntityManager().createNamedQuery("Cliente.findByCodigo");
        cli.setParameter("codigo", codigo);
        
        try{
            return (Cliente) cli.getSingleResult();
        }catch (NoResultException e){
            return null;
        }catch (NonUniqueResultException e){
            List<Cliente> lista =cli.getResultList();
            return lista.get(0);
        }
    }  
    
    public static Cliente getClientePorLogin(int codigo){
        Query c = getEntityManager().createNamedQuery("Cliente.findByCodigo");
        c.setParameter("codigo", codigo);
        
        try{
            return (Cliente) c.getSingleResult();
        }catch (NoResultException e){
            return null;
        }catch (NonUniqueResultException e){
            List<Cliente> lista =c.getResultList();
            return lista.get(0);
        }
    }  
    
     public Cliente salvarCliente(Cliente cliente) {
   //     cliente.setCodigo(0);
        EntityManager em = getEntityManager();
        em.getTransaction().begin();

        if (cliente.getCpf() == null) {//verifica existe...

            try{em.persist(cliente);
             
            }catch (Exception e){JOptionPane.showMessageDialog(null, e);} // executa insert

        } else {
            try{cliente = em.merge(cliente);}catch (Exception e){JOptionPane.showMessageDialog(null, e);} //executa update

        }
        em.getTransaction().commit();
        em.close();
        
        return cliente;
    }
    
    //Delete Usuario... 
    public void removerCliente(String cpf) {

        EntityManager em = getEntityManager();
        Cliente cliente = em.find(Cliente.class, cpf);
        
        try {
            em.getTransaction().begin();
            em.remove(cliente);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    //Procura usuario por login...
    public Cliente consultaClienteporCpf(String cpf) {

        EntityManager em = getEntityManager();
        Cliente c = null;
        
        try {
            c = em.find(Cliente.class, cpf); // executa select
        } finally {
            em.close();
        }
        return c;
    }
    
    
    
}
