<%@page import="com.Model.Note"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style type="text/css">
	body{
		background-image: url("backgroundhome.jpg");
		background-repeat: no-repeat;
		background-size: cover;
	}
</style>
</head>
<body>
	
<%
String check=(String)session.getAttribute("check");
if(check!=null)
{
%>

	<p>hello <%=check %></p>
	<h1 class="text-center">Dashboard</h1>
	
	<div class="container text-center mb-3 mt-3">
	<!-- <a class="btn btn-info" href="addnote.jsp">Add note</a>  -->
	
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" >Add Note</button>
	
	<a href="logout" class="btn btn-danger">Logout</a>
	
	</div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header text-center">
	        <h1 class="modal-title fs-5 " id="exampleModalLabel" >Add Note</h1>
	       
	      </div>
	      <div class="modal-body">
	        <form action="addnote">
	        	<div class="mb-3">
					<textarea rows="" cols="" class="form-control" name="note"></textarea>
					<input type="hidden" name="userid" value="<%=check%>">
				</div>
				<div class="mb-3 text-center">
					<button class="btn btn-success mb-3">Submit</button>
				</div>
			</form>
	      </div>
	    </div>
	  </div>
	</div>
				<div class="container">
				    <div class="row">
				        <%
				        ArrayList<Note> al = (ArrayList<Note>) session.getAttribute("al");
				        if (al != null) {
				            for (Note n : al) {
				                String s = n.getNote();
				        %>
				        <div class="container w-45 border border-black rounded-5 mb-5 p-4 me-3 text-center col-3 bg-white">
				            <h4 class="display-4"><%= n.getNote() %></h4>
				            <p><%= n.getAdddate() %></p>
				            <p><%= n.getEditdate() %></p>
				            <div class="container">
				                <div class="row">
				                    <div class="col-6">
				                        <form action="deleteNote">
				                            <input type="hidden" name="userid" value="<%= check %>">
				                            <input type="hidden" name="note" value="<%= n.getNote() %>">
				                            <button class="btn btn-danger mb-3">Delete</button>
				                        </form>
				                    </div>
				                    <div class="col-6">
				                        <button type="button" class="btn btn-primary edit-note-btn" 
				                            data-bs-toggle="modal" 
				                            data-bs-target="#exampleModal2" 
				                            data-note="<%= n.getNote() %>" 
				                            data-userid="<%= check %>">
				                            Edit Note
				                        </button>
				                    </div>
				                </div>
				            </div>
				        </div>
				        <%
				            }
				        }
				        %>
				    </div>
				</div>
				
				<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered">
				        <div class="modal-content">
				            <div class="modal-header text-center">
				                <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Note</h1>
				            </div>
				            <div class="modal-body">
				                <form action="editenote">
				                    <div class="mb-3">
				                        <textarea rows="5" cols="50" class="form-control" name="note" id="editNoteTextArea"></textarea>
				                        <input type="hidden" name="userid" id="editNoteUserId">
				                        <input type="hidden" name="oldnote" id="editOldNote">
				                    </div>
				                    <div class="mb-3 text-center">
				                        <button class="btn btn-success mb-3">Submit</button>
				                    </div>
				                </form>
				            </div>
				        </div>
				    </div>
				</div>
				
				<script>
				    document.addEventListener('DOMContentLoaded', function () {
				        const editNoteBtns = document.querySelectorAll('.edit-note-btn');
				        editNoteBtns.forEach(btn => {
				            btn.addEventListener('click', function () {
				                const note = this.getAttribute('data-note');
				                const userId = this.getAttribute('data-userid');
				
				                document.getElementById('editNoteTextArea').value = note;
				                document.getElementById('editNoteUserId').value = userId;
				                document.getElementById('editOldNote').value = note;
				            });
				        });
				    });
				</script>

<% 
}
else
{
	response.sendRedirect("login.jsp");	
}

%>

</body>
</html>