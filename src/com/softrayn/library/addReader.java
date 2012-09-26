package com.softrayn.library;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

public class addReader extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public addReader() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		@SuppressWarnings("rawtypes")
		List list = session.createQuery("from ReaderCategoryBean").list();

		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/addReader.jsp").forward(request,
				response);

		session.getTransaction().commit();
	}

}
