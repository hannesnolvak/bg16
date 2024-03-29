package ee.itcollege.bg.entities;

import java.util.Date;
import java.util.Set;

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
public class RiigiAdminYksus extends BaseEntity {

	@OneToMany(mappedBy="alluv")
	private Set<AdminAlluvus> ylemused;

	@OneToMany(mappedBy="ylem")
	private Set<AdminAlluvus> alluvad;

/*
	@ManyToOne
	private RiigiAdminYksuseLiik liik;
*/
	
    @NotNull
    private String kommentaar;

    @NotNull
    @Size(max = 20)
    private String kood;

    @NotNull
    @Size(max = 100)
    private String nimetus;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date alates;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date kuni;
}
