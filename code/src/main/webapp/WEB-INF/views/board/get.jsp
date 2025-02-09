<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

        <div class="container mt-4">
            <h2 class="mb-4">Review Details</h2>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${board.title}</h5>
                    <h6 class="card-subtitle mb-2 text-muted">작성자: ${board.writer}</h6>
                    <p class="card-text">${board.content}</p>
                    <p class="text-muted">게시일: <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm"/></p>
                </div>
            </div>

            <div class="mt-3">
                <button data-oper="modify" class="btn btn-warning">Modify</button>
                <button data-oper="list" class="btn btn-primary">Back to List</button>
            </div>

            <form id="operForm" action="/board/modify" method="get">
                <input type="hidden" name="bno" value="<c:out value='${board.bno}'/>">
                <input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
                <input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
                <input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
                <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
            </form>

            <!-- 댓글 섹션 -->
            <div class="mt-5">
                <h4>Comments</h4>
                <button id="addReplyBtn" class="btn btn-success btn-sm mb-2">New Comment</button>
                
                <ul class="list-group chat">
                    <c:forEach var="reply" items="${replies}">
                        <li class="list-group-item d-flex justify-content-between align-items-center" data-rno="${reply.rno}">
                            <div>
                                <strong>[${reply.rno}] ${reply.replyer}</strong>
                                <span class="text-muted">(${reply.replyDate})</span>
                                <p>${reply.reply}</p>
                            </div>
                            <div>
                                <button class="btn btn-sm btn-warning editReplyBtn">Edit</button>
                                <button class="btn btn-sm btn-danger deleteReplyBtn">Delete</button>
                            </div>
                        </li>
                    </c:forEach>
                </ul>

                <!-- 댓글 페이지네이션 -->
                <nav class="mt-3">
                    <ul class="pagination">
                        <c:if test="${pageNum > 1}">
                            <li class="page-item"><a class="page-link" href="?pageNum=${pageNum - 1}">Previous</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${i == pageNum ? 'active' : ''}">
                                <a class="page-link" href="?pageNum=${i}">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pageNum < totalPages}">
                            <li class="page-item"><a class="page-link" href="?pageNum=${pageNum + 1}">Next</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>

            <!-- 댓글 모달 -->
            <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="replyModalLabel">Manage Comment</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Reply</label>
                                <input type="text" class="form-control" name="reply">
                            </div>
                            <div class="form-group">
                                <label>Replyer</label>
                                <input type="text" class="form-control" name="replyer">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="modalModBtn" class="btn btn-warning">Modify</button>
                            <button id="modalRemoveBtn" class="btn btn-danger">Remove</button>
                            <button id="modalRegisterBtn" class="btn btn-primary">Register</button>
                            <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
<script src="/resources/js/reply.js"></script>
<script>
$(document).ready(function() {
    let operForm = $("#operForm");

    $("button[data-oper='modify']").click(function() {
        operForm.attr("action", "/board/modify").submit();
    });

    $("button[data-oper='list']").click(function() {
        operForm.attr("action", "/board/list").submit();
    });

    // 댓글 모달
    let modal = $("#replyModal");
    let modalInputReply = modal.find("input[name='reply']");
    let modalInputReplyer = modal.find("input[name='replyer']");
    let modalModBtn = $("#modalModBtn");
    let modalRemoveBtn = $("#modalRemoveBtn");
    let modalRegisterBtn = $("#modalRegisterBtn");

    $("#addReplyBtn").click(function() {
        modal.find("input").val("");
        modalRegisterBtn.show();
        modalModBtn.hide();
        modalRemoveBtn.hide();
        modal.modal("show");
    });

    $(".chat").on("click", ".editReplyBtn", function() {
        let li = $(this).closest("li");
        let rno = li.data("rno");
        
        replyService.get(rno, function(reply) {
            modalInputReply.val(reply.reply);
            modalInputReplyer.val(reply.replyer);
            modal.data("rno", reply.rno);
            modalRegisterBtn.hide();
            modalModBtn.show();
            modalRemoveBtn.show();
            modal.modal("show");
        });
    });

    modalModBtn.click(function() {
        let reply = { rno: modal.data("rno"), reply: modalInputReply.val() };
        replyService.update(reply, function(result) {
            alert(result);
            modal.modal("hide");
            location.reload();
        });
    });

    modalRemoveBtn.click(function() {
        let rno = modal.data("rno");
        replyService.remove(rno, function(result) {
            alert(result);
            modal.modal("hide");
            location.reload();
        });
    });

    modalRegisterBtn.click(function() {
        let reply = {
            reply: modalInputReply.val(),
            replyer: modalInputReplyer.val(),
            bno: '${board.bno}'
        };
        replyService.add(reply, function(result) {
            alert(result);
            modal.modal("hide");
            location.reload();
        });
    });
});
</script>
