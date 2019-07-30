CREATE TABLE `user_news`
(
  `id` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `created_at` date,
  `updated_at` date
);

CREATE TABLE `link_news`
(
  `id` int PRIMARY KEY,
  `title` varchar(255),
  `url` varchar(255),
  `created_at` date,
  `updated_at` date,
  `user_id` int,
  FOREIGN KEY (`user_id`) REFERENCES `user_news` (`id`)
);

CREATE TABLE `comment_news`
(
  `id` int PRIMARY KEY,
  `content` text,
  `created_at` date,
  `updated_at` date,
  `user_id` int,
  `link_id` int,
  FOREIGN KEY (`user_id`) REFERENCES `user_news` (`id`),
  FOREIGN KEY (`link_id`) REFERENCES `link_news` (`id`);
);

CREATE TABLE `comment_of_comment_news`
(
  `id` int PRIMARY KEY,
  `content` text,
  `created_at` date,
  `updated_at` date,
  `user_id` int,
  `link_id` int,
  `comment_id` int
  FOREIGN KEY (`user_id`) REFERENCES `user_news` (`id`),
  FOREIGN KEY (`link_id`) REFERENCES `link_news` (`id`),
  FOREIGN KEY (`comment_id`) REFERENCES `comment_news` (`id`)
);