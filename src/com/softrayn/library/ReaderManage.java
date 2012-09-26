package com.softrayn.library;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

public class ReaderManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReaderManage() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		if (method == null) {
			method = "";
		}
		if (method.equals("add")) {
			add(request, response);
		}

		else if (method.equals("list")) {
			list(request, response);
		}

		else if (method.equals("preEdit")) {
			preEdit(request, response);
		} else if (method.equals("update")) {
			update(request, response);
		} else if (method.equals("delete")) {
			delete(request, response);
		}
	}

	protected void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String readersName = request.getParameter("readersName");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String category = request.getParameter("categoryId");
		int categoryId = Integer.parseInt(category);
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		ReaderBean reader = new ReaderBean();
		reader.setCategoryId(categoryId);
		reader.setPassword(password);
		reader.setReadersName(readersName);
		reader.setSex(sex);
		
		session.save(reader);
		
		session.getTransaction().commit();
		request.getRequestDispatcher("ReaderManage?method=list").forward(request, response);
		

	}

	protected void preEdit(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String dbId = request.getParameter("id");
		int id = Integer.parseInt(dbId);
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		ReaderBean reader = (ReaderBean)session.get(ReaderBean.class, id);
		request.setAttribute("reader", reader);
		
		@SuppressWarnings("rawtypes")
		List list = session.createQuery("from ReaderCategoryBean").list();
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/admin/editReader.jsp").forward(request, response);
		
		session.getTransaction().commit();
		
	}

	protected void update(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String dbId = request.getParameter("id");
		int id = Integer.parseInt(dbId);
		String readersName = request.getParameter("readersName");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String category = request.getParameter("categoryId");
		int categoryId = Integer.parseInt(category);
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		ReaderBean reader = (ReaderBean)session.get(ReaderBean.class, id);
		reader.setCategoryId(categoryId);
		reader.setReadersName(readersName);
		reader.setPassword(password);
		reader.setSex(sex);
		
		session.update(reader);
		session.getTransaction().commit();
		request.getRequestDispatcher("ReaderManage?method=list").forward(request, response);

		
	}

	protected void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		@SuppressWarnings("rawtypes")
		List list = session.createQuery("from ReaderBean").list();
		System.out.println(list.size());
		@SuppressWarnings("rawtypes")
		List categoryList = session.createQuery("from ReaderCategoryBean").list();

		request.setAttribute("list", list);
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/admin/showAllReaders.jsp").forward(request,
				response);

		session.getTransaction().commit();
	}

	protected void delete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String dbId = request.getParameter("id");
		int id = Integer.parseInt(dbId);
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		ReaderBean reader = (ReaderBean)session.get(ReaderBean.class, id);
		
		session.delete(reader);
		session.getTransaction().commit();
		request.getRequestDispatcher("ReaderManage?method=list").forward(request, response);

	}

}
