# SQL COMMANDS  

These commands are primarliy for MySQL however the commands are similar to other relational databases such as PostgreSQL   

#### Acessing mysql CLI  

```
mysql -u "user name" -p
```  
To access the command line you enter the above command where -u indicates the user and -p is added if the user has a password attached  

#### Creating a database  

```
CREATE DATABASE "whatever name you wish to call the database";
```  
Code in realtion to creating a database  

```
SHOW DATABASES;
```  
Lists all databases within MySQL. This is not always the best to view data and instead we can visualise data using SQLTools on VsCode  

#### Comments  

```
-- "comment"
```  
Allows us to create comments, one use case is the block command which allows us to run things individually:    

```
-- @block
```  

#### Creating a table in the database  

```
CREATE TABLE Users;
```  
CREATE TABLE is a key word from SQL that the language interprets to execute a command, they can be written in lower case.   
The Users part is the identifier which identifies the name of the table.      

```
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country
);
```    
In the parenthesis we can include a list of coloumns to include in the table, so id, email, bio and country are all coloumn names.    

INT is the data type which means the data of the id will be whole numbers. If data other than an integer is applied to the id coloumn there will be an error.    

PRIMARY KEY ensures that the id number is unique for each row.   

AUTO_INCREMENT refers to automatically attaching a unique id to a new data value in incremental order.  

VARCHAR can take variable characters and 255 is the max amount of characters.  

NOT NULL data cannot be left out   

UNIQUE each email must be unique an dcannot be the same as another email  

TEXT used to store large string of unspecified size unlike VARCHAR  

#### What is ;  
The ; sytanx is used for statements. Statements are just code that do something. 

#### Inserting rows into database  

```
INSERT INTO Users (email, bio, country)
VALUES
    ('hiworld@gmail.com', 'foo' , 'GB')
    ('helloworld@gmail.com', 'BAR' , 'US')
    ('hellohi@gmail.com', 'baz' , 'MA');
```  

VALUES is the list of values inserted into the rows. We have inserted 3 rows into the Users table.  

#### How do we retrieve data or query   

```
SELECT * FROM Users;
```  
Retrieves the entire Users table due to "*" meaning all   

```
SELECT email, id FROM Users;
```  
This will only select email and id coloumn   

```
SELECT email, id FROM Users
ORDER BY id ASC
LIMIT 2;
```  
This can be used to limit the rows to only two rows and query the data in increasing id size

```  
SELECT email, id FROM Users
ORDER BY id DESC
LIMIT 2;
```  
Similarly we have the rows limited to 2 and the id in a descending fashion presenting the 2 biggest id values  

```  
SELECT email, id FROM Users

WHERE country = 'US'

ORDER BY id DESC
LIMIT 2;
``` 
WHERE will only return rows where the country is US  

```  
SELECT email, id FROM Users

WHERE country = 'US'
AND id > 1

ORDER BY id DESC
LIMIT 2;
``` 
AND command make sure the id is greater than 1 and country is US

```
SELECT email, id FROM Users

WHERE country = 'US'
OR id > 1

ORDER BY id DESC
LIMIT 2;
```
OR means retrieve data where country is US and id's that are greater than 1

```
SELECT email, id FROM Users

WHERE country = 'US'
AND email LIKE 'hello%'

ORDER BY id DESC
LIMIT 2;
```

LIKE is used to filter by a pattern so in this example emails that start with hello will be retrieved 