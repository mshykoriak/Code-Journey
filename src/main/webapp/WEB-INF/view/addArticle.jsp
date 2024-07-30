<%@ page contentType = "text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
   <head>
      <title>Add article</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
   </head>
   <body class="flex flex-col min-h-screen">

       <!-- Header -->
       <div class="bg-gray-800 text-white p-4 flex justify-between items-center">
           <h1 class="text-2xl">Code Journey Admin - Add article</h1>
           <div>
               <a href="${pageContext.request.contextPath}/" class="text-white ml-4">Dashboard</a>
               <a href="#" class="text-white ml-4">Backup</a>
               <a href="#" class="text-white ml-4">Analytics</a>
           </div>
       </div>

       <!-- Content -->
       <div class="flex-grow p-4">
           <h2 class="text-xl mb-4">Add New Article</h2>
           <form:form method="POST" action="${pageContext.request.contextPath}/admin/articles/edit" modelAttribute="article" id="articleForm" class="space-y-4">
               <form:input type="hidden" path="id" name="title" id="title" value="${article.id}" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
               <div>
                   <label for="title" class="block text-sm font-medium text-gray-700">Title<label>
                   <form:input type="text" path="title" name="title" id="title" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
               </div>
               <div>
                   <label for="description" class="block text-sm font-medium text-gray-700">Short Description<label>
                   <form:input type="text" path="description" name="description" id="description" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
               </div>
               <div>
                   <label for="tag" class="block text-sm font-medium text-gray-700">Tags<label>
                   <form:input type="text" path="tags" name="tag" id="tag" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
               </div>
               <div>
                   <span class="block text-sm font-medium text-gray-700">Category</span>
                   <div class="mt-1">
                       <label class="inline-flex items-center">
                           <input type="radio" name="isInDraft" value="true" class="form-radio" <c:if test="${article.inDraft}">checked</c:if> >
                           <span class="ml-2">Save to draft</span>
                       </label>
                       <label class="inline-flex items-center ml-6">
                           <input type="radio" name="isInDraft" value="false" class="form-radio" <c:if test="${!article.inDraft}">checked</c:if>>
                           <span class="ml-2">Publish</span>
                       </label>
                   </div>
               </div>
               <div>
                   <label for="content" class="block text-sm font-medium text-gray-700">Content</label>
                   <form:textarea name="content" path="content" id="editor" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
               </div>
               <div>
                   <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Submit</button>
               </div>
             </form:form>
       </div>

       <!-- Footer -->
       <div class="bg-gray-800 text-white p-4 text-center">
           <p>&copy; 2024 Code Journey. All rights reserved.</p>
       </div>

       <script>
           ClassicEditor
               .create(document.querySelector('#editor'))
               .catch(error => {
                   console.error(error);
               });
       </script>
   </body>
 </html>