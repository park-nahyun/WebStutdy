package com.test.mvc;

public class MemberDTO
{
	private String memberId, memberPw, name, tel, email;

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getMemberPw()
	{
		return memberPw;
	}

	public void setMemberPw(String memberPw)
	{
		this.memberPw = memberPw;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}
}
