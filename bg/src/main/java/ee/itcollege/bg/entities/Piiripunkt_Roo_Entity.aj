// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.bg.entities;

import ee.itcollege.bg.entities.Piiripunkt;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Piiripunkt_Roo_Entity {
    
    declare @type: Piiripunkt: @Entity;
    
    @PersistenceContext
    transient EntityManager Piiripunkt.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer Piiripunkt.version;
    
    public Long Piiripunkt.getId() {
        return this.id;
    }
    
    public void Piiripunkt.setId(Long id) {
        this.id = id;
    }
    
    public Integer Piiripunkt.getVersion() {
        return this.version;
    }
    
    public void Piiripunkt.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Piiripunkt.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Piiripunkt.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Piiripunkt.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    public static final EntityManager Piiripunkt.entityManager() {
        EntityManager em = new Piiripunkt().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Piiripunkt.countPiiripunkts() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Piiripunkt o", Long.class).getSingleResult();
    }
    
    public static List<Piiripunkt> Piiripunkt.findAllPiiripunkts() {
        return entityManager().createQuery("SELECT o FROM Piiripunkt o", Piiripunkt.class).getResultList();
    }
    
    public static Piiripunkt Piiripunkt.findPiiripunkt(Long id) {
        if (id == null) return null;
        return entityManager().find(Piiripunkt.class, id);
    }
    
    public static List<Piiripunkt> Piiripunkt.findPiiripunktEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Piiripunkt o", Piiripunkt.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
