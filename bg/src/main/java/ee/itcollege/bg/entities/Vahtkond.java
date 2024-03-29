package ee.itcollege.bg.entities;

import java.util.Date;

import javax.persistence.ManyToOne;
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
public class Vahtkond extends BaseEntity {

	@NotNull
	@ManyToOne
	private Piiripunkt piiripunkt;
	
	@NotNull
	@ManyToOne
	private Vaeosa vaeosa;

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
