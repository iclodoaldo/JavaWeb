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
@Table(name = "tipoExame")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoExame.findAll", query = "SELECT t FROM TipoExame t"),
    @NamedQuery(name = "TipoExame.findByCodigoExame", query = "SELECT t FROM TipoExame t WHERE t.codigoExame = :codigoExame"),
    @NamedQuery(name = "TipoExame.findByNomeExame", query = "SELECT t FROM TipoExame t WHERE t.nomeExame = :nomeExame"),
    @NamedQuery(name = "TipoExame.findByCusto", query = "SELECT t FROM TipoExame t WHERE t.custo = :custo"),
    @NamedQuery(name = "TipoExame.findByHoraJenjum", query = "SELECT t FROM TipoExame t WHERE t.horaJenjum = :horaJenjum"),
    @NamedQuery(name = "TipoExame.findByDataExame", query = "SELECT t FROM TipoExame t WHERE t.dataExame = :dataExame"),
    @NamedQuery(name = "TipoExame.findByDataEntrega", query = "SELECT t FROM TipoExame t WHERE t.dataEntrega = :dataEntrega"),
    @NamedQuery(name = "TipoExame.findByPrazoEntrega", query = "SELECT t FROM TipoExame t WHERE t.prazoEntrega = :prazoEntrega")})
public class TipoExame implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigoExame")
    private Integer codigoExame;
    @Column(name = "nomeExame")
    private String nomeExame;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "custo")
    private Double custo;
    @Column(name = "horaJenjum")
    private Integer horaJenjum;
    @Column(name = "dataExame")
    private String dataExame;
    @Column(name = "dataEntrega")
    private String dataEntrega;
    @Column(name = "prazoEntrega")
    private Integer prazoEntrega;

    public TipoExame() {
    }

    public TipoExame(Integer codigoExame) {
        this.codigoExame = codigoExame;
    }

    public Integer getCodigoExame() {
        return codigoExame;
    }

    public void setCodigoExame(Integer codigoExame) {
        this.codigoExame = codigoExame;
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
        hash += (codigoExame != null ? codigoExame.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoExame)) {
            return false;
        }
        TipoExame other = (TipoExame) object;
        if ((this.codigoExame == null && other.codigoExame != null) || (this.codigoExame != null && !this.codigoExame.equals(other.codigoExame))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.ufjf.model.TipoExame[ codigoExame=" + codigoExame + " ]";
    }
    
}
