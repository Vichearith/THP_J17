CREATE TABLE `student`
(
  `id` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `created_at` date,
  `updated_at` date,
  `class_id` int,
  FOREIGN KEY (`class_id`) REFERENCES `course_class` (`id`)
);

CREATE TABLE `course_class`
(
  `id` int PRIMARY KEY,
  `title` varchar(255),
  `content` text,
  `created_at` date,
  `updated_at` date
);