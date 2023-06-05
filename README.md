# Welcome to My Basecamp 1
***

## PROJECT USAGE
#****** To Login as an admin *********
email: admin@admin.com
password: password


******** NOTE *****
you can login as normal user by simply creating an account

Thanks Gaetan



## project correction
the obversed error observed by Gaetan about users been able to see other users project 
relating to the database model implemented has been fixed...


## Task
A Ruby on rails project that handles User Registration
with basic features as liste below....

User #new
User #show
User #create
User #destroy In summary, you should be able to create a new user, delete a user, and as a new user, create an account yourself.
Session

User #sign_in
User #sign_out Users should be able to log in and log out.
Role Permission

User setAdmin
User removeAdmin This means you will have two types of permissions, someone who is a user, and someone who is a user and an admin. We want the ability to also remove the admin permission from a user.
Project

Project #new
Project #show
Project #edit
Project #destroy Similar to the real Basecamp, users should be able to create, edit, and destroy a project.



## Description
THe Basecamp project is built on the idea where developers can work on projects 
and also collaborate on some other projects

we have two entry points into the program... as an `admin` or `user`
and admin will have access to both the user project and admins portal
will the users only can see and access their projects 



## Installation
Rails was installed 
Sqlite was also installed

rails new my_basecamp_1
add to Gemfile = gem 'devise', '~> 4.8', '>= 4.8.1'
cd my_basecamp1
run = bundle install
run = rails generate devise:install



## Usage
TO start project, kindly run:  `rails s` this will start server on`http://127.0.0.1:3000/`
and lunch project on the web browser

#****** To Login as an admin *********
email: admin@admin.com
password: password


the admin has the previllages..........


after project lunch, the user interface is easy enough to help navigate around the project...


```
./my_project argument1 argument2
```

### The Core Team
OGTL academy
awwal-il_m
Martins Ake

<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px'></span>
