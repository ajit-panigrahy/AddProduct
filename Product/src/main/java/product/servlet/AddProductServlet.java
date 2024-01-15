package product.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import product.entity.Product;

//@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productName = request.getParameter("productName");
		double price = Double.parseDouble(request.getParameter("price"));

		Product product = new Product();
		product.setName(productName);
		product.setPrice(price);

		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.save(product);
			transaction.commit();
			response.sendRedirect("index.jsp?success=true");
		} catch (Exception e) {
			transaction.rollback();
			response.sendRedirect("index.jsp?success=false&error="
					+ URLEncoder.encode(e.getMessage(), StandardCharsets.UTF_8.toString()));
		} finally {
			session.close();
			sessionFactory.close();
		}
	}
}
