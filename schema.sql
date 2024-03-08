CREATE DATABASE todo_app;

USE todo_app;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)unique NOT NULL,
    password VARCHAR(255)
);

CREATE TABLE todos (
    id int auto_increment primary key,
    title VARCHAR(255) NOT NULL,
    completed boolean default false,
    user_id int not null,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE shared_todos (
    id INT auto_increment primary key,
    todo_id INT,
    user_id INT,
    shared_with_id INT,
    FOREIGN KEY (todo_id) REFERENCES todos (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES todos (id) ON DELETE CASCADE,
    FOREIGN KEY (shared_with_id) REFERENCES users (id) ON DELETE CASCADE
);

--Insert two users into the users table
INSERT INTO users (name, email, password) values ('Emilio','user1@exaimple.com','Password1');
INSERT INTO users (name, email, password) values ('Coco','user2@exaimple.com','Password2');

--Insert todos into the todos table
INSERT INTO todos (title, user_id)
values
("🏃‍♂️ Go for a morning run 🏃🏿", 1),
("🧑🏾‍💻 work on project presentation 💻", 1),
("📖 Read 30 pages of book", 1),
("🧹 Clean the house", 1),
("🧘‍♀️ Practice joga 🧘🏿", 1),
("🌮 Cook dinner for family 👩🏼‍🍳", 1),
("⚽️ Play football 🥅", 1);
("🥱 Get 8 hours of sleep", 1);


--share todo of user 1 with user 2 (para compartirle las tares de uno con otro)
INSERT INTO shared_todos (todo_id, user_id, shared_with_id) 
values (6, 1, 2);

--Get todos including shared todos by id
Select todos.*, shared_todos.shared_with_id
from todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = [user_id] OR shared_todos.shared_with_id = [user_id];