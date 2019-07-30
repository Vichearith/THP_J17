CREATE TABLE `user_pint`
(
  `id` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `created_at` date,
  `updated_at` date
);

CREATE TABLE `pins_pint`
(
  `id` int PRIMARY KEY,
  `title` varchar(255),
  `url` varchar(255),
  `created_at` date,
  `updated_at` date,
  `user_id` int,
  FOREIGN KEY (`user_id`) REFERENCES `user_pint` (`id`)
);

CREATE TABLE `comment_pint`
(
  `id` int PRIMARY KEY,
  `content` text,
  `created_at` date,
  `updated_at` date,
  `user_id` int,
  `pins_id` int,
  FOREIGN KEY (`user_id`) REFERENCES `user_pint` (`id`),
  FOREIGN KEY (`pins_id`) REFERENCES `pins_pint` (`id`)
);