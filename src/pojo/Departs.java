package pojo;
// Generated Nov 21, 2018 9:17:59 PM by Hibernate Tools 4.3.5.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.validator.constraints.Length;

/**
 * Departs generated by hbm2java
 */
@Entity
@Table(name = "Departs", uniqueConstraints = @UniqueConstraint(columnNames = "CodeId"))
public class Departs {
	
	private int id;
	@Length(min=5,max=5)
	private String codeId;
	@Length(min=1,max=64)
	private String name;
	private Set<Staffs> staffses = new HashSet<Staffs>(0);

	public Departs() {
	}

	public Departs(String codeId, String name) {
		this.codeId = codeId;
		this.name = name;
	}

	public Departs(int id, String codeId, String name) {
		this.codeId = codeId;
		this.name = name;
		this.id = id;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "Id", unique = true, nullable = false, columnDefinition="tinyint(4)")
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "departs")
	public Set<Staffs> getStaffses() {
		return this.staffses;
	}

	public void setStaffses(Set<Staffs> staffses) {
		this.staffses = staffses;
	}

}