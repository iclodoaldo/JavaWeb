
package br.ufjf.dao;

import br.ufjf.model.Cliente;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author clodoaldo
 */

public class ClienteDAO{
    
    public ClienteDAO (EntityManagerFactory emf){
        ClienteDAO.emf=emf;
    }
    private static EntityManagerFactory emf=null;
    
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
}
