/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufjf.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author clodoaldo
 */
@Entity
@Table(name = "cliente")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM Cliente c"),
    @NamedQuery(name = "Cliente.findByCodigoCli", query = "SELECT c FROM Cliente c WHERE c.codigoCli = :codigoCli"),
    @NamedQuery(name = "Cliente.findBySenhaCli", query = "SELECT c FROM Cliente c WHERE c.senhaCli = :senhaCli"),
    @NamedQuery(name="Cliente.findExistsCliente", query="SELECT c FROM Usuario c WHERE " + "c.login = :login and "
                    + "c.senha = :senha")})
public class Cliente implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigoCli")
    private Integer codigoCli;
    @Column(name = "senhaCli")
    private String senhaCli;

    public Cliente() {
    }

    public Cliente(Integer codigoCli) {
        this.codigoCli = codigoCli;
    }

    public Integer getCodigoCli() {
        return codigoCli;
    }

    public void setCodigoCli(Integer codigoCli) {
        this.codigoCli = codigoCli;
    }

    public String getSenhaCli() {
        return senhaCli;
    }

    public void setSenhaCli(String senhaCli) {
        this.senhaCli = senhaCli;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigoCli != null ? codigoCli.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.codigoCli == null && other.codigoCli != null) || (this.codigoCli != null && !this.codigoCli.equals(other.codigoCli))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.ufjf.dao.Cliente[ codigoCli=" + codigoCli + " ]";
    }
    
}
