package ee.itcollege.bg.entities;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;

//@RooToString
@RooJavaBean
@RooEntity
public class Vaeosa extends BaseEntity {
	
	@OneToOne(mappedBy="alluv", cascade = CascadeType.ALL)
	private VaeosaAlluvus ylemus;

	@OneToMany(mappedBy="ylem", cascade = CascadeType.ALL)
	private Collection<VaeosaAlluvus> alluvad;
	
	@ManyToOne
    @JoinColumn(name="riigi_admin_yksus_ID")
    private RiigiAdminYksus asukoht;

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
    
    public Vaeosa getParent()
    {
    	if(ylemus == null)
    		return null;
    	
    	return ylemus.getYlem();
    }
    
    public void setParent(Vaeosa what)
    {
    	if(what != null && ylemus != null)
    	{
    		if(what.equals(ylemus))
    		{
    			return;
    		}

    		ylemus.close();
    		ylemus.persist();
    	}

    	VaeosaAlluvus a = new VaeosaAlluvus();
    	
    	if(ylemus == null)
    	{
    		a.setAlates(new Date());
    		a.setKuni(BaseEntity.surrogate.getTime());
    		a.setKommentaar("");
    	}
    	else
    	{
	    	a.setAlates(ylemus.getAlates());
	    	a.setKuni(ylemus.getKuni());
	    	a.setKommentaar(ylemus.getKommentaar());
    	}

    	a.setAlluv(this);
    	a.setYlem(what);
    	
    	ylemus = a;
    }
}
