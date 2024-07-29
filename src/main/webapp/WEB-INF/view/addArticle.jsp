<%@ page contentType = "text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
   <head>
      <title>Add article</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
      <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
      <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Edu+AU+VIC+WA+NT+Hand:wght@400..700&display=swap" rel="stylesheet">
      <script src="<c:url value='https://cdn.ckeditor.com/4.8.0/standard-all/ckeditor.js'/>"></script>
   </head>
   <body>
    <div class="grid-container">
        <%@ include file="admin/header.jsp" %>
        <div class="content">
         <form:form method="POST" action="${pageContext.request.contextPath}/admin/articles/edit" modelAttribute="article" id="articleForm">
                <form:input type="hidden" path="id" value="${article.id}"/>
                 <c:if test="${article.dateCreated != null}">
                    <input type="hidden" name="dateCreated" value="${article.dateCreated}">
                 </c:if>
                 <c:if test="${article.datePublished != null}">
                    <input type="hidden" name="datePublished" value="${article.datePublished}">
                 </c:if>
                <form:label path="title">Title</form:label><br>
                <form:input path="title"/>
                <form:errors path="title" cssClass="error"/><br>
                <form:label path="description">Description</form:label><br>
                <form:textarea path="description" rows="5" cols="50"/>
                <form:errors path="description" cssClass="error"/>
            <form:textarea path="content" rows="20%" cols="200%" class="content-textarea"/>
            <form:errors path="content" cssClass="error"/><br>
            <fieldset>
                    <legend>Do you want to post an article right now?</legend>
                    <label for="draft">Save in draft</label>
                    <input type="radio" name="inDraft"  id="draft" value="true" <c:if test="${article.inDraft}">checked</c:if>>
                    <label for="post_now">Post now</label>
                    <input type="radio" name="inDraft" id="post_now" value="false" <c:if test="${!article.inDraft}">checked</c:if>>
            </fieldset>
            <br>
         <button type="submit" class="ui-button ui-widget ui-corner-all">Submit</button>
         </form:form>
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
                          		height: 600,
                          		contentsCss: [ 'https://cdn.ckeditor.com/4.8.0/standard-all/contents.css', 'mystyles.css' ],
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
        </div>
        <div class="footer">

        </div>
    </div>
   </body>
 </html>