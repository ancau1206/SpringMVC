package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pojo.Users;

@Repository(value = "usersDAO")
@Transactional

public class UsersDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public List<Users> getUsers() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "FROM Users";
		Query q = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Users> list = q.list();
		return list;
	}

	public Users getUser(Byte id) {
		Session session = this.sessionFactory.getCurrentSession();
		Users Users = (Users) session.get(Users.class, id);
		return Users;
	}

	public boolean saveUser(Users users) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			session.update(users);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean deledeUser(Byte id) {
		Session session = this.sessionFactory.getCurrentSession();
		Users Users = (Users) session.get(Users.class, id);
		session.delete(Users);
		return true;
	}

	public boolean insertUser(Users users) {
		Session session = this.sessionFactory.openSession();
		try {
			session.save(users);
			return true;
		} catch (Exception e) {
			session.close();
			return false;
		}
	}
	
	public boolean checkLogin(Users users) {
		Session session = this.sessionFactory.openSession();
		try {
			session.save(users);
			return true;
		} catch (Exception e) {
			session.close();
			return false;
		}
	}
	
}
