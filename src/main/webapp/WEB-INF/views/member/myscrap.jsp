<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myscrap.css">
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
<header>
    <%@include file="../../tags/header.jsp"%>
</header>

<div id="container">
    <div class="companyScrap">
        <div class="companies">
            <c:set var="count" value="0" />
            <c:forEach begin="0" end="${div_company_count-1}">
                <div class="company">
                    <c:forEach begin="0" end="1">
                        <%--반복 시작--%>
                        <div class="flex-container">
                            <c:forEach begin="0" end="3">
                                <c:set var="apple" value="${company_names[count]}" />
                                <c:set var="apple2" value="${company_names[count]}count" />
                                <c:set var="apple3" value="${company_names[count]}OneInfoName" />
                                <c:set var="apple4" value="${company_names[count]}OneInfoNum" />
                                <c:choose>
                                    <c:when test="${apple.length()>=1}">
                                        <%--반복 시작--%>
                                        <input type="hidden" name="company_name" id="companyName_${apple}" value="${apple}">
                                        <div class="flex-item color-gray" style="float: left;">
                                            <div class="item_container">
                                                <div class="logo" onclick="location.href='/com.solponge/jobinfolist/${apple}'">
                                                    <img src="${pageContext.request.contextPath}/img/icons8-business-buildings-100.png" />
                                                </div>
                                                <c:set var="appleCount" value="${responseData.get(apple).get(apple2)}" />
                                                <div class="company_name" onclick="location.href='/com.solponge/jobinfolist/${apple}'">${apple}
                                                    <br /><span  style="font-size: 12px;">채용중 ${appleCount} 건</span>
                                                </div>
                                                <button class="delete_bt" type="button" style="float: right;" id="${apple}" onclick="submitForm(this.id)">x</button>
                                                <c:set var="infotitle" value="${responseData.get(apple).get(apple3)}"/>
                                                <c:choose>
                                                    <c:when test="${fn:length(infotitle) > 15}">
                                                        <div class="jobinfo"><a href="/com.solponge/jobinfo/${responseData.get(apple).get(apple4)}">최근 공고: ${fn:substring(infotitle, 0, 14)}...</a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="jobinfo"><a href="/com.solponge/jobinfo/${responseData.get(apple).get(apple4)}">최근 공고: ${infotitle}</a></div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <%--반복 끝--%>
                                    </c:when>
                                    <c:otherwise>
                                        <%--반복 시작--%>
                                        <div class="flex-item color-gray" style="text-align: center;">
                                            <div style="top: 32px;  position:relative;">solponge</div>
                                        </div>
                                        <%--반복 끝--%>
                                    </c:otherwise>
                                </c:choose>
                                <c:set var="count" value="${count + 1}" />
                            </c:forEach>
                        </div>
                    </c:forEach>
                        <%--반복 끝--%>
                </div>
            </c:forEach>
        </div>
    </div>
    <div style="display: inline-block; float: right; margin-right: 20px;">
        <button class="prev">
            &#60;
        </button>
        <button class="next">
            &#62;
        </button>
    </div>
