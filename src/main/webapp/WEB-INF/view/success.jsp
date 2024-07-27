<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Content</title>
</head>
<body>
    <h1>Stored Content</h1>
    <div>
        <%= request.getAttribute("content") %>
    </div>
</body>
</html>