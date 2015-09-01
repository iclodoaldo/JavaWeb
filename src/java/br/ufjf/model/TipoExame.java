/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufjf.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author clodoaldo
 */
@Entity
@Table(name = "tipoExame")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoExame.findAll", query = "SELECT t FROM TipoExame t"),
    @NamedQuery(name = "TipoExame.findByCodigoTipo", query = "SELECT t FROM TipoExame t WHERE t.codigoTipo = :codigoTipo"),
    @NamedQuery(name = "TipoExame.findByNomeExame", query = "SELECT t FROM TipoExame t WHERE t.nomeExame = :nomeExame"),
    @NamedQuery(name = "TipoExame.findByCusto", query = "SELECT t FROM TipoExame t WHERE t.custo = :custo"),
    @NamedQuery(name = "TipoExame.findByHoraJenjum", query = "SELECT t FROM TipoExame t WHERE t.horaJenjum = :horaJenjum"),
    @NamedQuery(name = "TipoExame.findByPrazoEntrega", query = "SELECT t FROM TipoExame t WHERE t.prazoEntrega = :prazoEntrega")})
public class TipoExame implements Serializable {
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoTipo")
    private Collection<Exame> exameCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "codigoTipo")
    private Integer codigoTipo;
    @Column(name = "nomeExame")
    private String nomeExame;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "custo")
    private Double custo;
    @Column(name = "horaJenjum")
    private Integer horaJenjum;
    @Column(name = "prazoEntrega")
    private Integer prazoEntrega;

    public TipoExame() {
    }

    public TipoExame(Integer codigoTipo) {
        this.codigoTipo = codigoTipo;
    }

    public Integer getCodigoTipo() {
        return codigoTipo;
    }

    public void setCodigoTipo(Integer codigoTipo) {
        this.codigoTipo = codigoTipo;
    }

    public String getNomeExame() {
        return nomeExame;
    }

    public void setNomeExame(String nomeExame) {
        this.nomeExame = nomeExame;
    }

    public Double getCusto() {
        return custo;
    }

    public void setCusto(Double custo) {
        this.custo = custo;
    }

    public Integer getHoraJenjum() {
        return horaJenjum;
    }

    public void setHoraJenjum(Integer horaJenjum) {
        this.horaJenjum = horaJenjum;
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
        hash += (codigoTipo != null ? codigoTipo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoExame)) {
            return false;
        }
        TipoExame other = (TipoExame) object;
        if ((this.codigoTipo == null && other.codigoTipo != null) || (this.codigoTipo != null && !this.codigoTipo.equals(other.codigoTipo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.ufjf.model.TipoExame[ codigoTipo=" + codigoTipo + " ]";
    }

    @XmlTransient
    public Collection<Exame> getExameCollection() {
        return exameCollection;
    }

    public void setExameCollection(Collection<Exame> exameCollection) {
        this.exameCollection = exameCollection;
    }
    
}
