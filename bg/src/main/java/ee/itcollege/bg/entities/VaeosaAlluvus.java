package ee.itcollege.bg.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
@Table(name="vaeosa_alluvus")
public class VaeosaAlluvus extends BaseEntity {

	@ManyToOne
	@JoinColumn(name="alluva_vaeosa_ID")
	private Vaeosa alluv;

	@ManyToOne
	@JoinColumn(name="ylemus_vaeosa_ID")
	private Vaeosa ylem;
	
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
    
    public String getChildName()
    {
    	return alluv.getNimetus();
    }
    
    public static List<VaeosaAlluvus> findAllVaeosaAlluvuses()
    {
    	return entityManager().createQuery("SELECT o FROM VaeosaAlluvus o WHERE suletud >= '9999-12-31'", VaeosaAlluvus.class).getResultList();
    }
}
