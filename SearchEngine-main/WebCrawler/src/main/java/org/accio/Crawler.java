package org.accio;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashSet;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
    HashSet<String> urlSet;
    int MAX_DEPTH = 2;

    Crawler() {
        urlSet = new HashSet<>();
    }

    public void getTextsAndLinks(String url, int depth) throws IOException, SQLException, ClassNotFoundException {
        if (urlSet.contains(url))
            return;

        if (depth > MAX_DEPTH)
            return;

        urlSet.add(url);
        ++depth;

        Document document = Jsoup.connect(url).timeout(5000).get();
//        System.out.println(document.title());

        Indexer indexer = new Indexer(document, url);

        Elements availableLinksOnPage = document.select("a[href]");

        for (Element currentLink : availableLinksOnPage)
            getTextsAndLinks(currentLink.attr("abs:href"), depth);
    }

    public static void main(String[] args) throws IOException, SQLException, ClassNotFoundException {
        Crawler crawler = new Crawler();
        crawler.getTextsAndLinks("https://www.geeksforgeeks.org", 1);
        crawler.getTextsAndLinks("https://javatpoint.com", 1);
    }
}