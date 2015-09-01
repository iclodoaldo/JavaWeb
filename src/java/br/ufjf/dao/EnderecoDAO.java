/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufjf.dao;

import static br.ufjf.dao.ClienteDAO.getEntityManager;
import br.ufjf.model.Cliente;
import br.ufjf.model.Endereco;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import org.w3c.dom.Entity;

/**
 *
 * @author clodoaldo
 */
public class EnderecoDAO {
    
    public static EntityManager getEM(){
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("LaboratorioPU");
    return factory.createEntityManager();
    }
    
    EntityManager em = getEM();
    
    public static Endereco getUltimoEndereco(){
        Query e = getEM().createNamedQuery("Endereco.findUltimoEnd");
                
        try{
            return (Endereco) e.getSingleResult();
        }catch (NoResultException exx){
            return null;
        }catch (NonUniqueResultException ex){
            List<Endereco> lista =e.getResultList();
            return lista.get(0);
        }
    
    }
    
    public static Endereco getEnderecoPorId(Integer idEndereco){
        Query e = getEM().createNamedQuery("Endereco.findByIdEndereco");
        e.setParameter("idEndereco", idEndereco);
        
        try{
            return (Endereco) e.getSingleResult();
        }catch (NoResultException exx){
            return null;
        }catch (NonUniqueResultException ex){
            List<Endereco> lista =e.getResultList();
            return lista.get(0);
        }
    
    }
    
    
    public Endereco salvarEndereco(Endereco endereco) {

        EntityManager em = getEM();

        em.getTransaction().begin();

        if (endereco.getLogradouro()== null) {//verifica existe...

            em.persist(endereco); // executa insert

        } else {
            endereco = em.merge(endereco); //executa update

        }
        em.getTransaction().commit();
        em.close();

        return endereco;
    }
    
    //Delete endereco... 
    public void removerendereco(String logradouro) {

        EntityManager em = getEntityManager();
        Endereco endereco = em.find(Endereco.class, logradouro);
        
        try {
            em.getTransaction().begin();
            em.remove(endereco);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    
}
