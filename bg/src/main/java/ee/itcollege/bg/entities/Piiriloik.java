package ee.itcollege.bg.entities;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
public class Piiriloik extends BaseEntity {

	@NotNull
	@ManyToOne
	private PiiriloiguHaldaja haldaja;
	
	@NotNull
	@OneToMany(mappedBy="piiriloik")
	private Collection<VahtkondPiiriloigul> vahtkonnad;
	
    @NotNull
    @Size(max = 20)
    private String kood;

    @NotNull
    private String nimetus;

    @NotNull
    private String kommentaar;

    @NotNull
    private String GPS_koordinaadid;
    
    public static List<Piiriloik> find(String kp, String vaeosa) {
        return entityManager().createQuery("SELECT o FROM Piiriloik o", Piiriloik.class).getResultList();
    }
}
