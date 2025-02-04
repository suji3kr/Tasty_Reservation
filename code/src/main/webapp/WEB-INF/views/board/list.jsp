<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>맛집 가게 페이지</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/css/bootstrap.min.css">
    
   <style>
    /* 기본 스타일 설정 */
    body {
        background-color: #f8f9fa; /* 부드러운 흰색 배경 */
        font-family: 'Roboto', sans-serif; /* 깔끔한 폰트 */
        margin: 0;
        padding: 20px;
        color: #495057; /* 어두운 회색 텍스트 */
    }

    h1.page-header {
        color: #343a40; /* 진한 회색 */
        text-align: center;
        margin-bottom: 40px;
        font-size: 2.2em;
        font-weight: 700;
    }

    .panel {
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
        padding: 25px;
    }

    .panel-heading {
        background-color: #007bff; /* 파란색 배경 */
        color: white;
        padding: 20px;
        border-radius: 12px 12px 0 0;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: 600;
        font-size: 1.25em;
    }

    .panel-body {
        padding: 20px;
    }

    .table {
        width: 100%;
        margin-top: 30px;
        border-collapse: collapse;
    }

    .table th, .table td {
        padding: 18px;
        text-align: left;
        font-size: 1.1em;
        border-bottom: 1px solid #dee2e6; /* 라이트 그레이 테두리 */
    }

    .table th {
        background-color: #f1f3f5; /* 연한 회색 */
        color: #007bff; /* 파란색 */
        font-weight: 600;
    }

    .form-inline .form-control {
        width: 250px;
        margin-right: 15px;
        padding: 12px;
        font-size: 1em;
        border-radius: 8px;
        border: 1px solid #ced4da; /* 밝은 회색 테두리 */
    }

    .form-inline .btn {
        padding: 12px 18px;
        font-size: 1em;
        border-radius: 8px;
    }

    .pagination {
        margin-top: 25px;
        display: flex;
        justify-content: center;
        gap: 12px;
    }

    .pagination li {
        list-style: none;
    }

    .pagination a {
        padding: 10px 16px;
        background-color: #f1f3f5;
        color: #007bff;
        border-radius: 8px;
        text-decoration: none;
        font-size: 1em;
    }

    .pagination .active a {
        background-color: #007bff;
        color: white;
    }

    .pagination .disabled a {
        background-color: #e9ecef;
        color: #adb5bd;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        color: white;
        font-weight: 600;
        padding: 12px 20px;
        border-radius: 8px;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    .btn-outline-secondary {
        color: #007bff;
        border-color: #007bff;
        font-weight: 600;
        padding: 12px 20px;
        border-radius: 8px;
    }

    .btn-outline-secondary:hover {
        background-color: #007bff;
        color: white;
    }

    /* 반응형 디자인 */
    @media (max-width: 768px) {
        h1.page-header {
            font-size: 1.8em;
        }

        .panel {
            padding: 20px;
        }

        .form-inline .form-control {
            width: 100%;
            margin-bottom: 10px;
        }

        .pagination {
            gap: 5px;
        }

        .pagination a {
            padding: 8px 14px;
        }
    }
</style>
</head>
<body>

<div class="container">
    <h1 class="page-header">맛집 가게 페이지</h1>

    <div class="panel">
        <div class="panel-heading d-flex justify-content-between align-items-center">
            <span>가게 목록</span>
            <div>
                <button id='regBtn' type="button" class="btn btn-info btn-sm">새로운 가게 등록</button>
                <a href="/store/storeList" class="btn btn-outline-secondary btn-sm">가게 리스트 확인 📑</a>
            </div>
        </div>

        <div class="panel-body">
            <div class="search-container">
                <form id='searchForm' action="/board/list" method='get' class="form-inline">
                    <select name='type' class="form-control mr-2">
                        <option value="" <c:if test="${empty pageMaker.cri.type}">selected</c:if>>--</option>
                        <option value="T" <c:if test="${pageMaker.cri.type == 'T'}">selected</c:if>>제목</option>
                        <option value="C" <c:if test="${pageMaker.cri.type == 'C'}">selected</c:if>>내용</option>
                        <option value="W" <c:if test="${pageMaker.cri.type == 'W'}">selected</c:if>>작성자</option>
                        <option value="TC" <c:if test="${pageMaker.cri.type == 'TC'}">selected</c:if>>제목 or 내용</option>
                        <option value="TW" <c:if test="${pageMaker.cri.type == 'TW'}">selected</c:if>>제목 or 작성자</option>
                        <option value="TWC" <c:if test="${pageMaker.cri.type == 'TWC'}">selected</c:if>>제목 or 내용 or 작성자</option>
                    </select>
                    <input type='text' name='keyword' class="form-control mr-2" placeholder="검색어 입력" value='${pageMaker.cri.keyword}' />
                    <button class='btn btn-primary'>Search</button>
                </form>
            </div>

            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>수정일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="board">
                        <tr>
                            <td>${board.bno}</td>
                            <td><a class="move" href='${board.bno}'>${board.title}</a></td>
                            <td>${board.writer}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- 페이지처리 -->
            <div class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">Previous</a></li>
                </c:if>

                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                        <a href="${num}">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="paginate_button next"><a href="${pageMaker.endPage + 1}">Next</a></li>
                </c:if>
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<!-- /.container -->

<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#regBtn").on("click", function() {
            self.location = "/board/register";
        });

        var actionForm = $("#actionForm");

        $(".paginate_button a").on("click", function(e) {
            e.preventDefault();
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });

        $(".move").on("click", function(e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
            actionForm.attr("action", "/board/get");
            actionForm.submit();
        });

        var searchForm = $("#searchForm");

        $("#searchForm button").on("click", function(e) {
            if (!searchForm.find("option:selected").val()) {
                alert("검색종류를 선택하세요");
                return false;
            }
            if (!searchForm.find("input[name='keyword']").val()) {
                alert("키워드를 입력하세요");
                return false;
            }
            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();
            searchForm.submit();
        });
    });
</script>