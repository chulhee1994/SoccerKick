package Soccer.filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {
	PrintWriter writer;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("SoccerKick 페이지 활성화");
		String filename = filterConfig.getInitParameter("filename");
		
		if(filename ==null)
			throw new ServletException("로그 파일의 이름을 찾을수 없습니다.");
		
		try {
			writer = new PrintWriter(new FileWriter(filename,true), true);
		}catch (IOException e) {
			throw new ServletException("로그 파일을 열수 없습니다.");
		}
	}
	
	@Override
	public void destroy() {
		System.out.println("Filter 파괴");
		writer.close();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
						 FilterChain filterChain)
			throws IOException, ServletException {
		writer.println("-----------------------------------------------");		
		long start = System.currentTimeMillis();
		String ip = request.getRemoteAddr();
		String url = getURLPath(request);
		
		System.out.println("접속한 클라이언트 IP:"+ip);
		System.out.println("접근한 URL 경로 : "+ url);
		
		writer.println("접근한 URL 경로 :" + url);
		writer.println("요청 처리 시작 시각 :" + getDate());
		
		filterChain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		writer.println("요청 처리 종료 시각 : " + getDate());
		writer.println("요청 처리 시작 시각 :" +getDate());
		writer.println("-----------------------------------------------");		
	}
	//URL 주소 구하는 메서드
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currnetPath = "";
		String queryString ="";
		if(request instanceof HttpServletRequest) {
			req =(HttpServletRequest) request;
			currnetPath = req.getRequestURI();
			queryString =req.getQueryString();
			queryString = queryString==null? "" : "?" + queryString;
		}
			return currnetPath + queryString;
	}
	
	//현재 날짜 구하는 메서드
	private String getDate() {
		Date d = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		String date = simpleDateFormat.format(d);
		return date;
		
	}
}
