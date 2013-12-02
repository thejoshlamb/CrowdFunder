Bitmaker Labs Assignment 18


Models
======

###User
types: Owner, Backer, Admin
name, email, password 

###Project
name
description
deadline
goal

###Comments
text
user_id

###Pledge
amount
belongs to user
belongs to project

Controllers
===========

###Projects

index show new create edit update destroy

###users
show new create edit updat destory


MVP
===

+3 user types: Owners, Backers, Admins  
+POs can create a project   
+Projects have a funding goal and time limit, and image/description  
+Backers can pledge money to a project  
+Project will display a live counter of total amount pledged and time remaining  
+index of all current projects  

STRETCH
=======

+categories  
+breakpoints for donations  
+limits at various breakpoints  