</div>
<script>
    const items = document.querySelectorAll('.company');
    const itemCount = items.length - 1;
    console.log(itemCount);
    let curPos = 0;
    let position = 0;
    const IMAGE_WIDTH = 1300;

    // 요소 선택
    const prevBtn = document.querySelector('.prev');
    const nextBtn = document.querySelector('.next');
    const companies = document.querySelector('.companies');

    function prev() {
        if (curPos > 0) {
            nextBtn.removeAttribute('disabled');
            position += IMAGE_WIDTH;

            companies.style.transform = 'translateX('+position+'px)';
            curPos -= 1;
        }
        if (curPos === 0) {
            prevBtn.setAttribute('disabled', 'true');
        }
    }
    function next() {
        if (curPos < itemCount) {
            prevBtn.removeAttribute('disabled');
            position -= IMAGE_WIDTH;
            companies.style.transform = 'translateX('+position+'px)';
            curPos += 1;
        }
        if (curPos === itemCount) {
            nextBtn.setAttribute('disabled', 'true');
        }
    }
    function init() {
        prevBtn.setAttribute('disabled', 'true');
        prevBtn.addEventListener('click', prev);
        nextBtn.addEventListener('click', next);
    }

    init();

    const myButton = document.getElementsByClassName("delete_bt");
    myButton.addEventListener("click", postData);

    function postData() {
        const inputVal = document.getElementById("myInput").value;
        fetch("/my-endpoint", {
            method: "POST",
            body: JSON.stringify({ inputVal }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json())
            .then(data => console.log(data))
            .catch(error => console.error(error));
    }
    $(document).ready(function() {
        $(".delete_bt").click(function() {
            location.reload();
        });
    });

    function submitForm(clicked_id) {
        var buttonElement = document.getElementById(clicked_id);
        var usercheck = '${member.MEMBER_ID}';
        let MEMBER_NO = parseInt(${member.MEMBER_NO});
        var companyName = "companyName_"+clicked_id;
        var data2 = document.getElementById(companyName).value;
        buttonElement.value = 'Click';
        buttonElement.classList.remove('red');
        if (usercheck.length !== 0) {
            console.log('보낼 값: ' + data2);
            console.log('용자사 번호: ' + MEMBER_NO);
            console.log(typeof(MEMBER_NO))
            let scrapCompany = JSON.stringify({"member_No": MEMBER_NO,"companyName": data2});
            $.ajax({
                type: "POST"
                , url: "/scrap/company/delete/mypage"
                , contentType: "application/json"
                , data: scrapCompany
                , success: function() {
                    alert('성공');
                }
                , error: function() {
                    alert('찜 삭제 실패했습니다. 관리자에게 문의해주세요.');
                }
            });
        }
    }
    function submitForm2(clicked_id) {
        var buttonElement = document.getElementById(clicked_id);
        var usercheck = '${member.MEMBER_ID}';
        let MEMBER_NO = parseInt(${member.MEMBER_NO});
        var infoname = "infoname_"+clicked_id;
        console.log(infoname)
        var infoname_re = infoname.replace("_star","");
        console.log(infoname_re)
        var data2 = document.getElementById(infoname_re).value;
        if (buttonElement.value === 'Click') {
            buttonElement.value = 'Clicked';
            buttonElement.classList.add('yellow');
            if (usercheck.length !== 0) {
                console.log('보낼 값: ' + data2);
                console.log('용자사 번호: ' + MEMBER_NO);
                console.log(typeof(MEMBER_NO))
                let scrapinfo = JSON.stringify({"member_No": MEMBER_NO,"infoname": data2});
                $.ajax({
                    type: "POST"
                    , url: "/scrap/job"
                    , contentType: "application/json"
                    , data: scrapinfo
                    , success: function() {
                        alert('성공');
                    }
                    , error: function() {
                        alert('찜 등록에 실패했습니다. 관리자에게 문의해주세요.');
                    }
                });
            } else {
                alert('찜 등록에 실패했습니다.');
                location.href = "/main";
            }
        } else {
            buttonElement.value = 'Click';
            buttonElement.classList.remove('yellow');
            if (usercheck.length !== 0) {
                console.log('보낼 값: ' + data2);
                console.log('용자사 번호: ' + MEMBER_NO);
                console.log(typeof(MEMBER_NO))
                let scrapinfo = JSON.stringify({"member_No": MEMBER_NO,"infoname": data2});
                $.ajax({
                    type: "POST"
                    , url: "/scrap/job/delete"
                    , contentType: "application/json"
                    , data: scrapinfo
                    , success: function() {
                        alert('성공');
                    }
                    , error: function() {
                        alert('찜 삭제 실패했습니다. 관리자에게 문의해주세요.');
                    }
                });
            }
        }
    }
</script>
<br>
<div style="width: 1258px; margin: 0 auto; position: relative; left: 10px;">
    <hr>
    <div id="container_booklist">
        <div id="row2">
            <form action = "/com.solponge/jobinfolist/search" accept-charset="utf-8" name = "book_info" method = "get">
                <h3 id="newbook">
                    스크랩된 공고<span>
                    <select name="SearchSelect">
                      <option value="all">전체</option>
                      <option value="JopInfo_COMPANYNAME">회사명</option>
                      <option value="JopInfo_INFONAME">공고명</option>
                      <option value="JopInfo_FTAGLIST">기술 태그</option>
                      <option value="JopInfo_QUALIFICAT">지원자격</option>
                      <option value="JopInfo_WORKTYPE">고용 형태</option>
                    </select>
                    <input type="text" name="SearchValue" size="15" value="검색 내용">
                    <button type="submit"><img src="/img/Magnifier.png" style="width: 20px;" alt="Search"></button>
            </span>
                </h3>
            </form>

            <form id="my-form">
                <table id="Newjob8" style="font-size: 13px;">
                    <tr id="Newjob8th" style="text-align: center; background: #f2f9fe">
                        <td style="width: 220px; height: 44px">기업명</td>
                        <td style="width: 420px; height: 44px">제목</td>
                        <td style="width: 180px; height: 44px">지원자격</td>
                        <td style="width: 150px; height: 44px">근무조건</td>
                        <td>마감일</td>
                    </tr>
                    <c:forEach var="NewJopInfo" items="${paginatedjobinfo}" varStatus="status" >
                        <input type="hidden" id="infoname_${NewJopInfo.infonum}" value="${NewJopInfo.infoname}"/>
                        <input type="hidden" id="companyName_${NewJopInfo.infonum}" value="${NewJopInfo.companyname}"/>
                        <tr id="Newjob8td">
                            <c:set var="comname" value="response_${NewJopInfo.companyname}"/>
                                    <td class="infonum" style="height: 54px"><div class="url" OnClick="location.href ='/com.solponge/jobinfolist/${NewJopInfo.companyname}'">${NewJopInfo.companyname}</div></td>
                            <c:set var="infoname" value="response_${NewJopInfo.infoname}"/>
                            <c:choose>
                                <c:when test="${JobScrap2.containsKey(infoname)}">
                                    <td style="height: 54px"><div class="url" OnClick="location.href ='/com.solponge/jobinfo/${NewJopInfo.infonum}'">${NewJopInfo.infoname}</div><button class="star yellow" id="${NewJopInfo.infonum}_star" type="button" onclick="submitForm2(this.id)" value="Clicked">&#10029;</button><br><span style="font-size: 10px">${NewJopInfo.ftaglist}</span></td>
                                </c:when>
                                <c:otherwise>
                                    <td style="height: 54px"><div class="url" OnClick="location.href ='/com.solponge/jobinfo/${NewJopInfo.infonum}'">${NewJopInfo.infoname}</div><button class="star" id="${NewJopInfo.infonum}_star" type="button" onclick="submitForm2(this.id)" value="Click">&#10029;</button><br><span style="font-size: 10px">${NewJopInfo.ftaglist}</span></td>
                                </c:otherwise>
                            </c:choose>
                            <td style="height: 54px">${NewJopInfo.qualificat}</td>
                            <td style="text-align: center; height: 54px">${NewJopInfo.worktype}<br>${NewJopInfo.workarea}</td>
                            <td style="height: 54px">${NewJopInfo.deadline}</td>
                        </tr>
                    </c:forEach>
                </table>
            </form>


            <nav id="paging" aria-label="Page navigation example" style="clear: both;">
                <ul class="pagination justify-content-center" style="padding: 0">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="${url}page=${currentPage - 1}" tabindex="-1"
                           aria-disabled="${currentPage == 1}">Previous</a>
                    </li>
                    <c:choose>
                        <c:when test="${totalPages <= 10}">
                            <c:set var="startPage" value="1"/>
                            <c:set var="endPage" value="${totalPages}"/>
                        </c:when>
                        <c:when test="${currentPage <= 6}">
                            <c:set var="startPage" value="1"/>
                            <c:set var="endPage" value="10"/>
                        </c:when>
                        <c:when test="${currentPage > totalPages - 6}">
                            <c:set var="startPage" value="${totalPages - 9}"/>
                            <c:set var="endPage" value="${totalPages}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="startPage" value="${currentPage - 5}"/>
                            <c:set var="endPage" value="${currentPage + 4}"/>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                        <li class="page-item ${currentPage == pageNum ? 'active' : ''}">
                            <a class="page-link" href="${url}page=${pageNum}">${pageNum}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}" style="margin-right: 44px">
                        <a class="page-link" href="${url}page=${currentPage + 1}" aria-disabled="${currentPage == totalPages}">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>


</div>


<a target="_blank" href="https://icons8.com/icon/Av3axTNxQaRs/business-buildings"
>Business Buildings</a
>
icon by <a target="_blank" href="https://icons8.com">Icons8</a>

<footer class="border border-dark border-left-0 border-right-0 border-bottom-0 p-4 bg-dark">
    <%@include file="../../tags/footer.jsp" %>
</footer>
</body>
</html>
