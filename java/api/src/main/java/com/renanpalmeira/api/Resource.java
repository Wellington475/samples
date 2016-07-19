package com.renanpalmeira.api;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.renanpalmeira.api.model.ContactDAO;

@Path("/")
public class Resource {

	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String get() {
		Configuration cfg = new Configuration();
		cfg.configure();

		SessionFactory sf = cfg.buildSessionFactory();
		Session session = sf.openSession();

		ContactDAO dao = new ContactDAO(session);

		dao.getAll();

		return "Hello JAX RS";
	}
}