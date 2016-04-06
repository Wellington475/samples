package com.spring.app;

import redis.clients.jedis.*;

public class App {
	public static void main(String[] args) {
		JedisPool pool = new JedisPool(new JedisPoolConfig(), "localhost");
		Jedis jedis = pool.getResource();

		jedis.set("spam", "eggs");

		String spam = jedis.get("spam");

		System.out.println("Spam: "+spam);

		pool.returnResource(jedis);
		pool.destroy();

		System.out.println("Hello Redis with Java!");
	}
}