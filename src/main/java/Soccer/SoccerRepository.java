package Soccer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class SoccerRepository {
	PreparedStatement pstmt;
	Statement st;
	ResultSet rs;
	String sql;
	
	private List<SoccerVo> SoccerList = new ArrayList<SoccerVo>();
	private static SoccerRepository instance = new SoccerRepository();
	
	
	public SoccerRepository(){
		
		SoccerVo vo = new SoccerVo();
		vo.setNum(getNum());
		vo.setName("첼시 유니폼");
		vo.setPrice(35000);
		vo.setPublisher("나이키");
		vo.setInformation("첼시 FC 어센틱 2024-25 어웨이 유니폼 by 나이키");
		vo.setCondition("신품");
		vo.setCategory("유니폼");
		vo.setImg("soccer0.jpg");
		SoccerList.add(vo);
		
		vo = new SoccerVo();
		vo.setNum(getNum());
		vo.setName("맨체스터시티 유니폼");
		vo.setPrice(40000);
		vo.setPublisher("푸마");
		vo.setInformation("맨체스터 시티 FC 어센틱 2024-25 홈 유니폼 by 푸마");
		vo.setCondition("신품");
		vo.setCategory("유니폼");
		vo.setImg("soccer1.jpg");
		SoccerList.add(vo);
		
		vo = new SoccerVo();
		vo.setNum(getNum());
		vo.setPrice(60000);
		vo.setName("리버풀 유니폼");
		vo.setPublisher("나이키");
		vo.setInformation("리버풀 FC 어센틱 2024-25 홈 유니폼 by 나이키");
		vo.setCondition("신품");
		vo.setCategory("유니폼");
		vo.setImg("soccer2.jpg");
		SoccerList.add(vo);
		
		vo = new SoccerVo();
		vo.setNum(getNum());
		vo.setName("바이에른 뮌헨 유니폼");
		vo.setPrice(140000);
		vo.setPublisher("아디다스");
		vo.setInformation("FC 바이에른 뮌헨 어센틱 2023-24 홈 유니폼 by 아디다스");
		vo.setCondition("신품");
		vo.setCategory("유니폼");
		vo.setImg("soccer3.jpg");
		SoccerList.add(vo);
		
	}
	//싱글톤
	public static SoccerRepository getInstance() {
		return instance;
	}
	
	//상품 목록 리스트
	public List<SoccerVo> printSoccerList(){
		return SoccerList;
	}
	
	//상품 정보 불러오는 메서드
	public SoccerVo getSoccerVo(int num) {
		SoccerVo vo = null;
		
		for(int i =0; i<SoccerList.size(); i++) {
			SoccerVo Soccer = SoccerList.get(i);
			if(Soccer !=null && Soccer.getNum() ==num) {
				vo = Soccer;
				break;
			}
		}
		return vo;
	}
	
	//상품 추가 메서드
	public boolean addProduct(SoccerVo vo) {
		
		if(SoccerList.add(vo)) {
			return true;
		}
		return false;
	}
	//상품번호 시퀀스 같은 기능
	public Integer getNum() {
		int num = printSoccerList().size()+1;
		return num;
	}
	
	
}
