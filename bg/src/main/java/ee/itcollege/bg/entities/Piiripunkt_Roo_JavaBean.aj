// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.bg.entities;

import ee.itcollege.bg.entities.Vaeosa;
import ee.itcollege.bg.entities.Vahtkond;
import java.lang.Number;
import java.lang.String;
import java.util.Collection;
import java.util.Date;

privileged aspect Piiripunkt_Roo_JavaBean {
    
    public Vaeosa Piiripunkt.getAllub() {
        return this.allub;
    }
    
    public void Piiripunkt.setAllub(Vaeosa allub) {
        this.allub = allub;
    }
    
    public Collection<Vahtkond> Piiripunkt.getVahtkonnad() {
        return this.vahtkonnad;
    }
    
    public void Piiripunkt.setVahtkonnad(Collection<Vahtkond> vahtkonnad) {
        this.vahtkonnad = vahtkonnad;
    }
    
    public String Piiripunkt.getKood() {
        return this.kood;
    }
    
    public void Piiripunkt.setKood(String kood) {
        this.kood = kood;
    }
    
    public String Piiripunkt.getNimetus() {
        return this.nimetus;
    }
    
    public void Piiripunkt.setNimetus(String nimetus) {
        this.nimetus = nimetus;
    }
    
    public String Piiripunkt.getKommentaar() {
        return this.kommentaar;
    }
    
    public void Piiripunkt.setKommentaar(String kommentaar) {
        this.kommentaar = kommentaar;
    }
    
    public Date Piiripunkt.getAlates() {
        return this.alates;
    }
    
    public void Piiripunkt.setAlates(Date alates) {
        this.alates = alates;
    }
    
    public Date Piiripunkt.getKuni() {
        return this.kuni;
    }
    
    public void Piiripunkt.setKuni(Date kuni) {
        this.kuni = kuni;
    }
    
    public Number Piiripunkt.getGPS_Longitude() {
        return this.GPS_Longitude;
    }
    
    public void Piiripunkt.setGPS_Longitude(Number GPS_Longitude) {
        this.GPS_Longitude = GPS_Longitude;
    }
    
    public Number Piiripunkt.getGPS_Latitude() {
        return this.GPS_Latitude;
    }
    
    public void Piiripunkt.setGPS_Latitude(Number GPS_Latitude) {
        this.GPS_Latitude = GPS_Latitude;
    }
    
    public Number Piiripunkt.getKorgus_merepinnast() {
        return this.korgus_merepinnast;
    }
    
    public void Piiripunkt.setKorgus_merepinnast(Number korgus_merepinnast) {
        this.korgus_merepinnast = korgus_merepinnast;
    }
    
}
