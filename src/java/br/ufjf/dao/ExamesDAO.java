
package br.ufjf.dao;

import br.ufjf.model.Cliente;
import br.ufjf.model.Exames;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.metamodel.SingularAttribute;

public class ExamesDAO { 

    
    public ExamesDAO() {
    }
    
     //cria a conexao com o banco  
    EntityManager conexao =  BancoDados.retornaBanco().createEntityManager();
    
    
    public ExamesDAO (EntityManagerFactory emf){
        ExamesDAO.emf=emf;
    }
    private static EntityManagerFactory emf=null;
    
    public static EntityManager getEntityManager(){
        return emf.createEntityManager();
    }

    public Exames getExamesPorCodigoCliente(int codigoCliente){
        Query c = getEntityManager().createNamedQuery("Exames.findByCodigoCliente");
        c.setParameter("codigoCliente", codigoCliente);
        
        try{
            return (Exames) c.getSingleResult();
        }catch (NoResultException e){
            return null;
        }catch (NonUniqueResultException e){
            List<Exames> lista =c.getResultList();
            return lista.get(0);
        }
    }  
    //public static List<Exames> retornaExames(int codigoCli){
        
     //return    
    
   // }

   
}
