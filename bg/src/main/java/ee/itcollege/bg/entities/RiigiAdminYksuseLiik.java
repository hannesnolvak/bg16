package ee.itcollege.bg.entities;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooEntity
public class RiigiAdminYksuseLiik extends BaseEntity {

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
