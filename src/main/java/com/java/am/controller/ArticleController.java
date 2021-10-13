package com.java.am.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArticleController {
	
	private HttpServletRequest request;
	private HttpServletResponse response;
	private Connection con;

	public ArticleController(HttpServletRequest request, HttpServletResponse response, Connection con) {
		this.request = request;
		this.response = response;
		this.con = con;
	}

}
