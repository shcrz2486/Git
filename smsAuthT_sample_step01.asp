<%
	'************************************************************************************/
	'* - ����� ��ȣȭ�� ���� IV ���� Random�ϰ� ������.(�ݵ�� �ʿ���!!)			    */
	'* - input�ڽ� reqNum�� value���� curDate & RandNo ���·� ����						*/
 	'************************************************************************************/
	'����ð� ���ϱ�
	Dim curDate 
	curDate = year(now) & right("0" & Month(now),2) & right("0" & day(now),2) & right("0" & hour(now),2) & right("0" & minute(now),2) & right("0" & second(now),2)

	'�������� �����
	Function random()
		Dim str, strlen, r, i, ds, serialCode '���� ����
		str = "0123456789" '�������� ���õ� ����or ����
		strlen = 6 '��µ� ���� �ڸ��� ex)�ش� �������� 10�ڸ��� ���� �� ���
		Randomize '���� �ʱ�ȭ
		For i = 1 To strlen
			r = Int(len(str) * Rnd + 1)
			serialCode = serialCode + Mid(str,r,1)
		Next 
		random = serialCode
	End Function 

	Dim certNo
	Dim reqDate

	'��û ��ȣ ����
	certNo = curDate & random()	
	reqDate = curDate
%>
<html>
    <head>
        <title>SMS��������� ����(����Ź��) �׽�Ʈ</title>
        <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
        <style>
            <!--
            body,p,ol,ul,td
            {
                font-family: ����;
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
            <span class="style1">SMS��������� ����(����Ź��) �׽�Ʈ - ���� ��û</span><br>
            <form name="reqForm" method="post" action="http://ȸ���纰 ���/smsAuthT_sample_step02.asp">
                <table cellpadding="1" cellspacing="1">
                    <tr>
                        <td align="center">ȸ����ID</td>
                        <td align="left"><input type="text" name="cpId" size="41" maxlength ="10" value = ""></td>
                    </tr>
                    <tr>
                        <td align="center">���������ڵ�</td>
                        <td align="left"><input type="text" name="urlCode" size="41" maxlength ="6" value=""></td>
                    </tr>
                    <tr>
                        <td align="center">������ȣ</td>
                        <td align="left"><input type="text" name="certNo" size="41" maxlength ="40" value="<%= certNo %>"></td>
                    </tr>
                    <tr>
                        <td align="center">��û�Ͻ�</td>
                        <td align="left"><input type="text" name="reqDate" size="41" maxlength ="14" value="<%= reqDate %>"></td>
					</tr>
                    <tr>
                        <td align="center">�޴�����ȣ</td>
                        <td align="left"><input type="text" name="phoneNo" size="41" maxlength ="11" value="" onkeypress="javascript:checkNumber()"></td>
                    </tr>
                    <tr>
                        <td align="center">SMS���ι�ȣ</td>
                        <td align="left"><input type="text" name="authNo"  size="41" maxlength ="10" value="" onkeypress="javascript:checkNumber()"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><hr></td>
                    </tr>
				</table>
                <br><br>
                <input type="submit" value="SMS��������� �׽�Ʈ">
            </form>
            <br>
            <br>
            �� Sampleȭ���� SMS��������� ���� �׽�Ʈ�� ���� �����ϰ� �ִ� ȭ���Դϴ�.<br>
            <br>
        </center>
    </body>
</html>