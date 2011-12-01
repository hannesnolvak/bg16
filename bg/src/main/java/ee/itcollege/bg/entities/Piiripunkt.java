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
public class Piiripunkt extends BaseEntity {
/*
	@NotNull
	@ManyToOne
	private Piiriloik piiriloik;
*/

	@NotNull
	@ManyToOne
	private Vaeosa allub;
	
	@NotNull
	@OneToMany(mappedBy="piiripunkt")
	private Collection<Vahtkond> vahtkonnad;
	
    @NotNull
    @Size(max = 20)
    private String kood;

    @NotNull
    private String nimetus;

    @NotNull
    private String kommentaar;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date alates;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date kuni;

    @NotNull
    private Number GPS_Longitude;

    @NotNull
    private Number GPS_Latitude;

    @NotNull
    private Number korgus_merepinnast;

    public static List<Piiripunkt> find(String kp, String vaeosa) {
        return entityManager().createQuery("SELECT o FROM Piiripunkt o", Piiripunkt.class).getResultList();
    }
}
