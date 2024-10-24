_1. What is PostgreSQL?_
PostgreSQL is a relational database management system (RDBMS) that provides ACID compliance, data integrity, extensibility, and scalability.

_2. What is the purpose of a database schema in PostgreSQL?_
In PostgreSQL, a database schema is used to organize and group related database objects like tables, views, and functions. It acts as a namespace to prevent naming conflicts by allowing objects with the same name to exist in multiple schemas.

_3. Explain the primary key and foreign key concepts in PostgreSQL._
Primary key is a column or combination of columns that uniquely identifies a row in the table often used as foreign key in other tables.
Foreign key is a column or combination of columns that refers to the primary key of another table.

_4. What is the difference between the VARCHAR and CHAR data types?_
VARCHAR is a variable length character data type. CHAR is a fixed length character data type.

_5. Explain the purpose of the WHERE clause in a SELECT statement._
Where clause is used to filter data from a table based on some condition.

_6. What are the LIMIT and OFFSET clauses used for?_
LIMIT clause is used to limit the number of rows returned by a query. OFFSET clause is used to skip the specified number of rows before returning the remaining rows.

_7. How can you perform data modification using UPDATE statements?_
To modify data in a table, at first you will have to select which table you want to update, then set the value by which the selected column will be updated. then filter out the rows that you want to update.

`update` table_name
`set` column_name = value
`where` condition

_8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?_
The JOIN operation is used to combine data from two or more tables based on a common column or combination of columns (most often primary and foreign keys). It gives us related data from multiple tables.

_9. Explain the GROUP BY clause and its role in aggregation operations._
The group by clause is used to group data in a table according to a specific column or combination of columns. When aggregation is applied to grouped data, the results are aggregated for that group.

_10. How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?_
Aggregate functions such as COUNT, SUM, and AVG are used to calculate aggregate values from tables.
For example, COUNT returns the number of rows in a table; SUM returns the sum of all values in a column; and AVG returns the average of all values in a column.

SELECT aggregate_function(column_name)
FROM: table_name
