DROP TABLE departments;

CREATE TABLE departments (
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR NOT NULL, 
	dept_name VARCHAR NOT NULL
);

