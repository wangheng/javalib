package com.softrayn.library;

import org.hibernate.Query;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.classic.Session;

public class BorrowManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BorrowManage() {
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
		System.out.println(method);
		if (method == null) {
			method = "";
		} else if (method.equals("add")) {
			add(request, response);
		} else if (method.equals("list")) {
			list(request, response);
		} else if (method.equals("delete")) {
			delete(request, response);
		} else if (method.equals("admin")) {

			admin(request, response);
		}
	}

	protected void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String booksIdPre = request.getParameter("booksId");
		String readersIdPre = request.getParameter("readersId");
		int booksId = Integer.parseInt(booksIdPre);
		int readersId = Integer.parseInt(readersIdPre);

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		BorrowBean borrow = new BorrowBean();

		ReaderBean reader = (ReaderBean) session.get(ReaderBean.class,
				readersId);
		ReaderCategoryBean category = (ReaderCategoryBean) session.get(
				ReaderCategoryBean.class, reader.getCategoryId());
		borrow.setBooksId(booksId);
		borrow.setReadersId(readersId);
		Date date = new Date();
		borrow.setBorrowDate(date);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, category.getBorrowDays());
		date = cal.getTime();
		borrow.setShouldReturnDate(date);
		session.save(borrow);

		session.getTransaction().commit();
		request.getRequestDispatcher(
				"/BorrowManage?method=list&readersId=" + reader.getId())
				.forward(request, response);
	}

	protected void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String readersIdPre = request.getParameter("readersId");
		int readersId = Integer.parseInt(readersIdPre);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		Query query = session
				.createQuery("from BorrowBean bb where bb.readersId = :readersId");
		query.setParameter("readersId", readersId);
		@SuppressWarnings("rawtypes")
		List list = query.list();
		request.setAttribute("list", list);

		request.getRequestDispatcher("/showAllBorrow.jsp").forward(request,
				response);

		session.getTransaction().commit();

	}

	// delete means return a book
	protected void delete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String booksIdPre = request.getParameter("booksId");
		int booksId = Integer.parseInt(booksIdPre);

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		BorrowBean borrow = (BorrowBean) session.get(BorrowBean.class, booksId);

		Date shouldReturnDate = borrow.getShouldReturnDate();
		Date now = new Date();
		
		long time1 = shouldReturnDate.getTime();
		long time2 = now.getTime();
		int days = (int)(time2-time1)/(1000*60*60*24);
		session.delete(borrow);
		session.getTransaction().commit();

		if(days > 0){
			request.setAttribute("days", days);
			request.getRequestDispatcher("/admin/countPay.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/BorrowManage?method=admin").forward(request, response);
		}
	}

	protected void admin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		Query query = session.createQuery("from BorrowBean");
		@SuppressWarnings("rawtypes")
		List list = query.list();
		request.setAttribute("list", list);

		request.getRequestDispatcher("/admin/adminBorrow.jsp").forward(request,
				response);

		session.getTransaction().commit();

	}

}
