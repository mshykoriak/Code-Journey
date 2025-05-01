<%@ page contentType = "text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Content Management</title>
      <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
      </head>
<body class="flex flex-col min-h-screen">
    <div class="bg-gray-800 text-white p-4 flex justify-between items-center">
        <h1 class="text-2xl">Code Journey - All articles</h1>
        <div>
            <a href="${pageContext.request.contextPath}/" class="text-white ml-4">Dashboard</a>
            <a href="#" class="text-white ml-4">Backup</a>
            <a href="#" class="text-white ml-4">Analytics</a>
        </div>
    </div>

    <!-- Content -->
    <div class="flex-grow p-4">
        <h2 class="text-xl mb-4">Content</h2>
        <table class="min-w-full bg-white">
            <thead>
                <tr>
                    <th class="py-2 px-4 bg-gray-200">ID</th>
                    <th class="py-2 px-4 bg-gray-200">Date created</th>
                    <th class="py-2 px-4 bg-gray-200">Date published</th>
                    <th class="py-2 px-4 bg-gray-200">Date updated</th>
                    <th class="py-2 px-4 bg-gray-200">Title</th>
                    <th class="py-2 px-4 bg-gray-200">Tags</th>
                    <th class="py-2 px-4 bg-gray-200">Description</th>
                    <th class="py-2 px-4 bg-gray-200">State</th>
                    <th class="py-2 px-4 bg-gray-200">Publish/draft</th>
                    <th class="py-2 px-4 bg-gray-200">Action</th>
                </tr>
            </thead>
            <tbody id="data-table">
               <c:forEach items="${articlesList}" var="a">
                  <tr>
                    <td class="border px-4 py-2">${a.id}</td>
                    <td class="border px-4 py-2">${a.dateCreated}</td>
                    <td class="border px-4 py-2">${a.datePublished}</td>
                    <td class="border px-4 py-2">${a.dateUpdated}</td>
                    <td class="border px-4 py-2">${a.title}</td>
                    <td class="border px-4 py-2">${a.tags}</td>
                    <td class="border px-4 py-2">${a.description}</td>
                    <td class="border px-4 py-2">
                    <c:choose>
                    <c:when test="${a.inDraft}">
                    <p>In draft</p>
                    </c:when>
                    <c:otherwise>
                    <p>Published</p>
                    </c:otherwise>
                    </c:choose>
                    </td>
                    <td class="border px-4 py-2">
                    <c:choose>
                    <c:when test="${a.inDraft}">
                    <a class="text-blue-500" href="${pageContext.request.contextPath}/admin/articles/publish?id=${a.id}">Publish</a>
                    </c:when>
                    <c:otherwise>
                    <a class="text-blue-500" href="${pageContext.request.contextPath}/admin/articles/draft?id=${a.id}">Put to draft</a>
                    </c:otherwise>
                    </c:choose>
                    </td>
                    <td class="border px-4 py-2"><a class="text-blue-500" href="${pageContext.request.contextPath}/admin/articles/edit?id=${a.id}">Edit</a></td>
                    </tr>
                    </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <div class="bg-gray-800 text-white p-4 text-center">
        <p>&copy; 2024 Code Journey. All rights reserved.</p>
    </div>
    </body>
    </html>