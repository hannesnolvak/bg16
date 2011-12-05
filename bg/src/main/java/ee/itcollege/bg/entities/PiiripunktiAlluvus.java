package ee.itcollege.bg.entities;

import java.util.Date;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
public class PiiripunktiAlluvus {
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="vaeosa_ID")
	private Vaeosa vaeosa;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="piiripunkt_ID")
	private Piiripunkt piiripunkt;

    @NotNull
    private String kommentaar;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date alates;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date kuni;
}
