# Search Engine using DFS

The **Search Engine** is a Java-based Desktop web application with basic search engine functions. The application has been built using Maven.
The web application has the following primary features:
  ### 1. Search:
  For a searched query, the most relevant webpages will be displayed in a ranked manner. The top 30 most relevant results will be displayed by default.
  The search results would be obtained from a given SQL database to which a connection should be established first.
  The Java-based WebCrawler is made use of to obtain webpages from the _Worlwide Web_ using Depth Limited Search, a variation of Depth First Search (DFS). These webpages would be stored in the database and can be accessed for search queries.
  ### 2. Search History:
  The search queries will be stored in the database and can be obtained using the **history** feature whenever required.
  There is also the option to clear all search history from the database.


## Instructions to run the Project locally
1. In case your IDE does not have built-in support for Maven, or in case of a code editor like VS Code, install [Apache Maven](https://maven.apache.org/download.cgi) on your desktop and add a Maven extension to your code editor or IDE.
2. Create a MySQL database. Create a table to store the _page title_, _page link_, and _page text_ obtained from web pages through web scraping; and another table to store the search history. The SQL commands used for creating the MySQL database for this project are provided in the sql file [```sql_commands.sql```](https://github.com/abhishekgoud343/SearchEngine/blob/main/sql_commands.sql). Using different attributes, table names etc in the database, than those in the ```sql_commands.sql``` file, would require making corresponding modifications in the project code.  
_Note_: Default SQL server username ```root``` and password ```password``` have been used in the project code as well as in the provided _war_ file. In case of different SQL server credentials, make the following change(s) in the project code:  
In the two java files named ```DatabaseConnection.java```, one in the _Search Engine_ folder and the other in the _Web Crawler_ folder (at ```/WebCrawler/src/main/java/org/accio/``` and ```/SearchEngine/src/main/java/com/accio/``` respectively), add the actual username and password of your MySQL server (as indicated in the comments of the program files), so that a connection to the database can be established when the respective project is executed.

### Web Scraping to your MySQL database using _WEB CRAWLER_  
1.  Open the ```Web Crawler``` project folder in any IDE or code editor such as IntelliJ IDEA, VS Code, Eclipse etc.  
2. Open the java file at the location ```/WebCrawler/src/main/java/org/accio/Crawler.java```. In the main function of this java program, add the required URLs so that web data can be scraped from the respective webpages, in this manner: ```crawler.getTextsAndLinks("url", 1);``` (replace ```url``` with the desired URL). For example: ```crawler.getTextsAndLinks("https://javatpoint.com", 1);```. A deeper web scraping can be performed by icreasing the ```MAX_DEPTH``` parameter in the ```Crawler.java``` program file (initially set to ```2```).  
3.  Run the java file at ```/WebCrawler/src/main/java/org/accio/Crawler.java```. This file contains the _main_ function and therefore the WebCrawler project can be executed by running the specified program file.  
4.  On successfully executing the ```Web Crawler``` project, the required webpage data will be scraped from the given webpages and added to your MySQL database.

### Running the _Search Engine_ project
1. Open the ```SearchEngine``` project folder in your IDE or code editor.  
2. Add a Tomcat plugin (e.g., _Smart Tomcat_) to your IDE. Download the ```Apache Tomcat``` archive file from [here](https://tomcat.apache.org/download-90.cgi) and extract it. Add a _run/debug configuration_ of ```Smart Tomcat``` type and select the location of the extracted ```Apache Tomcat``` folder as the _Tomcat server_; choose the location ```/SearchEngine/src/main/webapp``` as _Deployment directory_; and select ```SearchEngine``` as the _classpath of module_.
3. Optional: to change the maximum number of search results (default: 30), make a corresponding modification in the SQL query in the file at ```SearchEngine/src/main/java/com/accio/Search.java```.  
4. Run the _Search Engine_ project with the ```Tomcat``` server configuration. A _localhost_ URL will be generated; the URL will load the _Search Engine_ web application ([```http://localhost:8080/SearchEngine```](http://localhost:8080/SearchEngine)).
