package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pojo.Departs;

@Repository(value = "departsDAO")
@Transactional

public class DepartsDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public List<Departs> getDeparts() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "FROM Departs";
		Query q = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Departs> list = q.list();
		return list;
	}

	public Departs getDepart(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Departs departs = (Departs) session.get(Departs.class, id);
		return departs;
	}

	public boolean saveDepart(Departs departs) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.update(departs);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean deledeDepart(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Departs departs = (Departs) session.get(Departs.class, id);
		session.delete(departs);
		return true;
	}

	public boolean insertDepart(Departs departs) {
		Session session = this.sessionFactory.openSession();
		try {
			session.save(departs);
			return true;
		} catch (Exception e) {
			return false;
		} finally {
			session.close();
		}
	}

	public String getNewCodeId() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "SELECT id FROM Departs ORDER BY id desc";
		Query q = session.createQuery(hql);
		q.setFirstResult(0);
		q.setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<Integer> list = q.list();
		String newCodeId = "DE";
		int newId = list.get(0) + 1;
		try {
			if (String.valueOf(newId).length() == 1) {
				newCodeId += "00" + newId;
			} else if (String.valueOf(newId).length() == 2) {
				newCodeId += "0" + newId;
			} else {
				newCodeId += newId;
			}
		} catch (Exception e) {
			// Khong lay duoc ID, set ID ve 1
			System.out.println("Loi: " + e);
			newCodeId = "DE001";
		}
		return newCodeId;
	}

}
