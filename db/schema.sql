create table MONTH (
	month int NOT NULL,
    year int NOT NULL,
    planned_income int,
    primary key (month, year));
    
create table CATEGORY (
	month int NOT NULL,
    year int NOT NULL,
	name varchar(255) NOT NULL,
    planned_expenses int NOT NULL,
    primary key (month, year, name),
    foreign key (month, year) references MONTH(month, year));

create table ITEM (
	id int NOT NULL auto_increment,
	month int NOT NULL,
    year int NOT NULL,
    category_name varchar(255) NOT NULL,
    cost int NOT NULL,
    name varchar(255),
    day int,
    primary key (id),
    foreign key (month, year) references MONTH(month, year),
    foreign key (month, year, category_name) references CATEGORY(month, year, name));
    
create view MONTH_SUMMARY as
select X.month, X.year, planned_income, sum(planned_expenses) as planned_expenses, actual_expenses, count(name) as category_count, item_count from CATEGORY
right outer join (
	select MONTH.month, MONTH.year, planned_income, sum(cost) as actual_expenses, count(id) as item_count FROM ITEM
	right outer join MONTH on MONTH.month = ITEM.month and MONTH.year = ITEM.year
    group by month, year) as X on X.month = CATEGORY.month and X.year = CATEGORY.year
group by month, year