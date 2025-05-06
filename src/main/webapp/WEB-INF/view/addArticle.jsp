<%@ page contentType = "text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
   <head>
      <title>Add article</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="<c:url value='https://cdn.ckeditor.com/4.8.0/standard-all/ckeditor.js'/>"></script>
        <style>
        .error {
            color:red;
         }
        </style>
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
               <form:input type="hidden" path="dateCreated" name="dateCreated" id="dateCreated" value="${article.dateCreated}" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
               <form:input type="hidden" path="datePublished" name="datePublished" id="datePublished" value="${article.datePublished}" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
               <form:input type="hidden" path="dateUpdated" name="dateUpdated" id="dateUpdated" value="${article.dateUpdated}" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
               <div>
                   <label for="title" class="block text-sm font-medium text-gray-700">Title<label>
                   <form:input type="text" path="title" name="title" id="title"  class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
                   <form:errors path="title" cssClass="error"/>
               </div>
               <div>
                   <label for="description" class="block text-sm font-medium text-gray-700">Short Description<label>
                   <form:input type="text" path="description" name="description" id="description" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
                   <form:errors path="description" cssClass="error"/>
               </div>
               <div>
                   <label for="tag" class="block text-sm font-medium text-gray-700">Tags<label>
                   <form:input type="text" path="tags" name="tag" id="tag" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
                   <form:errors path="tags" cssClass="error"/>
               </div>
               <div>
                   <span class="block text-sm font-medium text-gray-700">Category</span>
                   <div class="mt-1">
                       <label class="inline-flex items-center">
                           <input type="radio" name="inDraft" value="true" path="inDraft" class="form-radio" <c:if test="${article.inDraft}">checked</c:if> >
                           <span class="ml-2">Save to draft</span>
                       </label>
                       <label class="inline-flex items-center ml-6">
                           <input type="radio" name="inDraft" value="false" path="inDraft" class="form-radio" <c:if test="${!article.inDraft}">checked</c:if>>
                           <span class="ml-2">Publish</span>
                       </label>
                   </div>
               </div>
               <div>
                   <label for="content" class="block text-sm font-medium text-gray-700">Content</label>
                   <form:textarea name="content" path="content" id="editor" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"/>
                   <form:errors path="content" cssClass="error"/>
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
                                 	CKEDITOR.replace( 'content', {
                                 		toolbar: [
                                 			{ name: 'clipboard', items: [ 'Undo', 'Redo' ] },
                                 			{ name: 'styles', items: [ 'Styles', 'Format' ] },
                                 			{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
                                 			{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
                                 			{ name: 'links', items: [ 'Link', 'Unlink' ] },
                                 			{ name: 'insert', items: [ 'Image', 'EmbedSemantic', 'Table' ] },
                                 			{ name: 'tools', items: [ 'Maximize' ] },
                                 			{ name: 'editing', items: [ 'Scayt' ] }
                                 		],
                                 		customConfig: '',
                                 		extraPlugins: 'autoembed,embedsemantic,image2,uploadimage,uploadfile',
                                 		removePlugins: 'image',
                                 		height: 100 ,
                                 		contentsCss: [ 'https://cdn.ckeditor.com/4.8.0/standard-all/contents.css'],
                                 		bodyClass: 'article-editor',
                                 		format_tags: 'p;h1;h2;h3;pre',
                                 		removeDialogTabs: 'image:advanced;link:advanced',
                                 		stylesSet: [
                                 			/* Inline Styles */
                                 			{ name: 'Marker',			element: 'span', attributes: { 'class': 'marker' } },
                                 			{ name: 'Cited Work',		element: 'cite' },
                                 			{ name: 'Inline Quotation',	element: 'q' },
                                 			/* Object Styles */
                                 			{
                                 				name: 'Special Container',
                                 				element: 'div',
                                 				styles: {
                                 					padding: '5px 10px',
                                 					background: '#eee',
                                 					border: '1px solid #ccc'
                                 				}
                                 			},
                                 			{
                                 				name: 'Compact table',
                                 				element: 'table',
                                 				attributes: {
                                 					cellpadding: '5',
                                 					cellspacing: '0',
                                 					border: '1',
                                 					bordercolor: '#ccc'
                                 				},
                                 				styles: {
                                 					'border-collapse': 'collapse'
                                 				}
                                 			},
                                 			{ name: 'Borderless Table',		element: 'table',	styles: { 'border-style': 'hidden', 'background-color': '#E6E6FA' } },
                                 			{ name: 'Square Bulleted List',	element: 'ul',		styles: { 'list-style-type': 'square' } },
                                 			/* Widget Styles */
                                 			// We use this one to style the brownie picture.
                                 			{ name: 'Illustration', type: 'widget', widget: 'image', attributes: { 'class': 'image-illustration' } },
                                 			// Media embed
                                 			{ name: '240p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-240p' } },
                                 			{ name: '360p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-360p' } },
                                 			{ name: '480p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-480p' } },
                                 			{ name: '720p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-720p' } },
                                 			{ name: '1080p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-1080p' } }
                                 		]
                                 	} );
                      </script>
   </body>
 </html>