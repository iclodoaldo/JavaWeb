
package br.ufjf.dao;

import static br.ufjf.dao.ClienteDAO.getEntityManager;
import br.ufjf.model.Cliente;
import br.ufjf.model.Exame;
import br.ufjf.model.TipoExame;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.swing.JOptionPane;

public class ExamesDAO {  

    public ExamesDAO() {
    }
    
     //cria a conexao com o banco  
    //static EntityManager conexao =  BancoDados.retornaBanco().createEntityManager();
    public static EntityManager getEM() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("LaboratorioPU");
        return factory.createEntityManager();
    }
   
    
        public static List<Exame> retornaTodosExames(){
         EntityManager em = getEM();

        Query e = em.createNamedQuery("Exame.findAll");
             
        
        try{
            List<Exame> lista =e.getResultList();
            return lista; 
        }catch (NoResultException ex){
            return null;
        }
        
        }

        public static List<Exame> retornaExames(Integer codigoCliente){
         EntityManager em = getEM();

        Query e = em.createNamedQuery("Exame.findByCodigoCliente");
        e.setParameter("codigoCliente", codigoCliente);
        
        
        try{
            List<Exame> lista =e.getResultList();
            return lista; 
        }catch (NoResultException ex){
            return null;
        }    
    
    }
    
    public Exame salvarExame(Exame exame) {

        EntityManager em = getEM();

        em.getTransaction().begin();

        if (exame.getCodigo() == null) {//verifica existe...

            em.persist(exame); // executa insert

        } else {
            exame = em.merge(exame); //executa update

        }
        em.getTransaction().commit();
        em.close();

        return exame;
    }
    
    public static Exame retornaDetalheExame(Integer codigoExame){
        EntityManager em = getEM();
        Query e = em.createNamedQuery("Exame.findByCodigo");
        e.setParameter("codigo", codigoExame);
        
        
        try{
            return (Exame) e.getSingleResult();
        }catch (NoResultException ex){
            return null;
        }catch (NonUniqueResultException exx){
            List<Exame> lista =e.getResultList();
            return lista.get(0);
        }    
    
    }
    
    public static void somaTotal(){
    JOptionPane.showMessageDialog(null, "lista.get(0)");
            EntityManager conexao =  BancoDados.retornaBanco().createEntityManager();
            
            JOptionPane.showMessageDialog(null, "lista.get(0)");
            List<Exame>lista = ExamesDAO.retornaTodosExames();
                JOptionPane.showMessageDialog(null, lista.get(0));
            
            for(int i=0;i==lista.size();i++){
                JOptionPane.showMessageDialog(null, lista.get(i));
            
            }
    
    
    }
    
    
    
}
