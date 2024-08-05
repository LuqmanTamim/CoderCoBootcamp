# Python Commands and info 

### Printing hello world
``` print("Hello World") ``` 
This is a string (sequence of characters). The bit between the bracket is text which must be surrounded by double quotes " or single ' 
``` print ``` is a function built into python used to print messages on application window

### Data types

1. Integers

4, 5, 6, 7

2. Strings 
Made up of characters and written in single quotes '' or double quotes ""

- str 'Tim', "Heloo", '43r4infr'

```
my_name = "Luqman"
print (my_name)
```
>> Luqman

- We can also also print characters

```
my_name = "Luqman"
print (note [0])
```
>> L

This prints the first character

```
my_name = "Luqman"
print (note [-1])
```
>> n

This prints the last character

```
my_name = "Luqman"
print (note [0:3])
```
>> Luqm

This is called a Slice and prints a portion of the string

```
old_string = "Hello, YOUR NAME!"
new_string = old_string.replace("YOUR NAME", "Luqman")
print (new_string)
```
>> Hello, Luqman!

Used to replace things in a function it is called a method function

```
old_string = "Hello, YOUR NAME!"
len(old_string)
```
>> String is 17 characters long 

- String Conatenation 

```
my_string = "Ant" + "eater"
print (my_string)
```
>>Anteater 

```
my_string = "Forty" + str("2")
print (my_string)
```
>> Forty2

To add numbers to a string we must use the str()


```
my_name = "Luqman"
print (f"Hello, {my_name})
```


3. Boolean

bool True, False

4. Float

float 0.32, 1.234

### Variables

Variables can't start with a number (1name) and can only include Capital, non capital and underscore. name is different to NAME

```
name = "Luqman"
print (name)
```

>> Luqman

age = 18
print (age)


### Basic Operations & input

##### input 
```
print ('Hello, what is your name)
name = input()                     # Allows user to input name
print('Hello,' name)               # Prints Hello and the name that was inputted
```

##### Operators

