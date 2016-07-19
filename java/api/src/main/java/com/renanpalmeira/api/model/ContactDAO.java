package com.renanpalmeira.api.model;

import java.util.List;
import org.hibernate.Session;
import com.renanpalmeira.api.model.Contact;

/**
 * Reference http://goo.gl/kX5jPV
 */
public class ContactDAO {
	private Session session;

	public ContactDAO(Session session) {
		this.session = session;
	}

	public List<Contact> getAll() {
		List<Contact> contactList = this.session.createQuery("from Contact").list();
		return contactList;
	}
}