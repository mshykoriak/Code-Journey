<%@ page contentType = "text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
   <head>
      <title>Content Management</title>
      </head>
<body>
 <script>
        const shouldRender = $
        const container = document.getElementById('container');

        if (shouldRender) {
            const element = document.createElement('div');
            element.innerHTML = 'This is a conditionally rendered element';
            container.appendChild(element);
        }
    </script>
<table border="1">
	<thead>
		<tr>
			<th>#ID</th>
			<th>Title</th>
			<th>Description</th>
			<th>Date</th>
			<th>State</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
    	<c:forEach items="${articlesList}" var="a">
    		<tr>
    			<td>${a.id}</td>
    			<td>${a.title}</td>
    			<td>${a.description}</td>
    			<td>${a.dateCreated}</td>
    			<td>
    			<c:choose>
    			<c:when test="${a.inDraft}">
                    <p>In draft</p>
                </c:when>
                <c:otherwise>
                    <p>Published</p>
                </c:otherwise>
                </c:choose>
                </td>
    			<td>
    			<c:if test="${a.inDraft}">
    			<a href="${pageContext.request.contextPath}/admin/articles/publish?id=${a.id}">Publish</a>
    			</c:if>
    			</td>
    			<td><a href="${pageContext.request.contextPath}/admin/articles/edit?id=${a.id}">Edit</a></td>
    		</tr>
    	</c:forEach>
    	</tbody>
    </table>

    </body>
    </html>