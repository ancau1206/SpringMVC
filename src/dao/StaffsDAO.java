package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pojo.Staffs;

@Repository(value = "staffsDAO")
@Transactional

public class StaffsDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public List<Staffs> getStaffs() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "FROM Staffs";
		Query q = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Staffs> list = q.list();
		return list;
	}

	public List<Object[]> getTableStaffs() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "SELECT s.codeId, s.name, s.departs.name, s.id FROM Staffs s";
		Query q = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Object[]> list = q.list();
		return list;
	}

	public Staffs getStaff(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Staffs staffs = (Staffs) session.get(Staffs.class, id);
		return staffs;
	}

	public boolean updateStaff(Staffs staffs) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.update(staffs);
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public boolean deledeStaff(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Staffs Staffs = (Staffs) session.get(Staffs.class, id);
		session.delete(Staffs);
		return true;
	}

	public boolean insertStaff(Staffs staffs) {
		Session session = this.sessionFactory.openSession();
		try {
			session.save(staffs);
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		} finally {
			session.close();
		}
	}

	public String getNewCodeId() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "SELECT id FROM Staffs ORDER BY id desc";
		Query q = session.createQuery(hql);
		q.setFirstResult(0);
		q.setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<Integer> list = q.list();
		String newCodeId = "ST";
		int newId = list.get(0) + 1;
		try {
			if (String.valueOf(newId).length() == 1) {
				newCodeId += "000" + newId;
			} else if (String.valueOf(newId).length() == 2) {
				newCodeId += "00" + newId;
			} else if (String.valueOf(newId).length() == 3) {
				newCodeId += "0" + newId;
			} else {
				newCodeId += newId;
			}
		} catch (Exception e) {
			//Khong lay duoc ID, set ID ve 1
			System.out.println("Loi: " + e);
			newCodeId = "ST0001";
		}
		return newCodeId;
	}
}
