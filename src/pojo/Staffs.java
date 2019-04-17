package pojo;
// Generated Nov 21, 2018 9:17:59 PM by Hibernate Tools 4.3.5.Final
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

/**
 * Staffs generated by hbm2java
 */
@Entity
@Table(name = "Staffs", uniqueConstraints = @UniqueConstraint(columnNames = "CodeId"))
public class Staffs {

	private int id;
	private Departs departs;
	
	@Length(max=8)
	private String codeId;
	
	@NotEmpty
	@Length(max=64)
	private String name;
	private boolean gender;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Past()
	@NotBlank
	@Temporal(TemporalType.DATE)
	private Date birthday;
	
	@Length(max=256)
	@Pattern(regexp="(?:([^:/?#]+):)?(?://([^/?#]*))?([^?#]*\\.(?:jpg|gif|png))(?:\\?([^#]*))?(?:#(.*))?")
	private String photo;
	
	@Length(max=64)
	@Pattern(regexp="^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$")
	private String email;
	
	@Pattern(regexp="(\\+8432|\\+8433|\\+8434|\\+8435|\\+8436|\\+8437|\\+8438|\\+8439|\\+8452|\\+8456|\\+8458|\\+8459|\\+847\\+84|\\+8476|\\+8477|\\+8478|\\+8479|\\+8481|\\+8482|\\+8483|\\+8484|\\+8485|\\+8486|\\+8488|\\+8489|\\+849\\+84|\\+8491|\\+8492|\\+8493|\\+8494|\\+8495|\\+8496|\\+8497|\\+8498|\\+8499|032|033|034|035|036|037|038|039|052|056|058|059|070|076|077|078|079|081|082|083|084|085|086|088|089|090|091|092|093|094|095|096|097|098|099)\\d{7,7}")
	private String phone;
	
	@DecimalMin(value="0")
	@DecimalMax(value="50000")
	private double salary;

	@Min(value=0)
	@Max(value=10)
	private byte level;
	
	@Length(max=50)
	private String notes;
	private Set<Records> recordses = new HashSet<Records>(0);

	public Staffs() {
	}

	public Staffs(Departs departs, int id, String codeId, String name, boolean gender, Date birthday,
			String photo, String email, String phone, double salary, byte level, String notes) {
		this.id = id;
		this.codeId = codeId;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.photo = photo;
		this.email = email;
		this.phone = phone;
		this.salary = salary;
		this.level = level;
		this.notes = notes;
		this.departs = departs;
	}
	
	public Staffs(Departs departs, String codeId, String name, boolean gender, Date birthday,
			String photo, String email, String phone, double salary, byte level, String notes) {
		this.departs = departs;
		this.codeId = codeId;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.photo = photo;
		this.email = email;
		this.phone = phone;
		this.salary = salary;
		this.level = level;
		this.notes = notes;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "Id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "DepartId")
	public Departs getDeparts() {
		return this.departs;
	}

	public void setDeparts(Departs departs) {
		this.departs = departs;
	}

	@Column(name = "CodeId", unique = true, nullable = false)
	public String getCodeId() {
		return this.codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	@Column(name = "Name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Gender", nullable = false)
	public boolean isGender() {
		return this.gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "Birthday", nullable = false, length = 10)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "Photo")
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name = "Email", nullable = false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Phone", nullable = false)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone.trim();
	}

	@Column(name = "Salary", nullable = false, precision = 53, scale = 0)
	public double getSalary() {
		return this.salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	@Column(name = "Level", nullable = false)
	public byte getLevel() {
		return this.level;
	}

	public void setLevel(byte level) {
		this.level = level;
	}

	@Column(name = "Notes")
	public String getNotes() {
		return this.notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "staffs")
	public Set<Records> getRecordses() {
		return this.recordses;
	}

	public void setRecordses(Set<Records> recordses) {
		this.recordses = recordses;
	}

}
