// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.bg.entities;

import ee.itcollege.bg.entities.VahtkondPiiriloigul;
import java.lang.Long;
import java.util.List;
import javax.persistence.Entity;

privileged aspect VahtkondPiiriloigul_Roo_Entity {
    
    declare @type: VahtkondPiiriloigul: @Entity;
    
    public static long VahtkondPiiriloigul.countVahtkondPiiriloiguls() {
        return entityManager().createQuery("SELECT COUNT(o) FROM VahtkondPiiriloigul o", Long.class).getSingleResult();
    }
    
    public static List<VahtkondPiiriloigul> VahtkondPiiriloigul.findAllVahtkondPiiriloiguls() {
        return entityManager().createQuery("SELECT o FROM VahtkondPiiriloigul o", VahtkondPiiriloigul.class).getResultList();
    }
    
    public static VahtkondPiiriloigul VahtkondPiiriloigul.findVahtkondPiiriloigul(Long id) {
        if (id == null) return null;
        return entityManager().find(VahtkondPiiriloigul.class, id);
    }
    
    public static List<VahtkondPiiriloigul> VahtkondPiiriloigul.findVahtkondPiiriloigulEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM VahtkondPiiriloigul o", VahtkondPiiriloigul.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
