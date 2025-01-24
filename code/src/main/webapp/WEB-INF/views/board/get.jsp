<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
</div>

<!-- /.row -->


<div class="form-group">
	<label>Bno</label> <input class="form-control" name='bno'
		value=${board.bno } readonly="readonly">
</div>

<div class="form-group">
	<label>Title</label> <input class="form-control" name='title'
		value=${board.title } readonly="readonly">
</div>

<div class="form-group">
	<label>Text area</label>
	<textarea class="form-control" rows="3" name='content'
		readonly="readonly">${board.content}</textarea>
</div>

<div class="form-group">
	<label>Writer</label> <input class="form-control" name='writer'
		value=${board.writer } readonly="readonly">
</div>

<button data-oper='modify' class="btn btn-default btn-success">Modify</button>
<button data-oper='list' class="btn btn-default btn-info">List</button>
<form id='operForm' action="/board/modify" method="get">
	<input type='hidden' id='bno' name='bno'
		value='<c:out value="${board.bno}"/>'> <input type='hidden'
		name='PageNum' value='<c:out value="${cri.pageNum}"/>'> <input
		type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	<input type='hidden' name='keyword'
		value='<c:out value="${cri.keyword}"/>'>
</form>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<!-- /.panel-heading -->
				<i class="fa fa-comments fa-fw"></i>Reply
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
			</div>
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno='12'>
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong> <small
									class="pull-right text-muted">2024-12-23 17:33</small>
							</div>
							<p>Good job!</p>
						</div>
					</li>

				</ul>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>

</div>
<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	 	<div class="modal-dialog">
	 	  <div class="modal-content">
	 	    <div class="modal-header">
	 	       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	 	       <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
	 	    </div>
	 	    <div class="modal-body">
	 	      <div class="form-group">
	 	      	<label>Reply</label>
	 	      	<input class= "form-control" name='reply' value='New Reply!!!'>
	 	      </div>
	 	      <div class="form-group">
	 	      <label>Replyer</label>
	 	      	<input class= "form-control" name='replyer' value='replyer'>
	 	      </div>
	 	      <div class="form-group">
	 	      	<label>Reply Date</label>
	 	      	<input class= "form-control" name='replyDate' value='2024-12-24 17:27'>
	 	      </div>
	 	      
	 	     </div>
	 	     <div class="modal-footer">
	 	     	<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
	 	     	<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
	 	     	<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
	 	     	<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
	 	     </div>
	 	    </div>
	 	</div>
	 </div>









<!-- /#page-wrapper -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">

