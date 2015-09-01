package br.ufjf.dao;

import static br.ufjf.dao.ExamesDAO.getEM;
import br.ufjf.model.Exame;
import br.ufjf.model.TipoExame;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class TipoExameDAO {

     public static EntityManager getEM(){
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("LaboratorioPU");
    return factory.createEntityManager();
    }
    
    public static TipoExame getExamePorCodigo(Integer codigoTipo){
        Query te = getEM().createNamedQuery("TipoExame.findByCodigoTipo");
        te.setParameter("codigoTipo", codigoTipo);
        
        try{
            return (TipoExame) te.getSingleResult();
        }catch (NoResultException e){
            return null;
        }catch (NonUniqueResultException e){
            List<TipoExame> lista =te.getResultList();
            return lista.get(0);
        }
    } 
    
     public static TipoExame salvarTipoExame(TipoExame tipoExame) {

        EntityManager em = getEM();

        em.getTransaction().begin();

        if (tipoExame.getCodigoTipo() == null) {//verifica existe...

            em.persist(tipoExame); // executa insert

        } else {
            tipoExame = em.merge(tipoExame); //executa update

        }
        em.getTransaction().commit();
        em.close();

        return tipoExame;
    }
    
}
