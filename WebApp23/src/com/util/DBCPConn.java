/*=========================
 	DBCPConn.java
 ==========================*/

package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	private static Connection conn = null;
	
	public static Connection getConnection()
	{
		if (conn == null)
		{
			try
			{
				// ○ 이름과 객체를 바인딩
				//-- 컨텍스트(Context)를 얻어내는 가장 쉬운 방법은
				//   『javax.naming.InitialContext』클래스의
				//   인스턴스를 생성하는 것이다.
				//   → 『new InitialContext();』
				Context ctx = new InitialContext();
				
				// ※ javax.naming.InitialContext 메소드
				//    - bind(String str, Object obj)
				//      : 서비스할 객체를 특정 이름으로 등록한다.
				//    - rebind(String str, Object obj)
				//      : 서비스할 객체를 특정 이름으로 다시 등록한다.
				//    - list(String str)
				//      : 특정 이름으로 서비스하는 객체 정보를 반환한다.
				//    - unbinding(String str)
				//      : 등록된 객체를 메모리에서 해제한다.
				//    - Object lookup(String str)
				//      : 서비스중인 객체 정보를 얻어온다. 
				
				// 우리 - 특정 객체 필요 - 인스턴스 생성 이게 일반적 순서
				// (컨테이너 내부에서는)
				//  특정 객체들 이미 존재, 객체를 만들기 위한 설계도들도 쌓여 있음.
				//  우리가 특정 객체가 필요할 때.. 이 설계도를 쓰는 게 아님..!
				//  사과장수를 새롭게 만드는 것이 필요한 것이 아니라 컨테이너 안에서 만들어놔서, 홍대입구에 배치해 놓은!
				//  이 사과장수가 필요한 것임.
				//  그럼 생성된 것은 어떻게 불러오나?
				//  Context들은..Context c1 = new 특정객체(); .. 여기서 특정객체도 Context다..
				//  Object ob1 = new 사과장수(); 
				//  Object ob2 = new 포도장수();.. 이 개념이 container 안에서는
			    //  Context c1 = new 사과장수(); 이렇게 되어있는 것.
				//  Context를 기반으로 어떤 객체를 꺼내다 쓴다?
				//  우리 입장에서는 Context 구성,.. 얻어와서 써야함. 이걸 위해서 29 구문 쓴 것.
				//  Context : 서블릿 컨테이너에서 관리하는 자원.
				//  자원의 타입으로 또다른 특정 객체들을 구성해놓은 것들..
				
				// 『web.xml』로부터 환경 설정을 찾아오겠다는 코딩
				//-- 다른 형태로 변경 불가
				Context env = (Context)ctx.lookup("java:/comp/env");
				// context는 관리대장이 있다. lookup으로 web.wml을 가져오는게 아니라.. 
				// web.xml 에 설정되어 있는 "객체 정보"를 가져오는 것.
				// 즉 이 떄 가져와지는 것도 객체니까 Context로 다운 캐스팅 필요..
				
				DataSource ds = (DataSource)env.lookup("jdbc/myOracle");
				
				conn = ds.getConnection();
				
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return conn;
	} // end getConnection()
	
	public static void close()
	{
		if(conn != null)
		{
			try
			{
				if(!conn.isClosed())
					conn.close();
			}
			catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		conn = null;
		
	} // end close()

}
