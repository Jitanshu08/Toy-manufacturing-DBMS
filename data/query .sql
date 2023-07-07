Set search_path to toymanf_new;

select * from employee where shift_hours = 5;

SELECT name, age FROM employee where age >35 GROUP BY name, age ORDER BY name

SELECT * FROM departments

select name, age from employee where extract(year from joined_since) between 2019 and 2020;

select * from employee where extract(hour from prefered_work_hour) = 12;

Select SUM(current_stock) from toy_base

select count(employee_id) from employee where age >40;

UPDATE Customers SET Zip=Phone;

SELECT * FROM employee WHERE Type='tr'

SELECT DISTINCT extract(year from joined_since) FROM employee

select * from employee order by employee_id limit 25;

SELECT * FROM employee WHERE joined_since BETWEEN '2019-12-01' AND '2021-01-01'

SELECT name as Employees FROM employee

DELETE FROM employee WHERE name = 'Nilu';

DROP Table raw_materials;
