package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.LienHe;
import model.bean.User;
import model.bo.LienHeBO;

/**
 * Servlet implementation class XemLienHeServlet
 */
@WebServlet("/XemLienHeServlet")
public class XemLienHeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XemLienHeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession hs = request.getSession();
		User acc = (User) hs.getAttribute("user");
		if (acc != null) {
			if (acc.getUserType() == 1) {
				response.sendRedirect("404.jsp");
				return;
			}
		} else {
			response.sendRedirect("IndexServlet");
			return;
		}
		String str = request.getParameter("idLienHe");
		LienHeBO lienHeBO = new LienHeBO();
		PrintWriter pw = response.getWriter();
		LienHe xemLienHeLH = null;
		if ((xemLienHeLH = lienHeBO.layLienHe(Integer.parseInt(str))) != null) {
			request.setAttribute("xemLienHeLH", xemLienHeLH);
			RequestDispatcher rd = request.getRequestDispatcher("admin/qlLienHe/xemLienHe.jsp");
			rd.include(request, response);
		} else {

			request.setAttribute("thatBai", "Có lỗi xảy ra");
			RequestDispatcher rd = request.getRequestDispatcher("DanhSachLienHeServlet");
			rd.include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
