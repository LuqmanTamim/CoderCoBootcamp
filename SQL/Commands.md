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
    id,
    email,
    bio,
    country
);
```  
In the parenthesis we can include a list of coloumns to include in the table, so id, email, bio and country are all coloumn names. 


#### What is ;
The ; sytanx is used for statements. Statements are just code that do something. 