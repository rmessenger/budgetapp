insert into MONTH
(month, year, planned_income)
values
(1, 2018, 2000),
(2, 2018, 2100),
(3, 2018, 2050),
(4, 2018, 2000),
(5, 2018, 2200),
(6, 2018, 2150),
(7, 2018, 2040),
(8, 2018, 2200),
(9, 2018, 2200),
(10, 2018, 2200),
(11, 2018, 2200),
(12, 2018, 2200);

insert into CATEGORY
(month, year, name, planned_expenses)
values
(11, 2018, "Groceries", 450),
(12, 2018, "Groceries", 450),
(11, 2018, "Utilities", 250),
(12, 2018, "Utilities", 250),
(11, 2018, "Restaurants", 200),
(12, 2018, "Restaurants", 200),
(11, 2018, "Transportation", 140),
(12, 2018, "Transportation", 140),
(11, 2018, "Necessities", 100),
(12, 2018, "Necessities", 100);

insert into ITEM
(month, year, category_name, name, day, cost)
values
(11, 2018, "Groceries", "Curry Ingredients", 4, 43),
(11, 2018, "Transportation", "Gas", 6, 58),
(11, 2018, "Restaurants", "Lot Six", 8, 62),
(11, 2018, "Groceries", "Stuff for the week", 11, 142),
(11, 2018, "Necessities", "Light bulbs", 12, 3),
(11, 2018, "Necessities", "Snow Shovel", 14, 32),
(12, 2018, "Groceries", "Ice Cream", 3, 12),
(12, 2018, "Transportation", "Gas", 7, 59),
(12, 2018, "Restaurants", "Roll it up Sushi", 10, 39),
(12, 2018, "Utilities", "Power", 13, 30),
(12, 2018, "Groceries", "Weekly groceries", 15, 151);