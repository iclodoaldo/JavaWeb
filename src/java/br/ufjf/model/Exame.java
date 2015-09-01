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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author clodoaldo
 */
@Entity
@Table(name = "exame")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Exame.findAll", query = "SELECT e FROM Exame e"),
    @NamedQuery(name = "Exame.findByCodigo", query = "SELECT e FROM Exame e WHERE e.codigo = :codigo"),
    @NamedQuery(name = "Exame.findByCodigoCliente", query = "SELECT e FROM Exame e WHERE e.codigoCliente.codigo = :codigoCliente"),
    @NamedQuery(name = "Exame.findByDataExame", query = "SELECT e FROM Exame e WHERE e.dataExame = :dataExame"),
    @NamedQuery(name = "Exame.findByDataEntrega", query = "SELECT e FROM Exame e WHERE e.dataEntrega = :dataEntrega")})
public class Exame implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @Column(name = "dataExame")
    private String dataExame;
    @Basic(optional = false)
    @Column(name = "dataEntrega")
    private String dataEntrega;
    @JoinColumn(name = "codigoCliente", referencedColumnName = "codigo")
    @ManyToOne(optional = false)
    private Cliente codigoCliente;
    @JoinColumn(name = "codigoTipo", referencedColumnName = "codigoTipo")
    @ManyToOne(optional = false)
    private TipoExame codigoTipo;

    public Exame() {
    }

    public Exame(Integer codigo) {
        this.codigo = codigo;
    }

    public Exame(Integer codigo, String dataExame, String dataEntrega) {
        this.codigo = codigo;
        this.dataExame = dataExame;
        this.dataEntrega = dataEntrega;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getDataExame() {
        return dataExame;
    }

    public void setDataExame(String dataExame) {
        this.dataExame = dataExame;
    }

    public String getDataEntrega() {
        return dataEntrega;
    }

    public void setDataEntrega(String dataEntrega) {
        this.dataEntrega = dataEntrega;
    }

    public Cliente getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(Cliente codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    public TipoExame getCodigoTipo() {
        return codigoTipo;
    }

    public void setCodigoTipo(TipoExame codigoTipo) {
        this.codigoTipo = codigoTipo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Exame)) {
            return false;
        }
        Exame other = (Exame) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.ufjf.model.Exame[ codigo=" + codigo + " ]";
    }
    
}
