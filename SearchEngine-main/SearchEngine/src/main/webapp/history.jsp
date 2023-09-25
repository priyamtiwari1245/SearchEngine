<%@page import="java.util.ArrayList"%>
<%@page import="com.accio.HistoryResult"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles.css?v=1.0">
    </head>
    <body>
        <h2>History</h2>
        <table border=1 class="resultTable">
            <tr>
                <th>Keyword</th>
                <th>Link</th>
            </tr>
            <%
                ArrayList<HistoryResult> results = (ArrayList<HistoryResult>) request.getAttribute("results");
                for (HistoryResult result : results) {
            %>
            <tr>
                <td><%out.println(result.getKeyword());%></td>
                <td><a href="<%out.println(result.getLink());%>"><%out.println(result.getLink());%></a></td>
            </tr>
            <%
                }
            %>
        </table>
        <form action="ClearHistory">
            <br>
            <button type="submit" id="clearHistory">Clear History</button>
        </form>
        <button><a href="http://localhost:8080/SearchEngine" class="goHome">Go to homepage</a></button>
    </body>
</html>
