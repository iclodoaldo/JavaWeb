package br.ufjf.dao;

import br.ufjf.model.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;

public class UsuarioDAO {

    public UsuarioDAO (EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    

    
    public Usuario getUsuarioByLoginAndPassword(String login, String senha){
        Query q = getEntityManager()
                .createNamedQuery("Usuario.findExistsUser");
        q.setParameter("login", login);
        q.setParameter("senha", senha);

        try {
            return (Usuario) q.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (NonUniqueResultException e) {
            List<Usuario> lista = q.getResultList();
            return lista.get(0);
        }
    }
    
}