DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE labels;
DROP TABLE users;

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  username VARCHAR(255) not null,
  name VARCHAR(255),
  monthly_budget DECIMAL(8, 2),
  transactions_to_disp INT4
);

CREATE TABLE merchants (
  id SERIAL4 PRIMARY KEY,
  merchant_name VARCHAR(255) not null,
  user_id INT4
);

CREATE TABLE labels (
  id SERIAL4 PRIMARY KEY,
  user_id INT4,
  label VARCHAR(255) not null
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  user_id INT4,
  merchant_id INT4,
  label_id INT4,
  amount DECIMAL(8, 2) not null,
  time_stamp TIMESTAMP
);
