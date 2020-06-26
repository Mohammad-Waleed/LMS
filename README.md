# README
LMS has following Modules

We have a Library with a Fine amount. (only admin can access)
Can have multiple libraries.
One manager cannot be an employee of any other library.
There are Following Users (every user can perform login functionality.):
Admin:
  He has an Email and password.
  He can manage Library Fine Amount.
  He can manage the manager and issuer status whether active or inactive.
  He can edit or delete any user.
  He can create a manager account and upon creation welcome email should be sent to the manager email.
  He can approve or reject the issuer request for account creation.
  He can view all managers and issuers.
Manager:
  He has an Email, password, profile picture and status.
  He can create books in the Library.
  He can change the status of the Book.
  He can approve or reject the book issue request from an issuer, in both cases an email should be dispatched to the requested user.
Issuer:
  He has First Name, Last Name, Email, Password, Profile Picture, Status and Balance(Number of books).
  He can request an account.
  He can perform login functionality after account confirmation.
  He can see all the books available in the Library.
  He can place a request for issuing any book.
  He can return a book after 1 month, if he fails to return the issued book, he will charge a fine of everyday which is set by the admin.
Book:
  It has title, isbn, author, year, genre, number of copies, picture(can be more than 1) and status.
  It will always be issued for 1 month.
  Everybook should have some history like it is issued to this user from this date to this date.
  Issuers and Managers can search for books.
