package jp.co.vcms.common;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

public class CBase {

	private HttpServletRequest request = null;
	private MultipartRequest multi_request = null;
	private HttpServletResponse response = null;
	public HttpSession session = null;
	public Map<String, Object> user = null;

	public CBase(HttpServletRequest request, MultipartRequest multi_request, HttpServletResponse response) {

		this.request = request;
		this.multi_request = multi_request;
		this.response = response;
		this.session = this.request.getSession();

		// ?ù∏ÏΩîÎî©
		try {

			this.response.setCharacterEncoding("UTF-8");
			this.request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {

		}

	}

	public CBase(HttpServletRequest request, HttpServletResponse response) {

		this.request = request;
		this.response = response;
		this.session = this.request.getSession();

		// ?ù∏ÏΩîÎî©
		try {

			this.response.setCharacterEncoding("UTF-8");
			this.request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {

		}

	}

	public void SetView(String key, Object value) {
		this.request.setAttribute(key, value);
	}

}
