package br.ufjf.dao;

import br.ufjf.model.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsuarioDAO {

    public EntityManager getEM() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("LaboratorioPU");
        return factory.createEntityManager();
    }

    //Create e insert junto....
    public Usuario salvar(Usuario usuario) {

        EntityManager em = getEM();

        em.getTransaction().begin();

        if (usuario.getLogin() == null) {//verifica existe...

            em.persist(usuario); // executa insert

        } else {
            usuario = em.merge(usuario); //executa update

        }
        em.getTransaction().commit();
        em.close();

        return usuario;
    }
    
    //Delete Usuario... 
    public void removerUsuario(String login) {

        EntityManager em = getEM();
        Usuario usuario = em.find(Usuario.class, login);
        
        try {
            em.getTransaction().begin();
            em.remove(usuario);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    //Procura usuario por login...
    public Usuario consultaUsuarioporlogin(String login) {

        EntityManager em = getEM();
        Usuario u = null;
        
        try {
            u = em.find(Usuario.class, login); // executa select
        } finally {
            em.close();
        }
        return u;
    }


    public Usuario getUsuarioByLoginAndPassword(String login, String senha) {
        Query q = getEM()
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
