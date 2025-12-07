-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2025 at 07:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventfinder`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `event_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'test', '2025-12-07 19:38:10', '2025-12-07 19:38:10'),
(2, 3, 3, 'tets', '2025-12-07 19:38:16', '2025-12-07 19:38:16'),
(3, 3, 4, 'test', '2025-12-07 19:46:48', '2025-12-07 19:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `image_url` varchar(500) DEFAULT NULL,
  `status` enum('draft','published','archived') DEFAULT 'published',
  `genre_id` int(11) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `capacity` int(11) DEFAULT 0,
  `available_spots` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `description`, `location`, `lat`, `lng`, `date`, `time`, `price`, `image_url`, `status`, `genre_id`, `owner_id`, `capacity`, `available_spots`, `created_at`, `updated_at`) VALUES
(1, 'Summer Music Festival', 'The biggest summer music festival featuring top artists from around the world. Three days of non-stop entertainment!', 'Central Park, New York', NULL, NULL, '2025-07-15', '18:00:00', 89.99, 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=600', 'published', 1, 1, 5000, 5000, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(2, 'Tech Conference 2025', 'Annual technology conference featuring keynotes from industry leaders, workshops, and networking opportunities.', 'Convention Center, San Francisco', NULL, NULL, '2025-08-20', '09:00:00', 299.00, 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=600', 'published', 5, 1, 1000, 1000, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(3, 'Comedy Night Live', 'An evening of laughter with stand-up performances from the best comedians in the country.', 'Comedy Club, Los Angeles', NULL, NULL, '2025-06-10', '20:00:00', 35.00, 'https://images.unsplash.com/photo-1585699324551-f6c309eedeca?w=600', 'published', 4, 1, 200, 200, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(4, 'Shakespeare in the Park', 'Free outdoor performance of Romeo and Juliet by the City Theater Company.', 'Riverside Park, Chicago', NULL, NULL, '2025-06-25', '19:30:00', 0.00, 'https://images.unsplash.com/photo-1503095396549-807759245b35?w=600', 'published', 3, 1, 500, 500, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(5, 'NBA Finals Game 3', 'Eastern Conference Finals - Experience the excitement live!', 'Madison Square Garden, New York', NULL, NULL, '2025-06-18', '20:00:00', 250.00, 'https://images.unsplash.com/photo-1504450758481-7338eba7524a?w=600', 'published', 2, 1, 20000, 15000, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(6, 'Food & Wine Expo', 'Taste dishes from over 50 restaurants and wineries. Cooking demos and wine tastings included.', 'Expo Center, Miami', NULL, NULL, '2025-07-22', '12:00:00', 75.00, 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=600', 'published', 5, 1, 800, 650, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(7, 'Rock Concert: The Legends', 'Classic rock tribute band performing hits from the 70s and 80s.', 'Arena Stadium, Boston', NULL, NULL, '2025-08-05', '19:00:00', 65.00, 'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?w=600', 'published', 1, 1, 15000, 12000, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(8, 'Art Gallery Opening', 'Exhibition opening featuring contemporary artists. Wine and cheese reception included.', 'Modern Art Museum, Seattle', NULL, NULL, '2025-06-30', '18:00:00', 25.00, 'https://images.unsplash.com/photo-1561214115-f2f134cc4912?w=600', 'published', 5, 1, 150, 150, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(9, 'Marathon 2025', 'Annual city marathon. Register now for early bird pricing!', 'Downtown, Portland', NULL, NULL, '2025-09-10', '07:00:00', 45.00, 'https://images.unsplash.com/photo-1452626038306-9aae5e071dd3?w=600', 'published', 2, 1, 3000, 2500, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(10, 'Jazz Night Under the Stars', 'Smooth jazz performances in an intimate outdoor setting. Bring a blanket!', 'Botanical Gardens, Austin', NULL, NULL, '2025-07-08', '20:30:00', 40.00, 'https://images.unsplash.com/photo-1415201364774-f6f0bb35f28f?w=600', 'published', 1, 1, 300, 300, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(11, 'Metallica Live in Lebanon', 'See metallica in leb', 'Lebanon', 33.8547, 35.8623, '2025-12-31', '20:30:00', 120.00, 'uploads/events/283f39156f712598.png', 'published', 1, 2, 0, 0, '2025-12-07 11:39:14', '2025-12-07 11:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `event_genres`
--

CREATE TABLE `event_genres` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_genres`
--

INSERT INTO `event_genres` (`id`, `event_id`, `genre_id`, `created_at`) VALUES
(1, 11, 1, '2025-12-07 11:39:14'),
(2, 11, 8, '2025-12-07 11:39:14'),
(3, 11, 10, '2025-12-07 11:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `slug`, `description`, `icon`, `created_at`) VALUES
(1, 'Music', 'music', 'Concerts, festivals, and live performances', '🎵', '2025-12-07 11:10:28'),
(2, 'Sports', 'sports', 'Sporting events and competitions', '⚽', '2025-12-07 11:10:28'),
(3, 'Food & Drink', 'food-drink', 'Food festivals, tastings, and culinary events', '🍔', '2025-12-07 11:10:28'),
(4, 'Arts & Culture', 'arts-culture', 'Art exhibitions, theater, and cultural events', '🎨', '2025-12-07 11:10:28'),
(5, 'Business', 'business', 'Conferences, networking, and professional events', '💼', '2025-12-07 11:10:28'),
(6, 'Technology', 'technology', 'Tech meetups, hackathons, and workshops', '💻', '2025-12-07 11:10:28'),
(7, 'Family', 'family', 'Family-friendly activities and events', '👨‍👩‍👧‍👦', '2025-12-07 11:10:28'),
(8, 'Nightlife', 'nightlife', 'Clubs, bars, and evening entertainment', '🌙', '2025-12-07 11:10:28'),
(9, 'Education', 'education', 'Workshops, classes, and learning opportunities', '📚', '2025-12-07 11:10:28'),
(10, 'Outdoor', 'outdoor', 'Outdoor activities and adventures', '🏕️', '2025-12-07 11:10:28'),
(11, 'Comedy', 'comedy', 'Stand-up comedy and humor shows', '😂', '2025-12-07 11:10:28'),
(12, 'Film', 'film', 'Movie screenings and film festivals', '🎬', '2025-12-07 11:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` enum('registered','canceled') DEFAULT 'registered',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `firebase_uid` varchar(128) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `role` enum('owner','admin','user') DEFAULT 'user',
  `is_active` tinyint(1) DEFAULT 1,
  `joined_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `firebase_uid`, `age`, `phone`, `location`, `bio`, `role`, `is_active`, `joined_at`, `updated_at`) VALUES
(1, 'Owner User', 'owner@example.com', NULL, NULL, NULL, NULL, NULL, 'owner', 1, '2025-12-07 11:10:28', '2025-12-07 11:10:28'),
(2, 'Owner', 'test@owner.com', '6lltqXaWjfWj9lHzOUxT42aAHzu2', 20, '+96181530659', 'Lebanon', NULL, 'owner', 1, '2025-12-07 09:32:56', '2025-12-07 11:34:15'),
(3, 'joe', '22@22.com', 'TsoTAZHf40OpNaeFnV9P90dSlH53', 20, NULL, NULL, NULL, 'user', 1, '2025-12-07 16:44:03', '2025-12-07 18:44:03'),
(4, 'joe', 'j@j.com', 'oWj0ppbYqoZzJoae0j7VXgqSWeO2', 20, '+96181530659', 'Lebanon', NULL, 'user', 1, '2025-12-07 17:46:37', '2025-12-07 19:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE `user_favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_favorites`
--

INSERT INTO `user_favorites` (`id`, `user_id`, `event_id`, `created_at`) VALUES
(3, 2, 11, '2025-12-07 16:34:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment_user` (`user_id`),
  ADD KEY `idx_event` (`event_id`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_events_genre` (`genre_id`),
  ADD KEY `fk_events_owner` (`owner_id`),
  ADD KEY `idx_date` (`date`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `event_genres`
--
ALTER TABLE `event_genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_event_genre` (`event_id`,`genre_id`),
  ADD KEY `fk_event_genres_genre` (`genre_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_event` (`user_id`,`event_id`),
  ADD KEY `idx_event` (`event_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `firebase_uid` (`firebase_uid`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_favorite` (`user_id`,`event_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_event` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `event_genres`
--
ALTER TABLE `event_genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_favorites`
--
ALTER TABLE `user_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_genre` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_events_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_genres`
--
ALTER TABLE `event_genres`
  ADD CONSTRAINT `fk_event_genres_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_event_genres_genre` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `fk_reg_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_reg_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD CONSTRAINT `fk_fav_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fav_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
