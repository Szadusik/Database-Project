# Database-Project
# Local Registration Database

A MySQL database project created as of a private contract and a tool for getting experience with databases.    

# About

The main goal of the database is to support the management of registrations locally in the city. It is also a good tool for learning the basics of how MySQL databases work and their basic functionalities.

Database tracks the history of all check-ins which took place, registered buildings with premises inside them and also inhabitants registered in property described by the registration.

# Database schemes

The first step of the project was to create an entity relationship schema as to see which entities do we need, what attributes does every entity needs and how they should be connected with each other.

<br> 

![ERDiagram](schemes/scheme.png)

After that process I have decided to create a schema with tables which were going to be included into database and their respective columns. This new schema looks like this.

![TablesDiagram](schemes/scheme-with-types.png)

<br>

# Database structure

## Tables

As shown above database consists of six tables in total which can be described as written below:

* Person - Table for storing personal information about people. Each row contains information about one person identified by their respective ID (in Poland it is done by PESEL)

* Inhabitant - Stores optional information about inhabitants and their contact data. Every row contains those informations for person with given ID (every person in that table is also found in Person table by the same ID)

* Building - Table for storing information about registered buildings. Each building is identified by unique ID and has basic information about its location and address.

* Local - 