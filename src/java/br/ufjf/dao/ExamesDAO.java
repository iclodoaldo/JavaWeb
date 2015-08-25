
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
import jdk.nashorn.internal.ir.RuntimeNode;
import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

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

   
    //public static List<Exames> retornaExames(int codigoCli){
        
     //return    
    
   // }

    public List retornaExmesPorCliente(int codigoCliente) {
        String vHql = "select exames.codigoExame, tipoexame.nomeExame, exames.dataExame, exames.dataEntrega "
                + "FROM exames INNER JOIN tipoexame ON  exames.codigoExame = tipoexame.codigoTipo";  
        
        Query q = getEntityManager().createQuery(vHql);
        
        return q.getResultList();
    }
   
   
}
