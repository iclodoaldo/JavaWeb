/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufjf.dao;

import br.ufjf.model.Cliente;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;

/**
 *
 * @author clodoaldo
 */

public class ClienteDAO implements Serializable {
    
    public ClienteDAO (EntityManagerFactory emf){
        this.emf=emf;
    }
    private static EntityManagerFactory emf=null;
    
    public static EntityManager getEntityManager(){
        return emf.createEntityManager();
    }
    public ClienteDAO() {
    }
    
    public static Cliente getClientePorLoginESenha(String codigoCli, String senhaCli){
        Query c = getEntityManager().createNamedQuery("Cliente.findExistsCliente");
        c.setParameter("codigoCli", codigoCli);
        c.setParameter("senhaCli", senhaCli);
        
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
