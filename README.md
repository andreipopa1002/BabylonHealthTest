# BHT
Employment test

Using the API endpoint
GET http://fast-gorge.herokuapp.com/contacts
Save the results of the request using Core Data (or another local database) so that the app can still be used (after first successful connection) offline.

create a simple iOS app with two screens:

Screen1: 
a title
a tableview. Tapping a cell should take you to Screen2; each cell displaying:
  - first_name
  - surname

Screen2:
back button back to screen 1
title
labels for the fields:
  - first_name
  - surname
  - address
  - phone_number
  - email
  - createdAt
  - updatedAt

Use of 3rd party libraries (and dependency management) is accepted and encouraged.
Either Objective-C or Swift.

Bonus:
Based on the contacts’ email address, use http://avatars.adorable.io to generate a unique avatar for each of the contacts. To be shown on both screens.
