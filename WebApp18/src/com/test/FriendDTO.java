/*==================
   FriendDTO.java
 ===================*/

package com.test;

public class FriendDTO
{
	
	// 주요 속성 구성(이름, 나이, 성별, 이상형)
	private String userName, userAge, gender;
	private String[] boys;
	//-- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//   즉, 다중 선택이 가능하도록 구성된 컨트롤이기 때문에
	//   배열로 처리한다.

	// getter / setter 구성
	public String[] getBoys()
	{
		return boys;
	}

	public void setBoys(String[] boys)
	{
		this.boys = boys;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getUserAge()
	{
		return userAge;
	}

	public void setUserAge(String userAge)
	{
		this.userAge = userAge;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}


}
