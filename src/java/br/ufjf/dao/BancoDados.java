/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufjf.dao;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author clodoaldo
 */
public class BancoDados {
    private static final String nomeBanco= "LaboratorioPU";
    
    public static EntityManagerFactory retornaBanco(){
    
    return Persistence.createEntityManagerFactory(nomeBanco);
    }
}

