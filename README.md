CrowdFunder
-----------
A lovingly crafted Kickstarter clone.

Features
========

###Active

+Users can create projects  
+Projects have a funding goal and a deadline (funding goal needs better formatting, currently integer only)  

###MVP TODO

+3 user types: Owners, Backers, Admins  
+Projects have an image  
+Backers can pledge money to a project  
+Project will display a live counter of total amount pledged and time remaining  
+index of all current projects  

###STRETCH TODO

+categories for projects  
+breakpoints for donations  
+limits at various breakpoints  

Structure
=========

Users create and own Projects
Users create and own pledges for projects
Users create and own comments on projects

Any user can create a project or back another project

###Models

####User
types: User, Admin
name, email, password, gravatar

####Project
name
description
deadline
goal

####Comments
text
user_id

####Pledge
amount
belongs to user
belongs to project

###Controllers

####Projects

index show new create edit update destroy

####Users
show new create edit updat destory

####Pledges
index show new create (destroy?)

####Comments
index new create edit update destroy



