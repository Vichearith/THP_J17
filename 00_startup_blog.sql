CREATE TABLE `article`
(
  `id` int PRIMARY KEY,
  `user_id` int,
  `name` varchar(255),
  `created_at` date,
  `updated_at` date
);

CREATE TABLE `users`
(
  `id` int PRIMARY KEY,
  `full_name` varchar(255),
  `created_at` date,
  `updated_at` date
);

CREATE TABLE `tag`
(
  `id` int PRIMARY KEY,
  `title` varchar(255),
  `created_at` date,
  `updated_at` date
);

CREATE TABLE `category`
(
  `id` int PRIMARY KEY,
  `title` varchar(255),
  `color` varchar(255),
  `created_at` date,
  `updated_at` date,
  `article_id` int,
  `tag_id` int
);

ALTER TABLE `article` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `category` ADD FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

ALTER TABLE `category` ADD FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

