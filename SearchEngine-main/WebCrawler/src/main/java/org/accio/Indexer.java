package org.accio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.jsoup.nodes.Document;

public class Indexer {
    static Connection connection = null;

    Indexer(Document document, String url) throws SQLException, ClassNotFoundException {
        String title = document.title();
        String text = document.text();

        connection = DatabaseConnection.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO pages VALUES(?, ?, ?);");
        preparedStatement.setString(1, title);
        preparedStatement.setString(2, url);
        preparedStatement.setString(3, text);

        preparedStatement.executeUpdate();
    }
}
