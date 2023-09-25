<%@page import="java.util.ArrayList"%>
<%@page import="com.accio.SearchResult"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles.css?v=1.0">
    </head>
    <body>
        <h2>Search Results</h2>
        <table border=1 class="resultTable">
            <tr>
                <th>Title</th>
                <th>Link</th>
            </tr>
            <%
                ArrayList<SearchResult> results = (ArrayList<SearchResult>) request.getAttribute("results");
                for (SearchResult result : results) {
            %>
            <tr>
                <td><%out.println(result.getTitle());%></td>
                <td><a href="<%out.println(result.getLink());%>"><%out.println(result.getLink());%></a></td>
            </tr>
            <%
                }
            %>
        </table>
        <br><br>
        <button><a href="http://localhost:8080/SearchEngine" class="goHome">Go to homepage</a></button>
    </body>
</html>
