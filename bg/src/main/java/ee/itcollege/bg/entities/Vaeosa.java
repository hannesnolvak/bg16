package ee.itcollege.bg.entities;

import java.util.Collection;
import java.util.Date;

import javax.persistence.JoinColumn;
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
public class Vaeosa extends BaseEntity {

	@OneToMany(mappedBy="ylem")
	private Collection<VaeosaAlluvus> ylemused;

	@OneToMany(mappedBy="alluv")
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
}
