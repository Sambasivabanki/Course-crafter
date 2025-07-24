<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="adminNavbar.jsp" />
	<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Add New Course</h5>
                </div>

                <div class="card-body">
                    <form action="/admin/addCourse" method="post" enctype="multipart/form-data">

                        <div class="mb-3">
                            <label class="form-label">Course Name</label>
							<select name="courseName" class="form-select" required>
								<option value="">--Select Course----</option>
								<option value="C Programming">C Programming</option>
								<option value="Java">Java</option>
						        <option value="Python">Python</option>
						        <option value="Java Full Stack">Java Full Stack</option>
						        <option value="Python Full Stack">Python Full Stack</option>
						        <option value="MEAN Stack">MEAN Stack</option>
						        <option value="MERN Stack">MERN Stack</option>
						        <option value="MySQL">MySQL</option>
							</select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Price</label>
                            <input type="text" name="price" class="form-control" required />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Start Date</label>
                            <input type="date" name="startDate" class="form-control" required />
                        </div>
                        
                         <!-- Image Upload -->
					    <div class="mb-3">
					        <label class="form-label">Course Image</label>
					        <input type="file" name="courseImage" class="form-control" accept="image/*" required />
					    </div>

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea name="description" class="form-control" rows="3" required></textarea>
                        </div>

                        <div class="text-end">
                            <button type="submit" class="btn btn-success">Add Course</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>