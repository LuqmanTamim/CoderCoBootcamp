# Python Commands and info 

### Printing hello world
``` print("Hello World") ``` 
This is a string (sequence of characters). The bit between the bracket is text which must be surrounded by double quotes " or single ' 
``` print ``` is a function built into python used to print messages on application window

### Data types

1. Integers

4, 5, 6, 7

2. Strings

str 'Tim', "Heloo", '43r4infr'

3. Boolean

bool True, False

4. Float

float 0.32, 1.234

### Variables

Variables can't start with a number (1name) and can only include Capital, non capital and underscore. name is different to NAME

name = "Luqman"
print (name)
>> Luqman

age = 18
print (age)


### Basic Operations & input

##### input 
print ('Hello, what is your name)
name = input()                     # Allows user to input name
print('Hello,' name)               # Prints Hello and the name that was inputted

##### Operators

1. Basic Operators
+-/*

```
num1 = 45
num2 = 3
print (num1 + num2)
>> 48
```

64 // 10 = 6 (gives as a whole number only 6 max integers can go in)


5 % 2 = 1 # gives the remainder (5/2 is 2 r1)

```
num1 = 45
num2 = 4
num3 = num1**num2 #exponent
print (num3)
>> 4100625
```

2. Comparison Operators
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

### Conditions

From them are If/Elif/Else

##### if
```
if x == y:
    do this
```

```
age = input ('Input your age:')

if age > 16:
    print ('Your old!')
```

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
for x in range(0, 10, 1): # (start, stop, step)
    print(x)
```
Prints the numbers 0-9 as 0 is the first number how the loop works it starts with 0 and does 
x = x + 1. Step is how much you add by 

##### While Loops


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

``` fruits = ['apple', 'pear', 3] ``` Catagorised by square brackets 

1. chose from the list and print
``` 
fruits = ['apple', 'pear', 3]

print(fruits[0])
``` 
```>> pear```

2. adding to the list

``` 
fruits = ['apple', 'pear', 3]
print(fruits)
fruits.append('strawberry')
print(fruits)
``` 

3. changing something on the list

``` 
fruits = ['apple', 'pear', ''strawberry]

fruits[1] = 'blueberry'

print(fruits)
``` 
This chnages pear to blueberry

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