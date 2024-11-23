CREATE TABLE `USERS` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(255),
  `name` varchar(255),
  `enabled` boolean,
  `password` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `RENTALS` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `surface` numeric,
  `price` numeric,
  `picture` varchar(255),
  `description` varchar(2000),
  `owner_id` integer NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `MESSAGES` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `rental_id` integer,
  `user_id` integer,
  `message` varchar(2000),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `ROLES` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `authority` varchar(255) NOT NULL,
  UNIQUE KEY `unique_authority` (`authority`)
);

CREATE TABLE `USERS_AUTHORITIES` (
  `app_user_id` integer NOT NULL,
  `authorities_id` integer NOT NULL
);



CREATE UNIQUE INDEX `USERS_indexusersusers` ON `USERS` (`email`);

ALTER TABLE `RENTALS` ADD FOREIGN KEY (`owner_id`) REFERENCES `USERS` (`id`);

ALTER TABLE `MESSAGES` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS` (`id`);

ALTER TABLE `MESSAGES` ADD FOREIGN KEY (`rental_id`) REFERENCES `RENTALS` (`id`);

ALTER TABLE `USERS_AUTHORITIES` ADD FOREIGN KEY (`app_user_id`) REFERENCES `USERS` (`id`);

ALTER TABLE `USERS_AUTHORITIES` ADD FOREIGN KEY (`authorities_id`) REFERENCES `ROLES` (`id`);

INSERT INTO ROLES (authority) VALUES ('ROLE_USER');

INSERT INTO ROLES (authority) VALUES ('ROLE_ADMIN');
