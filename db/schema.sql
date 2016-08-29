use animals;

DROP TABLE IF EXISTS state;
DROP TABLE IF EXISTS tree;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS animal;

CREATE TABLE IF NOT EXISTS animal(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS question(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    sentence VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tree(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

    /* null if not leaf node */
    animal_id INT,

    /* null if leaf node */
    question_id INT,
    yes_child_id INT,
    no_child_id INT,

    FOREIGN KEY (animal_id) REFERENCES animal(id),
    FOREIGN KEY (question_id) REFERENCES question(id),
    FOREIGN KEY (yes_child_id) REFERENCES tree(id),
    FOREIGN KEY (no_child_id) REFERENCES tree(id)
);

CREATE TABLE IF NOT EXISTS state(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL UNIQUE,
    node_id INT,

    FOREIGN KEY (node_id) REFERENCES tree(id)
);

INSERT INTO animal VALUES 
    (1, "whale"),
    (2, "giraffe");

INSERT INTO question VALUES
    (1, "Does it live on land?");

INSERT INTO tree VALUES
    (3, 2, NULL, NULL, NULL),
    (2, 1, NULL, NULL, NULL),
    (1, NULL, 1, 2, 3);






    



