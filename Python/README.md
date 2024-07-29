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