-- tables
-- Table: category
CREATE TABLE category (
    id int  NOT NULL,
    description varchar(20)  NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY (id)
);

-- Table: post
CREATE TABLE post (
    id int  NOT NULL,
    region_id int  NOT NULL,
    user_id int  NOT NULL,
    category_id int  NOT NULL,
    title varchar(40)  NOT NULL,
    text text  NOT NULL,
    location json  NOT NULL,
    CONSTRAINT post_pk PRIMARY KEY (id)
);

-- Table: region
CREATE TABLE region (
    id int  NOT NULL,
    city varchar(20)  NOT NULL,
    CONSTRAINT region_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE "user" (
    id int  NOT NULL,
    username varchar(15)  NOT NULL,
    region_id int  NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: post_category (table: post)
ALTER TABLE post ADD CONSTRAINT post_category
    FOREIGN KEY (category_id)
    REFERENCES category (id)  
;

-- Reference: post_region (table: post)
ALTER TABLE post ADD CONSTRAINT post_region
    FOREIGN KEY (region_id)
    REFERENCES region (id)  
;

-- Reference: post_user (table: post)
ALTER TABLE post ADD CONSTRAINT post_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
;

-- Reference: user_region (table: user)
ALTER TABLE "user" ADD CONSTRAINT user_region
    FOREIGN KEY (region_id)
    REFERENCES region (id)  
;
-- Insert into region table
INSERT INTO region (id, city) VALUES
(1, 'Region 1'),
(2, 'Region 2'),
(3, 'Region 3');

-- Insert into user table
INSERT INTO "user" (id, username, region_id) VALUES
(1, 'User 1', 1),
(2, 'User 2', 2),
(3, 'User 3', 3);

-- Insert into category table
INSERT INTO category (id, description) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3');

-- Insert into post table
INSERT INTO post (id, region_id, user_id, category_id, title, text, location) VALUES
(1, 1, 1, 1, 'Title 1', 'Text 1', '{"lat": 1.1, "long": 1.1}'),
(2, 2, 2, 2, 'Title 2', 'Text 2', '{"lat": 2.2, "long": 2.2}'),
(3, 3, 3, 3, 'Title 3', 'Text 3', '{"lat": 3.3, "long": 3.3}');


-- Query all the post, where the region shows the name, user shows username, and category shows description
SELECT p.id, r.city, u.username, c.description, p.title, p.text, p.location
FROM post p
JOIN region r ON p.region_id = r.id
JOIN "user" u ON p.user_id = u.id
JOIN category c ON p.category_id = c.id;