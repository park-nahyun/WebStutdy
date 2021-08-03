/**
 * ajax.js
 */

var ajax = null;
// AjaxTest01에서는 변수명 XMLHttp으로 했음 

// AJAX 객체(XMLHttpRequest 객체)생성 함수
function createAjax()
{
   // ※ 객체를 생성하는 방식(방법)의 차이일 뿐
   //     모두 XMLHttpRequest 객체를 생성하는 구문이다.
   
   /* 이해를 돕기 위해 작성한 코드
   if (window.ActiveXObject)   //-- IE 7 이전버전 사용하고 있는지 물어보는 중
   {
      //return new ActiveXObject("Microsoft.XMLHTTP");   // 그렇다면 이렇게 객체를 반환해 줄게
      return new ActiveXObject("Msxml2.XMLHTTP");         // 위 코드랑 같은 코드임 
      //-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해라.
      //    (ActiveXObject 객체 → XMLHttpRequest 객체의 대리 객체)
   }
   else                           //-- IE 7 이전 버전이 아닌 그 외 브라우저
   {
      if(window.XMLHttpRequest)         //-- XMLHttpRequest 객체 지원 브라우저
      {
         return new XMLHttpRequest();
         //-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해라.
      }
      else      //-- ActiveXObject도 지원 안하고 XMLHttpRequest도 지원 안하는거 = AJAX를 지원하지 않는 브라우저 
      {
         return null;
      }
   }
   */
   
   // 위 코드랑 같은데 축약한거
   if (window.ActiveXObject)   //-- IE 7 이전버전 사용하고 있는지 물어보는 중
      return new ActiveXObject("Msxml2.XMLHTTP");
   else if(window.XMLHttpRequest)
      return new XMLHttpRequest();
   else
      return null;
}