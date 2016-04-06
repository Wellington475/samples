package com.renanpalmeira.cassandra;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.Metadata;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;

public class App {

	private static Cluster cluster;
	private static Session session;

	public static Cluster connect(String node) {
		return Cluster.builder().addContactPoint(node).build();
	}

	public static void main(String[] args) {
		cluster = connect("localhost");
		session = cluster.connect("system");

		System.out.println("Hello World Cassandra With Java Driver!");

		ResultSet results = session.execute("SELECT * FROM local");
		for(Row row : results) {
			System.out.println(row.getString("cluster_name"));
		}

		session.close();
		cluster.close();
	}
}