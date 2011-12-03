package ee.itcollege.bg.entities;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreRemove;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;

@MappedSuperclass
@RooToString
@RooEntity(mappedSuperclass = true)
@Access(AccessType.FIELD)
public abstract class BaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Size(max = 32)
	private String avaja;

	@Size(max = 32)
	private String muutja;

	@Size(max = 32)
	private String sulgeja;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date avatud;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date muudetud;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date suletud;

	public static final Calendar surrogate;

	static {
		surrogate = Calendar.getInstance();

		surrogate.set(Calendar.YEAR, 9999);
		surrogate.set(Calendar.MONTH, Calendar.DECEMBER);
		surrogate.set(Calendar.DATE, 31);

		surrogate.set(Calendar.HOUR_OF_DAY, 0);
		surrogate.set(Calendar.MINUTE, 0);
		surrogate.set(Calendar.SECOND, 0);
		surrogate.set(Calendar.MILLISECOND, 0);
	}

	@PrePersist
	public void recordCreated() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		avaja  = auth.getName();
		avatud = new Date();

		muutja   = auth.getName();
		muudetud = new Date();

		if (suletud == null) {
			suletud = surrogate.getTime();
		} else {
			sulgeja = auth.getName();
		}
	}

	@PreUpdate
	public void recordModified() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		muutja   = auth.getName();
		muudetud = new Date();
	}

	@PreRemove
	public void preventRemove() {
		if(suletud != null)
			throw new SecurityException("Seda objekti ei saa enam muuta!");
	}

	public void close() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		suletud = new Date();
		sulgeja = auth.getName();
	}

	@Transactional
	public void remove() {
		close();

		if (this.entityManager == null)
			this.entityManager = entityManager();

		entityManager.persist(this);
	}

	@Transactional
	public BaseEntity merge() {
		if (this.entityManager == null)
			this.entityManager = entityManager();

		if (id != null && !entityManager.contains(this)) {
			BaseEntity oldEntity = entityManager.find(getClass(), id);
			oldEntity.close();

			if (getAvatud() == null) {
				avatud = oldEntity.getAvatud();
				avaja  = oldEntity.getAvaja();
			}
			
			suletud = null;
			sulgeja = null;

			clearId();
			persist();
			
			return this;
		}

		BaseEntity merged = entityManager.merge(this);
		entityManager.flush();
		return merged;
	}
	
	public void clearId()
	{
		this.id = null;
	}

	public String getAvaja() {
		return avaja;
	}

	public String getMuutja() {
		return muutja;
	}

	public String getSulgeja() {
		return sulgeja;
	}

	public Date getAvatud() {
		return avatud;
	}

	public Date getMuudetud() {
		return muudetud;
	}

	public Date getSuletud() {
		return suletud;
	}
}
