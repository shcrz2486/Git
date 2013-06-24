<%
	'************************************************************************************/
	'* - 결과값 복호화를 위해 IV 값을 Random하게 생성함.(반드시 필요함!!)			    */
	'* - input박스 reqNum의 value값을 curDate & RandNo 형태로 지정						*/
 	'************************************************************************************/
	'현재시간 구하기
	Dim curDate 
	curDate = year(now) & right("0" & Month(now),2) & right("0" & day(now),2) & right("0" & hour(now),2) & right("0" & minute(now),2) & right("0" & second(now),2)

	'랜던문자 만들기
	Function random()
		Dim str, strlen, r, i, ds, serialCode '변수 선언
		str = "0123456789" '랜덤으로 선택된 문자or 숫자
		strlen = 6 '출력될 값의 자릿수 ex)해당 구문에서 10자리의 랜덤 값 출력
		Randomize '랜덤 초기화
		For i = 1 To strlen
			r = Int(len(str) * Rnd + 1)
			serialCode = serialCode + Mid(str,r,1)
		Next 
		random = serialCode
	End Function 

	Dim certNo
	Dim reqDate

	'요청 번호 생성
	certNo = curDate & random()	
	reqDate = curDate
%>
<html>
    <head>
        <title>SMS사용자인증 서비스(웹통신방식) 테스트</title>
        <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
        <style>
            <!--
            body,p,ol,ul,td
            {
                font-family: 굴림;
                font-size: 12px;
            }

            a:link { size:9px;color:#000000;text-decoration: none; line-height: 12px}
            a:visited { size:9px;color:#555555;text-decoration: none; line-height: 12px}
            a:hover { color:#ff9900;text-decoration: none; line-height: 12px}

            .style1 {
                color: #6b902a;
                font-weight: bold;
            }
            .style2 {
                color: #666666
            }
            .style3 {
                color: #3b5d00;
                font-weight: bold;
            }
            -->
        </style>
		<script language="javascript">
			function checkNumber() {
				var key = event.keyCode;
				if(!(key==8||key==9||key==13||key==46||key==144||(key>=48&&key<=57)||key==110||key==190)){
					event.returnValue=false;
				}
			}
		</script>
    </head>
    <body bgcolor="#FFFFFF" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
        <center>
            <br><br><br>
            <span class="style1">SMS사용자인증 서비스(웹통신방식) 테스트 - 인증 요청</span><br>
            <form name="reqForm" method="post" action="http://회원사별 경로/smsAuthT_sample_step02.asp">
                <table cellpadding="1" cellspacing="1">
                    <tr>
                        <td align="center">회원사ID</td>
                        <td align="left"><input type="text" name="cpId" size="41" maxlength ="10" value = ""></td>
                    </tr>
                    <tr>
                        <td align="center">웹페이지코드</td>
                        <td align="left"><input type="text" name="urlCode" size="41" maxlength ="6" value=""></td>
                    </tr>
                    <tr>
                        <td align="center">인증번호</td>
                        <td align="left"><input type="text" name="certNo" size="41" maxlength ="40" value="<%= certNo %>"></td>
                    </tr>
                    <tr>
                        <td align="center">요청일시</td>
                        <td align="left"><input type="text" name="reqDate" size="41" maxlength ="14" value="<%= reqDate %>"></td>
					</tr>
                    <tr>
                        <td align="center">휴대폰번호</td>
                        <td align="left"><input type="text" name="phoneNo" size="41" maxlength ="11" value="" onkeypress="javascript:checkNumber()"></td>
                    </tr>
                    <tr>
                        <td align="center">SMS승인번호</td>
                        <td align="left"><input type="text" name="authNo"  size="41" maxlength ="10" value="" onkeypress="javascript:checkNumber()"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><hr></td>
                    </tr>
				</table>
                <br><br>
                <input type="submit" value="SMS사용자인증 테스트">
            </form>
            <br>
            <br>
            이 Sample화면은 SMS사용자인증 서비스 테스트를 위해 제공하고 있는 화면입니다.<br>
            <br>
        </center>
    </body>
</html>