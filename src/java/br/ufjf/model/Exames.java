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
@Table(name = "exames")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Exames.findAll", query = "SELECT e FROM Exames e"),
    @NamedQuery(name = "Exames.findByIdExameRealizado", query = "SELECT e FROM Exames e WHERE e.idExameRealizado = :idExameRealizado"),
    @NamedQuery(name = "Exames.findByCodigoExame", query = "SELECT e FROM Exames e WHERE e.codigoExame = :codigoExame"),
    @NamedQuery(name = "Exames.findByCodigoCliente", query = "SELECT e FROM Exames e WHERE e.codigoCliente = :codigoCliente"),
    @NamedQuery(name = "Exames.findByPreco", query = "SELECT e FROM Exames e WHERE e.preco = :preco"),
    @NamedQuery(name = "Exames.findByDataExame", query = "SELECT e FROM Exames e WHERE e.dataExame = :dataExame"),
    @NamedQuery(name = "Exames.findByDataEntrega", query = "SELECT e FROM Exames e WHERE e.dataEntrega = :dataEntrega"),
    @NamedQuery(name = "Exames.findByPrazoEntrega", query = "SELECT e FROM Exames e WHERE e.prazoEntrega = :prazoEntrega")})
public class Exames implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idExameRealizado")
    private Integer idExameRealizado;
    @Column(name = "codigoExame")
    private Integer codigoExame;
    @Column(name = "codigoCliente")
    private Integer codigoCliente;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "preco")
    private Double preco;
    @Column(name = "dataExame")
    private String dataExame;
    @Column(name = "dataEntrega")
    private String dataEntrega;
    @Column(name = "prazoEntrega")
    private Integer prazoEntrega;

    public Exames() {
    }

    public Exames(Integer idExameRealizado) {
        this.idExameRealizado = idExameRealizado;
    }

    public Integer getIdExameRealizado() {
        return idExameRealizado;
    }

    public void setIdExameRealizado(Integer idExameRealizado) {
        this.idExameRealizado = idExameRealizado;
    }

    public Integer getCodigoExame() {
        return codigoExame;
    }

    public void setCodigoExame(Integer codigoExame) {
        this.codigoExame = codigoExame;
    }

    public Integer getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(Integer codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
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

    public Integer getPrazoEntrega() {
        return prazoEntrega;
    }

    public void setPrazoEntrega(Integer prazoEntrega) {
        this.prazoEntrega = prazoEntrega;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idExameRealizado != null ? idExameRealizado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Exames)) {
            return false;
        }
        Exames other = (Exames) object;
        if ((this.idExameRealizado == null && other.idExameRealizado != null) || (this.idExameRealizado != null && !this.idExameRealizado.equals(other.idExameRealizado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.ufjf.model.Exames[ idExameRealizado=" + idExameRealizado + " ]";
    }
    
}
