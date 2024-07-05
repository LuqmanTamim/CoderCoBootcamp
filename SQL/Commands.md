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

#### Performing JOINS

Used to coonect data between two tables where the teables share the same row title. 

```
SELECT *

FROM martian

INNER JOIN base

ON martian.base_id = base.base_id;
```
Here we look to connect the base id from the martian table with the base is with the base table. We also selected all other coloumns using *.

```
SELECT martian.martian_id, base.base_id, base.base_name

FROM martian

INNER JOIN base

ON martian.martian_id = base.base_id;
```

Now if we want to select specific coloumns we remove the * and write the coloumns we want to select. BUT it must me specific to a table, you cannot just write SELECT martian_id. base_id, base name. You have to be specific to which table so: SELECT martian.martian_id, base.base_id, base.base_name. it looks like this:

```
SELECT m.martian_id, b.base_id, b.base_name

FROM martian AS m

INNER JOIN base as b

ON m.martian_id = b.base_id;
```
We can rename tables by stating martian as m and base as b. AS stands for alius

### Types of Joins

There are 4 types of joins INNER LEFT RIGHT FULL 

- The ``` SELECT INNER ``` join will connect the left row with right row only when the ON condition is met
- The ``` SELECT LEFT ``` join will perform an INNER join and include all other rows from left table. The rows from the left table that have no matches will have a value null
- The ``` SELECT RIGHT ``` join will perform an INNER join and include all other rows from right table. The rows from the right table that have no matches will have a value null
- The ``` SELECT FULL ``` join will returnn all rows from left and right tables. If some rows have matches they will be joined but if not, they will have a null value  

#### Self Join



