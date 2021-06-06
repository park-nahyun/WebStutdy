/*===========================
 * 		WordDTO
 * ==========================*/
package com.test.ajax;

public class WordDTO
{
	// 주요 속성 구성
	private String word;
	
	// 기본 생성자
	public WordDTO()
	{
		this("");
	}
	// 사용자 정의 생성자
	public WordDTO(String word)
	{
		this.word = word;
	}
	
	// getter setter
	public String getWord()
	{
		return word;
	}
	public void setWord(String word)
	{
		this.word = word;
	}

}
