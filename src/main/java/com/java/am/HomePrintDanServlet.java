package com.java.am;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/home/printDan")
public class HomePrintDanServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String inputedDan = request.getParameter("dan");
		if (inputedDan == null) {
			inputedDan = "1";
		}

		String inputedLimit = request.getParameter("limit");

		if (inputedLimit == null) {
			inputedLimit = "9";
		}

		int dan = Integer.parseInt(inputedDan);
		int limit = Integer.parseInt(inputedLimit);

		response.getWriter().append(String.format("%ddan\n", dan));

		for (int i = 1; i <= limit; i++) {
			response.getWriter().append(String.format("%d * %d = %d\n", dan, i, dan * i));
		}
	}
}