
package br.ufjf.dao;

import br.ufjf.model.Exames;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ExamesDAO {  

    public ExamesDAO() {
    }
    
     //cria a conexao com o banco  
    EntityManager conexao =  BancoDados.retornaBanco().createEntityManager();
    
    
    
    //public static List<Exames> retornaExames(int codigoCli){
        
     //return    
    
   // }
    
}
