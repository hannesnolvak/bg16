// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.bg.entities;

import ee.itcollege.bg.entities.Piiriloik;
import ee.itcollege.bg.entities.Vahtkond;
import java.lang.String;
import java.util.Date;

privileged aspect VahtkondPiiriloigul_Roo_JavaBean {
    
    public Vahtkond VahtkondPiiriloigul.getVahtkond() {
        return this.vahtkond;
    }
    
    public void VahtkondPiiriloigul.setVahtkond(Vahtkond vahtkond) {
        this.vahtkond = vahtkond;
    }
    
    public Piiriloik VahtkondPiiriloigul.getPiiriloik() {
        return this.piiriloik;
    }
    
    public void VahtkondPiiriloigul.setPiiriloik(Piiriloik piiriloik) {
        this.piiriloik = piiriloik;
    }
    
    public String VahtkondPiiriloigul.getKommentaar() {
        return this.kommentaar;
    }
    
    public void VahtkondPiiriloigul.setKommentaar(String kommentaar) {
        this.kommentaar = kommentaar;
    }
    
    public Date VahtkondPiiriloigul.getAlates() {
        return this.alates;
    }
    
    public void VahtkondPiiriloigul.setAlates(Date alates) {
        this.alates = alates;
    }
    
    public Date VahtkondPiiriloigul.getKuni() {
        return this.kuni;
    }
    
    public void VahtkondPiiriloigul.setKuni(Date kuni) {
        this.kuni = kuni;
    }
    
}
