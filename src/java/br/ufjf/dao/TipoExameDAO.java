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
     
     public static List<TipoExame> retornaExamesPorTipo(){
         EntityManager em = getEM();

        Query e = em.createNamedQuery("TipoExame.findByOrdenNome");
             
        
        try{
            List<TipoExame> lista =e.getResultList();
            return lista; 
        }catch (NoResultException ex){
            return null;
        }
        
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
     
     public static String retornaFaturamento(){
        List <TipoExame> listaDosTipo = TipoExameDAO.retornaExamesPorTipo();
        List <Exame> listaExame = ExamesDAO.retornaTodosExames();
        int contador=0;
        Double valor=0.0;
        String mensagem="<table border=1><tr><td>Especialidade&nbsp;</td><td>&nbsp;&nbsp;Qtde&nbsp;&nbsp;</td><td>&nbsp;Arrecadacao</td></tr>";
        for (int i = 0; i < listaDosTipo.size(); i++) {//lista de tipoexame
            int codigoExame=listaDosTipo.get(i).getCodigoTipo();
                for (int j = 0; j < listaExame.size(); j++) {//lista de todos exames do tipo x
                    if (listaExame.get(j).getCodigoTipo().getCodigoTipo().equals(codigoExame)){
                        contador++;
                        valor+=listaDosTipo.get(i).getCusto();
                    }
                    }
                    
                    mensagem += "<tr><td>"+listaDosTipo.get(i).getNomeExame()+"&nbsp;</td><td>&nbsp;&nbsp;"+contador+"&nbsp;&nbsp;</td><td>&nbsp;R$&nbsp;"+valor+"</td></tr>";
                    //JOptionPane.showMessageDialog(null, listaDosTipo.get(i).getNomeExame()+"-"+contador+"-"+valor);
                    contador=0;
                    valor=0.0;
                }
        mensagem+="</table><br><br><br>";
        return mensagem;
     }
    
}
