# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app.  See Gemfile lines 3 and 5.
- [x] Use ActiveRecord for storing information in a database.  See environment.rb lines 6-9.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category).  User, Volunteer, Task
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)  User has_many Volunteers, Volunteer has_many Tasks
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)  Volunteer belongs_to User, Task belongs_to Volunteer
- [x] Include user accounts.  User requires username and password.
- [x] Ensure that users can't modify content created by other users  Users can't modify Volunteers that they did not create.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying. Volunteers and Tasks both have all four routes.
- [x] Include user input validations.  Validations required for user's username and password, volunteer's name and interest, and task's name and description.  No can be empty.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)  Display on /volunteers/new, tasks/new
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
