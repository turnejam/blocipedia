# blocipedia

## Overview

Blocipedia is a Wikipedia clone created on Rails as part of the Bloc Web Development curriculum. It allows basic users to create and update public wikis (as well as destroy their own). Users can upgrade to a premium membership, allowing them to create private wikis, add collaborators to that wiki, and then make that wiki public. Finally, admins can delete or edit any wiki.


## Technical details

- Uses Devise for user sign up
- Uses Pundit for authorization
- Uses Stripe to handle upgrade requests and payments
- Uses Redcarpet to parse and display markdown syntax on the wikis
