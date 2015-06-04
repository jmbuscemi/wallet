# Wallet App

## Description
This app tells you how much money you have right now.  Well, not in your bank account...I can't access that.  But you put in transactions (deposits/withdrawals) and the app will keep track of all your transactions. It uses one data table of transactions, simple edit/create forms, and a total amount displayed on the home page.

## Features
The app assumes that there is only one way to use money...you spend it or you deposit it.  There are not different ways to spend money (i.e. checks, cash, debit card).  Once a transaction is created, the database is updated and the following statistics are updated:

* The total amount of money in the account (whether that is a positive amount or a negative amount).
* The total number of transactions on the account.
* The total amount spent in the current calendar month
* The total amount spent in the prior calendar month
* The total number of transactions in the current calendar month
* The total number of transactions in the prior calendar month
* The biggest expense in the current calendar month
* The biggest expense ever