- Basic Operators
+-/* (plus, minus, division, multiplication)

1. Addition

``
added = 2 + 3
print(f"2 + 3 = {addeded} (should be 5)")
``


2. Multiplication

``
multiplied = 2 * 3
print(f"2 * 3 = {multiplied} (should be 6)")
``

3. Subtaraction

``
subtracted = 2 - 3
print(f"2 - 3 = {subtracted} (should be -1)")
``

4. Division

```
divided = 2 / 3
print(f"2 / 3 = {divided} (should be 0.6666666666666666)")
```

This kind of 'decimal point' number, 0.6666666666666666 is
called a float, by the way, meaning 'floating point'.

5. Modulus
Sometimes known as "remainder if we divide 3 by 2"

```
modulus = 3 % 2
print(f"3 % 2 = {modulus} (should be 1)")
```

6. Floor division
Sometimes known as "division without remainder"

floor_divided = 2 // 3
print(f"2 // 3 = {floor_divided} (should be 0)")

7. Exponentiation ==
Sometimes known as "2 to the power of 3"

expr = 2 ** 3
print(f"2 ** 3 = {expr} (should be 8)")

__*Operations are calculated using BIDMAS so 2 + 3 * 4 = 14, not 20*__

- Comparison Operators
<, >, == stands from is left equal to right, != stands for not equal to, <= greater than or equal to, >= less than or equal to 

```
print (2 > 3)
>> False
```

```
print ("Hello" == "hello")
>> False
```

```
print (4 != 5)
>>True
```

```
def a_is_within_apple(a, apple):
return a in apple
```
>>True

### Conditions

From them are If/Elif/Else

##### if
```
if x == y:
    do this
```
== is a comparison operator

```
age = input ('Input your age:')

if age > 16:
    print ('Your old!')
```

##### else

```
age = input ('Input your age:')

if int(age) >= 16:
    print('hey youre older than 16')
else:                                       #if the above is false then the else command dispalys the below
    print('you are younger older than 16')
```

```
height = input()

if int(height) < 1:
    print ('you cannot ride, under 1m')
elif int (height) > 2:
    print ('you cannot ride, over 2m)
else:
    print ('you can ride') 

# stands for else if used to have multiple else statements
```

##### Chained Conditionals & Nested Statements

We use ```and```, ```or```, ```not```

```
x = 2
y = 3

if x == y and x + y == 5:
```
This will give a false statement as both must be right

```
x = 2
y = 3

if x == y or x + y == 5:
```

This will give us a True since x + y = 5

```
x = 2
y = 3

if not (x == y or x + y == 6):
```

This not command implies the opposite of the bracket i.e if the operations are not true

```
x = 2
y = 3

if x == 2
    if y == 3:
        print('x = 2, y = 3')
    else:
        print('x = 2, y != 3')
else:
    print('x != 2')
```

Nested statement above

### Loops

##### For Loops

```
def print_range():
    for x in range(0, 10, 1): # (start, stop, step)
        print(x)
```
Prints the numbers 0-9 as 0 is the first number how the loop works it starts with 0 and does 
x = x + 1. Step is how much you add by 

##### While Loops

A while loop is like an if but it is different as it keeps on executing the block for as long as the

```
i = 0
while i > 10:
    print (f"the number is now {i}")
    i = i + 1
```
>> the number is now 0
the number is now 1
the number is now 2
the number is now 3
the number is now 4
the number is now 5
the number is now 6
the number is now 7
the number is now 8
the number is now 9


```
while loop == True:
    do this 
```

```
loop = True

while loop == True:
    name = input('insert something: ')
    if name == 'stop':
    loop == False     # or we could just type break
```
This loop keeps on running until the persn inputs 'stop'

While loops can be used for things like password in which there is criteria i=which the password must meet


### Lists and Tuples

##### List

Syntax for lists visit https://docs.python.org/3/tutorial/datastructures.html the official documentation

``` fruits = ['apple', 'pear', 3] ``` Catagorised by square brackets 

1. chose from the list and print

``` 
fruits = ['apple', 'pear', 3]

print(fruits[0])
``` 
>> apple

2. adding to the list

``` 
fruits = ['apple', 'pear', 3]
fruits.append('strawberry')
print(fruits)
``` 
>> ['apple', 'pear', 3, 'strawberry']

3. changing something on the list

``` 
fruits = ['apple', 'pear', 'strawberry']

fruits[1] = 'blueberry'

print(fruits)
``` 
This chnages pear to blueberry

4. copying the list

``` 
fruits = ['apple', 'pear', 'strawberry']
copy_fruits = fruits.copy()
copy_fruits.append('blueberry')
print(fruits)
print(copy_fruits)
``` 
>> ['apple', 'pear', 'strawberry', 'blueberry']
>> ['apple', 'pear', 'strawberry', 'blueberry']

alows the copying of a list without modificating the first

5. remove item from list

``` 
fruits = ['apple', 'pear', 'strawberry']
fruits.remove('strawberry')
print(fruits)
``` 
>> ['apple', 'pear']

Removes strawberry from the list 

6. reverse the list

``` 
fruits = ['apple', 'pear', 'strawberry']
    fruits.reverse()
    return fruits
``` 

>> ['strawberry', 'pear', 'apple']


##### Tuple

used for coordinates, colours

``` 
fruits = ['apple', 'pear', ''strawberry]
position = (2, 3)
```

### Interations by Item

```
fruits = ['apples', 'pear', 'strawberries']

for fruit in fruits:
    if fruit == 'pears':
        print (fruits)
    else:
        print('not pears')
```

### String Methods

1. ```.strip()``` removes white spaces when text is inputted

```
text = input('Input something: ')
print(text.strip())
```

so if user inputs

```       hello    ```

returns

>> hello

2. ```len()``` stands for length and returns length of string 
```
text = input('Input something: ')
print(len())
```
so if user inputs 

```12345```

returns

>> 5

3. ```.lower()``` stands for lower case and makes the text lower case

```
text = input('Input something: ')
print(text.lower())
```
so if user inputs 

```LUQmaN WaS heRe```

returns

>> luqman was here

4. ```.upper()``` stands for lower case and makes the tex upper case

```
text = input('Input something: ')
print(text.upper())
```
so if user inputs 

```LUQmaN WaS heRe```

returns

>> LUQMAN WAS HERE

5. ```.split()``` makes a list 

```
text = input('Input something: ')
print(text.split())
```

so if user inputs 

``` hello.tim.bye```

returns

>> ['hello', 'tim', 'bye']

### Slice Operator

Used on lists and strings

1. 
```
fruits = ['apples', 'pear', 'strawberries']
text 'Hello I like fruits'

print(text[::])    # start:stop:step
                   # having nothing defaults to 1:1:1
```

returns

>> Hello I like fruits

2. Adding to a list 


1. 
```
fruits = ['apples', 'pears', 'strawberries']
text 'Hello I like fruits'

fruits[1:1] = 'blueberries'

print(fruits)    
```
returns
>> apples, blueberries, pears, strawberries


### Functions
Has a paramter and we call the parameter in something called an argument


```
def luqmansfunction (x):  #def=define, luqmansfunction= name of function, x = parameter
    return x + 2  # argument
```
```
def luqmansfunction (x): 
    return x + 2

newnumber = luqmansfunction (10)
print(newnumber)
```
returns
>> 12


def add_one(num):
  return num + 1

You may need to widen the panel or zoom out to see the table:

| Code           | What is it?                                        |
| -------------- | -------------------------------------------------- |
| def            | `def` is a keyword that defines a new function     |
| add_one        | `add_one` is the function name                     |
| (num)          | `(num)` is the parameter list                      |
| num            | `num` is a parameter                               |
| :              | The `:` symbol indicates the body should start now |
| return num + 1 | `return num + 1` is a statement                    |
| num + 1        | `num + 1` is an expression                         |
| num            | `num` here is a variable                           |
| +              | `+` is an operator                                 |
| 1              | `1` is a literal number                            |


##### 2 step Functions

```
def function(num):
    divided = num / 2
    added = divided + 1
    return added
```

It can also be written in 1 step:

```
def function(num):
    return (num/2) + 1
```

### Reading a text file

```file = open('file.txt', 'r')``` r stands for read

```
file = open('file.txt', 'r')
f = file.readlines()
```
states all lines of the file with the enter key at the end of each line (\n)


```
file = open('file.txt', 'r')
f = file.readlines()

newlist = []
for line in f:
    if line [-1] == '\n':
        newlist.append(line[:-1]) # removes the last character of each line
    else:
        newlist.append(line)

print(newlist)

file.close()  # saves changes
```

easier way


```
file = open('file.txt', 'r')
f = file.readlines()

newlist = []
for line in f:
    newlist.append(line.strip())

print(newlist)

file.close()
```

### Writing a text file

```
file = open('file.txt', 'w') #w stands for write and clears entire file and writes new words

file.write('python')

file.close()
```

if you want things on a differnt line then:

```
file = open('file.txt', 'w') #w stands for write and clears entire file and writes new words

file.write('python\n') # enter key (\n) makes a new line
file.write('This is on a new line')

file.close()
```

### USING .COUNT() and .FIND()