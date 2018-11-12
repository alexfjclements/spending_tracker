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
  name VARCHAR(255) not null,
  user_id INT4 REFERENCES users(id)
);

CREATE TABLE labels (
  id SERIAL4 PRIMARY KEY,
  user_id INT4 REFERENCES users(id),
  label VARCHAR(255) not null
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  user_id INT4 REFERENCES users(id),
  merchant_id INT4 REFERENCES merchants(id) ON DELETE SET NULL,
  label_id INT4 REFERENCES labels(id) ON DELETE SET NULL,
  amount DECIMAL(8, 2) not null,
  time_stamp TIMESTAMP
);
