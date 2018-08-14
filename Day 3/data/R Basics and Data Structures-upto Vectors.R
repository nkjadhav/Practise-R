# Help Commands

help.start()   # Help documantation
help(median)   # Help on Functions
help("if")     # Help on keywords
?median        # Help on function
??logit        # Help on unknown functions, search in documentation of all installed packages 
help.search("logit") # same as ??
library(utils)
apropos("mean") # search using partial match
?colMeans
#=========================================

g<-5
g

# Assignment and Expressions
x<-2  # Assignment Operator
x
1/x   #Expression
x

.Last.value   #Last value before next statement is executed

assign("C",1) # another command for assignment, function
C
c<-2


# Arithmetic Operators

x<-6
y<-2

x+y
x-y
x*y
x/y
x^y

x%/%y # Quotient 
x%%y  # Remainder


# Logical (relational) Operators
y<3
y>3
y>=2
y<=2
y==2
y!=2

# NA 
z<-NA
y==z
# Logical expressions

(y<3)&(x<7) # & And Short form
(y<1)&(x<7)
(y<1)|(x<7) # & Or Short form
!(y==2) # Not ooperator
#(y<3)&&(x<7) # && And Long Form
#(y<1)||(x<7) # || Or Long form

y<-y + (y<3)   # Logical vector in Ordinary Arithmetic TRUE=1 and FALSE=0 
y

# Grouping of Elementary Commands


{a<-2;b<-3;a+b} # Grouping of Command

{a1<-a+1;b1<-b+1;  # Incomplete command
  a*b;a1*b1;
}


# R Statements

# if else statement

if (a>b) a else b
if (a>b) a

if (a<b) a;c<-2;c
{if (a<b) a;c<-2;c}

# if ((a<b)&&(b==3)) b 


# Nested if else

animal.fl<-'t' # first letter

if (animal.fl=='l') "lion" else 
  if (animal.fl=='t') "tiger" else 
    if (animal.fl=='z') "zebra" else "Not known"



# switch statement

# Character variable

animal.fl<-'t' # first letter

animal<-switch (animal.fl,
        l='lion',
        t='tiger',
        z='zebra',
        'Not known')
animal

# Integer or Factor variable (behaves differently)

sal <-600000
slab<-5

tax<-switch(slab,
            0,
            0.1*sal,
            0.15*sal,
            0.20*sal
            )
tax

a
aa<-switch (a+2,
        a+1,
        a+2,
        a+3,
        a+4,
        a+5,
        a+6,
        a+7)
aa   #NULL

# for loop
j=0

for (i in 1:10) { j<-j+i; print(j)}

for(i in c(-1:3, 9))  
  print(switch(i, 2, 3 , 4, 5,6,7,8,9,10))

# repeat and break

i<-0
repeat {print(i); if (i==10) break; i<-i+1}

# while and next
j<-0
while (j<10) {j<-j+1; if (j<6) next; print(j)} 

#common functions
print(1)
exp(x=1)
log(x = 10, base = 10) 
log (x = 10, base = exp(1))
log (x=10) # base = exp(1) is default
sqrt(9)
abs(-5.5)
sin(pi/6)
factorial(5)
round(pi,digit = 2)
sign(-3)
0/0  #NaN
2^1024    # Inf
-2^1024   # -Inf

# String functions

print("This is a character string")
m1<-"This is a character string"
substr(m1, start=10, stop=15)
strsplit(m1,split =" ")
nchar(m1)
toupper(m1)
tolower(m1)
paste(m1,m1,sep = ", ")  # concatenate

#==================================================================
# Data Structure in R
# Numeric Vector
x <- c(2,3,4,5,6) # c() combine values into a vector or list
x
y <- c(x,7,x)     # another vector y created from x having 11 elements
y
z<-1:50
# Arithmetic operations using vectors
1/x
x+y  # x is recycled to meet the length of y
x-y
x*y
x/y

print(x)
exp(x=x)
exp(x)
log(x = x, base = 10) 
log (x = x, base = exp(1))
log(x, base=10)
log (x=x) # base = exp(1) is default
sqrt(x)
abs(-x)
sin(pi/x)
factorial(x)
round(x/y,digit = 2)
sign(-x)
-x
# More Vector functions

length(x) #Number of elements
min(x)
max(x)
range(x) # returns min and max
var(x) 
sd(x)
mean(x)
median(x)
sort(x) # Ascending order
sort(x,decreasing = TRUE)
sum(x)
prod(x)
x<-c(x,7)
x
# some vector functions do not work in the presence of null value so they need to 
# be removed before operations
# Missing Value NA

v <- c(1,2,3,NA)
#length(v) <- 4
v
is.na(v)
mode(v)
range(v)
range(v,na.rm = TRUE)
mean(v)
mean(v,na.rm = TRUE)

u<-c(1,2,3,"abcd")
u
mode(u)


# colon operator

xx<-1:30 # colon operator to create integer vector
xx
xx[10]
xx[10:15]
xx[c(5,10,15,20)]
xx[-30]
xx[-(20:30)]


# seq
seq(from = 5, to = 10)    # 5 6 7 8 9 10
seq(5,10) 		# 5 6 7 8 9 10
seq(0,10,by =2) 	# 0 2 4 6 8 10
seq(0,10,length.out = 10)  # Number of elements in length.out

# rep() repeat elements

rep(0, times = 10)
rep(1:5, times = 2) # whole series is repeated
rep(1:5, each = 2)  # each element is repeated
rep(1:5, times=2, each = 2)
# Logical Operations on Vectors and Logical Vectors
x
y
x>3   
x==y

l1<-x>3  # l1 is a Logical Vector
l1

x+l1

v2<-1:4
v2
paste("Quarter",c(1,2,3,4),sep = "-")
paste("Quarter",v2,sep = "-")

# Character vector
c1<-("Quarter")
c1
Quarters <- paste("Quarter",1:4,sep = "-")
Quarters
mode(Quarters)

cat("Quarter",1:4,sep = "-") # concatenate. Notice the difference in out from paste. In memory
.Last.value

MASS
dplyr
xlsx

length(Quarters)
substr(Quarters, start=9, stop=9)
strsplit(Quarters,split ="-")
nchar(Quarters)
toupper(Quarters)
tolower(Quarters)
paste(Quarters,Quarters,sep = ", ")  # concatenate

m2<-c("do","do not","not")
m2
grep("do",m2)                   # pattern matching

m2<-c(m2,"1")
grep("[a-z]",m2) 
gsub("do","did",m2)            # pattern replacement
m2<-c(m2,"not do")
regexpr("do",m2)

# ifelse function for vectors

f<-c(5,6,7)
s<-c(4,7,6)
ifelse(f>s,f,s) # Returns bigger value

# Indexing vector

v
v1<-v[!is.na(v)] # recreates v with non missing values i.e. NA
v1

v2<-v[-4]      # negative index vector specifies values to be excluded
v2

#-------------------------------------------------------