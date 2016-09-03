package com.renanpalmeira.hibernate;

import java.util.List;
import org.hibernate.Session;

public class App {
    public static void main(String args[]) {

        System.out.println("Go Hibernate");
        Session s = HibernateUtil.getSessionFactory().getCurrentSession();
        
        s.beginTransaction();
        
        List<Member> members = (List<Member>)s.createQuery("From Member").list();
        
        for(Member m : members) {
            System.out.println("Nome:" + m.getName());
        }
    }    
}