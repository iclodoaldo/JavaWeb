package br.ufjf.dao;

import br.ufjf.controller.exceptions.NonexistentEntityException;
import static br.ufjf.dao.ExamesDAO.getEM;
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
public class ClienteDAO {

    public ClienteDAO(EntityManagerFactory emf) {
        ClienteDAO.emf = emf;
    }
    private static EntityManagerFactory emf = BancoDados.retornaBanco();

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public ClienteDAO() {
    }

    public static Cliente getClientePorLoginESenha(String cpf, String senha) {
        Query c = getEntityManager().createNamedQuery("Cliente.findExistsCliente");
        c.setParameter("cpf", cpf);
        c.setParameter("senha", senha);

        try {
            return (Cliente) c.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (NonUniqueResultException e) {
            List<Cliente> lista = c.getResultList();
            return lista.get(0);
        }
    }

    public static Cliente getClientePorCodigo(Integer codigo) {
        Query cli = getEntityManager().createNamedQuery("Cliente.findByCodigo");
        cli.setParameter("codigo", codigo);

        try {
            return (Cliente) cli.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (NonUniqueResultException e) {
            List<Cliente> lista = cli.getResultList();
            return lista.get(0);
        }
    }

    public static Cliente getClientePorCpf(String cpf) {
        Query c = getEntityManager().createNamedQuery("Cliente.findByCpf");
        c.setParameter("cpf", cpf);

        try {
            return (Cliente) c.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (NonUniqueResultException e) {
            List<Cliente> lista = c.getResultList();
            return lista.get(0);
        }
    }

    public static Cliente getClientePorLogin(int codigo) {
        Query c = getEntityManager().createNamedQuery("Cliente.findByCodigo");
        c.setParameter("codigo", codigo);

        try {
            return (Cliente) c.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (NonUniqueResultException e) {
            List<Cliente> lista = c.getResultList();
            return lista.get(0);
        }
    }

    public Cliente salvarCliente(Cliente cliente) {
         
        ClienteDAO dao = new ClienteDAO();

        EntityManager em = getEM();

        em.getTransaction().begin();

        if (cliente.getCpf().equals(null)) {//verifica existe...

            em.persist(cliente); // executa insert se não existir

        } else {
            cliente = em.merge(cliente); //executa update se existir e faz o merge...

        }
        em.getTransaction().commit();
        em.close();

        return cliente;
    
    }
    
          public static  void editCliente(Cliente cliente) {
       EntityManager em = null;
       
            em = getEM();
            em.getTransaction().begin();
            Cliente atualizaCliente = em.find(Cliente.class,cliente.getCodigo() );
           int codigo = cliente.getCodigo();
          
            if (codigo != 0) {
                em.merge(atualizaCliente);
            }
            em.getTransaction().commit();
       
        
            if (em != null) {
                em.close();
            }
              
             


        }
    
    //Delete Usuario... 
    public void removerCliente(int codigo) {

        EntityManager em = getEM();
        Cliente cliente = em.find(Cliente.class, codigo);

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
