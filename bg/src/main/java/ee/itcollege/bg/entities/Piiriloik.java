package ee.itcollege.bg.entities;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
public class Piiriloik extends BaseEntity {

	@ManyToOne
	private PiiriloiguHaldaja haldaja;
	
	@OneToMany(mappedBy="piiriloik")
	private Set<VahtkondPiiriloigul> vahtkonnad;
	
    @NotNull
    @Size(max = 20)
    private String kood;

    @NotNull
    private String nimetus;

    @NotNull
    private String kommentaar;

    @NotNull
    private String GPS_koordinaadid;

    public static List<Piiriloik> find(String vaeosa, String kp) {
        return entityManager().createQuery("SELECT o FROM Piiriloik o WHERE EXISTS (SELECT 1 FROM PiiripunktiAlluvus a WHERE a.piiripunkt = o AND a.vaeosa = :vid AND avatud >= :kp AND suletud <= :kp)", Piiriloik.class).setParameter("vid", vaeosa).setParameter("kp", kp).getResultList();
    }
    
    public void setHaldaja(PiiriloiguHaldaja h)
    {
    	if(haldaja != null)
    	{
    		haldaja.setKuni(new Date());
    	}
    	
    	h.setAlates(new Date());
    	
    	haldaja = h;
    }
}
