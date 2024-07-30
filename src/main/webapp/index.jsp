<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
      <title>Add article</title>
   </head>
<body class="flex flex-col min-h-screen">

    <!-- Header -->
    <div class="bg-gray-800 text-white p-4 flex justify-between items-center">
        <h1 class="text-2xl">Code Journey - Admin</h1>
        <div>
            <a href="#" class="text-white ml-4">Dashboard</a>
            <a href="#" class="text-white ml-4">Backup</a>
            <a href="#" class="text-white ml-4">Analytics</a>
        </div>
    </div>

    <!-- Content -->
    <div class="flex-grow p-4">
        <h2 class="text-xl mb-4">Admin Panel</h2>
        <ul class="list-disc pl-5">
            <li class="mb-2"><a href="${pageContext.request.contextPath}/admin/articles/edit" class="text-blue-500">Add Article</a></li>
            <li class="mb-2"><a href="${pageContext.request.contextPath}/admin/articles" class="text-blue-500">View All Articles</a></li>
            <li class="mb-2"><a href="#" class="text-blue-500">Site Settings</a></li>
        </ul>
    </div>

    <!-- Footer -->
    <div class="bg-gray-800 text-white p-4 text-center">
        <p>&copy; 2024 Code Journey. All rights reserved.</p>
    </div>
</body>
</html>