$(document).ready(function() {
  
	var bnoValue = '${board.bno}';
	var replyUL = $(".chat");

	showList(1);
	    
	 function showList(page){
	  
             replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {
               	 
           	 if(page == -1){
           		 pageNum = Math.ceil(replyCnt/10.0);
           		 showList(pageNum);
           		 return;
           	 }
	   	 
	      var str="";
	      
	      if(list == null || list.length == 0){
	          replyUL.html();
	    	  return;
	      }
	      
	      
	      for (let i = 0, len = list.length || 0; i < len; i++) {
	          str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
	          str +="  <div><div class='header'><strong class='primary-font'>["
	       	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
	          str +="    <small class='pull-right text-muted'>"
	              +replyService.displayTime(list[i].replyDate)+"</small></div>";
	          str +="    <p>"+list[i].reply+"</p></div></li>";
	        }
	        
	        
	        replyUL.html(str);
	        
	        showReplyPage(replyCnt);
	
		 }); //end function
	}  //end showList
	
	let pageNum = 1;
	let replyPageFooter = $(".panel-footer");
	
	  function showReplyPage(replyCnt){
		  let endNum = Math.ceil(pageNum / 10.0) *10;
		  let startNum = endNum - 9;
		  
		  let prev = startNum != 1;
		  let next = false;
		  
		  if(endNum * 10 >= replyCnt){
			  endNum = Math.ceil(replyCnt/10.0);
		  }
		  
		  if(endNum * 10 < replyCnt) {
			  next = true;
		  }
		  
		  let str = "<ul class='pagination pull-right'>";
		  
		  if(prev){
			  str+= "<li class='page-item'><a class='page-link' href='" + (startNum - 1)+"'>Previous</a></li>";
		  }
		  for(let i = startNum; i <=endNum; i++){
			  
			  let active = pageNum == i ? "active":"";
			  
			  str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		  }
		  
		  if(next) {
			  str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		  }
		  str += "</ul></div>";
		  
		  console.log(str);
		  
		  replyPageFooter.html(str);
	  }
	  
	  replyPageFooter.on("click","li a", function(e){
		  e.preventDefault();
		  console.log("page click");
		  
		  let targetPageNum = $(this).attr("href");
		  
		  console.log("targetPageNum: " + targetPageNum);
		  
		  pageNum = targetPageNum;
		  
		  showList(pageNum);
	  });
		//페이징 처리 끝
	let modal = $(".modal");
	let modalInputReply = modal.find("input[name='reply']");
	let modalInputReplyer = modal.find("input[name='replyer']");
	let modalInputReplyDate = modal.find("input[name='replyDate']");
	
	let modalModBtn = $("#modalModBtn");
	let modalRemoveBtn = $("#modalRemoveBtn");
	let modalRegisterBtn = $("#modalRegisterBtn");
	
	
	$("#addReplyBtn").on("click", function(e){
		
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		$(".modal").modal("show");
		
		
	}); //end addReplyBtn
	
	//등록
	modalRegisterBtn.on("click",function(e){
		
		let reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno:bnoValue
		};
		replyService.add(reply, function(result){
			
			alert(result);
			
			modal.find("input").val("");
			modal.modal("hide");
			
			//showList(-1);
			showList(pageNum);
		});
	});
	
	$(".chat").on("click", "li", function(e){
		
		let rno = $(this).data("rno");
		
		replyService.get(rno, function(reply){
			
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
			.attr("readonly","readonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id != 'mmodalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
	});
	
	//댓글 내용 수정
	modalModBtn.on("click", function(e){
		
		let reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		
		replyService.update(reply, function(result){
			
			alert(result);
			modal.modal("hide");
			//showList(1);
			showList(pageNum);
		});
	}); //end modalModBtn
	
	//삭제
	
	modalRemoveBtn.on("click", function (e){
		let rno = modal.data("rno");
		
		replyService.remove(rno, function(result){
			
			alert(result);
			modal.modal("hide");
			showList(1);
		});
	});//end modalRemoveBtn
	
});


/* 	  var bnoValue = '<c:out value="${board.bno}"/>';
	console.log("bnoValue");
	console.log("bno: " + bnoValue); 

	 replyService.add(
	 {reply:"js test", replyer:"tester", bno:bnoValue},
	 function(result){
	 alert("REsult : " + result);
	 }
	 );   */ 
	/*  replyService.getList({bno:bnoValue, page:1}, function(list){
	 for(let i =0; i<list.length; i++){
	 console.log(list[i]);
	 }
	 });  */
	/*   replyService.remove(5, function(result){
	 console.log("Result : " + result);
	 if(result === "success"){
	 alert("REMOVED");
	 }
	 });    */
	/*   replyService.update(
	 {rno:25, bno:bnoValue, reply:"수정하고있음8282"},
	 function(result){
	 alert("수정완료");
	 });  */
	/* replyService.get(25, function(data) {
		console.log(data);
	}) */
</script>
<script type="text/javascript">
	$(document).ready(function() {

		let operForm = $("#operForm");

		$("button[data-oper='modify']").click(function(e) {
			operForm.attr("action", "/board/modify").submit();
		});
		$("button[data-oper='list']").click(function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list").submit();
		});

	})
</script>
<%@include file="../includes/footer.jsp"%>
