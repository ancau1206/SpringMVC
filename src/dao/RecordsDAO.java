package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pojo.Departs;
import pojo.Records;
import pojo.Staffs;
import dao.DepartsDAO;

@Repository(value = "recordsDAO")
@Transactional

public class RecordsDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	DepartsDAO dpd;
	
	public List<Records> getRecords() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "FROM Records";
		Query q = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Records> list = q.list();
		return list;
	}

	public Records getRecord(Byte id) {
		Session session = this.sessionFactory.getCurrentSession();
		Records Records = (Records) session.get(Records.class, id);
		return Records;
	}

	public boolean saveRecord(Records records) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.update(records);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean deledeRecord(Byte id) {
		Session session = this.sessionFactory.getCurrentSession();
		Records Records = (Records) session.get(Records.class, id);
		session.delete(Records);
		return true;
	}

	public boolean insertRecord(Records records) {
		Session session = this.sessionFactory.openSession();
		try {
			session.save(records);
			return true;
		} catch (Exception e) {
			System.out.println("Loi: " + e);
			return false;
		} finally {
			session.close();
		}
	}

	public List<Object[]> getTop10Records() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "SELECT r.staffs.name, SUM(case when r.type=1 then 1 else 0 end), SUM(case when r.type=0 then 1 else 0 end), SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end), r.staffs.departs.name, r.staffs.photo "
				+ "FROM Records r "
				+ "GROUP BY r.staffs.name, r.staffs.departs.name, r.staffs.photo "
				+ "ORDER BY (SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end)) desc, SUM(case when r.type=0 then 1 else 0 end) ASC";
		Query query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(10);
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list();
		return list;
	}
	
	public List<Records> getRecentActivity() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "FROM Records ORDER BY date desc";
		Query query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(7);
		@SuppressWarnings("unchecked")
		List<Records> list = query.list();
		return list;
	}
	
	public Map<Integer, List<Staffs>> getStaffsInDeparts() {
		Session session = this.sessionFactory.getCurrentSession();
		Map<Integer, List<Staffs>> m = new HashMap<Integer, List<Staffs>>();
		List<Departs> key = dpd.getDeparts();
		for(int i=0;i<key.size();i++) {
			@SuppressWarnings("unchecked")
			List<Staffs> value = session.createQuery("FROM Staffs r WHERE r.departs.id = '" + key.get(i).getId() + "'").list();
			m.put(key.get(i).getId(), value);
		}
		return m;
	}
	
	public List<Object[]> getStaffsRecords() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "SELECT r.staffs.codeId, r.staffs.name, SUM(case when r.type=1 then 1 else 0 end), SUM(case when r.type=0 then 1 else 0 end), SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end), r.staffs.id "
				+ "FROM Records r "
				+ "GROUP BY r.staffs.codeId, r.staffs.name, r.staffs.id "
				+ "ORDER BY (SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end)) desc, SUM(case when r.type=0 then 1 else 0 end) ASC";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list();
		return list;
	}
	
	public List<Object[]> getDepartsRecords() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "SELECT r.staffs.departs.codeId, r.staffs.departs.name, SUM(case when r.type=1 then 1 else 0 end), SUM(case when r.type=0 then 1 else 0 end), SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end) "
				+ "FROM Records r "
				+ "GROUP BY r.staffs.departs.codeId, r.staffs.departs.name "
				+ "ORDER BY (SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end)) desc, SUM(case when r.type=0 then 1 else 0 end) ASC";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list();
		return list;
	}
}