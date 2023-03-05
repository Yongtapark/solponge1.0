
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="h" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/joinForm.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
<header>
    <%@include file="../../tags/header.jsp"%>
</header>
<form:form method="post" modelAttribute="member" name="frm">
    <input type="hidden" name="memberNo">
    <div id="memberinfo">
        <table>
            <tr>
                <th>아이디</th>
                <td><form:input type="text" id="MEMBER_ID" name="MEMBER_ID" path="MEMBER_ID"/>
                    <form:errors path="MEMBER_ID"  cssStyle="color: red" />
                </td>

            </tr>
            <tr>
                <th>비밀번호</th>
                <td><form:input type="password"  id="MEMBER_PWD" name="MEMBER_PWD" path="MEMBER_PWD"/>
                    <form:errors path="MEMBER_PWD"  cssStyle="color: red" />

                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><form:input type="password"  id="pwdCheck" name="MEMBER_PWD_CHECK" path="MEMBER_PWD_CHECK"/>
                    <form:errors path="MEMBER_PWD_CHECK" cssStyle="color: red"/>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <form:input type="text" name="MEMBER_NAME" id="MEMBER_NAME" path="MEMBER_NAME"/>
                    <form:errors path="MEMBER_NAME" cssStyle="color: red"/>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" size="16" id="email1" name="MEMBER_EMAIL1" path="MEMBER_EMAIL1"/> @
                    <input type="text" size="20" id="email2" name="MEMBER_EMAIL2" value="naver.com" path="MEMBER_EMAIL2"/>
                    <select name="emails" id="emails" size="1" onchange="mailCheck()">
                        <option value="naver.com" selected>naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="1">직접입력</option>
                    </select></td>
            </tr>
            <tr>
                <th>휴대폰 번호</th>
                <td><select name="MEMBER_PHONE1" size="1" id="firstnum">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="013">013</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                </select>
                    -
                    <form:input type="text" size="4" maxlength="4" minlength="4" name="MEMBER_PHONE2" id="secnum" path="MEMBER_PHONE2"/>-
                    <form:input type="text" size="4" maxlength="4" minlength="4" name="MEMBER_PHONE3" id="thrnum" path="MEMBER_PHONE3"/></td>

                <c:if test="${empty param.MEMBER_PHONE2 or empty param.MEMBER_PHONE3}">
                    <td><span style="color: red;">휴대폰 번호를 입력해주세요.</span></td>
                </c:if>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" name="MEMBER_ADDRESS1" id="sample6_postcode"  placeholder="우편번호" readonly>
                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    <input type="text" name="MEMBER_ADDRESS2" id="sample6_address" placeholder="주소" readonly>
                    <input type="text" name="MEMBER_ADDRESS3" id="sample6_detailAddress" placeholder="상세주소">

                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="회원가입" onclick="infocheck()"><input type="button" onclick="location.href='/com.solponge/main'" value="취소"></td>
            </tr>
        </table>
    </div>
</form:form>
<footer>
    <%@include file="../../tags/footer.jsp" %>
</footer>
</body>
</html>