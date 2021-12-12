**Project Background**

This project is completed as part of the Final Project for CS3700 Intro to Databases offered at Wright State Univeristy. This project demonstrates the implementation of a database with at leasst 8 entities and a 3 table inner join.
Files and usage:
1. ERDiagram-EngineeringNotation.png: the ER diagram for the database detailing all entities, attributes, keys, and relations with modality and cardinality. It was generated using Oracle Data Modeler.
2. DataDictionary: a file containing definitions for each attribute in the database
3. RelationalSchema: This file contains the relational schema for the database in order of table levels, constraints, and any sequences used for primary keys.
4. main.sql: the sql code that contains the Data Definition Language (DDL) and Data Manipulation Language (DML) for the database. The DDL was generated using Oracle Data Modeler and tested using Oracle SQL Developer. The DML demonstrates a query with a 3 table inner join with a restriction, a PL/SQL to automate a task, a statistical function and a single row function, a materialized view, and a nested subquery.

**Overview of the Project**

![Asset 2RAILSOL](https://user-images.githubusercontent.com/43413025/145717650-1eadc806-05c1-430c-a18f-28f770a84fc0.png)

Railroad Solutions is a project that provides database functionality to railway stations so that they can easily manage data pertaining to trains, scheduling, and other operational needs. This database project is catered towards a Railway Management System which can be employed by public transport railway companies to keep track of their passengers and train schedules. It details the different categories which data can be divided into and the relationship between those categories. 

The entities in this database are:
1.	Passenger: Holds records of all registered passengers including their personal details and subscriptions
2.	Train: Holds records of all trains employed by the company including their model number, color, number of seats and whether it is operational or not
3.	Train Station: Holds records of all stations that the company operates in including the state, city, name, and contact information of the train station
4.	Timing: will hold a list of all the possible start and end times within a 24hr time frame
5.	Routes: Holds records of the predetermined routes that the company operates including the starting train station and ending train station
6.	Operator: Holds records of all personnel that operate trains including their name, contact information, and age
7.	Booking: Holds records that match a passenger to a schedule
8.	Schedule: Holds records that match an operator, to a route, a timing, and a train
9.	Subscription: Holds records describing the subscription and its fees

This database will have the following relationships:
1.	A subscription can have many or no passengers subscribed to it
2.	A train operator can drive many different schedules
3.	A passenger can make more than one booking
4.	A specific schedule can have many different bookings made for it
5.	A route can have many different schedules
6.	A train can cater to many schedules
7.	A route can have different starting and ending train stations
8.	A timing can have different schedules

This project can also be expanded and redesigned for other transportation services like buses, airplanes, and taxicabs
