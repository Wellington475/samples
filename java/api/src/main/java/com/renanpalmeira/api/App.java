package com.renanpalmeira.api;

import java.io.IOException;
import java.net.URI;

import org.glassfish.grizzly.http.server.HttpServer;
import org.glassfish.jersey.grizzly2.httpserver.GrizzlyHttpServerFactory;
import org.glassfish.jersey.server.ResourceConfig;

/**
 * Hello world!
 *
 */
public class App
{
	public static void main(String[] args) throws IOException
	{
		ResourceConfig config = new ResourceConfig().packages("com.renanpalmeira.api");
		URI uri = URI.create("http://localhost:8080/");
		HttpServer server = GrizzlyHttpServerFactory.createHttpServer(uri, config);

		System.out.println("* Server start");

		System.in.read();
		server.shutdownNow();
	}
}