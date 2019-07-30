CREATE TABLE `course`
(
  `id` int PRIMARY KEY,
  `title` varchar(255),
  `description` varchar(255),
  `created_at` date,
  `updated_at` date
);

CREATE TABLE `lesson`
(
  `id` int PRIMARY KEY,
  `title` varchar(255),
  `body` text,
  `created_at` date,
  `updated_at` date,
  `course_id` int,
  FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
);

