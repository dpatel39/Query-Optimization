This project was done as a part of Introduction to Database Management class. 

The goal of this project was to rewrite several given queries such that the queries run as fast as possible. On a 1.2 GB MySQL database, I redesigned the SQL queries such that their run time was improved by 98%. I was able to achieve such an improvment by utilizing different join order, pushing grouping operations below a join, and adding appropriate indexes on the database.

__Constraints__
The optimized queries must run against the same set of indexes, and no more than three indexes per table.

