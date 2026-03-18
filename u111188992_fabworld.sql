-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 25, 2026 at 12:44 AM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u111188992_fabworld`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `image`, `password`, `is_super_admin`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'kevin', 'heykevin55555@gmail.com', 'uploads/website-images/admin.jpg', '$2y$12$0BxTMYWfqyFJE96zg0.mb.Dzww4pghXz8GAAH0bHxaO47b1sXcarq', 1, 'active', 'SrfI5UUbDMjBpeOpugqcITo74dboYKEIZe0knqsktwoDvg9TGlssttjv9teY', '2025-05-04 09:05:05', '2025-05-04 09:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '#',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'https://www.youtube.com/watch?v=VCsmPAOTaVg', 1, '2025-05-04 09:05:05', '2025-09-21 10:42:25'),
(5, 'https://www.youtube.com/watch?v=_XIrawnFjnc&t=4s', 1, '2025-09-21 10:39:19', '2025-09-21 10:39:19'),
(6, 'https://www.youtube.com/watch?v=-dHp0ek73jw&list=PL0nkJ-TC_3AMcXenFUUK1bGnlzO6SiPek&index=5', 1, '2025-09-21 10:44:43', '2025-09-21 10:44:43'),
(7, 'https://www.youtube.com/watch?v=dFGDGiG2LZA&list=PL0nkJ-TC_3AMcXenFUUK1bGnlzO6SiPek&index=2', 1, '2025-09-21 10:46:16', '2025-09-21 10:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `award_colors`
--

CREATE TABLE `award_colors` (
  `id` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `award_colors`
--

INSERT INTO `award_colors` (`id`, `color`, `updated_at`, `created_at`) VALUES
(1, '#40fc23', '2025-09-29 07:38:03', '2025-09-29 07:38:03');

-- --------------------------------------------------------

--
-- Table structure for table `award_translations`
--

CREATE TABLE `award_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `award_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `year` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `award_translations`
--

INSERT INTO `award_translations` (`id`, `award_id`, `lang_code`, `year`, `title`, `sub_title`, `tag`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '04', 'Shape City Adventure', 'Shapes Learning for Preschool', 'Fablepals', '2025-05-04 09:05:05', '2025-09-21 10:46:40'),
(2, 1, 'hi', '2017', 'न्यूयॉर्क डिजाइन सप्ताह', 'हम सबसे जटिल परियोजनाओं को जीवंत बनाते हैं, विशेषज्ञता रखते हैं', 'मुख्य डेवलपर', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(13, 5, 'en', '03', 'Transportation Learning Video', 'Kids Learning Animated Video', 'Fablepals', '2025-09-21 10:39:19', '2025-09-21 10:46:49'),
(14, 5, 'hi', '01', 'Transportation Learning Video', 'From cars, buses, and trains, to boats, ships, and submarines, and even planes, rockets, and hot air balloons—this fun and colorful Pixar-style video helps toddlers and preschoolers learn all types of vehicles in English.', 'Kids Learning Video', '2025-09-21 10:39:19', '2025-09-21 10:39:19'),
(15, 6, 'en', '02', 'Gaiya Meri Gaiya', 'Kids Music Dance Video Song', 'Fablepals', '2025-09-21 10:44:43', '2025-09-21 10:46:58'),
(16, 6, 'hi', '03', 'Gaiya Meri Gaiya', 'Kids Music Dance Video Song', 'Fablepals', '2025-09-21 10:44:43', '2025-09-21 10:44:43'),
(17, 7, 'en', '01', 'Happy Birthday Song', 'Kids Birthday Party Song', 'Fablepals', '2025-09-21 10:46:16', '2025-09-21 10:47:05'),
(18, 7, 'hi', '04', 'Happy Birthday Song', 'Kids Birthday Party Song', 'Fablepals', '2025-09-21 10:46:16', '2025-09-21 10:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `banned_histories`
--

CREATE TABLE `banned_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `reasone` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_payments`
--

CREATE TABLE `basic_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_payments`
--

INSERT INTO `basic_payments` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'stripe_key', 'pk_test_33mdngCLuLsmECXOe8mbde9f00pZGT4uu9', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(2, 'stripe_secret', 'sk_test_MroTZzRZRv2KJ9Hmaro73SE800UOR90Q9u', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(3, 'stripe_currency_id', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(4, 'stripe_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(5, 'stripe_charge', '0', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(6, 'stripe_image', 'uploads/website-images/stripe.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(7, 'paypal_app_id', 'APP-80W284485P519543T', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(8, 'paypal_client_id', 'AWlV5x8Lhj9BRF8-TnawXtbNs-zt69mMVXME1BGJUIoDdrAYz8QIeeTBQp0sc2nIL9E529KJZys32Ipy', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(9, 'paypal_secret_key', 'EEvn1J_oIC6alxb-FoF4t8buKwy4uEWHJ4_Jd_wolaSPRMzFHe6GrMrliZAtawDDuE-WKkCKpWGiz0Yn', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(10, 'paypal_account_mode', 'sandbox', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(11, 'paypal_currency_id', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(12, 'paypal_charge', '0', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(13, 'paypal_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(14, 'paypal_image', 'uploads/website-images/paypal.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(15, 'bank_information', 'Bank Name => Your bank name\r\nAccount Number =>  Your bank account number\r\nRouting Number => Your bank routing number\r\nBranch => Your bank branch name', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(16, 'bank_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(17, 'bank_image', 'uploads/website-images/bank-pay.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(18, 'bank_charge', '0', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(19, 'bank_currency_id', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(20, 'razorpay_key', 'rzp_test_cvrsy43xvBZfDT', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(21, 'razorpay_secret', 'c9AmI4C5vOfSWmZehhlns5df', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(22, 'razorpay_name', 'WebSolutionUs', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(23, 'razorpay_description', 'This is test payment window', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(24, 'razorpay_charge', '0', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(25, 'razorpay_theme_color', '#6d0ce4', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(26, 'razorpay_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(27, 'razorpay_currency_id', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(28, 'razorpay_image', 'uploads/website-images/razorpay.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(29, 'flutterwave_public_key', 'FLWPUBK_TEST-5760e3ff9888aa1ab5e5cd1ec3f99cb1-X', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(30, 'flutterwave_secret_key', 'FLWSECK_TEST-81cb5da016d0a51f7329d4a8057e766d-X', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(31, 'flutterwave_app_name', 'WebSolutionUs', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(32, 'flutterwave_charge', '0', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(33, 'flutterwave_currency_id', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(34, 'flutterwave_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(35, 'flutterwave_image', 'uploads/website-images/flutterwave.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(36, 'paystack_public_key', 'pk_test_057dfe5dee14eaf9c3b4573df1e3760c02c06e38', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(37, 'paystack_secret_key', 'sk_test_77cb93329abbdc18104466e694c9f720a7d69c97', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(38, 'paystack_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(39, 'paystack_charge', '0', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(40, 'paystack_image', 'uploads/website-images/paystack.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(41, 'paystack_currency_id', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(42, 'mollie_key', 'test_HFc5UhscNSGD5jujawhtNFs3wM3B4n', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(43, 'mollie_charge', '0', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(44, 'mollie_image', 'uploads/website-images/mollie.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(45, 'mollie_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(46, 'mollie_currency_id', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(47, 'instamojo_account_mode', 'Sandbox', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(48, 'instamojo_api_key', 'test_ffc6f0ad486d6ae0ba9ca2f46da', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(49, 'instamojo_auth_token', 'test_ded356ba75e1aaa80bdd8f438d7', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(50, 'instamojo_charge', '0', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(51, 'instamojo_image', 'uploads/website-images/instamojo.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(52, 'instamojo_currency_id', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(53, 'instamojo_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(54, 'cash_on_delivery_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(55, 'cash_on_delivery_image', 'uploads/website-images/cash-on-delivery.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `slug` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `show_homepage` tinyint(1) NOT NULL DEFAULT 0,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `tags` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `admin_id`, `blog_category_id`, `slug`, `image`, `views`, `show_homepage`, `is_popular`, `tags`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'everything-you-should-know-about-return', 'uploads/custom-images/blog_1_1.webp', 361, 1, 1, '[{\"value\":\"branding\"},{\"value\":\"business\"}]', 0, '2025-05-04 09:05:05', '2025-09-21 09:23:31'),
(2, 1, 4, '6-big-commerce-design-tips-for-big-results', 'uploads/custom-images/blog_1_2.webp', 324, 1, 1, '[{\"value\":\"design\"},{\"value\":\"commerce\"}]', 0, '2025-05-04 09:05:05', '2025-09-21 09:23:30'),
(3, 1, 4, 'four-steps-to-conduct-a-successful-usability', 'uploads/custom-images/blog_1_3.webp', 226, 1, 1, '[{\"value\":\"design\"},{\"value\":\"business\"}]', 0, '2025-05-04 09:05:05', '2025-09-21 09:23:29'),
(4, 1, 2, 'the-future-of-ai-in-software-development', 'uploads/custom-images/blog_1_4.webp', 326, 1, 1, '[{\"value\":\"development\"},{\"value\":\"software\"},{\"value\":\"ai\"}]', 0, '2025-05-04 09:05:05', '2025-09-21 09:23:27'),
(5, 1, 2, 'how-to-optimize-your-software-development-lifecycle', 'uploads/custom-images/blog_1_5.webp', 244, 1, 1, '[{\"value\":\"development\"},{\"value\":\"software\"}]', 0, '2025-05-04 09:05:05', '2025-09-21 09:23:26'),
(6, 1, 4, 'unlock-your-business-potential', 'uploads/custom-images/blog_1_6.webp', 297, 1, 0, '[{\"value\":\"business\"},{\"value\":\"branding\"}]', 0, '2025-05-04 09:05:05', '2025-09-21 09:23:25'),
(7, 1, 5, 'fablepals-the-next-global-kids-brand-from-india-', 'uploads/custom-images/wsus-img-2025-09-21-09-35-38-5893.webp', 0, 1, 1, NULL, 1, '2025-09-21 09:27:29', '2025-09-21 09:35:38'),
(8, 1, 5, 'fablepals-tv-1-youtube-kids-channel', 'uploads/custom-images/wsus-img-2025-09-21-10-02-26-2285.webp', 0, 1, 1, NULL, 1, '2025-09-21 09:55:46', '2025-09-21 10:02:26'),
(9, 1, 5, 'guide-to-world-of-fablepals', 'uploads/custom-images/wsus-img-2025-09-21-11-04-25-6940.webp', 0, 1, 1, NULL, 1, '2025-09-21 10:55:59', '2025-09-21 11:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `parent_id` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `slug`, `position`, `parent_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'branding', 0, NULL, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 'design', 0, NULL, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 'business', 0, NULL, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 'development', 0, NULL, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 'fablepals-brand', 0, NULL, 1, '2025-09-21 09:23:05', '2025-09-21 09:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_translations`
--

CREATE TABLE `blog_category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_category_translations`
--

INSERT INTO `blog_category_translations` (`id`, `blog_category_id`, `lang_code`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Branding', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'hi', 'ब्रांडिंग', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 2, 'en', 'Design', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 2, 'hi', 'डिज़ाइन', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 3, 'en', 'Business', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 3, 'hi', 'व्यापार', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(10, 4, 'en', 'Development', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(11, 4, 'hi', 'विकास', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(13, 5, 'en', 'Fablepals India', '2025-09-21 09:23:05', '2025-09-21 11:05:15'),
(14, 5, 'hi', 'Fablepals Brand', '2025-09-21 09:23:05', '2025-09-21 09:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `user_id`, `blog_id`, `parent_id`, `name`, `email`, `phone`, `image`, `comment`, `is_admin`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 'Ms. Frances Moen', 'gutmann.baylee@hotmail.com', '+1-520-390-5080', 'uploads/website-images/default-avatar.png', 'Omnis non omnis inventore cumque autem optio nam. Ipsam aliquam beatae assumenda quo consectetur. Totam vel voluptate est velit consequatur fuga temporibus.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 1, 0, 'Liza Rath', 'vella.pollich@yahoo.com', '724.435.1371', 'uploads/website-images/default-avatar.png', 'Consequatur reprehenderit voluptatem rerum cum eligendi fugiat et. Rerum facilis voluptas tenetur quod recusandae. Optio quaerat ipsam architecto omnis exercitationem voluptas et. Nemo vero rerum recusandae quia nihil at.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 1, 1, 0, 'Mr. Vladimir Herman DVM', 'keely00@yahoo.com', '283-292-3945', 'uploads/website-images/default-avatar.png', 'Qui earum nam id dolorem est. Ea quas numquam non voluptatem ad inventore. Ut non quia dolore velit.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 1, 2, 0, 'Prof. Lane O\'Connell IV', 'xkilback@ritchie.com', '(334) 291-9946', 'uploads/website-images/default-avatar.png', 'Vero a ipsa natus iusto voluptatem voluptatem. Qui eveniet repellendus qui id laudantium. Aliquam rerum modi nihil distinctio animi.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 1, 2, 0, 'Giles Russel DVM', 'grant.dubuque@bechtelar.info', '(272) 916-1782', 'uploads/website-images/default-avatar.png', 'Perspiciatis deleniti iste consequatur. Nemo ullam porro ipsa sapiente non eos. Ad autem officiis sequi adipisci atque.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(6, 1, 2, 0, 'Sincere Jones', 'halvorson.dax@upton.com', '681-202-5104', 'uploads/website-images/default-avatar.png', 'Nulla quae aut quia expedita amet ipsa ut. Enim possimus id eius recusandae voluptas ea officiis. Earum ut voluptatem in sint est. Et omnis culpa voluptatem qui non sed.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 1, 3, 0, 'Miss Delfina Gislason', 'eula.jacobson@damore.com', '(219) 727-1750', 'uploads/website-images/default-avatar.png', 'Et ratione quis velit quis animi quia placeat. Omnis ea accusamus deleniti nihil. Excepturi alias et qui mollitia voluptas harum vel quaerat. Facilis inventore et saepe.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 1, 3, 0, 'Mrs. Elyssa Anderson', 'xgutkowski@strosin.com', '225-814-7616', 'uploads/website-images/default-avatar.png', 'Omnis aut in neque ut itaque quis. Veniam et necessitatibus nemo quo quibusdam. Eos quos facere esse quo odit dolor dolores.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(9, 1, 3, 0, 'Nedra Walker', 'kshanahan@hotmail.com', '563.282.9859', 'uploads/website-images/default-avatar.png', 'Voluptatem velit sint occaecati est nihil. Dolores corporis dolore in. Illo earum ut rerum hic qui sed qui nostrum.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(14, 1, 5, 0, 'Dr. Kolby McCullough', 'erich57@swift.com', '347.846.8040', 'uploads/website-images/default-avatar.png', 'Cum voluptatem illum laudantium tempora nesciunt. Neque officia qui amet quos eveniet nisi distinctio. Ratione fuga porro soluta qui.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(15, 1, 5, 0, 'Dina Deckow', 'dillan.fahey@corkery.net', '1-480-829-6756', 'uploads/website-images/default-avatar.png', 'Sunt voluptatum sit esse et itaque deleniti. Optio dolores animi nobis rerum numquam dolor unde. Harum qui dolore enim occaecati sit esse.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(16, 1, 6, 0, 'Harold Marvin', 'koepp.nikita@gmail.com', '1-516-412-2638', 'uploads/website-images/default-avatar.png', 'Id quia exercitationem veniam eaque sunt natus unde. Qui cum ut recusandae officia.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(17, 1, 6, 0, 'Columbus Heathcote', 'tom.schroeder@hayes.org', '1-706-994-8583', 'uploads/website-images/default-avatar.png', 'Sunt nihil qui molestias quidem eos placeat. Temporibus sed et neque voluptates magni dolorem. Quos ut nisi quo dolores. Sed exercitationem repudiandae dolor inventore nulla.', 0, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `blog_translations`
--

CREATE TABLE `blog_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `seo_title` text DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_translations`
--

INSERT INTO `blog_translations` (`id`, `blog_id`, `lang_code`, `title`, `description`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Everything You Should Know About Return', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\n            <p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p><p>Leighton Asia&rsquo;s brand refreshment will help position the company to meet the challenges of future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p><p>But in order that you may see whence all this born error of those who accuse pleasure and praise pain, I will open the whole matter, and explain the very things which  were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>\n\n            <img src=\'uploads/custom-images/descirption_blog_details_01.jpg\'>\n            <img src=\'uploads/custom-images/descirption_blog_details_02.jpg\'}>\n            \n            <p>But in order that you may see whence and praise pain, I will open the whole matter, and explain the very things which were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>', 'Everything You Should Know About Return', 'Et voluptatem et accusamus. Exercitationem numquam molestiae sunt fugit et quos.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'hi', 'रिटर्न के बारे में आपको जो कुछ भी जानना चाहिए', 'बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि लीटन एशिया ने उसे अपने ब्रांड को फिर से स्थापित करने का काम सौंपा है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य सहायक उपकरणों को अपडेट करने के लिए जिम्मेदार होंगे।\\\\लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढाँचे की परियोजनाओं को पूरा किया है।', 'रिटर्न के बारे में आपको जो कुछ भी जानना चाहिए', 'Vel pariatur et voluptatem blanditiis. Ut qui nihil veritatis laborum voluptas dolorem et. Cumque eos pariatur libero.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 2, 'en', '6 Big Commerce Design Tips For Big Results', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\n            <p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p><p>Leighton Asia&rsquo;s brand refreshment will help position the company to meet the challenges of future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p><p>But in order that you may see whence all this born error of those who accuse pleasure and praise pain, I will open the whole matter, and explain the very things which  were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>\n\n            <img src=\'uploads/custom-images/descirption_blog_details_01.jpg\'>\n            <img src=\'uploads/custom-images/descirption_blog_details_02.jpg\'}>\n            \n            <p>But in order that you may see whence and praise pain, I will open the whole matter, and explain the very things which were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>', '6 Big Commerce Design Tips For Big Results', 'Odit corporis accusantium exercitationem vel voluptatem. Quis quia cum aut sit vel quibusdam deleniti. Nemo et in inventore reiciendis molestiae. Porro quia deleniti cupiditate.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 2, 'hi', 'बड़े परिणामों के लिए 6 बड़े वाणिज्य डिजाइन युक्तियाँ', 'बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि लीटन एशिया ने उसे अपने ब्रांड को फिर से स्थापित करने का काम सौंपा है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य सहायक उपकरणों को अपडेट करने के लिए जिम्मेदार होंगे।\\\\लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढाँचे की परियोजनाओं को पूरा किया है।', 'बड़े परिणामों के लिए 6 बड़े वाणिज्य डिजाइन युक्तियाँ', 'Et exercitationem aut nulla cum sit aliquam eum. Natus ea facere quod debitis ut. Consequatur eveniet repellat voluptatibus quaerat iste et laborum perferendis.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 3, 'en', 'Four Steps to Conduct a Successful Usability', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\n            <p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p><p>Leighton Asia&rsquo;s brand refreshment will help position the company to meet the challenges of future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p><p>But in order that you may see whence all this born error of those who accuse pleasure and praise pain, I will open the whole matter, and explain the very things which  were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>\n\n            <img src=\'uploads/custom-images/descirption_blog_details_01.jpg\'>\n            <img src=\'uploads/custom-images/descirption_blog_details_02.jpg\'}>\n            \n            <p>But in order that you may see whence and praise pain, I will open the whole matter, and explain the very things which were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>', 'Four Steps to Conduct a Successful Usability', 'Optio officiis vel sint ut aut accusantium et. Nobis fuga ab corrupti ut dicta delectus perspiciatis. Voluptate quo laborum sunt autem non sequi. Sit facere culpa et voluptatem nemo modi illo.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 3, 'hi', 'सफल प्रयोज्यता के संचालन के लिए चार कदम', 'बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि लीटन एशिया ने उसे अपने ब्रांड को फिर से स्थापित करने का काम सौंपा है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य सहायक उपकरणों को अपडेट करने के लिए जिम्मेदार होंगे।\\\\लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढाँचे की परियोजनाओं को पूरा किया है।', 'सफल प्रयोज्यता के संचालन के लिए चार कदम', 'In recusandae omnis dolor consequatur deleniti perferendis sit. Rerum dolores dolore perspiciatis veniam saepe excepturi occaecati.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(10, 4, 'en', 'The Future of AI in Software Development', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\n            <p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p><p>Leighton Asia&rsquo;s brand refreshment will help position the company to meet the challenges of future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p><p>But in order that you may see whence all this born error of those who accuse pleasure and praise pain, I will open the whole matter, and explain the very things which  were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>\n\n            <img src=\'uploads/custom-images/descirption_blog_details_01.jpg\'>\n            <img src=\'uploads/custom-images/descirption_blog_details_02.jpg\'}>\n            \n            <p>But in order that you may see whence and praise pain, I will open the whole matter, and explain the very things which were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>', 'The Future of AI in Software Development', 'Corporis quia et esse vero dolore sit dicta. Laborum id ullam aliquam nihil aut. Voluptatem vero architecto qui molestiae ab iusto.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(11, 4, 'hi', 'सॉफ्टवेयर विकास में एआई का भविष्य', 'बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि लीटन एशिया ने उसे अपने ब्रांड को फिर से स्थापित करने का काम सौंपा है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य सहायक उपकरणों को अपडेट करने के लिए जिम्मेदार होंगे।\\\\लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढाँचे की परियोजनाओं को पूरा किया है।', 'सॉफ्टवेयर विकास में एआई का भविष्य', 'Totam omnis minus sed unde. Numquam autem rem nesciunt sit non modi. Autem fugiat officiis beatae culpa iste commodi ut. Non molestias sit libero iure natus.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(13, 5, 'en', 'How to Optimize Your Software Development Lifecycle', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\n            <p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p><p>Leighton Asia&rsquo;s brand refreshment will help position the company to meet the challenges of future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p><p>But in order that you may see whence all this born error of those who accuse pleasure and praise pain, I will open the whole matter, and explain the very things which  were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>\n\n            <img src=\'uploads/custom-images/descirption_blog_details_01.jpg\'>\n            <img src=\'uploads/custom-images/descirption_blog_details_02.jpg\'}>\n            \n            <p>But in order that you may see whence and praise pain, I will open the whole matter, and explain the very things which were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>', 'How to Optimize Your Software Development Lifecycle', 'Unde sunt maiores qui officiis non accusamus. Cupiditate et tempora consequatur occaecati fuga cum in. Animi omnis omnis voluptate nihil itaque nostrum sit consequatur.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(14, 5, 'hi', 'अपने सॉफ्टवेयर विकास जीवनचक्र को कैसे अनुकूलित करें', 'बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि लीटन एशिया ने उसे अपने ब्रांड को फिर से स्थापित करने का काम सौंपा है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य सहायक उपकरणों को अपडेट करने के लिए जिम्मेदार होंगे।\\\\लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढाँचे की परियोजनाओं को पूरा किया है।', 'अपने सॉफ्टवेयर विकास जीवनचक्र को कैसे अनुकूलित करें', 'Ad optio ea nostrum. Dicta libero voluptate a reiciendis delectus. Aut autem numquam enim. Corporis maiores ut cupiditate ut itaque architecto eveniet. Explicabo unde consequuntur et.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(16, 6, 'en', 'Unlock Your Business Potential', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\n            <p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p><p>Leighton Asia&rsquo;s brand refreshment will help position the company to meet the challenges of future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p><p>But in order that you may see whence all this born error of those who accuse pleasure and praise pain, I will open the whole matter, and explain the very things which  were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>\n\n            <img src=\'uploads/custom-images/descirption_blog_details_01.jpg\'>\n            <img src=\'uploads/custom-images/descirption_blog_details_02.jpg\'}>\n            \n            <p>But in order that you may see whence and praise pain, I will open the whole matter, and explain the very things which were said by that discoverer of truth and, as it were, the architect of a happy life.</p><p>Always ready to push the boundaries, especially when it comes to our own platform maximum analytical eye to create a site that was visually engaging and also optimised</p>', 'Unlock Your Business Potential', 'Alias consequatur consequatur nihil non repellat illum molestiae. Sed molestiae eius adipisci dicta velit omnis. Id voluptatem possimus impedit eaque.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(17, 6, 'hi', 'अपने व्यवसाय की संभावनाओं को अनलॉक करें', 'बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि लीटन एशिया ने उसे अपने ब्रांड को फिर से स्थापित करने का काम सौंपा है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य सहायक उपकरणों को अपडेट करने के लिए जिम्मेदार होंगे।\\\\लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढाँचे की परियोजनाओं को पूरा किया है।', 'अपने व्यवसाय की संभावनाओं को अनलॉक करें', 'Sequi omnis ipsa exercitationem consectetur impedit. In a soluta nisi et corporis ducimus ut. Quod autem doloribus natus assumenda cupiditate eos quos.', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(19, 7, 'en', 'FablePals : The Next Global Kids Brand from India !', '<h1 data-start=\"195\" data-end=\"258\"><span style=\"font-size: 18pt;\">Can FablePals Be the Next Global Kids&rsquo; Brand from India?</span></h1>\r\n<p data-start=\"260\" data-end=\"585\">FablePals is more than a fantasy series&mdash;it&rsquo;s India&rsquo;s bold step toward creating a global kids&rsquo; brand that blends storytelling, education, and adventure. In a world dominated by international franchises, FablePals stands out as a homegrown universe with the heart, depth, and creativity to inspire children across cultures.</p>\r\n<h2 data-start=\"587\" data-end=\"620\"><span style=\"font-size: 14pt;\">✨ Why FablePals is Different</span></h2>\r\n<p data-start=\"621\" data-end=\"1029\">At its core, FablePals combines imaginative storytelling with purposeful learning.</p>\r\n<p data-start=\"621\" data-end=\"1029\">Children are drawn to the cute, adventurous cub heroes and their magical journeys, while teens and adults find themselves immersed in a richly built cinematic universe filled with lore, guardians, and epic battles. This dual-layered approach makes FablePals more than just a cartoon&mdash;it&rsquo;s an&nbsp;<strong data-start=\"999\" data-end=\"1026\">experience for all ages</strong>.</p>\r\n<h2 data-start=\"1031\" data-end=\"1061\"><span style=\"font-size: 14pt;\">🦊 The Heart of the Brand</span></h2>\r\n<p data-start=\"1062\" data-end=\"1137\">Each FablePal represents universal values that resonate across the globe:</p>\r\n<ul data-start=\"1138\" data-end=\"1418\">\r\n<li data-start=\"1138\" data-end=\"1177\">\r\n<p data-start=\"1140\" data-end=\"1177\"><strong data-start=\"1140\" data-end=\"1149\">Tiggo</strong> &ndash; courage and leadership.</p>\r\n</li>\r\n<li data-start=\"1178\" data-end=\"1223\">\r\n<p data-start=\"1180\" data-end=\"1223\"><strong data-start=\"1180\" data-end=\"1188\">Luna</strong> &ndash; curiosity and self-expression.</p>\r\n</li>\r\n<li data-start=\"1224\" data-end=\"1261\">\r\n<p data-start=\"1226\" data-end=\"1261\"><strong data-start=\"1226\" data-end=\"1235\">Ollie</strong> &ndash; wisdom and invention.</p>\r\n</li>\r\n<li data-start=\"1262\" data-end=\"1306\">\r\n<p data-start=\"1264\" data-end=\"1306\"><strong data-start=\"1264\" data-end=\"1272\">Bolt</strong> &ndash; creativity and determination.</p>\r\n</li>\r\n<li data-start=\"1307\" data-end=\"1346\">\r\n<p data-start=\"1309\" data-end=\"1346\"><strong data-start=\"1309\" data-end=\"1318\">Blaze</strong> &ndash; resilience and freedom.</p>\r\n</li>\r\n<li data-start=\"1347\" data-end=\"1379\">\r\n<p data-start=\"1349\" data-end=\"1379\"><strong data-start=\"1349\" data-end=\"1358\">Waver</strong> &ndash; joy and harmony.</p>\r\n</li>\r\n<li data-start=\"1380\" data-end=\"1418\">\r\n<p data-start=\"1382\" data-end=\"1418\"><strong data-start=\"1382\" data-end=\"1390\">Kane</strong> &ndash; redemption and balance.</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1420\" data-end=\"1551\">By weaving these values into playful adventures, FablePals becomes both entertaining and meaningful, giving it global appeal.</p>\r\n<h2 data-start=\"1553\" data-end=\"1588\"><span style=\"font-size: 14pt;\">🌍 Why It Has Global Potential</span></h2>\r\n<ol data-start=\"1589\" data-end=\"2194\">\r\n<li data-start=\"1589\" data-end=\"1720\">\r\n<p data-start=\"1592\" data-end=\"1720\"><strong data-start=\"1592\" data-end=\"1612\">Universal Themes</strong> &ndash; Friendship, courage, and imagination transcend cultures, making FablePals relatable to kids everywhere.</p>\r\n</li>\r\n<li data-start=\"1721\" data-end=\"1862\">\r\n<p data-start=\"1724\" data-end=\"1862\"><strong data-start=\"1724\" data-end=\"1744\">Educational Edge</strong> &ndash; From coloring sheets to shape adventures, it offers fun learning for children, a feature parents worldwide value.</p>\r\n</li>\r\n<li data-start=\"1863\" data-end=\"2034\">\r\n<p data-start=\"1866\" data-end=\"2034\"><strong data-start=\"1866\" data-end=\"1885\">Cinematic Depth</strong> &ndash; With its saga of elements, guardians, and the Shadow Legion, FablePals holds the potential to expand into films, series, games, and merchandise.</p>\r\n</li>\r\n<li data-start=\"2035\" data-end=\"2194\">\r\n<p data-start=\"2038\" data-end=\"2194\"><strong data-start=\"2038\" data-end=\"2062\">Homegrown Creativity</strong> &ndash; As an original IP from India, FablePals shows the world that India can create brands on par with Pixar, Disney, and DreamWorks.</p>\r\n</li>\r\n</ol>\r\n<h2 data-start=\"2196\" data-end=\"2234\"><span style=\"font-size: 14pt;\">🌈 The Next Big Thing from India?</span></h2>\r\n<p data-start=\"2235\" data-end=\"2637\">India has long been celebrated for its mythology, storytelling, and creativity. FablePals channels that heritage into a fresh, modern format designed for today&rsquo;s kids and tomorrow&rsquo;s global audience. With its unique blend of learning + adventure + cinematic storytelling , FablePals is perfectly positioned to become not just a national success, but the&nbsp;<strong data-start=\"2591\" data-end=\"2634\">next global kids&rsquo; phenomenon from India</strong>.</p>', NULL, NULL, '2025-09-21 09:27:29', '2025-09-21 09:32:02'),
(20, 7, 'hi', 'FablePals : The Next Global Kid\'s Brand from India !', '<h1 data-start=\"195\" data-end=\"258\">Can FablePals Be the Next Global Kids&rsquo; Brand from India?</h1>\r\n<p data-start=\"260\" data-end=\"585\">FablePals is more than a fantasy series&mdash;it&rsquo;s India&rsquo;s bold step toward creating a global kids&rsquo; brand that blends storytelling, education, and adventure. In a world dominated by international franchises, FablePals stands out as a homegrown universe with the heart, depth, and creativity to inspire children across cultures.</p>\r\n<h2 data-start=\"587\" data-end=\"620\">✨ Why FablePals is Different</h2>\r\n<p data-start=\"621\" data-end=\"1029\">At its core, FablePals combines <strong data-start=\"653\" data-end=\"706\">imaginative storytelling with purposeful learning</strong>. Children are drawn to the cute, adventurous cub heroes and their magical journeys, while teens and adults find themselves immersed in a richly built cinematic universe filled with lore, guardians, and epic battles. This dual-layered approach makes FablePals more than just a cartoon&mdash;it&rsquo;s an <strong data-start=\"999\" data-end=\"1026\">experience for all ages</strong>.</p>\r\n<h2 data-start=\"1031\" data-end=\"1061\">🦊 The Heart of the Brand</h2>\r\n<p data-start=\"1062\" data-end=\"1137\">Each FablePal represents universal values that resonate across the globe:</p>\r\n<ul data-start=\"1138\" data-end=\"1418\">\r\n<li data-start=\"1138\" data-end=\"1177\">\r\n<p data-start=\"1140\" data-end=\"1177\"><strong data-start=\"1140\" data-end=\"1149\">Tiggo</strong> &ndash; courage and leadership.</p>\r\n</li>\r\n<li data-start=\"1178\" data-end=\"1223\">\r\n<p data-start=\"1180\" data-end=\"1223\"><strong data-start=\"1180\" data-end=\"1188\">Luna</strong> &ndash; curiosity and self-expression.</p>\r\n</li>\r\n<li data-start=\"1224\" data-end=\"1261\">\r\n<p data-start=\"1226\" data-end=\"1261\"><strong data-start=\"1226\" data-end=\"1235\">Ollie</strong> &ndash; wisdom and invention.</p>\r\n</li>\r\n<li data-start=\"1262\" data-end=\"1306\">\r\n<p data-start=\"1264\" data-end=\"1306\"><strong data-start=\"1264\" data-end=\"1272\">Bolt</strong> &ndash; creativity and determination.</p>\r\n</li>\r\n<li data-start=\"1307\" data-end=\"1346\">\r\n<p data-start=\"1309\" data-end=\"1346\"><strong data-start=\"1309\" data-end=\"1318\">Blaze</strong> &ndash; resilience and freedom.</p>\r\n</li>\r\n<li data-start=\"1347\" data-end=\"1379\">\r\n<p data-start=\"1349\" data-end=\"1379\"><strong data-start=\"1349\" data-end=\"1358\">Waver</strong> &ndash; joy and harmony.</p>\r\n</li>\r\n<li data-start=\"1380\" data-end=\"1418\">\r\n<p data-start=\"1382\" data-end=\"1418\"><strong data-start=\"1382\" data-end=\"1390\">Kane</strong> &ndash; redemption and balance.</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1420\" data-end=\"1551\">By weaving these values into playful adventures, FablePals becomes both <strong data-start=\"1492\" data-end=\"1523\">entertaining and meaningful</strong>, giving it global appeal.</p>\r\n<h2 data-start=\"1553\" data-end=\"1588\">🌍 Why It Has Global Potential</h2>\r\n<ol data-start=\"1589\" data-end=\"2194\">\r\n<li data-start=\"1589\" data-end=\"1720\">\r\n<p data-start=\"1592\" data-end=\"1720\"><strong data-start=\"1592\" data-end=\"1612\">Universal Themes</strong> &ndash; Friendship, courage, and imagination transcend cultures, making FablePals relatable to kids everywhere.</p>\r\n</li>\r\n<li data-start=\"1721\" data-end=\"1862\">\r\n<p data-start=\"1724\" data-end=\"1862\"><strong data-start=\"1724\" data-end=\"1744\">Educational Edge</strong> &ndash; From coloring sheets to shape adventures, it offers fun learning for children, a feature parents worldwide value.</p>\r\n</li>\r\n<li data-start=\"1863\" data-end=\"2034\">\r\n<p data-start=\"1866\" data-end=\"2034\"><strong data-start=\"1866\" data-end=\"1885\">Cinematic Depth</strong> &ndash; With its saga of elements, guardians, and the Shadow Legion, FablePals holds the potential to expand into films, series, games, and merchandise.</p>\r\n</li>\r\n<li data-start=\"2035\" data-end=\"2194\">\r\n<p data-start=\"2038\" data-end=\"2194\"><strong data-start=\"2038\" data-end=\"2062\">Homegrown Creativity</strong> &ndash; As an original IP from India, FablePals shows the world that India can create brands on par with Pixar, Disney, and DreamWorks.</p>\r\n</li>\r\n</ol>\r\n<h2 data-start=\"2196\" data-end=\"2234\">🌈 The Next Big Thing from India?</h2>\r\n<p data-start=\"2235\" data-end=\"2637\">India has long been celebrated for its mythology, storytelling, and creativity. FablePals channels that heritage into a fresh, modern format designed for today&rsquo;s kids and tomorrow&rsquo;s global audience. With its unique blend of <strong data-start=\"2459\" data-end=\"2508\">learning + adventure + cinematic storytelling</strong>, FablePals is perfectly positioned to become not just a national success, but the <strong data-start=\"2591\" data-end=\"2634\">next global kids&rsquo; phenomenon from India</strong>.</p>', NULL, NULL, '2025-09-21 09:27:29', '2025-09-21 09:27:29'),
(21, 8, 'en', 'Fablepals TV : #1 Youtube Kids Channel', '<h1 data-start=\"145\" data-end=\"208\"><span style=\"font-size: 18pt;\">📺 FablePals TV &ndash; Tailor-Made Playlists for Every Adventure</span></h1>\r\n<p data-start=\"210\" data-end=\"458\">At Fablepals TV, we believe learning and fun should go hand in hand. That&rsquo;s why our YouTube channel is designed with special playlist, making it easy for kids, parents, and even schools to explore Fabland in the way that suits them best.</p>\r\n<h2 data-start=\"460\" data-end=\"493\"><span style=\"font-size: 14pt;\">🎶 Our Playlists at a Glance</span></h2>\r\n<ul data-start=\"494\" data-end=\"1121\">\r\n<li data-start=\"494\" data-end=\"631\">\r\n<p data-start=\"496\" data-end=\"631\"><strong data-start=\"496\" data-end=\"520\">FablePals Flashcards</strong> &ndash; Bright, colorful videos that help kids learn letters, numbers, shapes, and words in the most engaging way.</p>\r\n</li>\r\n<li data-start=\"632\" data-end=\"753\">\r\n<p data-start=\"634\" data-end=\"753\"><strong data-start=\"634\" data-end=\"653\">FablePals Music</strong> &ndash; Sing-along songs, theme tracks, and fun rhymes that bring joy while teaching values and basics.</p>\r\n</li>\r\n<li data-start=\"754\" data-end=\"869\">\r\n<p data-start=\"756\" data-end=\"869\"><strong data-start=\"756\" data-end=\"778\">FablePals Learning</strong> &ndash; From alphabets to storytelling, this playlist makes education magical and interactive.</p>\r\n</li>\r\n<li data-start=\"870\" data-end=\"991\">\r\n<p data-start=\"872\" data-end=\"991\"><strong data-start=\"872\" data-end=\"891\">FablePals World</strong> &ndash; Dive into the lore of Fabland, discover elemental realms, and meet fascinating side characters.</p>\r\n</li>\r\n<li data-start=\"992\" data-end=\"1121\">\r\n<p data-start=\"994\" data-end=\"1121\"><strong data-start=\"994\" data-end=\"1015\">FablePals Explain</strong> &ndash; Simplified breakdowns of the heroes, guardians, gadgets, and mysteries for curious minds of all ages.</p>\r\n</li>\r\n</ul>\r\n<h2 data-start=\"1123\" data-end=\"1151\"><span style=\"font-size: 14pt;\">🌟 Why Playlists Matter</span></h2>\r\n<p data-start=\"1152\" data-end=\"1430\">For kids, playlists make it simple to find their favorite type of content&mdash;whether it&rsquo;s singing, learning, or exploring magical adventures. Parents can use them as a safe educational tool, and institutes can integrate them into classrooms for fun, story-based teaching.</p>\r\n<h2 data-start=\"1432\" data-end=\"1469\"><span style=\"font-size: 14pt;\">🌈 One Channel, Endless Journeys</span></h2>\r\n<p data-start=\"1470\" data-end=\"1688\">FablePals TV isn&rsquo;t just a YouTube channel&mdash;it&rsquo;s a structured digital library of fun, learning, and adventure. Every playlist opens a new door into Fabland, making it the perfect space for families and educators alike.</p>\r\n<p data-start=\"1690\" data-end=\"1798\">👉 <strong data-start=\"1693\" data-end=\"1796\">Subscribe and explore the playlists today&mdash;because every hero&rsquo;s journey begins with the right story!<br><br>Youtube Channel Link : [ <a href=\"https://www.youtube.com/@FablePalsTV/playlists\">https://www.youtube.com/watch?v=_XIrawnFjnc&amp;t=4s</a> ]</strong></p>', NULL, NULL, '2025-09-21 09:55:46', '2025-09-21 11:27:15'),
(22, 8, 'hi', 'Fablepals TV : #1 Youtube Kids Channel', '<h1 data-start=\"145\" data-end=\"208\">📺 FablePals TV &ndash; Tailor-Made Playlists for Every Adventure</h1>\r\n<p data-start=\"210\" data-end=\"458\">At <strong data-start=\"213\" data-end=\"229\">FablePals TV</strong>, we believe learning and fun should go hand in hand. That&rsquo;s why our YouTube channel is designed with <strong data-start=\"331\" data-end=\"352\">special playlists</strong>, making it easy for kids, parents, and even schools to explore Fabland in the way that suits them best.</p>\r\n<h2 data-start=\"460\" data-end=\"493\"><span style=\"font-size: 14pt;\">🎶 Our Playlists at a Glance</span></h2>\r\n<ul data-start=\"494\" data-end=\"1121\">\r\n<li data-start=\"494\" data-end=\"631\">\r\n<p data-start=\"496\" data-end=\"631\"><strong data-start=\"496\" data-end=\"520\">FablePals Flashcards</strong> &ndash; Bright, colorful videos that help kids learn letters, numbers, shapes, and words in the most engaging way.</p>\r\n</li>\r\n<li data-start=\"632\" data-end=\"753\">\r\n<p data-start=\"634\" data-end=\"753\"><strong data-start=\"634\" data-end=\"653\">FablePals Music</strong> &ndash; Sing-along songs, theme tracks, and fun rhymes that bring joy while teaching values and basics.</p>\r\n</li>\r\n<li data-start=\"754\" data-end=\"869\">\r\n<p data-start=\"756\" data-end=\"869\"><strong data-start=\"756\" data-end=\"778\">FablePals Learning</strong> &ndash; From alphabets to storytelling, this playlist makes education magical and interactive.</p>\r\n</li>\r\n<li data-start=\"870\" data-end=\"991\">\r\n<p data-start=\"872\" data-end=\"991\"><strong data-start=\"872\" data-end=\"891\">FablePals World</strong> &ndash; Dive into the lore of Fabland, discover elemental realms, and meet fascinating side characters.</p>\r\n</li>\r\n<li data-start=\"992\" data-end=\"1121\">\r\n<p data-start=\"994\" data-end=\"1121\"><strong data-start=\"994\" data-end=\"1015\">FablePals Explain</strong> &ndash; Simplified breakdowns of the heroes, guardians, gadgets, and mysteries for curious minds of all ages.</p>\r\n</li>\r\n</ul>\r\n<h2 data-start=\"1123\" data-end=\"1151\"><span style=\"font-size: 14pt;\">🌟 Why Playlists Matter</span></h2>\r\n<p data-start=\"1152\" data-end=\"1430\">For kids, playlists make it simple to <strong data-start=\"1190\" data-end=\"1229\">find their favorite type of content</strong>&mdash;whether it&rsquo;s singing, learning, or exploring magical adventures. Parents can use them as a <strong data-start=\"1321\" data-end=\"1346\">safe educational tool</strong>, and institutes can integrate them into classrooms for fun, story-based teaching.</p>\r\n<h2 data-start=\"1432\" data-end=\"1469\"><span style=\"font-size: 14pt;\">🌈 One Channel, Endless Journeys</span></h2>\r\n<p data-start=\"1470\" data-end=\"1688\">FablePals TV isn&rsquo;t just a YouTube channel&mdash;it&rsquo;s a structured digital library of fun, learning, and adventure. Every playlist opens a new door into Fabland, making it the perfect space for families and educators alike.</p>\r\n<p data-start=\"1690\" data-end=\"1798\">👉 <strong data-start=\"1693\" data-end=\"1796\">Subscribe and explore the playlists today&mdash;because every hero&rsquo;s journey begins with the right story!</strong></p>', NULL, NULL, '2025-09-21 09:55:46', '2025-09-21 09:55:46'),
(23, 9, 'en', 'Guide to World of Fablepals', '<p data-start=\"311\" data-end=\"580\">Every great journey begins with a spark, and in Fabland, that spark lives in the hearts of brave cubs and the world they protect. This guide will take you step by step through the magic of the FablePals universe&mdash;its heroes, its worlds, its mysteries, and its threats.</p>\r\n<hr data-start=\"582\" data-end=\"585\">\r\n<h2 data-start=\"587\" data-end=\"636\"><span style=\"font-size: 14pt;\">📖 1. Meet the Heroes &ndash; The Adventure Begins</span></h2>\r\n<p data-start=\"637\" data-end=\"908\">In Fabland, courage is small but mighty. Four cubs&mdash;Tiggo, Ollie , Luna and Bolt&mdash;begin the story with dreams bigger than themselves. Along the way, they meet Blaze, Waver and Kane each carrying their own destiny. Together, they form the heart of the FablePals.</p>\r\n<p data-start=\"910\" data-end=\"952\">🔗 Explore each hero &rarr; Character Pages</p>\r\n<hr data-start=\"954\" data-end=\"957\">\r\n<h2 data-start=\"959\" data-end=\"1013\"><span style=\"font-size: 14pt;\">🌌 2. Enter the Mystic World &ndash; Origins of Fabland</span></h2>\r\n<p data-start=\"1014\" data-end=\"1242\">Before Fabland, there was Primora, the Realm of Pure Energy. From it, the Five Elemental Worlds were born, each protected by a Guardian: Earth, Water, Air, Fire, and Time. This is where the balance of all realms began.</p>\r\n<p data-start=\"1244\" data-end=\"1285\">🔗 Visit &rarr; Fab Mystic World Pages</p>\r\n<hr data-start=\"1287\" data-end=\"1290\">\r\n<h2 data-start=\"1292\" data-end=\"1348\"><span style=\"font-size: 14pt;\">💥 3. The Element Scattering &ndash; The Shattering Event</span></h2>\r\n<p data-start=\"1349\" data-end=\"1514\">But balance did not last. In the Element Scattering, energy fragments rained across Fabland, reshaping the land into new terrains filled with power&mdash;and danger.</p>\r\n<p data-start=\"1516\" data-end=\"1546\">🔗 Learn more &rarr; Lore Pages</p>\r\n<hr data-start=\"1548\" data-end=\"1551\">\r\n<h2 data-start=\"1553\" data-end=\"1598\"><span style=\"font-size: 14pt;\">🏡 4. Fabland Unfolds &ndash; The Living World</span></h2>\r\n<p data-start=\"1599\" data-end=\"1854\">From scattered elements rose Fabland, with Fabville Village at its heart. Here, the FabCouncil guides, the FabGuard protects, and unique Elemental Terrains thrive. Yet in the shadows lurks the<strong> </strong>Silent Order, watching for their chance.</p>\r\n<p data-start=\"1856\" data-end=\"1885\">🔗 Explore &rarr; Fabland World Pages</p>\r\n<hr data-start=\"1887\" data-end=\"1890\">\r\n<h2 data-start=\"1892\" data-end=\"1945\"><span style=\"font-size: 14pt;\">👥 5. Meet the Villagers &ndash; The Heart of Fabville</span></h2>\r\n<p data-start=\"1946\" data-end=\"2197\">Not all heroes wield relics. In Fabville, villagers like Toko, Bako &amp; Rock, Chef Truffle, Healer Willow, Mr. Beavers, and Riffy shape daily life with wisdom, craft, healing, and music. They remind us that every role matters in Fabland&rsquo;s destiny.</p>\r\n<p data-start=\"2199\" data-end=\"2233\">🔗 Meet them &rarr; Fab Villagers Pages</p>\r\n<hr data-start=\"2235\" data-end=\"2238\">\r\n<h2 data-start=\"2240\" data-end=\"2295\"><span style=\"font-size: 14pt;\">⚡ 6. Mystic Gadgets &amp; Relics &ndash; Power of the Chosen</span></h2>\r\n<p data-start=\"2296\" data-end=\"2487\">The Guardians left behind the Elementrix wrist gears, mystical devices powered by ancient relics. Only the chosen can unlock their full potential&mdash;linking Fabland&rsquo;s past with its future.</p>\r\n<p data-start=\"2489\" data-end=\"2526\">🔗 Discover &rarr; Mystic Gadgets &amp; Relics Page</p>\r\n<hr data-start=\"2528\" data-end=\"2531\">\r\n<h2 data-start=\"2533\" data-end=\"2579\"><span style=\"font-size: 14pt;\">👤 7. The Shadow Legion &ndash; The Dark Threat</span></h2>\r\n<p data-start=\"2580\" data-end=\"2767\">From the void came Draxus, the Supreme Entity, leading his Shadow Legion. His commanders corrupt crystals, his armies raid villages, and his goal is to plunge Fabland into darkness.</p>\r\n<p data-start=\"2769\" data-end=\"2812\">🔗 Face the enemy &rarr; Shadow Legion Order Pages</p>\r\n<hr data-start=\"2814\" data-end=\"2817\">\r\n<h2 data-start=\"2819\" data-end=\"2868\"><span style=\"font-size: 14pt;\">🎥 8. The Cinematic Universe &ndash; Saga of Sagas</span></h2>\r\n<p data-start=\"2869\" data-end=\"3096\">FablePals is more than one story. The<strong> </strong>Element Collection Saga tells how the cubs unite with Guardians to restore balance, while the Lore Expansion Saga reveals ancient wars, forgotten origins, and the dawn of Fabland.</p>\r\n<p data-start=\"3098\" data-end=\"3140\">🔗 Watch the sagas unfold &rarr; Fablepals Cinematic Universe Pages</p>\r\n<hr data-start=\"3142\" data-end=\"3145\">\r\n<h2 data-start=\"3147\" data-end=\"3197\"><span style=\"font-size: 14pt;\">🚀 9. Join the Adventure &ndash; Be Part of Fabland</span></h2>\r\n<p data-start=\"3198\" data-end=\"3231\">The journey continues with you!</p>\r\n<ul data-start=\"3232\" data-end=\"3421\">\r\n<li data-start=\"3232\" data-end=\"3281\">\r\n<p data-start=\"3234\" data-end=\"3281\">▶️ <strong data-start=\"3237\" data-end=\"3253\">Watch Videos</strong> &rarr; FablePals TV on YouTube</p>\r\n</li>\r\n<li data-start=\"3282\" data-end=\"3329\">\r\n<p data-start=\"3284\" data-end=\"3329\">🎨 <strong data-start=\"3287\" data-end=\"3303\">Learn &amp; Play</strong> &rarr; Digi Store Activities</p>\r\n</li>\r\n<li data-start=\"3330\" data-end=\"3374\">\r\n<p data-start=\"3332\" data-end=\"3374\">🛒 <strong data-start=\"3335\" data-end=\"3359\">Bring the Magic Home</strong> &rarr; Shop Merch</p>\r\n</li>\r\n<li data-start=\"3375\" data-end=\"3421\">\r\n<p data-start=\"3377\" data-end=\"3421\">🌐 <strong data-start=\"3380\" data-end=\"3397\">Discover More</strong> &rarr; Explore our Website</p>\r\n</li>\r\n</ul>\r\n<h2 data-start=\"3428\" data-end=\"3477\"><span style=\"font-size: 14pt;\">Thank You &ndash; You Are Part of the Story</span></h2>\r\n<p data-start=\"3478\" data-end=\"3640\">Every story grows when it is shared. By stepping into Fabland, you&rsquo;ve joined the adventure of the FablePals. The world is brighter because you&rsquo;re part of it. 🌟</p>', NULL, NULL, '2025-09-21 10:55:59', '2025-09-21 11:01:06'),
(24, 9, 'hi', 'Guide to World of Fablepals', '<p data-start=\"311\" data-end=\"580\">Every great journey begins with a spark, and in Fabland, that spark lives in the hearts of brave cubs and the world they protect. This guide will take you step by step through the magic of the FablePals universe&mdash;its heroes, its worlds, its mysteries, and its threats.</p>\r\n<hr data-start=\"582\" data-end=\"585\">\r\n<h2 data-start=\"587\" data-end=\"636\"><span style=\"font-size: 14pt;\">📖 1. Meet the Heroes &ndash; The Adventure Begins</span></h2>\r\n<p data-start=\"637\" data-end=\"908\">In Fabland, courage is small but mighty. Four cubs&mdash;<strong>Tiggo, Ollie , Luna and Bolt</strong>&mdash;begin the story with dreams bigger than themselves. Along the way, they meet <strong>Blaze, Waver and Kane</strong> each carrying their own destiny. Together, they form the heart of the FablePals.</p>\r\n<p data-start=\"910\" data-end=\"952\">🔗 Explore each hero &rarr; Character Pages</p>\r\n<hr data-start=\"954\" data-end=\"957\">\r\n<h2 data-start=\"959\" data-end=\"1013\">🌌 2. Enter the Mystic World &ndash; Origins of Fabland</h2>\r\n<p data-start=\"1014\" data-end=\"1242\">Before Fabland, there was <strong data-start=\"1040\" data-end=\"1051\">Primora</strong>, the Realm of Pure Energy. From it, the <strong data-start=\"1092\" data-end=\"1117\">Five Elemental Worlds</strong> were born, each protected by a Guardian: Earth, Water, Air, Fire, and Time. This is where the balance of all realms began.</p>\r\n<p data-start=\"1244\" data-end=\"1285\">🔗 Visit &rarr; Primora &amp; Elemental Worlds</p>\r\n<hr data-start=\"1287\" data-end=\"1290\">\r\n<h2 data-start=\"1292\" data-end=\"1348\">💥 3. The Element Scattering &ndash; The Shattering Event</h2>\r\n<p data-start=\"1349\" data-end=\"1514\">But balance did not last. In the <strong data-start=\"1382\" data-end=\"1404\">Element Scattering</strong>, energy fragments rained across Fabland, reshaping the land into new terrains filled with power&mdash;and danger.</p>\r\n<p data-start=\"1516\" data-end=\"1546\">🔗 Learn more &rarr; Lore Pages</p>\r\n<hr data-start=\"1548\" data-end=\"1551\">\r\n<h2 data-start=\"1553\" data-end=\"1598\">🏡 4. Fabland Unfolds &ndash; The Living World</h2>\r\n<p data-start=\"1599\" data-end=\"1854\">From scattered elements rose Fabland, with <strong data-start=\"1642\" data-end=\"1662\">Fabville Village</strong> at its heart. Here, the <strong data-start=\"1687\" data-end=\"1701\">FabCouncil</strong> guides, the <strong data-start=\"1714\" data-end=\"1726\">FabGuard</strong> protects, and unique <strong data-start=\"1748\" data-end=\"1770\">Elemental Terrains</strong> thrive. Yet in the shadows lurks the <strong data-start=\"1808\" data-end=\"1824\">Silent Order</strong>, watching for their chance.</p>\r\n<p data-start=\"1856\" data-end=\"1885\">🔗 Explore &rarr; Fabland Hubs</p>\r\n<hr data-start=\"1887\" data-end=\"1890\">\r\n<h2 data-start=\"1892\" data-end=\"1945\">👥 5. Meet the Villagers &ndash; The Heart of Fabville</h2>\r\n<p data-start=\"1946\" data-end=\"2197\">Not all heroes wield relics. In Fabville, villagers like <strong data-start=\"2003\" data-end=\"2077\">Toko, Bako &amp; Rock, Chef Truffle, Healer Willow, Mr. Beavers, and Riffy</strong> shape daily life with wisdom, craft, healing, and music. They remind us that every role matters in Fabland&rsquo;s destiny.</p>\r\n<p data-start=\"2199\" data-end=\"2233\">🔗 Meet them &rarr; Villagers Pages</p>\r\n<hr data-start=\"2235\" data-end=\"2238\">\r\n<h2 data-start=\"2240\" data-end=\"2295\">⚡ 6. Mystic Gadgets &amp; Relics &ndash; Power of the Chosen</h2>\r\n<p data-start=\"2296\" data-end=\"2487\">The Guardians left behind the <strong data-start=\"2326\" data-end=\"2352\">Elementrix wrist gears</strong>, mystical devices powered by ancient relics. Only the chosen can unlock their full potential&mdash;linking Fabland&rsquo;s past with its future.</p>\r\n<p data-start=\"2489\" data-end=\"2526\">🔗 Discover &rarr; Elementrix &amp; Relics</p>\r\n<hr data-start=\"2528\" data-end=\"2531\">\r\n<h2 data-start=\"2533\" data-end=\"2579\">👤 7. The Shadow Legion &ndash; The Dark Threat</h2>\r\n<p data-start=\"2580\" data-end=\"2767\">From the void came <strong data-start=\"2599\" data-end=\"2609\">Draxus</strong>, the Supreme Entity, leading his Shadow Legion. His commanders corrupt crystals, his armies raid villages, and his goal is to plunge Fabland into darkness.</p>\r\n<p data-start=\"2769\" data-end=\"2812\">🔗 Face the enemy &rarr; Shadow Legion Pages</p>\r\n<hr data-start=\"2814\" data-end=\"2817\">\r\n<h2 data-start=\"2819\" data-end=\"2868\">🎥 8. The Cinematic Universe &ndash; Saga of Sagas</h2>\r\n<p data-start=\"2869\" data-end=\"3096\">FablePals is more than one story. The <strong data-start=\"2907\" data-end=\"2934\">Element Collection Saga</strong> tells how the cubs unite with Guardians to restore balance, while the <strong data-start=\"3005\" data-end=\"3028\">Lore Expansion Saga</strong> reveals ancient wars, forgotten origins, and the dawn of Fabland.</p>\r\n<p data-start=\"3098\" data-end=\"3140\">🔗 Watch the sagas unfold &rarr; Saga Pages</p>\r\n<hr data-start=\"3142\" data-end=\"3145\">\r\n<h2 data-start=\"3147\" data-end=\"3197\">🚀 9. Join the Adventure &ndash; Be Part of Fabland</h2>\r\n<p data-start=\"3198\" data-end=\"3231\">The journey continues with you!</p>\r\n<ul data-start=\"3232\" data-end=\"3421\">\r\n<li data-start=\"3232\" data-end=\"3281\">\r\n<p data-start=\"3234\" data-end=\"3281\">▶️ <strong data-start=\"3237\" data-end=\"3253\">Watch Videos</strong> &rarr; FablePals TV on YouTube</p>\r\n</li>\r\n<li data-start=\"3282\" data-end=\"3329\">\r\n<p data-start=\"3284\" data-end=\"3329\">🎨 <strong data-start=\"3287\" data-end=\"3303\">Learn &amp; Play</strong> &rarr; Digi Store Activities</p>\r\n</li>\r\n<li data-start=\"3330\" data-end=\"3374\">\r\n<p data-start=\"3332\" data-end=\"3374\">🛒 <strong data-start=\"3335\" data-end=\"3359\">Bring the Magic Home</strong> &rarr; Shop Merch</p>\r\n</li>\r\n<li data-start=\"3375\" data-end=\"3421\">\r\n<p data-start=\"3377\" data-end=\"3421\">🌐 <strong data-start=\"3380\" data-end=\"3397\">Discover More</strong> &rarr; Explore our Website</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"3423\" data-end=\"3426\">\r\n<h2 data-start=\"3428\" data-end=\"3477\">🌙 10. Thank You &ndash; You Are Part of the Story</h2>\r\n<p data-start=\"3478\" data-end=\"3640\">Every story grows when it is shared. By stepping into Fabland, you&rsquo;ve joined the adventure of the FablePals. The world is brighter because you&rsquo;re part of it. 🌟</p>', NULL, NULL, '2025-09-21 10:55:59', '2025-09-21 10:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `url`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Brand', 'uploads/custom-images/brand-2.svg', 'https://websolutionus.com/', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 'Brand', 'uploads/custom-images/brand-3.svg', 'https://websolutionus.com/', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 'Brand', 'uploads/custom-images/brand-4.svg', 'https://websolutionus.com/', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 'Brand', 'uploads/custom-images/brand-5.svg', 'https://websolutionus.com/', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(6, 'Brand', 'uploads/custom-images/brand-6.svg', 'https://websolutionus.com/', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 'Brand', 'uploads/custom-images/brand-7.svg', 'https://websolutionus.com/', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 'Brand', 'uploads/custom-images/brand-8.svg', 'https://websolutionus.com/', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` text NOT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_date` varchar(255) DEFAULT NULL,
  `project_author` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_two` varchar(255) DEFAULT NULL,
  `image_three` varchar(255) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `mystic_element` varchar(255) DEFAULT NULL,
  `signature_rider` varchar(255) DEFAULT NULL,
  `mystic_planet` varchar(255) DEFAULT NULL,
  `signature_weapon` varchar(255) DEFAULT NULL,
  `mystic_guardian` varchar(255) DEFAULT NULL,
  `line_color` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `slug`, `service_id`, `project_date`, `project_author`, `image`, `image_two`, `image_three`, `tags`, `mystic_element`, `signature_rider`, `mystic_planet`, `signature_weapon`, `mystic_guardian`, `line_color`, `status`, `created_at`, `updated_at`) VALUES
(25, 'tiggo-the-leader', NULL, NULL, NULL, 'uploads/custom-images/image_1754125032.webp', 'uploads/custom-images/image_two_1753095099.png', 'uploads/custom-images/image_three_1753095369.png', '[{\"value\":\"Fablepals\"},{\"value\":\"Tiggo\"},{\"value\":\"Animal baby tiger\"},{\"value\":\"kids channel\"},{\"value\":\"kids animation brand\"}]', 'Earth Element', 'Terra Bike ( Turbo )', 'Terra Prime', 'Stomp hammer ( Stomper )', 'Grok - Colossal Rock Giant', '#84ff00', 1, '2025-07-21 07:02:04', '2025-08-02 08:57:12'),
(26, 'luna-the-speedster', NULL, NULL, NULL, 'uploads/custom-images/image_1754124768.webp', 'uploads/custom-images/image_two_1753683635.png', 'uploads/custom-images/image_three_1753530973.png', '[{\"value\":\"fablepals\"},{\"value\":\"luna\"},{\"value\":\"air element\"},{\"value\":\"speedster\"}]', 'Air Element', 'Stormrider', 'Aero Zenith', 'Cyclo Rings ( AeroZips )', 'Aeron - Mighty Falcon', '#03f8fc', 1, '2025-07-23 11:07:42', '2025-08-02 08:52:48'),
(27, 'blaze-the-warrior', NULL, NULL, NULL, 'uploads/custom-images/image_1754124090.webp', 'uploads/custom-images/image_two_1753683388.png', 'uploads/custom-images/image_three_1753684026.png', '[{\"value\":\"FablePals\"},{\"value\":\"Blaze FablePals\"},{\"value\":\"Blaze character\"},{\"value\":\"fire hero red panda\"},{\"value\":\"Inferno Core\"},{\"value\":\"FablePals Blaze powers\"},{\"value\":\"FablePals Universe\"},{\"value\":\"Blaze backstory\"},{\"value\":\"FablePals characters\"},{\"value\":\"elemental animal heroes\"},{\"value\":\"animated kids universe\"},{\"value\":\"red panda superhero\"},{\"value\":\"Blaze toy\"},{\"value\":\"FablePals cinematic world\"},{\"value\":\"kids character profiles\"}]', 'Fire Element', 'Jet Wing Suit ( Flare Jet )', 'Inferno Core', 'Flame Chains ( Blazelinks )', 'Skarion - Fiery Phoenix', '#ed7428', 1, '2025-07-26 10:08:52', '2025-08-02 08:41:30'),
(28, 'bolt-the-genius-mechanic', NULL, NULL, NULL, 'uploads/custom-images/image_1754123909.webp', 'uploads/custom-images/image_two_1754118716.webp', 'uploads/custom-images/image_three_1754118311.png', '[{\"value\":\"FablePals Bolt\"},{\"value\":\"kids hero character\"},{\"value\":\"cartoon bear for kids\"},{\"value\":\"inventor character\"},{\"value\":\"STEM cartoon hero\"},{\"value\":\"time-powered hero\"},{\"value\":\"educational kids brand\"},{\"value\":\"animated kids character\"},{\"value\":\"brave bear character\"}]', 'Time Element', 'Titan Armor', 'Chrono Nexus', 'Chrono Blade', 'Iron Bison ( Titanox )', '#fcef56', 1, '2025-07-28 06:58:37', '2025-08-02 08:38:29'),
(31, 'waver-the-oceans-heart', NULL, NULL, NULL, 'uploads/custom-images/image_1754123739.webp', 'uploads/custom-images/image_two_1754122923.png', 'uploads/custom-images/image_three_1754216677.webp', '[{\"value\":\"Waver FablePals\"},{\"value\":\"water element hero\"},{\"value\":\"Aqua Realm\"},{\"value\":\"FablePals otter\"},{\"value\":\"water wielder\"},{\"value\":\"magical otter character\"},{\"value\":\"ocean hero\"},{\"value\":\"elemental warriors\"},{\"value\":\"FablePals gadgets\"}]', 'Water Element', 'Jet Rider ( TideChaser )', 'Aqua Realm', 'Trident of Aqualis', 'Sea Serpent ( Aqualis )', '#42f5ce', 1, '2025-08-02 08:13:36', '2025-08-03 10:24:37'),
(32, 'ollie-the-wise-', NULL, NULL, NULL, 'uploads/custom-images/image_1754227000.webp', 'uploads/custom-images/image_two_1754306545.webp', 'uploads/custom-images/image_three_1754306545.webp', '[{\"value\":\"ollie\"},{\"value\":\"fablepals\"},{\"value\":\"fablepaslheroes\"},{\"value\":\"lightelement\"},{\"value\":\"mysticworld\"}]', 'Light Element', 'Jet Glider ( LightWing )', 'Light Realm', 'Halo', 'Lumion - Majestic  Celestial Kirin', '#f5a442', 1, '2025-08-03 12:30:17', '2025-08-05 11:30:25'),
(33, 'kane-the-prodigal-knight', NULL, NULL, NULL, 'uploads/custom-images/image_1754479057.webp', 'uploads/custom-images/image_two_1754475766.webp', 'uploads/custom-images/image_three_1754398690.png', '[{\"value\":\"Kane FablePals\"},{\"value\":\"FablePals elemental warriors\"},{\"value\":\"fablepals\"},{\"value\":\"fablepalsuniverse\"}]', 'Shadow Element', 'Hover JetBike ( Draxar )', 'Shadow Realm', 'Void Axes ( Shadow Breakers )', 'Shadow Dragon ( Drekaris )', '#d303fc', 1, '2025-08-05 11:17:27', '2025-08-06 11:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `character_gadgets`
--

CREATE TABLE `character_gadgets` (
  `id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `character_gadgets`
--

INSERT INTO `character_gadgets` (`id`, `character_id`, `title`, `description`, `image`, `updated_at`, `created_at`) VALUES
(637, 28, 'Titan Armor', 'An armored exo-suit built from Bolt’s toughest blueprints and powered by the Hourglass Core. In full Overdrive, it bends time around Bolt.', 'uploads/custom-images/gadget_attack_1753788616_1.webp', '2025-08-02 08:38:29', '2025-08-02 08:38:29'),
(638, 28, 'Chrono Blade', 'A colossal wrench-scythe hybrid forged from ancient alloys and time energy. It clamps, cleaves, and rewinds in a single swing — freezing foes mid-strike or repairing the battlefield in seconds.', 'uploads/custom-images/gadget_attack_1754112890_1.webp', '2025-08-02 08:38:29', '2025-08-02 08:38:29'),
(639, 28, 'Patch', 'A small, round, one-eyed repair drone that rides in his tool belt. It pops out to weld armor cracks, patch Titanox’s plating, or deliver spare parts when Bolt is too deep in combat.', 'uploads/custom-images/gadget_attack_1754044800_2.webp', '2025-08-02 08:38:29', '2025-08-02 08:38:29'),
(640, 28, 'Loopmine', 'Small discs that Bolt tosses onto the battlefield. When triggered, they generate a time-loop zone that reverts enemies caught inside to their position a few seconds ago.', 'uploads/custom-images/gadget_attack_1754112973_3.webp', '2025-08-02 08:38:29', '2025-08-02 08:38:29'),
(641, 28, 'Time Frost', 'A compact, gear-shaped device that deploys a glowing clockwork ring on the ground. The ring expands into a swirling chronal portal, letting Bolt instantly transport the team across Fabville or between safe zones.', 'uploads/custom-images/gadget_attack_1754112973_4.webp', '2025-08-02 08:38:29', '2025-08-02 08:38:29'),
(642, 27, 'Blazelinks', 'Flaming chains that slash, bind, and burn with precision.\r\nBlaze uses them to trap foes, swing through danger, and unleash explosive strikes—powered by his rage.', 'uploads/custom-images/gadget_attack_1753682020_0.webp', '2025-08-02 08:41:30', '2025-08-02 08:41:30'),
(643, 27, 'Flarejet', 'A phoenix-forged jet wingsuit built for speed and battle.\r\n Its blazing thrusts let Blaze soar, dodge, and dive with volcanic force, lighting up the skies in flame.', 'uploads/custom-images/gadget_attack_1753682020_1.webp', '2025-08-02 08:41:30', '2025-08-02 08:41:30'),
(644, 27, 'Flamguard', 'Arm-worn gauntlets that supercharge Blaze’s punches with searing flame. They ignite with every strike and deflect attacks with fiery shields.', 'uploads/custom-images/gadget_attack_1753682020_2.webp', '2025-08-02 08:41:30', '2025-08-02 08:41:30'),
(645, 27, 'Fury Blades', 'Twin flame-forged daggers that Blaze wields with speed and fury. He uses them for rapid-fire slashes, spinning attacks, and flame-charged finishers in close combat.', 'uploads/custom-images/gadget_attack_1753682020_3.webp', '2025-08-02 08:41:30', '2025-08-02 08:41:30'),
(646, 27, 'Blastrike', 'A heavy, arm-mounted cannon that blasts molten fireballs and lava streams. Blaze uses it to melt enemy armor, create fiery shockwaves, and carve explosive paths through the battlefield.', 'uploads/custom-images/gadget_attack_1753682020_4.webp', '2025-08-02 08:41:30', '2025-08-02 08:41:30'),
(647, 27, 'Blaze Boomer', 'Blaze throws it in a wide arc—it spins with increasing heat and slices through enemies before returning. In close combat, Blaze splits it into two short-range fire sickles.', 'uploads/custom-images/gadget_attack_1753682020_5.webp', '2025-08-02 08:41:30', '2025-08-02 08:41:30'),
(654, 26, 'AeroZips', 'Aerozips are sleek, aerodynamic ring blades that Luna wears on both her forearms like elegant gauntlets. Crafted with air-elemental alloys and inscribed with ancient sky runes, each Aerozip hums with stored wind energy. When thrown, they unleash razor-sharp crescent-shaped air blades capable of slicing through enemy defenses or disarming opponents with precision.', 'uploads/custom-images/gadget_attack_1753446108_0.webp', '2025-08-02 08:52:48', '2025-08-02 08:52:48'),
(655, 26, 'Stormrider', 'Stormrider is a sleek, aerodynamic glider crafted from ultra-light enchanted alloy fused with ancient wind crystals. Its design resembles the wings of a bird fused with futuristic tech, featuring two wide, curved airfoil wings that shimmer with soft aqua and silver hues.', 'uploads/custom-images/gadget_attack_1753447031_1.jpg', '2025-08-02 08:52:48', '2025-08-02 08:52:48'),
(656, 26, 'Aeropiercer', 'A sleek, sky-blue needle forged on a wind-thread, combining blazing speed with razor precision. It slashes through targets effortlessly, then zips back or pulls Luna instantly toward it like a grappling hook. Controlled entirely by her mind, it obeys thought-speed movements, turning Luna into a blur of motion in battle.', 'uploads/custom-images/gadget_attack_1753447631_2.jpg', '2025-08-02 08:52:48', '2025-08-02 08:52:48'),
(657, 26, 'Zaplets', 'Luna’s wind-charged speed boots that boost her jumps, dashes, and aerial flips. Every stomp unleashes a shockwave burst, and every dash leaves behind slicing wind trails that cut through the air—and enemies.', 'uploads/custom-images/gadget_attack_1753449508_3.webp', '2025-08-02 08:52:48', '2025-08-02 08:52:48'),
(658, 26, 'Skystrike', 'A sleek jet-pack missile launcher combining ancient wind tech with modern targeting. It lets Luna stay agile in the skies, launching air-guided missiles that twist and track with precision. Lightweight design ensures high-speed flight and smooth aerial maneuvers.', 'uploads/custom-images/gadget_attack_1753525015_4.webp', '2025-08-02 08:52:48', '2025-08-02 08:52:48'),
(659, 26, 'Skyshades', 'Goggles that let Luna see heat trails, air pressure shifts, and invisible paths. Helps her predict enemy moves, detect hidden traps. They sync with her Stormrider for precision during high-speed flight.', 'uploads/custom-images/gadget_attack_1753525379_5.webp', '2025-08-02 08:52:48', '2025-08-02 08:52:48'),
(660, 25, 'Stomper', 'Stomper is Tiggo’s powerful stone hammer, crafted from enchanted rock. With each slam, it sends out shockwaves, breaks terrain, and launches enemies. It also helps Tiggo recharge his Earth energy, making it both a weapon and a source of strength.', 'uploads/custom-images/gadget_attack_1753286364_0.webp', '2025-08-02 08:57:12', '2025-08-02 08:57:12'),
(661, 25, 'Turbo', 'Turbo is Tiggo’s wild, earth-crystal-powered dirt bike, built with a rugged, beast-like design. It jumps across rocky terrain, fires boulder blasts, and roars through mud and jungle with unstoppable speed. Perfect for quick escapes or crashing into battle, Turbo is Tiggo’s ultimate ride across Fabland.', 'uploads/custom-images/gadget_attack_1753286385_1.webp', '2025-08-02 08:57:12', '2025-08-02 08:57:12'),
(662, 25, 'Geo Blasters', 'Geo Blasters are stone-tech gauntlets that fire vibrating shockwaves, earth energy blasts, and even echo-locate hidden secrets underground. Perfect for cave combat and stunning enemies, they channel Tiggo’s Earth power with every punch and pulse.', 'uploads/custom-images/gadget_attack_1753286385_2.webp', '2025-08-02 08:57:12', '2025-08-02 08:57:12'),
(663, 25, 'Terra Blade', 'The Terra Blade is a sleek, fossil-forged weapon designed for precise, elegant Earthline slashes. Infused with ancient mineral energy, it can split into dual crystal daggers, perfect for stealth missions and fast, focused combat. Light yet deadly, it\'s Tiggo’s go-to for close-range finesse.', 'uploads/custom-images/gadget_attack_1753286410_3.webp', '2025-08-02 08:57:12', '2025-08-02 08:57:12'),
(664, 25, 'Rocker', 'A living Earth-forged armor that wraps around Tiggo like a second skin during battle. It instinctively grows stronger with each blow it absorbs, forming tougher plates and spiked barriers. Rocker can expand to shield teammates, reflect incoming attacks, and anchor Tiggo like an immovable force. The more it protects, the more power it stores—becoming Tiggo’s ultimate defense in the harshest terrains.', 'uploads/custom-images/gadget_attack_1753286410_4.webp', '2025-08-02 08:57:12', '2025-08-02 08:57:12'),
(665, 25, 'Slash Fangs', 'Slash Fangs are sharp, glowing crystal-bark claws that grow with Tiggo’s Earth pulse. He uses them to slash enemies, dig through terrain, climb walls, and unleash fast fury combos. Their crystal tips are tough enough to deflect energy attacks, making them perfect for agile, close-up combat.', 'uploads/custom-images/gadget_attack_1753286410_5.webp', '2025-08-02 08:57:12', '2025-08-02 08:57:12'),
(716, 31, 'Trident of Aqualis', 'A sacred weapon gifted by the mystic guardian Aqualis, this elegant trident channels the raw energy of the ocean. With it, Waver can summon tidal waves, create water shields, and command aquatic forces with pinpoint precision.', 'uploads/custom-images/gadget_attack_1754129564_0.webp', '2025-08-03 10:24:37', '2025-08-03 10:24:37'),
(717, 31, 'Tide Chaser', 'A sleek, Hybrid Jet water glider designed for speed and stealth. Powered by hydropulse engines and guided by Waver’s elemental link, Tidechaser allows her to race through underwater currents or skim the ocean surface effortlessly.', 'uploads/custom-images/gadget_attack_1754128575_1.webp', '2025-08-03 10:24:37', '2025-08-03 10:24:37'),
(718, 31, 'AquaLink', 'A sleek, ocean-blue wristband with a glowing spiral seashell at its center. The Shell Syncer lets Waver telepathically connect with sea creatures, sense underwater disturbances, and coordinate movements during battles—her vital link to all aquatic life.', 'uploads/custom-images/gadget_attack_1754130318_2.webp', '2025-08-03 10:24:37', '2025-08-03 10:24:37'),
(719, 31, 'Aqua Rapters', 'Sleek, shark-head-shaped arm blasters crafted from Aqua Realm’s deep-sea alloys. The Aqua Rapters fire concentrated hydro-beams, launch freeze bursts that can trap enemies in ice, and shoot high-pressure bubble jets for rapid water propulsion or defense', 'uploads/custom-images/gadget_attack_1754216409_3.webp', '2025-08-03 10:24:37', '2025-08-03 10:24:37'),
(720, 31, 'Nymara', 'A luminous, ocean-blessed relic formed from the crystallized Tear of Aqualis. Nymara blooms in Waver’s presence, releasing gentle healing waves that mend wounds and soothe pain — a symbol of resilience, grace, and the ocean’s quiet power.', 'uploads/custom-images/gadget_attack_1754131379_4.webp', '2025-08-03 10:24:37', '2025-08-03 10:24:37'),
(759, 32, 'LightWing', 'A futuristic golden-blue jet glider shaped like stylized wings of light. Designed for precision and agility, LightWing allows Ollie to soar through air currents, scout terrain, and perform swift aerial maneuvers during missions.', 'uploads/custom-images/gadget_attack_1754305005_0.webp', '2025-08-05 11:30:25', '2025-08-05 11:30:25'),
(760, 32, 'Halo', 'A sleek, floating halo-like device that hovers just above Ollie’s head. Infused with ancient light-tech, HaloSynth acts as his personal AI assistant — analyzing threats, predicting enemy moves, and projecting holographic plans mid-air.', 'uploads/custom-images/gadget_attack_1754305005_1.webp', '2025-08-05 11:30:25', '2025-08-05 11:30:25'),
(761, 32, 'Lumion Guardian', 'A rare celestial stag with crystalline antlers and glowing fur patterns, Lumion is the embodiment of purity and guidance. As Ollie’s Light Guardian, Lumion channels divine energy to protect, heal, and reveal hidden truths — serving as a radiant symbol of inner peace and wisdom', 'uploads/custom-images/gadget_attack_1754305005_2.webp', '2025-08-05 11:30:25', '2025-08-05 11:30:25'),
(762, 32, 'Mindmites', 'Lightsprites are Ollie’s floating mini-drones with glowing hands, guided by his HaloSynth. They scan, repair, and build instantly from his blueprints—tiny, bright helpers that act as extensions of his brilliant mind.', 'uploads/custom-images/gadget_attack_1754307419_3.webp', '2025-08-05 11:30:25', '2025-08-05 11:30:25'),
(800, 33, 'Shadow Breakers', 'Forged from collapsed star metal and infused with volatile Void energy, the Shadowbreakers are twin axes wielded by Kane. Each blade crackles with violet flares and ancient runes, designed for fast, deadly strikes.', 'uploads/custom-images/gadget_attack_1754397856_0.webp', '2025-08-06 11:25:58', '2025-08-06 11:25:58'),
(801, 33, 'Draxar', 'Forged from ancient dragon-tech and infused with shadow energy, Draxar is a one-of-a-kind jetbike ridden only by Kane. With glowing dragon-eye headlights, violet-veined wheels, and a sleek, stealth-optimized spine design, Drakaris blazes across the battlefield like a myth reborn—silent, fast, and unstoppable.', 'uploads/custom-images/gadget_attack_1754476611_1.webp', '2025-08-06 11:25:58', '2025-08-06 11:25:58'),
(802, 33, 'Vornyx', 'Forged in the void forges beneath the Shadow Legion fortress, Vornyx is a cursed relic of ancient stealth and power. Its obsidian blade hums with silent rage, laced with pulsing violet rune veins. Crafted to strike without sound, Vornyx feeds on the fear and shadows of the battlefield. Only Kane can wield its silent wrath.', 'uploads/custom-images/gadget_attack_1754477634_2.webp', '2025-08-06 11:25:58', '2025-08-06 11:25:58'),
(803, 33, 'Nyxcloak', 'Woven from shadow-thread under the forgotten moons of the Dark Realm, the Nyxcloak is a relic of pure stealth. Named after the primordial spirit of night, it allows Kane to bend light, silence sound, and vanish into living shadow. When activated, the cloak flickers like dissolving smoke, blurring Kane’s form until he becomes little more than a phantom in motion.', 'uploads/custom-images/gadget_attack_1754478252_3.webp', '2025-08-06 11:25:58', '2025-08-06 11:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `character_galleries`
--

CREATE TABLE `character_galleries` (
  `id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `character_galleries`
--

INSERT INTO `character_galleries` (`id`, `character_id`, `image`, `updated_at`, `created_at`) VALUES
(51, 24, 'uploads/gallery/gallery_1752841284_0.avif', '2025-07-18 12:21:24', '2025-07-18 12:21:24'),
(52, 24, 'uploads/gallery/gallery_1752841284_1.avif', '2025-07-18 12:21:24', '2025-07-18 12:21:24'),
(53, 24, 'uploads/gallery/gallery_1752841284_2.avif', '2025-07-18 12:21:24', '2025-07-18 12:21:24'),
(54, 24, 'uploads/gallery/gallery_1752841284_3.avif', '2025-07-18 12:21:24', '2025-07-18 12:21:24'),
(55, 24, 'uploads/gallery/gallery_1752841284_4.avif', '2025-07-18 12:21:24', '2025-07-18 12:21:24'),
(56, 24, 'uploads/gallery/gallery_1752841284_5.avif', '2025-07-18 12:21:24', '2025-07-18 12:21:24'),
(66, 25, 'uploads/gallery/gallery_1753286132_0.webp', '2025-07-23 15:55:32', '2025-07-23 15:55:32'),
(67, 25, 'uploads/gallery/gallery_1753286132_1.webp', '2025-07-23 15:55:32', '2025-07-23 15:55:32'),
(68, 25, 'uploads/gallery/gallery_1753286132_2.webp', '2025-07-23 15:55:32', '2025-07-23 15:55:32'),
(69, 25, 'uploads/gallery/gallery_1753286132_3.webp', '2025-07-23 15:55:32', '2025-07-23 15:55:32'),
(70, 25, 'uploads/gallery/gallery_1753286132_4.webp', '2025-07-23 15:55:32', '2025-07-23 15:55:32'),
(71, 25, 'uploads/gallery/gallery_1753286132_5.webp', '2025-07-23 15:55:32', '2025-07-23 15:55:32'),
(72, 25, 'uploads/gallery/gallery_1753286132_6.webp', '2025-07-23 15:55:32', '2025-07-23 15:55:32'),
(73, 25, 'uploads/gallery/gallery_1753286132_7.webp', '2025-07-23 15:55:32', '2025-07-23 15:55:32'),
(76, 26, 'uploads/gallery/gallery_1753425694_0.webp', '2025-07-25 06:41:34', '2025-07-25 06:41:34'),
(77, 26, 'uploads/gallery/gallery_1753425694_1.webp', '2025-07-25 06:41:34', '2025-07-25 06:41:34'),
(78, 26, 'uploads/gallery/gallery_1753425694_2.webp', '2025-07-25 06:41:34', '2025-07-25 06:41:34'),
(79, 26, 'uploads/gallery/gallery_1753425694_3.webp', '2025-07-25 06:41:34', '2025-07-25 06:41:34'),
(80, 26, 'uploads/gallery/gallery_1753426048_0.webp', '2025-07-25 06:47:28', '2025-07-25 06:47:28'),
(81, 26, 'uploads/gallery/gallery_1753426344_0.png', '2025-07-25 06:52:24', '2025-07-25 06:52:24'),
(84, 26, 'uploads/gallery/gallery_1753523601_0.webp', '2025-07-26 09:53:21', '2025-07-26 09:53:21'),
(85, 26, 'uploads/gallery/gallery_1753525379_0.webp', '2025-07-26 10:22:59', '2025-07-26 10:22:59'),
(86, 27, 'uploads/gallery/gallery_1753530577_0.webp', '2025-07-26 11:49:37', '2025-07-26 11:49:37'),
(87, 27, 'uploads/gallery/gallery_1753530577_1.webp', '2025-07-26 11:49:37', '2025-07-26 11:49:37'),
(88, 27, 'uploads/gallery/gallery_1753677647_0.webp', '2025-07-28 04:40:47', '2025-07-28 04:40:47'),
(90, 27, 'uploads/gallery/gallery_1753682020_1.webp', '2025-07-28 05:53:40', '2025-07-28 05:53:40'),
(91, 27, 'uploads/gallery/gallery_1753682020_2.webp', '2025-07-28 05:53:40', '2025-07-28 05:53:40'),
(92, 27, 'uploads/gallery/gallery_1753682020_3.webp', '2025-07-28 05:53:40', '2025-07-28 05:53:40'),
(93, 27, 'uploads/gallery/gallery_1753682327_0.webp', '2025-07-28 05:58:47', '2025-07-28 05:58:47'),
(94, 27, 'uploads/gallery/gallery_1753683039_0.webp', '2025-07-28 06:10:39', '2025-07-28 06:10:39'),
(95, 28, 'uploads/gallery/gallery_1753787570_0.webp', '2025-07-29 11:12:50', '2025-07-29 11:12:50'),
(96, 28, 'uploads/gallery/gallery_1753787570_1.webp', '2025-07-29 11:12:50', '2025-07-29 11:12:50'),
(98, 28, 'uploads/gallery/gallery_1753788616_0.webp', '2025-07-29 11:30:16', '2025-07-29 11:30:16'),
(99, 28, 'uploads/gallery/gallery_1753788616_1.webp', '2025-07-29 11:30:16', '2025-07-29 11:30:16'),
(100, 28, 'uploads/gallery/gallery_1753792030_0.webp', '2025-07-29 12:27:10', '2025-07-29 12:27:10'),
(101, 28, 'uploads/gallery/gallery_1753792030_1.webp', '2025-07-29 12:27:10', '2025-07-29 12:27:10'),
(102, 28, 'uploads/gallery/gallery_1754113372_0.webp', '2025-08-02 05:42:52', '2025-08-02 05:42:52'),
(103, 28, 'uploads/gallery/gallery_1754116000_0.webp', '2025-08-02 06:26:40', '2025-08-02 06:26:40'),
(104, 31, 'uploads/gallery/gallery_1754128209_0.webp', '2025-08-02 09:50:09', '2025-08-02 09:50:09'),
(105, 31, 'uploads/gallery/gallery_1754128209_1.webp', '2025-08-02 09:50:09', '2025-08-02 09:50:09'),
(106, 31, 'uploads/gallery/gallery_1754128209_2.webp', '2025-08-02 09:50:09', '2025-08-02 09:50:09'),
(107, 31, 'uploads/gallery/gallery_1754128225_0.webp', '2025-08-02 09:50:25', '2025-08-02 09:50:25'),
(108, 31, 'uploads/gallery/gallery_1754128225_1.webp', '2025-08-02 09:50:25', '2025-08-02 09:50:25'),
(109, 31, 'uploads/gallery/gallery_1754128225_2.webp', '2025-08-02 09:50:25', '2025-08-02 09:50:25'),
(111, 31, 'uploads/gallery/gallery_1754128238_1.webp', '2025-08-02 09:50:38', '2025-08-02 09:50:38'),
(112, 31, 'uploads/gallery/gallery_1754131327_0.webp', '2025-08-02 10:42:07', '2025-08-02 10:42:07'),
(113, 32, 'uploads/gallery/gallery_1754305005_0.webp', '2025-08-04 10:56:45', '2025-08-04 10:56:45'),
(114, 32, 'uploads/gallery/gallery_1754305005_1.webp', '2025-08-04 10:56:45', '2025-08-04 10:56:45'),
(115, 32, 'uploads/gallery/gallery_1754305005_2.webp', '2025-08-04 10:56:45', '2025-08-04 10:56:45'),
(116, 32, 'uploads/gallery/gallery_1754306172_0.webp', '2025-08-04 11:16:12', '2025-08-04 11:16:12'),
(117, 32, 'uploads/gallery/gallery_1754306172_1.webp', '2025-08-04 11:16:12', '2025-08-04 11:16:12'),
(118, 32, 'uploads/gallery/gallery_1754306172_2.webp', '2025-08-04 11:16:12', '2025-08-04 11:16:12'),
(119, 32, 'uploads/gallery/gallery_1754309201_0.webp', '2025-08-04 12:06:41', '2025-08-04 12:06:41'),
(120, 32, 'uploads/gallery/gallery_1754314337_0.webp', '2025-08-04 13:32:17', '2025-08-04 13:32:17'),
(121, 33, 'uploads/gallery/gallery_1754397856_0.webp', '2025-08-05 12:44:16', '2025-08-05 12:44:16'),
(123, 33, 'uploads/gallery/gallery_1754397856_2.webp', '2025-08-05 12:44:16', '2025-08-05 12:44:16'),
(124, 33, 'uploads/gallery/gallery_1754397856_3.webp', '2025-08-05 12:44:16', '2025-08-05 12:44:16'),
(125, 33, 'uploads/gallery/gallery_1754398216_0.webp', '2025-08-05 12:50:16', '2025-08-05 12:50:16'),
(126, 33, 'uploads/gallery/gallery_1754476611_0.webp', '2025-08-06 10:36:51', '2025-08-06 10:36:51'),
(127, 33, 'uploads/gallery/gallery_1754477634_0.webp', '2025-08-06 10:53:54', '2025-08-06 10:53:54'),
(128, 33, 'uploads/gallery/gallery_1754477634_1.webp', '2025-08-06 10:53:54', '2025-08-06 10:53:54'),
(129, 33, 'uploads/gallery/gallery_1754478252_0.webp', '2025-08-06 11:04:12', '2025-08-06 11:04:12');

-- --------------------------------------------------------

--
-- Table structure for table `character_mystic_forms`
--

CREATE TABLE `character_mystic_forms` (
  `id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `character_mystic_forms`
--

INSERT INTO `character_mystic_forms` (`id`, `character_id`, `title`, `description`, `image`, `updated_at`, `created_at`) VALUES
(488, 28, 'Cub Form', 'A bright young bear cub with glowing golden eyes and tiny gear-shaped markings on his fur. Always fixing gadgets with oversized goggles and a patchy tool vest, Bolt is a natural inventor with big dreams and a bigger heart.', 'uploads/custom-images/mystic_form_1753787570_0.webp', '2025-08-02 08:38:29', '2025-08-02 08:38:29'),
(489, 28, 'Wielder Form', 'Now a teen hero in his yellow-black Titan Armor, Bolt wields the Hourblade Wrench and a glowing hourglass core that grants him control over time. Smart, fast, and precise, he balances courage with invention.', 'uploads/custom-images/mystic_form_1753787570_1.webp', '2025-08-02 08:38:29', '2025-08-02 08:38:29'),
(490, 28, 'Guardian Form', 'In his prime as the Timebound Sentinel, Bolt rides Titanox, his massive Iron Bison. His armor is fused with ancient time-tech, and a mystic visor scans timelines for danger. Surrounded by floating gears and temporal energy, he now guards the future itself.', 'uploads/custom-images/mystic_form_1753787570_2.webp', '2025-08-02 08:38:29', '2025-08-02 08:38:29'),
(491, 27, 'Cub Form', 'A small red panda cub with matted fur, torn slave cloth remnants, and glowing orange eyes. Blaze unknowingly emits heat waves when upset and sometimes sparks small flames when startled. His eyes show fear and also hope with hidden fire waiting to rise.', 'uploads/custom-images/mystic_form_1753530339_0.webp', '2025-08-02 08:41:30', '2025-08-02 08:41:30'),
(492, 27, 'Wielder Form', 'Now a bold teenage warrior, Blaze wears flame-forged armor marked with battle scars and tribal fire engravings. With his twin weapons — Blazlink  and Flare Jet  — he commands fire with precision, speed, and raw fury.', 'uploads/custom-images/mystic_form_1753530577_1.webp', '2025-08-02 08:41:30', '2025-08-02 08:41:30'),
(493, 27, 'Guardian Form', 'Blaze transcends into a mythical phoenix-fused avatar, merging with the celestial flame beast Skarion. His body glows with molten patterns, wings of ember trail behind him, and every step ignites the ground. He becomes the Flamebound Protector, guardian of Inferno Core and eternal fire itself.', 'uploads/custom-images/mystic_form_1753677647_2.webp', '2025-08-02 08:41:30', '2025-08-02 08:41:30'),
(497, 26, 'Cub Form', 'Luna is a playful baby bunny with fluffy white fur, wind-tufted ears that flutter with every breeze, and wide, sky-blue eyes filled with wonder. Each hop she takes sends a gentle swirl of air around her, as if the wind dances with her joy. Curious and imaginative and also Fast.', 'uploads/custom-images/mystic_form_1753425667_0.webp', '2025-08-02 08:52:48', '2025-08-02 08:52:48'),
(498, 26, 'Wielder Form', 'As a teen, Luna becomes a swift and agile air wielder. Wearing sleek, sky-toned wind armor adorned with feathers and air emblems, she moves like a breeze—gliding above the ground, flipping through tight spaces, and vanishing into thin air. She wields Stormrider, her signature hoverboard infused with wind energy, along with air-charged gadgets that amplify her speed and control over currents', 'uploads/custom-images/mystic_form_1753425667_1.webp', '2025-08-02 08:52:48', '2025-08-02 08:52:48'),
(499, 26, 'Guardian Form', 'In her final evolution, Luna fuses with the mighty Falcon Guardian Aeron, transforming into a majestic sky warrior. Her winged armor radiates streaks of silver and soft blue, glowing with the essence of the skies. Massive ethereal wings extend from her back, allowing her to soar at sonic speeds and summon cyclones with a wave of her hand.', 'uploads/custom-images/mystic_form_1753425667_2.webp', '2025-08-02 08:52:48', '2025-08-02 08:52:48'),
(500, 25, 'Cub Form', 'Tiggo begins as a curious and kind-hearted baby tiger in Fabville. With glowing green eyes and a natural connection to the earth, he can sense vibrations and even move rocks using his emotions. Though small, his spirit is mighty, and the earth already whispers to him in quiet ways.', 'uploads/custom-images/mystic_form_1753286132_0.webp', '2025-08-02 08:57:12', '2025-08-02 08:57:12'),
(501, 25, 'Wielder Form', 'Now, Tiggo becomes a true Earth Wielder. Wearing mystical stone-forged armor, he wields his signature Stomper and Terrablade. With them, he can shake the ground, form stone shields, and battle the Shadow Legion head-on. He leads with heart, growing stronger as he learns to master the balance between emotion and power.', 'uploads/custom-images/mystic_form_1753286132_1.webp', '2025-08-02 08:57:12', '2025-08-02 08:57:12'),
(502, 25, 'Guardian Form', 'In his final form, Tiggo fuses with the Earth’s Mystic Guardian, transforming into the ultimate Terra Protector. His armor glows with ancient runes and crystal veins, and he can summon rock titans, shift terrain, and protect entire regions. Strong, wise, and deeply connected to the planet, Tiggo becomes the shield of Fabland.', 'uploads/custom-images/mystic_form_1753096727_2.png', '2025-08-02 08:57:12', '2025-08-02 08:57:12'),
(557, 31, 'Cub Form', 'A joyful baby otter from Aqua Realm, full of laughter and curiosity. She plays by the shore with her sea friends, wearing a seaweed wrap and a glowing shell pendant that hints at her hidden destiny.', 'uploads/custom-images/mystic_form_1754128209_0.webp', '2025-08-03 10:24:37', '2025-08-03 10:24:37'),
(558, 31, 'Wielder Form', 'Now a brave young hero, Waver wields the magical Trident of Aqualis. With flowing ocean armor and a kind heart, she bends water with grace, defending her realm while believing in the power of karma.', 'uploads/custom-images/mystic_form_1754128209_1.webp', '2025-08-03 10:24:37', '2025-08-03 10:24:37'),
(559, 31, 'Guardian Form', 'A majestic water guardian fused with Aqualis, the Mystic Sea Serpent. Glowing with deep-sea energy and wisdom, she commands the tides and protects all realms with her awakened trident and serene strength.', 'uploads/custom-images/mystic_form_1754128209_2.webp', '2025-08-03 10:24:37', '2025-08-03 10:24:37'),
(624, 32, 'Cub Form', 'A curious baby owl with oversized glasses, a tiny satchel of tools, and a big heart. Ollie is always inventing things, fixing gadgets, and keeping the team grounded. He’s the “brain” of the FablePals even in his earliest days.', 'uploads/custom-images/mystic_form_1754305005_0.webp', '2025-08-05 11:30:25', '2025-08-05 11:30:25'),
(625, 32, 'Wielder Form', 'Wearing a sleek golden-blue robe with glowing patterns, Ollie stands tall with calm authority. Armed with his HaloSynth and soaring on his LightWing glider, he channels the power of light through wisdom, strategy, and speed.', 'uploads/custom-images/mystic_form_1754305005_1.webp', '2025-08-05 11:30:25', '2025-08-05 11:30:25'),
(626, 32, 'Guardian Form', 'Guardian Ollie dons flowing celestial robes and wields a glowing Light Staff. His presence radiates balance and clarity. With Lumion at his side and light flares surrounding him, he guides others not with force, but with insight and vision.', 'uploads/custom-images/mystic_form_1754305005_2.webp', '2025-08-05 11:30:25', '2025-08-05 11:30:25'),
(699, 33, 'Cub Form', 'A small lion cub with dusty golden fur and crimson eyes full of fear and longing. He wears a torn tunic from his life in slavery, with a glowing crystal shard around his neck—his only link to the past. This form marks the beginning of Kane’s journey from orphan to weapon.', 'uploads/custom-images/mystic_form_1754397856_0.webp', '2025-08-06 11:25:58', '2025-08-06 11:25:58'),
(700, 33, 'Shadow Knight', 'As a teenage lion, Kane becomes a stealth assassin in the Shadow Legion. Clad in black stealth armor with violet runes and flaring cape, he wields twin Void Axes that emit dark energy. Emotionless and silent.', 'uploads/custom-images/mystic_form_1754397856_1.webp', '2025-08-06 11:25:58', '2025-08-06 11:25:58'),
(701, 33, 'Wielder Form', 'Now awakened to his true purpose, Kane dons hybrid armor blending dark steel and mystic metals. One crimson eye flickers with light, the other holds shadows. A powerful Shadow Gauntlet pulses on his arm, symbolizing his inner war.', 'uploads/custom-images/mystic_form_1754397856_2.webp', '2025-08-06 11:25:58', '2025-08-06 11:25:58'),
(702, 33, 'Guardian Form', 'Fully transformed, Kane becomes the Guardian of Balance, merging with the Shadow Guardian. He wears dual-tone celestial armor—half obsidian etched with violet veins, half radiant silver with golden glyphs. Kane finally find peace between dark and light.', 'uploads/custom-images/mystic_form_1754397856_3.webp', '2025-08-06 11:25:58', '2025-08-06 11:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `character_translations`
--

CREATE TABLE `character_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `project_category` varchar(255) DEFAULT NULL,
  `seo_title` text DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `character_translations`
--

INSERT INTO `character_translations` (`id`, `character_id`, `lang_code`, `title`, `description`, `project_category`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(29, 24, 'en', 'Lion Warrior', '<p>\"I&rsquo;m Tiggo, a brave little cub who found a glowing earth crystal and heard the Earth whisper. That moment changed everything.&nbsp;From playful paws to powerful protector, I now lead my friends to uncover the lost elements and defend Fabland. With courage, heart, and the strength of the ground beneath me&mdash;I&rsquo;ll stop the shadows and restore the balance.\"</p>\r\n<p>\"I&rsquo;m Tiggo, a brave little cub who found a glowing earth crystal and heard the Earth whisper. That moment changed everything.From playful paws to powerful protector, I now lead my friends to uncover the lost elements and defend Fabland. With courage, heart, and the strength of the ground beneath me&mdash;I&rsquo;ll stop the shadows and restore the balance.\"</p>\r\n<p>\"I&rsquo;m Tiggo, a brave little cub who found a glowing earth crystal and heard the Earth whisper. That moment changed everything.From playful paws to powerful protector, I now lead my friends to uncover the lost elements and defend Fabland. With courage, heart, and the strength of the ground beneath me&mdash;I&rsquo;ll stop the shadows and restore the balance.\"</p>\r\n<p>\"I&rsquo;m Tiggo, a brave little cub who found a glowing earth crystal and heard the Earth whisper. That moment changed everything.&nbsp;From playful paws to powerful protector, I now lead my friends to uncover the lost elements and defend Fabland. With courage, heart, and the strength of the ground beneath me&mdash;I&rsquo;ll stop the shadows and restore the balance.\"</p>', NULL, NULL, NULL, '2025-07-18 12:21:24', '2025-07-19 12:53:53'),
(30, 25, 'en', 'Tiggo - The Leader', '<p style=\"text-align: center;\" data-start=\"228\" data-end=\"517\">&ldquo;I&rsquo;m Tiggo, a brave little cub from the deep jungles of <strong data-start=\"284\" data-end=\"299\">Terra Prime</strong>. I used to chase fireflies and climb vines with nothing but dreams in my head and dirt on my paws. But everything changed the day I discovered a <strong data-start=\"445\" data-end=\"470\">glowing earth crystal</strong> hidden beneath the ancient roots of FabTemple.&nbsp;When I touched it, I heard the Earth itself whisper to me &mdash; not in words, but in feelings. Strong. Warm. Ancient. That moment awakened something inside me&hellip; something powerful. I wasn&rsquo;t just playing in the jungle anymore. I had become part of something far greater.</p>\r\n<p data-start=\"789\" data-end=\"1018\">From playful paws to a <strong data-start=\"812\" data-end=\"836\">protector of Fabland</strong>, I now lead my friends &mdash; Luna, Ollie, Bolt, and more &mdash; on a journey to uncover the <strong data-start=\"920\" data-end=\"945\">lost elemental powers</strong> and defend our world from the creeping shadows of the <strong data-start=\"1000\" data-end=\"1017\">Shadow Legion</strong>. My hammer is forged from the heart of the jungle, my armor glows with the pulse of the planet, and my courage comes from every animal who can&rsquo;t fight for themselves.&nbsp;I may be small, but with the <strong data-start=\"1220\" data-end=\"1257\">strength of the ground beneath me</strong>, and the love of my FabPals beside me &mdash; I&rsquo;ll stop the shadows, restore the balance, and make sure light shines across Fabland once again.&rdquo;</p>\r\n<p style=\"text-align: center;\" data-start=\"196\" data-end=\"902\">Tiggo is the kind of hero every friend wishes they had by their side. He is <strong data-start=\"272\" data-end=\"296\">brave and dependable</strong>, never backing down when danger looms, and always standing tall to protect those in need. Whether it&rsquo;s facing off against a Shadow Legion scout or shielding a friend from falling debris, Tiggo&rsquo;s courage shines brightest in the toughest moments. His <strong data-start=\"546\" data-end=\"560\">kind heart</strong> is just as strong as his hammer &mdash; he never hesitates to help others, no matter how small the task or how big the risk. Tiggo also shows natural leadership, choosing to <strong data-start=\"729\" data-end=\"752\">lead from the front</strong> in every challenge.&nbsp;</p>\r\n<p style=\"text-align: center;\" data-start=\"932\" data-end=\"1679\">But even heroes have flaws. When things don&rsquo;t go as planned, Tiggo can become <strong data-start=\"1010\" data-end=\"1037\">stubborn and frustrated</strong>, often trying to fix everything on his own rather than asking for help. His passionate nature sometimes leads him to <strong data-start=\"1155\" data-end=\"1209\">rush into situations without thinking them through</strong>, acting on instinct instead of strategy. This makes him brave, but also vulnerable in battles that require patience or precision. Another challenge Tiggo faces is that he <strong data-start=\"1381\" data-end=\"1409\">trusts others too easily</strong>. While his pure heart sees the best in everyone, it sometimes blinds him to danger, making him an easy target for deception.&nbsp;</p>\r\n<p style=\"text-align: center;\" data-start=\"1191\" data-end=\"1396\">&nbsp;</p>', NULL, 'Tiggo the Leader – Brave FablePals Hero with Glowing Sword | Official Character Page', 'Meet Tiggo, the fearless tiger cub from FablePals! Discover his backstory, powers, and green-glowing sword. Explore artwork, character evolution, and toys of this determined young hero. Perfect for kids and fans of animal adventures!', '2025-07-21 07:02:04', '2025-07-26 10:48:36'),
(31, 26, 'en', 'Luna - The Speedster', '<p style=\"text-align: center;\">In the heart of <strong data-start=\"253\" data-end=\"265\">Fabville</strong>, a curious little bunny named <strong data-start=\"296\" data-end=\"304\">Luna</strong> dreamed not of battles or powers&mdash;but of becoming the <strong data-start=\"358\" data-end=\"410\">world&rsquo;s most famous influencer and news reporter</strong>. With her handmade mic crafted from a cloud-feather quill and a big personality to match, Luna zipped through the village with wind-tufted ears and sky-blue eyes, always chasing the next scoop.&nbsp; That moment came when a strange darkness began creeping into the outer regions beyond Fabville. Together with her best friends&mdash;<strong data-start=\"1146\" data-end=\"1155\">Tiggo ,</strong>&nbsp;<strong data-start=\"1183\" data-end=\"1192\">Ollie</strong>&nbsp;and <strong data-start=\"1227\" data-end=\"1235\">Bolt</strong> - Luna set off on their first great journey. Their destination: Cave Tree of <strong data-start=\"1346\" data-end=\"1354\">Toko</strong>, the wise tortoise and ancient Guardian whisperer.</p>\r\n<p style=\"text-align: center;\" data-start=\"1407\" data-end=\"1820\">There, under starlight and prophecy, <strong data-start=\"1444\" data-end=\"1478\">Toko revealed an ancient truth</strong>: One with the wind in her voice and swiftness in her soul would awaken the Air Element and lead the skies to freedom. As the prophecy echoed, a powerful gust surrounded Luna&mdash;<strong data-start=\"1655\" data-end=\"1684\">her inner energy unlocked</strong>. Her ears lifted, her feet glided, and her speed surged like never before. She wasn&rsquo;t just fast anymore&mdash;she was <strong data-start=\"1797\" data-end=\"1819\">meant for the wind. </strong>Guided by Toko&rsquo;s wisdom, the team journeyed to the cloud islands of <strong data-start=\"1890\" data-end=\"1905\">Aero Zenith</strong>, a sky realm of floating temples, ancient storms, and wind-forged machines.&nbsp;</p>\r\n<p style=\"text-align: center;\" data-start=\"2081\" data-end=\"2321\">With Stormrider in hand&mdash;an air-infused hoverboard that returned with truth&mdash;Luna rose as the <strong data-start=\"2172\" data-end=\"2187\">Air Wielder</strong>. She learned that real power wasn\'t just speed&mdash;it was <strong data-start=\"2242\" data-end=\"2320\">focus, clarity, and knowing when to ride the wind&hellip; and when to let it lead</strong>.&nbsp;In her final trial, Luna merged with the spirit of the <strong data-start=\"2378\" data-end=\"2397\">Falcon Guardian Aeron</strong>, transforming into a <strong data-start=\"2419\" data-end=\"2450\">winged warrior of the skies</strong>. With soaring armor and eyes full of purpose, she took her place not just as a reporter of stories&mdash;but as a <strong data-start=\"2559\" data-end=\"2579\">maker of destiny</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"37\" data-end=\"389\">Luna&rsquo;s greatest strength lies in her <strong data-start=\"74\" data-end=\"157\">incredible speed, sharp observation skills, and unwavering drive for perfection</strong>. As the Air Wielder, she glides through battles with agility and delivers swift, precise strikes using her wind-powered gadgets. . However, Luna&rsquo;s biggest weakness is her <strong data-start=\"431\" data-end=\"445\">impatience</strong>&mdash;she often rushes into action without waiting for the full picture. Her perfectionism can also overwhelm her, making her frustrated when things don&rsquo;t go exactly as planned. Learning to slow down and trust the moment is her ongoing challenge.</p>\r\n<p style=\"text-align: center;\" data-start=\"2584\" data-end=\"2691\">From a bunny with a dream to a legend of the wind, <strong data-start=\"2639\" data-end=\"2691\">Luna&rsquo;s voice now carries not just news&mdash;but hope.</strong></p>', NULL, 'Luna – The Wind Wielder | FablePals Character Profile', 'Meet Luna, the high-flying bunny hero of FablePals! Master of air and speed, Luna uses her Stormrider armor, Aeropiercer thread, and Zaplets boots to outmaneuver enemies. Discover her powers, gadgets, backstory, and how she shapes the skies in the FablePals universe.', '2025-07-23 11:07:42', '2025-07-26 10:44:45'),
(32, 27, 'en', 'Blaze - The Warrior', '<p style=\"text-align: center;\" data-start=\"244\" data-end=\"815\">Blaze was born a red panda cub in the volcanic lands of <strong data-start=\"300\" data-end=\"316\">Inferno Core</strong>, where magma rivers lit the night sky and fire was life itself. His earliest memories were of warmth&mdash;not just from the lava, but from his mother, a revered flame sage who protected their hidden village. But everything changed when the <strong data-start=\"552\" data-end=\"569\">Shadow Legion</strong> launched a surprise assault. In the chaos, Blaze was torn from his mother, who vanished without a trace while shielding others. He was captured, chained, and thrown into the mines of the Shadow World, forced into a life of slavery as just a cub.</p>\r\n<p style=\"text-align: center;\" data-start=\"817\" data-end=\"1265\">Years passed in silence and suffering, but deep within Blaze, a spark never died. That spark ignited the moment he discovered the <strong data-start=\"947\" data-end=\"961\">Flame Core</strong>, buried beneath molten rock. It didn&rsquo;t burn him&mdash;it bonded with him. The core recognized his pain, his strength, and his potential. Blaze erupted in fire, breaking free and leading a resistance that scorched through the slave pits. That day, the Shadow Legion lost a prisoner&mdash;and gained a powerful enemy.&nbsp;Clad in armor forged from living flame and wielding the twin power of <strong data-start=\"1337\" data-end=\"1349\">Blazlink</strong> (his chained blade) and the jet-fueled wings of <strong data-start=\"1398\" data-end=\"1411\">Flare Jet</strong>, Blaze became a myth among his people. He rallied the broken, protected scattered fireborn clans, and vowed to one day uncover the truth about his mother&rsquo;s fate. Even as a warrior, he never stopped searching&mdash;hoping she still lived or watching over him through the flames.</p>\r\n<p style=\"text-align: center;\" data-start=\"817\" data-end=\"1265\">Though Blaze once fought alone, fate brought him face-to-face with the <strong data-start=\"2750\" data-end=\"2763\">FablePals</strong>. At first reluctant to join, he saw in them something he had long lost&mdash;trust, friendship, and shared purpose. Eventually, Blaze chose to stand with the Fab Heroes, becoming their flame in the shadows as they embarked on their most critical mission yet: the <strong data-start=\"3021\" data-end=\"3060\">quest to uncover the Mystic Element</strong>, a power that could save&mdash;or doom&mdash;the realms.</p>\r\n<p style=\"text-align: center;\" data-start=\"817\" data-end=\"1265\">Blaze commands intense firepower and aerial agility, fueled by passion and pain. His strength comes from his fierce will and mastery of flame. But his emotions can cloud judgment, and his unresolved past&mdash;especially the loss of his mother&mdash;makes him vulnerable when pushed too far.</p>\r\n<h6 class=\"sr-only\">&nbsp;</h6>', NULL, 'Blaze – The Fire Wielder of Inferno Core | FablePals Universe', 'Meet Blaze, the brave red panda from Inferno Core in the FablePals Universe. Discover his powerful fire abilities, mysterious past, and heroic journey from slavery to resistance. Explore his story, powers, and epic role in the FablePals adventure!', '2025-07-26 10:08:52', '2025-07-28 06:28:45'),
(33, 28, 'en', 'Bolt - The Genius Mechanic', '<p style=\"text-align: center;\" data-start=\"151\" data-end=\"405\">Bolt was always the odd one out.&nbsp;A young bear with oversized goggles, clunky paws, and a head full of wild ideas. While other cubs soared, sprinted, or showed off their skills, Bolt was usually buried under scraps &mdash; fixing, failing, and trying again. The others teased him &mdash; called him names, laughed when his gadgets exploded, or when his robotic bird flew straight into walls.&nbsp;But through it all, his parents stood by him. They saw the spark in him. They reminded him: &ldquo;Great things take time, and time has chosen you.&rdquo;</p>\r\n<p style=\"text-align: center;\" data-start=\"683\" data-end=\"841\">Still, Bolt struggled. Nothing worked the way he wanted. His machines broke. His confidence cracked.&nbsp;Until the day the <strong data-start=\"804\" data-end=\"820\">Time Element</strong> awakened within him.&nbsp;A surge of golden energy rewired more than his inventions &mdash; it rewired him.&nbsp;Suddenly, he could see timelines, predict malfunctions, correct mistakes before they even happened. The curious cub had become a genius inventor &mdash; not just fixing the present, but upgrading the future.</p>\r\n<p style=\"text-align: center;\" data-start=\"1128\" data-end=\"1360\">Now, Bolt stands tall beside the FablePals team &mdash; armored in his mighty <strong data-start=\"1200\" data-end=\"1214\">Titan Suit</strong>, powered by a glowing hourglass core.&nbsp;He rides <strong data-start=\"1264\" data-end=\"1275\">Titanox</strong>, the Iron Bison, through the rivers of time, defending realities and rewriting fate.&nbsp;With his best friend <strong data-start=\"1383\" data-end=\"1392\">Ollie</strong>, Bolt builds the gadgets, shields, and portals that keep the team one step ahead. From grappling vines to plasma gliders, his creations power every mission.</p>\r\n<p style=\"text-align: center;\" data-start=\"0\" data-end=\"487\">Bolt is a fiercely inventive bear cub, known for crafting brilliant gadgets and powerful armor upgrades no one else could imagine. His mind races with ideas, always finding clever solutions to even the toughest problems. Beneath his tech genius, he&rsquo;s a true protector &mdash; using his inventions and massive Titan Armor not to show off, but to shield his friends when danger strikes. Loyal to the core, Bolt stands by his team through every challenge, never backing down once trust is earned.</p>\r\n<p style=\"text-align: center;\" data-start=\"489\" data-end=\"1052\" data-is-last-node=\"\" data-is-only-node=\"\">But behind that brave face lies a tangle of struggles. Bolt is a perfectionist, constantly chasing flaws in his own work, never feeling it&rsquo;s quite &ldquo;good enough.&rdquo; He overworks himself, pouring long hours into fixes and upgrades, often ignoring his own limits. Even when his best friend Ollie offers to help, Bolt finds it hard to accept &mdash; believing it&rsquo;s his responsibility alone. Deep down, he\'s still haunted by early failures when his gadgets malfunctioned. That fear drives him to never let the team down again, even if it means breaking himself in the process.</p>\r\n<p style=\"text-align: center;\" data-start=\"1551\" data-end=\"1635\">Once mocked for broken bolts &mdash; now, he is the bolt that holds the future together.</p>', NULL, 'Bolt the Inventor Bear | FablePals Hero for Kids | Fablepals Universe', 'Meet Bolt – the genius bear cub from FablePals! Discover his inventions, Titan Armor, and story of courage, friendship & growth. Perfect for kids & parents.', '2025-07-28 06:58:37', '2025-07-29 12:36:21'),
(34, 29, 'en', 'Testing', '<p>Test</p>', NULL, NULL, NULL, '2025-08-01 08:33:23', '2025-08-01 08:33:23'),
(35, 30, 'en', 'Bolt - The Genius', '<p style=\"text-align: center;\" data-start=\"151\" data-end=\"405\">Bolt was always the odd one out.&nbsp;A young bear with oversized goggles, clunky paws, and a head full of wild ideas. While other cubs soared, sprinted, or showed off their skills, Bolt was usually buried under scraps &mdash; fixing, failing, and trying again. The others teased him &mdash; called him names, laughed when his gadgets exploded, or when his robotic bird flew straight into walls.&nbsp;But through it all, his parents stood by him. They saw the spark in him. They reminded him: &ldquo;Great things take time, and time has chosen you.&rdquo;</p>\r\n<p style=\"text-align: center;\" data-start=\"683\" data-end=\"841\">Still, Bolt struggled. Nothing worked the way he wanted. His machines broke. His confidence cracked.&nbsp;Until the day the <strong data-start=\"804\" data-end=\"820\">Time Element</strong> awakened within him.&nbsp;A surge of golden energy rewired more than his inventions &mdash; it rewired him.&nbsp;Suddenly, he could see timelines, predict malfunctions, correct mistakes before they even happened. The curious cub had become a genius inventor &mdash; not just fixing the present, but upgrading the future.</p>\r\n<p style=\"text-align: center;\" data-start=\"1128\" data-end=\"1360\">Now, Bolt stands tall beside the FablePals team &mdash; armored in his mighty <strong data-start=\"1200\" data-end=\"1214\">Titan Suit</strong>, powered by a glowing hourglass core.&nbsp;He rides <strong data-start=\"1264\" data-end=\"1275\">Titanox</strong>, the Iron Bison, through the rivers of time, defending realities and rewriting fate.&nbsp;With his best friend <strong data-start=\"1383\" data-end=\"1392\">Ollie</strong>, Bolt builds the gadgets, shields, and portals that keep the team one step ahead. From grappling vines to plasma gliders, his creations power every mission.</p>\r\n<p style=\"text-align: center;\" data-start=\"0\" data-end=\"487\">Bolt is a fiercely inventive bear cub, known for crafting brilliant gadgets and powerful armor upgrades no one else could imagine. His mind races with ideas, always finding clever solutions to even the toughest problems. Beneath his tech genius, he&rsquo;s a true protector &mdash; using his inventions and massive Titan Armor not to show off, but to shield his friends when danger strikes. Loyal to the core, Bolt stands by his team through every challenge, never backing down once trust is earned.</p>\r\n<p style=\"text-align: center;\" data-start=\"489\" data-end=\"1052\" data-is-last-node=\"\" data-is-only-node=\"\">But behind that brave face lies a tangle of struggles. Bolt is a perfectionist, constantly chasing flaws in his own work, never feeling it&rsquo;s quite &ldquo;good enough.&rdquo; He overworks himself, pouring long hours into fixes and upgrades, often ignoring his own limits. Even when his best friend Ollie offers to help, Bolt finds it hard to accept &mdash; believing it&rsquo;s his responsibility alone. Deep down, he\'s still haunted by early failures when his gadgets malfunctioned. That fear drives him to never let the team down again, even if it means breaking himself in the process.</p>\r\n<p style=\"text-align: center;\" data-start=\"1551\" data-end=\"1635\">Once mocked for broken bolts &mdash; now, he is the bolt that holds the future together.</p>', NULL, NULL, NULL, '2025-08-01 11:23:49', '2025-08-01 11:32:06'),
(36, 31, 'en', 'Waver - The Playful Wielder', '<p style=\"text-align: center;\" data-start=\"178\" data-end=\"474\">Born on the crystal-blue shores of Aqua Realm, Waver began as a cheerful otter cub whose laughter echoed through coral groves and tide pools. Full of curiosity and compassion, she made friends with every creature of the sea, unknowingly carrying a deep connection to the water element within her.&nbsp;As darkness crept into the realm, Waver&rsquo;s innocence was tested. Her tribe, once respected, betrayed the realm&rsquo;s ancient harmony for personal power. Branded as outcasts, Waver and her family were cast away, left to survive in the outer reefs. But destiny had greater plans&mdash;chosen by the mystic serpent guardian Aqualis, Waver awakened her Wielder form, gracefully channeling the power of water with her shimmering <strong data-start=\"889\" data-end=\"909\">Trident of Tides</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"912\" data-end=\"1255\">Through loss, betrayal, and the rising threat of shadow forces, Waver remained steadfast in her belief that karma always finds its way. She fights not with fury, but with flow&mdash;guided by emotion and empathy. Alongside the other FablePals heroes, she joins the journey to recover the mystic elements and restore balance to their fractured world.&nbsp;Eventually, her spirit fused with Aqualis, elevating her into her <strong data-start=\"1323\" data-end=\"1340\">Guardian Form</strong>&mdash;a mature, powerful version of herself that harmonizes the might of the sea with the serenity of its depths. Now a beacon of hope, Waver commands ocean currents to protect the innocent and bring peace across realms.</p>\r\n<p style=\"text-align: center;\" data-start=\"912\" data-end=\"1255\">Waver&rsquo;s strength lies in her empathy&mdash;her ability to feel and heal. She connects deeply with all life around her and can sense emotional shifts like tides. Her water powers make her agile, unpredictable, and calming in battle. Guided by karmic luck and spiritual instincts, she often turns challenges into turning points.</p>\r\n<p style=\"text-align: center;\" data-start=\"1930\" data-end=\"2194\">Her open heart makes her vulnerable to betrayal. Emotional turmoil can cloud her control, causing surges in her water abilities. Outside aquatic zones, her powers weaken. At times, her belief in karma delays her actions, risking hesitation during critical moments.</p>\r\n<p style=\"text-align: center;\" data-start=\"1930\" data-end=\"2194\">\"Flow with compassion, strike with purpose &mdash; the tides always turn for those who believe.\"</p>', NULL, 'Waver – The Water Wielder of Aqua Realm | FablePals Official', 'Meet Waver, the joyful otter from Aqua Realm and the chosen Water Wielder in the FablePals universe. Discover her story of betrayal, kindness, and rising strength. Explore her gadgets like the Trident of Aqualis, AquaLink, Nymara, Aqua Raptors, and Hydro Wings.', '2025-08-02 08:13:36', '2025-08-03 10:20:09'),
(37, 32, 'en', 'Ollie - The Mastermind', '<p style=\"text-align: center;\" data-start=\"176\" data-end=\"821\">From his early days in Fabville, Ollie the baby owl always stood apart&mdash;not because he sought attention, but because he was quietly curious about how everything worked. While others played, Ollie dismantled toys to study their mechanics, scribbled blueprints, and built prototypes in his treehouse lab. A natural-born strategist and inventor, he soon earned a reputation as the &ldquo;brain&rdquo; of the FablePals, often devising rescue plans, decoding ancient maps, and upgrading the team\'s gadgets. Yet Ollie wasn&rsquo;t just a clever mind&mdash;he had a heart filled with justice, and though he appeared cautious, he never hesitated when his friends were in danger.</p>\r\n<p style=\"text-align: center;\" data-start=\"823\" data-end=\"1429\">Ollie\'s journey took a turn when he uncovered mysterious blueprints embedded with light-coded glyphs. The signals led him to a hidden temple buried deep under Fabville, where a divine being&mdash;<strong data-start=\"1013\" data-end=\"1023\">Lumion</strong>, the Light Guardian&mdash;awaited his arrival. Chosen as the Wielder of Light, Ollie was gifted the <strong data-start=\"1118\" data-end=\"1131\">Halo</strong>, an AI-infused headband that amplified his perception, memory, and tactics, and granted him access to the <strong data-start=\"1238\" data-end=\"1251\">Lightwing</strong>, his personal air glider. Over time, he developed advanced tools like the mini floating drones that could illuminate, scout, or disable enemies with precision.</p>\r\n<p style=\"text-align: center;\" data-start=\"1431\" data-end=\"1832\">As Ollie matured into his <strong data-start=\"1457\" data-end=\"1474\">Guardian Form</strong>, he shed his shy demeanor and took on the mantle of a wise tactician and calm protector. Clad in radiant golden robes traced with ethereal blue patterns, he now floats through the battlefield as both strategist and light-wielder&mdash;hovering with grace and leading with intellect. Despite his growth, Ollie never loses the spark of that curious cub he once was.</p>\r\n<p style=\"text-align: center;\" data-start=\"1431\" data-end=\"1832\">Ollie&rsquo;s greatest strength lies in his brilliant mind. As a master tactician and inventor, he can assess situations with clarity and precision, often coming up with clever solutions before others even spot the problem.he uses his light-based abilities to disorient enemies, create illusions, and shield his allies, making him a valuable support on the field. Beyond his intellect, Ollie&rsquo;s calm presence and emotional balance help ground the team, often serving as the voice of reason when tensions rise.</p>\r\n<p style=\"text-align: center;\" data-start=\"1431\" data-end=\"1832\">Despite his brilliance, Ollie isn&rsquo;t built for brute-force confrontations. He relies heavily on his gadgets and planning, which makes him vulnerable in fast-paced or chaotic fights. His tendency to overanalyze can sometimes lead to hesitation or missed opportunities. Emotionally, Ollie often keeps his feelings guarded, choosing logic over connection, which can create distance between him and others.</p>\r\n<p style=\"text-align: center;\" data-start=\"1431\" data-end=\"1832\"><br>\"Illuminate the path. Outsmart the shadows.\"</p>', NULL, 'Ollie - The Mastermind | Fablepals Universe | Fablepals Heroes', 'Ollie is mind of Fabteam. He is Light Element Wielder', '2025-08-03 12:30:17', '2025-08-05 11:30:25'),
(38, 33, 'en', 'Kane - The Prodigal Knight', '<p style=\"text-align: center;\" data-start=\"231\" data-end=\"485\">In a forgotten corner of the galaxy, tragedy struck. A peaceful star system near the borders of the Dark Realm was reduced to ash by an unknown force. From the ruins, a lone lion cub was found&mdash;scared, hungry, and surrounded by silence. His name was Kane.&nbsp;Taken in by the feared Shadow Legion, Kane was raised not with comfort, but with command. Under strict and merciless training, the once-fragile cub grew into a formidable warrior&mdash;a shadow in motion, a blade without hesitation. Clad in obsidian armor and trained in the ways of stealth and dark combat, Kane earned his title among the Shadow Legion: the Silent Flame.</p>\r\n<p style=\"text-align: center;\" data-start=\"855\" data-end=\"1107\">But even in the deepest darkness, something within Kane quietly resisted. Faint flashes of lost memories&hellip; a burning sense of something unfinished. Whispers in his dreams. Moments of hesitation on the battlefield. And questions that no one dared answer.&nbsp;As ancient energies across the realms begin to stir, Kane is pulled into a growing storm&mdash;one that challenges everything he has ever known. The line between right and wrong begins to blur, and the fate of the Mystic Realms may one day rest in the hands of the lion who walks alone.</p>\r\n<p style=\"text-align: center;\" data-start=\"1109\" data-end=\"1389\">Kane is a master of <strong data-start=\"139\" data-end=\"157\">stealth combat</strong>, trained in the brutal arts of the Shadow Legion. His agility, speed, and precision make him lethal in close-quarters combat, often defeating enemies before they even sense his presence. As the <strong data-start=\"352\" data-end=\"373\">Wielder of Shadow</strong>, he can manipulate darkness to disappear, confuse opponents, or launch surprise attacks. His mind is sharp and tactical, always ten steps ahead in a fight.</p>\r\n<p style=\"text-align: center;\" data-start=\"1109\" data-end=\"1389\">Kane&rsquo;s greatest strength is also his deepest flaw&mdash;<strong data-start=\"744\" data-end=\"794\">he walks a fine line between control and chaos</strong>. The shadow energy he commands is unstable, constantly tempting him with power beyond limits. Prolonged use of cursed weapons like Vornyx can erode his focus and self-trust. While he excels alone, his instinct to isolate himself often leaves him vulnerable to emotional manipulation. His struggle with identity and past trauma can cloud judgment, especially when faced with enemies who remind him of his former life in the Legion.</p>\r\n<p style=\"text-align: center;\" data-start=\"1391\" data-end=\"1496\">He was shaped by shadows.&nbsp;But something greater waits within.<br data-start=\"1454\" data-end=\"1457\">His true story&hellip; is only just beginning.</p>', NULL, 'Kane & Drekaris – Shadow Guardian Bond | FablePals Universe', 'Discover the epic bond between Kane, the Shadow Wielder, and his ancient dragon guardian, Drekaris. Explore their lore, powers, and mystic connection in the FablePals Universe. Legendary strength, shadow energy, and destiny collide.', '2025-08-05 11:17:27', '2025-08-06 11:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `config` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `config`, `value`, `created_at`, `updated_at`) VALUES
(1, 'setup_stage', '5', '2025-05-04 09:05:04', '2025-05-04 09:05:45'),
(2, 'setup_complete', '1', '2025-05-04 09:05:04', '2026-02-02 08:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_sections`
--

CREATE TABLE `contact_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone_two` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_two` varchar(255) DEFAULT NULL,
  `map` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_sections`
--

INSERT INTO `contact_sections` (`id`, `address`, `phone`, `phone_two`, `email`, `email_two`, `map`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'reseedestate@gmail.com', NULL, 'https://', '2025-05-04 09:05:05', '2025-11-26 10:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'afghanistan', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(2, 'albania', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(3, 'algeria', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(4, 'andorra', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(5, 'angola', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(6, 'antigua-and-barbuda', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(7, 'argentina', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(8, 'armenia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(9, 'australia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(10, 'austria', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(11, 'azerbaijan', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(12, 'bahamas', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(13, 'bahrain', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(14, 'bangladesh', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(15, 'barbados', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(16, 'belarus', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(17, 'belgium', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(18, 'belize', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(19, 'benin', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(20, 'bhutan', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(21, 'bolivia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(22, 'bosnia-and-herzegovina', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(23, 'botswana', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(24, 'brazil', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(25, 'brunei', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(26, 'bulgaria', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(27, 'burkina-faso', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(28, 'burundi', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(29, 'cambodia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(30, 'cameroon', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(31, 'canada', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(32, 'cape-verde', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(33, 'central-african-republic', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(34, 'chad', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(35, 'chile', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(36, 'china', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(37, 'colombi', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(38, 'comoros', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(39, 'congo-brazzaville', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(40, 'congo', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(41, 'costa-rica', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(42, 'cote-d-ivoire', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(43, 'croatia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(44, 'cuba', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(45, 'cyprus', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(46, 'czech-republic', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(47, 'denmark', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(48, 'djibouti', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(49, 'dominica', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(50, 'dominican-republic', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(51, 'east-timor-timor-timur', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(52, 'ecuador', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(53, 'egypt', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(54, 'el-salvador', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(55, 'equatorial-guinea', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(56, 'eritrea', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(57, 'estonia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(58, 'ethiopia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(59, 'fiji', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(60, 'finland', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(61, 'france', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(62, 'gabon', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(63, 'gambia-the', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(64, 'georgia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(65, 'germany', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(66, 'ghana', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(67, 'greece', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(68, 'grenada', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(69, 'guatemala', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(70, 'guinea', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(71, 'guinea-bissau', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(72, 'guyana', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(73, 'haiti', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(74, 'honduras', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(75, 'hungary', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(76, 'iceland', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(77, 'india', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(78, 'indonesia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(79, 'iran', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(80, 'iraq', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(81, 'ireland', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(82, 'israel', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(83, 'italy', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(84, 'jamaica', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(85, 'japan', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(86, 'jordan', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(87, 'kazakhstan', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(88, 'kenya', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(89, 'kiribati', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(90, 'korea-north', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(91, 'korea-south', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(92, 'kuwait', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(93, 'kyrgyzstan', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(94, 'laos', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(95, 'latvia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(96, 'lebanon', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(97, 'lesotho', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(98, 'liberia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(99, 'libya', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(100, 'liechtenstein', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(101, 'lithuania', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(102, 'luxembourg', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(103, 'macedonia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(104, 'madagascar', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(105, 'malawi', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(106, 'malaysia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(107, 'maldives', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(108, 'mali', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(109, 'malta', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(110, 'marshall-islands', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(111, 'mauritania', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(112, 'mauritius', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(113, 'mexico', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(114, 'micronesia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(115, 'moldova', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(116, 'monaco', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(117, 'mongolia', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(118, 'morocco', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(119, 'mozambique', 1, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(120, 'myanmar', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(121, 'namibia', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(122, 'nauru', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(123, 'nepal', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(124, 'netherlands', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(125, 'new-zealand', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(126, 'nicaragua', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(127, 'niger', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(128, 'nigeria', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(129, 'norway', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(130, 'oman', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(131, 'pakistan', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(132, 'palau', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(133, 'panama', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(134, 'papua-new-guinea', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(135, 'paraguay', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(136, 'peru', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(137, 'philippines', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(138, 'poland', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(139, 'portugal', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(140, 'qatar', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(141, 'romania', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(142, 'russia', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(143, 'rwanda', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(144, 'saint-kitts-and-nevis', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(145, 'saint-lucia', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(146, 'saint-vincent', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(147, 'samoa', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(148, 'san-marino', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(149, 'sao-tome-and-principe', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(150, 'saudi-arabia', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(151, 'senegal', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(152, 'serbia-and-montenegro', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(153, 'seychelles', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(154, 'sierra-leone', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(155, 'singapore', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(156, 'slovakia', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(157, 'slovenia', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(158, 'solomon-islands', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(159, 'somalia', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(160, 'south-africa', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(161, 'spain', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(162, 'sri-lanka', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(163, 'sudan', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(164, 'suriname', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(165, 'swaziland', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(166, 'sweden', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(167, 'switzerland', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(168, 'syria', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(169, 'taiwan', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(170, 'tajikistan', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(171, 'tanzania', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(172, 'thailand', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(173, 'togo', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(174, 'tonga', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(175, 'trinidad-and-tobago', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(176, 'tunisia', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(177, 'turkey', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(178, 'turkmenistan', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(179, 'tuvalu', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(180, 'uganda', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(181, 'ukraine', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(182, 'united-arab-emirates', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(183, 'united-kingdom', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(184, 'united-states', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(185, 'uruguay', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(186, 'uzbekistan', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(187, 'vanuatu', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(188, 'vatican-city', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(189, 'venezuela', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(190, 'vietnam', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(191, 'yemen', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(192, 'zambia', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(193, 'zimbabwe', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `country_translations`
--

CREATE TABLE `country_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_translations`
--

INSERT INTO `country_translations` (`id`, `country_id`, `lang_code`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Afghanistan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(2, 1, 'hi', 'Afghanistan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(4, 2, 'en', 'Albania', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(5, 2, 'hi', 'Albania', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(7, 3, 'en', 'Algeria', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(8, 3, 'hi', 'Algeria', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(10, 4, 'en', 'Andorra', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(11, 4, 'hi', 'Andorra', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(13, 5, 'en', 'Angola', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(14, 5, 'hi', 'Angola', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(16, 6, 'en', 'Antigua and Barbuda', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(17, 6, 'hi', 'Antigua and Barbuda', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(19, 7, 'en', 'Argentina', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(20, 7, 'hi', 'Argentina', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(22, 8, 'en', 'Armenia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(23, 8, 'hi', 'Armenia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(25, 9, 'en', 'Australia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(26, 9, 'hi', 'Australia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(28, 10, 'en', 'Austria', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(29, 10, 'hi', 'Austria', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(31, 11, 'en', 'Azerbaijan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(32, 11, 'hi', 'Azerbaijan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(34, 12, 'en', 'Bahamas', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(35, 12, 'hi', 'Bahamas', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(37, 13, 'en', 'Bahrain', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(38, 13, 'hi', 'Bahrain', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(40, 14, 'en', 'Bangladesh', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(41, 14, 'hi', 'Bangladesh', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(43, 15, 'en', 'Barbados', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(44, 15, 'hi', 'Barbados', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(46, 16, 'en', 'Belarus', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(47, 16, 'hi', 'Belarus', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(49, 17, 'en', 'Belgium', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(50, 17, 'hi', 'Belgium', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(52, 18, 'en', 'Belize', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(53, 18, 'hi', 'Belize', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(55, 19, 'en', 'Benin', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(56, 19, 'hi', 'Benin', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(58, 20, 'en', 'Bhutan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(59, 20, 'hi', 'Bhutan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(61, 21, 'en', 'Bolivia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(62, 21, 'hi', 'Bolivia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(64, 22, 'en', 'Bosnia and Herzegovina', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(65, 22, 'hi', 'Bosnia and Herzegovina', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(67, 23, 'en', 'Botswana', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(68, 23, 'hi', 'Botswana', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(70, 24, 'en', 'Brazil', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(71, 24, 'hi', 'Brazil', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(73, 25, 'en', 'Brunei', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(74, 25, 'hi', 'Brunei', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(76, 26, 'en', 'Bulgaria', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(77, 26, 'hi', 'Bulgaria', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(79, 27, 'en', 'Burkina Faso', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(80, 27, 'hi', 'Burkina Faso', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(82, 28, 'en', 'Burundi', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(83, 28, 'hi', 'Burundi', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(85, 29, 'en', 'Cambodia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(86, 29, 'hi', 'Cambodia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(88, 30, 'en', 'Cameroon', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(89, 30, 'hi', 'Cameroon', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(91, 31, 'en', 'Canada', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(92, 31, 'hi', 'Canada', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(94, 32, 'en', 'Cape Verde', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(95, 32, 'hi', 'Cape Verde', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(97, 33, 'en', 'Central African Republic', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(98, 33, 'hi', 'Central African Republic', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(100, 34, 'en', 'Chad', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(101, 34, 'hi', 'Chad', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(103, 35, 'en', 'Chile', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(104, 35, 'hi', 'Chile', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(106, 36, 'en', 'China', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(107, 36, 'hi', 'China', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(109, 37, 'en', 'Colombi', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(110, 37, 'hi', 'Colombi', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(112, 38, 'en', 'Comoros', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(113, 38, 'hi', 'Comoros', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(115, 39, 'en', 'Congo (Brazzaville)', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(116, 39, 'hi', 'Congo (Brazzaville)', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(118, 40, 'en', 'Congo', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(119, 40, 'hi', 'Congo', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(121, 41, 'en', 'Costa Rica', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(122, 41, 'hi', 'Costa Rica', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(124, 42, 'en', 'Cote d\'Ivoire', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(125, 42, 'hi', 'Cote d\'Ivoire', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(127, 43, 'en', 'Croatia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(128, 43, 'hi', 'Croatia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(130, 44, 'en', 'Cuba', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(131, 44, 'hi', 'Cuba', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(133, 45, 'en', 'Cyprus', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(134, 45, 'hi', 'Cyprus', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(136, 46, 'en', 'Czech Republic', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(137, 46, 'hi', 'Czech Republic', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(139, 47, 'en', 'Denmark', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(140, 47, 'hi', 'Denmark', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(142, 48, 'en', 'Djibouti', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(143, 48, 'hi', 'Djibouti', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(145, 49, 'en', 'Dominica', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(146, 49, 'hi', 'Dominica', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(148, 50, 'en', 'Dominican Republic', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(149, 50, 'hi', 'Dominican Republic', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(151, 51, 'en', 'East Timor (Timor Timur)', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(152, 51, 'hi', 'East Timor (Timor Timur)', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(154, 52, 'en', 'Ecuador', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(155, 52, 'hi', 'Ecuador', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(157, 53, 'en', 'Egypt', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(158, 53, 'hi', 'Egypt', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(160, 54, 'en', 'El Salvador', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(161, 54, 'hi', 'El Salvador', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(163, 55, 'en', 'Equatorial Guinea', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(164, 55, 'hi', 'Equatorial Guinea', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(166, 56, 'en', 'Eritrea', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(167, 56, 'hi', 'Eritrea', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(169, 57, 'en', 'Estonia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(170, 57, 'hi', 'Estonia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(172, 58, 'en', 'Ethiopia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(173, 58, 'hi', 'Ethiopia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(175, 59, 'en', 'Fiji', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(176, 59, 'hi', 'Fiji', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(178, 60, 'en', 'Finland', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(179, 60, 'hi', 'Finland', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(181, 61, 'en', 'France', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(182, 61, 'hi', 'France', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(184, 62, 'en', 'Gabon', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(185, 62, 'hi', 'Gabon', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(187, 63, 'en', 'Gambia, The', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(188, 63, 'hi', 'Gambia, The', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(190, 64, 'en', 'Georgia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(191, 64, 'hi', 'Georgia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(193, 65, 'en', 'Germany', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(194, 65, 'hi', 'Germany', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(196, 66, 'en', 'Ghana', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(197, 66, 'hi', 'Ghana', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(199, 67, 'en', 'Greece', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(200, 67, 'hi', 'Greece', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(202, 68, 'en', 'Grenada', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(203, 68, 'hi', 'Grenada', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(205, 69, 'en', 'Guatemala', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(206, 69, 'hi', 'Guatemala', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(208, 70, 'en', 'Guinea', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(209, 70, 'hi', 'Guinea', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(211, 71, 'en', 'Guinea-Bissau', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(212, 71, 'hi', 'Guinea-Bissau', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(214, 72, 'en', 'Guyana', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(215, 72, 'hi', 'Guyana', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(217, 73, 'en', 'Haiti', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(218, 73, 'hi', 'Haiti', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(220, 74, 'en', 'Honduras', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(221, 74, 'hi', 'Honduras', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(223, 75, 'en', 'Hungary', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(224, 75, 'hi', 'Hungary', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(226, 76, 'en', 'Iceland', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(227, 76, 'hi', 'Iceland', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(229, 77, 'en', 'India', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(230, 77, 'hi', 'India', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(232, 78, 'en', 'Indonesia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(233, 78, 'hi', 'Indonesia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(235, 79, 'en', 'Iran', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(236, 79, 'hi', 'Iran', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(238, 80, 'en', 'Iraq', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(239, 80, 'hi', 'Iraq', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(241, 81, 'en', 'Ireland', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(242, 81, 'hi', 'Ireland', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(244, 82, 'en', 'Israel', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(245, 82, 'hi', 'Israel', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(247, 83, 'en', 'Italy', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(248, 83, 'hi', 'Italy', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(250, 84, 'en', 'Jamaica', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(251, 84, 'hi', 'Jamaica', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(253, 85, 'en', 'Japan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(254, 85, 'hi', 'Japan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(256, 86, 'en', 'Jordan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(257, 86, 'hi', 'Jordan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(259, 87, 'en', 'Kazakhstan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(260, 87, 'hi', 'Kazakhstan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(262, 88, 'en', 'Kenya', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(263, 88, 'hi', 'Kenya', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(265, 89, 'en', 'Kiribati', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(266, 89, 'hi', 'Kiribati', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(268, 90, 'en', 'Korea, North', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(269, 90, 'hi', 'Korea, North', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(271, 91, 'en', 'Korea, South', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(272, 91, 'hi', 'Korea, South', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(274, 92, 'en', 'Kuwait', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(275, 92, 'hi', 'Kuwait', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(277, 93, 'en', 'Kyrgyzstan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(278, 93, 'hi', 'Kyrgyzstan', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(280, 94, 'en', 'Laos', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(281, 94, 'hi', 'Laos', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(283, 95, 'en', 'Latvia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(284, 95, 'hi', 'Latvia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(286, 96, 'en', 'Lebanon', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(287, 96, 'hi', 'Lebanon', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(289, 97, 'en', 'Lesotho', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(290, 97, 'hi', 'Lesotho', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(292, 98, 'en', 'Liberia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(293, 98, 'hi', 'Liberia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(295, 99, 'en', 'Libya', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(296, 99, 'hi', 'Libya', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(298, 100, 'en', 'Liechtenstein', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(299, 100, 'hi', 'Liechtenstein', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(301, 101, 'en', 'Lithuania', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(302, 101, 'hi', 'Lithuania', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(304, 102, 'en', 'Luxembourg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(305, 102, 'hi', 'Luxembourg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(307, 103, 'en', 'Macedonia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(308, 103, 'hi', 'Macedonia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(310, 104, 'en', 'Madagascar', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(311, 104, 'hi', 'Madagascar', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(313, 105, 'en', 'Malawi', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(314, 105, 'hi', 'Malawi', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(316, 106, 'en', 'Malaysia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(317, 106, 'hi', 'Malaysia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(319, 107, 'en', 'Maldives', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(320, 107, 'hi', 'Maldives', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(322, 108, 'en', 'Mali', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(323, 108, 'hi', 'Mali', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(325, 109, 'en', 'Malta', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(326, 109, 'hi', 'Malta', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(328, 110, 'en', 'Marshall Islands', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(329, 110, 'hi', 'Marshall Islands', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(331, 111, 'en', 'Mauritania', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(332, 111, 'hi', 'Mauritania', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(334, 112, 'en', 'Mauritius', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(335, 112, 'hi', 'Mauritius', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(337, 113, 'en', 'Mexico', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(338, 113, 'hi', 'Mexico', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(340, 114, 'en', 'Micronesia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(341, 114, 'hi', 'Micronesia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(343, 115, 'en', 'Moldova', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(344, 115, 'hi', 'Moldova', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(346, 116, 'en', 'Monaco', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(347, 116, 'hi', 'Monaco', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(349, 117, 'en', 'Mongolia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(350, 117, 'hi', 'Mongolia', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(352, 118, 'en', 'Morocco', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(353, 118, 'hi', 'Morocco', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(355, 119, 'en', 'Mozambique', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(356, 119, 'hi', 'Mozambique', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(358, 120, 'en', 'Myanmar', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(359, 120, 'hi', 'Myanmar', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(361, 121, 'en', 'Namibia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(362, 121, 'hi', 'Namibia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(364, 122, 'en', 'Nauru', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(365, 122, 'hi', 'Nauru', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(367, 123, 'en', 'Nepal', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(368, 123, 'hi', 'Nepal', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(370, 124, 'en', 'Netherlands', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(371, 124, 'hi', 'Netherlands', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(373, 125, 'en', 'New Zealand', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(374, 125, 'hi', 'New Zealand', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(376, 126, 'en', 'Nicaragua', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(377, 126, 'hi', 'Nicaragua', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(379, 127, 'en', 'Niger', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(380, 127, 'hi', 'Niger', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(382, 128, 'en', 'Nigeria', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(383, 128, 'hi', 'Nigeria', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(385, 129, 'en', 'Norway', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(386, 129, 'hi', 'Norway', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(388, 130, 'en', 'Oman', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(389, 130, 'hi', 'Oman', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(391, 131, 'en', 'Pakistan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(392, 131, 'hi', 'Pakistan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(394, 132, 'en', 'Palau', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(395, 132, 'hi', 'Palau', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(397, 133, 'en', 'Panama', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(398, 133, 'hi', 'Panama', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(400, 134, 'en', 'Papua New Guinea', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(401, 134, 'hi', 'Papua New Guinea', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(403, 135, 'en', 'Paraguay', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(404, 135, 'hi', 'Paraguay', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(406, 136, 'en', 'Peru', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(407, 136, 'hi', 'Peru', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(409, 137, 'en', 'Philippines', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(410, 137, 'hi', 'Philippines', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(412, 138, 'en', 'Poland', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(413, 138, 'hi', 'Poland', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(415, 139, 'en', 'Portugal', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(416, 139, 'hi', 'Portugal', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(418, 140, 'en', 'Qatar', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(419, 140, 'hi', 'Qatar', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(421, 141, 'en', 'Romania', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(422, 141, 'hi', 'Romania', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(424, 142, 'en', 'Russia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(425, 142, 'hi', 'Russia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(427, 143, 'en', 'Rwanda', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(428, 143, 'hi', 'Rwanda', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(430, 144, 'en', 'Saint Kitts and Nevis', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(431, 144, 'hi', 'Saint Kitts and Nevis', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(433, 145, 'en', 'Saint Lucia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(434, 145, 'hi', 'Saint Lucia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(436, 146, 'en', 'Saint Vincent', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(437, 146, 'hi', 'Saint Vincent', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(439, 147, 'en', 'Samoa', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(440, 147, 'hi', 'Samoa', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(442, 148, 'en', 'San Marino', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(443, 148, 'hi', 'San Marino', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(445, 149, 'en', 'Sao Tome and Principe', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(446, 149, 'hi', 'Sao Tome and Principe', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(448, 150, 'en', 'Saudi Arabia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(449, 150, 'hi', 'Saudi Arabia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(451, 151, 'en', 'Senegal', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(452, 151, 'hi', 'Senegal', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(454, 152, 'en', 'Serbia and Montenegro', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(455, 152, 'hi', 'Serbia and Montenegro', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(457, 153, 'en', 'Seychelles', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(458, 153, 'hi', 'Seychelles', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(460, 154, 'en', 'Sierra Leone', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(461, 154, 'hi', 'Sierra Leone', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(463, 155, 'en', 'Singapore', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(464, 155, 'hi', 'Singapore', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(466, 156, 'en', 'Slovakia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(467, 156, 'hi', 'Slovakia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(469, 157, 'en', 'Slovenia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(470, 157, 'hi', 'Slovenia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(472, 158, 'en', 'Solomon Islands', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(473, 158, 'hi', 'Solomon Islands', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(475, 159, 'en', 'Somalia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(476, 159, 'hi', 'Somalia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(478, 160, 'en', 'South Africa', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(479, 160, 'hi', 'South Africa', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(481, 161, 'en', 'Spain', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(482, 161, 'hi', 'Spain', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(484, 162, 'en', 'Sri Lanka', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(485, 162, 'hi', 'Sri Lanka', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(487, 163, 'en', 'Sudan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(488, 163, 'hi', 'Sudan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(490, 164, 'en', 'Suriname', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(491, 164, 'hi', 'Suriname', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(493, 165, 'en', 'Swaziland', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(494, 165, 'hi', 'Swaziland', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(496, 166, 'en', 'Sweden', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(497, 166, 'hi', 'Sweden', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(499, 167, 'en', 'Switzerland', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(500, 167, 'hi', 'Switzerland', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(502, 168, 'en', 'Syria', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(503, 168, 'hi', 'Syria', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(505, 169, 'en', 'Taiwan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(506, 169, 'hi', 'Taiwan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(508, 170, 'en', 'Tajikistan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(509, 170, 'hi', 'Tajikistan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(511, 171, 'en', 'Tanzania', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(512, 171, 'hi', 'Tanzania', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(514, 172, 'en', 'Thailand', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(515, 172, 'hi', 'Thailand', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(517, 173, 'en', 'Togo', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(518, 173, 'hi', 'Togo', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(520, 174, 'en', 'Tonga', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(521, 174, 'hi', 'Tonga', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(523, 175, 'en', 'Trinidad and Tobago', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(524, 175, 'hi', 'Trinidad and Tobago', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(526, 176, 'en', 'Tunisia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(527, 176, 'hi', 'Tunisia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(529, 177, 'en', 'Turkey', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(530, 177, 'hi', 'Turkey', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(532, 178, 'en', 'Turkmenistan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(533, 178, 'hi', 'Turkmenistan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(535, 179, 'en', 'Tuvalu', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(536, 179, 'hi', 'Tuvalu', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(538, 180, 'en', 'Uganda', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(539, 180, 'hi', 'Uganda', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(541, 181, 'en', 'Ukraine', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(542, 181, 'hi', 'Ukraine', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(544, 182, 'en', 'United Arab Emirates', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(545, 182, 'hi', 'United Arab Emirates', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(547, 183, 'en', 'United Kingdom', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(548, 183, 'hi', 'United Kingdom', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(550, 184, 'en', 'United States', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(551, 184, 'hi', 'United States', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(553, 185, 'en', 'Uruguay', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(554, 185, 'hi', 'Uruguay', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(556, 186, 'en', 'Uzbekistan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(557, 186, 'hi', 'Uzbekistan', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(559, 187, 'en', 'Vanuatu', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(560, 187, 'hi', 'Vanuatu', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(562, 188, 'en', 'Vatican City', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(563, 188, 'hi', 'Vatican City', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(565, 189, 'en', 'Venezuela', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(566, 189, 'hi', 'Venezuela', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(568, 190, 'en', 'Vietnam', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(569, 190, 'hi', 'Vietnam', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(571, 191, 'en', 'Yemen', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(572, 191, 'hi', 'Yemen', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(574, 192, 'en', 'Zambia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(575, 192, 'hi', 'Zambia', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(577, 193, 'en', 'Zimbabwe', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(578, 193, 'hi', 'Zimbabwe', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `coupon_code` varchar(255) NOT NULL,
  `min_price` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `discount_type` enum('percentage','amount') NOT NULL DEFAULT 'percentage',
  `start_date` varchar(255) NOT NULL,
  `expired_date` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `author_id`, `coupon_code`, `min_price`, `discount`, `discount_type`, `start_date`, `expired_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, '27Y3U', 5.00, 10.00, 'percentage', '2026-01-21', '2026-01-30', 'active', '2025-05-04 09:05:05', '2026-01-26 06:58:11'),
(2, 0, 'NE4YHMA1E', 256.00, 30.00, 'percentage', '2025-10-21', '2026-03-07', 'active', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 0, 'CKP4T', 1648.00, 29.00, 'percentage', '2025-08-06', '2026-04-15', 'active', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 0, 'D45Y6JU', 561.00, 3.00, 'amount', '2025-09-05', '2025-12-02', 'active', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 0, 'VZ7QA78E', 311.00, 19.00, 'percentage', '2025-07-12', '2026-01-21', 'active', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_histories`
--

CREATE TABLE `coupon_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `discount_amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customizable_page_translations`
--

CREATE TABLE `customizable_page_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customizeable_page_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customizable_page_translations`
--

INSERT INTO `customizable_page_translations` (`id`, `customizeable_page_id`, `lang_code`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Terms & Conditions', '<p class=\"MsoNormal\"><strong>Effective Date: [1-04-2025]</strong><br><strong>Owned &amp; Operated by: Reseed Estate LLP &mdash; India</strong></p>\r\n<p class=\"MsoNormal\"><strong>1. Acceptance of Terms</strong></p>\r\n<p class=\"MsoNormal\">By accessing our website, digital platforms, store, or associated services, you agree to these Terms.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>2. Intellectual Property Ownership</strong></p>\r\n<p class=\"MsoNormal\">All characters, visuals, names, designs, text, videos, music tracks, in-app audio, animations and story elements related to the FablePals universe are copyright-protected IP of <strong>Reseed Estate LLP</strong>.</p>\r\n<p class=\"MsoNormal\">Users may not:</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo1; tab-stops: list 36.0pt;\">copy</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo1; tab-stops: list 36.0pt;\">modify</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo1; tab-stops: list 36.0pt;\">redistribute</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo1; tab-stops: list 36.0pt;\">resell</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo1; tab-stops: list 36.0pt;\">commercialize</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo1; tab-stops: list 36.0pt;\">distribute</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo1; tab-stops: list 36.0pt;\">adapt<br>any content without permission.</li>\r\n</ul>\r\n<p class=\"MsoNormal\">This includes posting our copyrighted material on other platforms, channels, or printing physical versions without authorization.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>3. Digital Products &amp; Downloads</strong></p>\r\n<p class=\"MsoNormal\">When purchasing digital files (music, images, storybooks, apps, games, etc.):</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l5 level1 lfo2; tab-stops: list 36.0pt;\">You receive a <strong>personal usage license only</strong></li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l5 level1 lfo2; tab-stops: list 36.0pt;\">You <strong>do not own the IP rights</strong></li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l5 level1 lfo2; tab-stops: list 36.0pt;\">You cannot resell, upload, or publicly distribute or republish</li>\r\n</ul>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>4. Music Player &amp; Audio Content</strong></p>\r\n<p class=\"MsoNormal\">Music and audio content used in the FablePals ecosystem is for private listening only.<br>You may not:</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l6 level1 lfo3; tab-stops: list 36.0pt;\">repost publicly</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l6 level1 lfo3; tab-stops: list 36.0pt;\">remix</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l6 level1 lfo3; tab-stops: list 36.0pt;\">stream elsewhere</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l6 level1 lfo3; tab-stops: list 36.0pt;\">use commercially</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l6 level1 lfo3; tab-stops: list 36.0pt;\">use in video uploads without permission</li>\r\n</ul>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>5. Physical Merchandise</strong></p>\r\n<p class=\"MsoNormal\">When physical merchandise is sold (toys, plushies, apparel, collectibles, etc.), all branding and character likeness remain property of Reseed Estate LLP.</p>\r\n<p class=\"MsoNormal\">Purchasing a product does <strong>not grant</strong> any commercial usage rights.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>6. Website Use</strong></p>\r\n<p class=\"MsoNormal\">You agree not to:</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo4; tab-stops: list 36.0pt;\">misuse or hack the site</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo4; tab-stops: list 36.0pt;\">reverse-engineer site code</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo4; tab-stops: list 36.0pt;\">circumvent purchasing systems</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo4; tab-stops: list 36.0pt;\">use content in AI training datasets</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo4; tab-stops: list 36.0pt;\">scrape content for reproduction</li>\r\n</ul>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>7. Pricing &amp; Payments</strong></p>\r\n<p class=\"MsoNormal\">All prices are subject to change.<br>We reserve the right to adjust pricing and availability.</p>\r\n<p class=\"MsoNormal\">All payments are processed securely via third-party processors.<br>We are not responsible for failures of payment providers.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>8. Refunds</strong></p>\r\n<p class=\"MsoNormal\"><strong>Digital products:</strong></p>\r\n<p class=\"MsoNormal\">All digital purchases are <strong>non-refundable</strong> once downloaded or accessed.</p>\r\n<p class=\"MsoNormal\"><strong>Physical products:</strong></p>\r\n<p class=\"MsoNormal\">Refunds or replacements apply only for:</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l2 level1 lfo5; tab-stops: list 36.0pt;\">defective or damaged goods</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l2 level1 lfo5; tab-stops: list 36.0pt;\">incorrect item sent</li>\r\n</ul>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>9. Social Media Posting</strong></p>\r\n<p class=\"MsoNormal\">Users may share <strong>official published promotional material</strong> (e.g., screenshots or teasers) <strong>with credit</strong>, but not original creative files or internal content.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>10. Termination of User Access</strong></p>\r\n<p class=\"MsoNormal\">We may suspend or terminate accounts that:</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo6; tab-stops: list 36.0pt;\">violate IP rights</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo6; tab-stops: list 36.0pt;\">abuse platform features</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo6; tab-stops: list 36.0pt;\">attempt piracy</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo6; tab-stops: list 36.0pt;\">commit fraud</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo6; tab-stops: list 36.0pt;\">post harmful content</li>\r\n</ul>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>11. Disclaimer</strong></p>\r\n<p class=\"MsoNormal\">FablePals is entertainment-based.<br>We are not liable for:</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l0 level1 lfo7; tab-stops: list 36.0pt;\">user misunderstandings</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l0 level1 lfo7; tab-stops: list 36.0pt;\">third-party platform issues</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l0 level1 lfo7; tab-stops: list 36.0pt;\">external disruptions</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l0 level1 lfo7; tab-stops: list 36.0pt;\">data loss due to user error</li>\r\n</ul>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>12. Governing Law</strong></p>\r\n<p class=\"MsoNormal\">These Terms are governed by Indian law.<br>Legal jurisdiction: Vadodara<strong>, Gujarat, India</strong> (adjustable if needed)</p>', '2025-05-04 09:05:05', '2025-11-26 10:59:13'),
(2, 1, 'hi', 'Terms & Conditions', '<h2 class=\"title\">Who we are</h2>\n                    <p><b>Suggested text:</b> Our website address is: https://yourwebsite.com</p>\n                    <h6 class=\"title\">Comments</h6>\n                    <p><b>Suggested text:</b> When visitors leave comments on the site we collect the data shown\n                        in the comments form, and also the visitor’s IP address and browser user agent string to\n                        help spam detection.</p>\n                    <p>An anonymized string created from your email address (also called a hash) may be provided\n                        to the Gravatar service to see if you are using it. The Gravatar service privacy policy\n                        is available here: https://automattic.com/privacy/. After approval of your comment, your\n                        profile picture is visible to the public in the context of your comment.</p>\n                    <h6 class=\"title\">Media</h6>\n                    <p><b>Suggested text:</b> If you upload images to the website, you should avoid uploading\n                        images with embedded location data (EXIF GPS) included. Visitors to the website can\n                        download and extract any location data from images on the website.</p>\n                    <h6 class=\"title\">Cookies</h6>\n                    <p><b>Suggested text:</b> If you leave a comment on our site you may opt-in to saving your\n                        name, email address and website in\n                        cookies. These are for your convenience so that you do not have to fill in your details\n                        again when you leave another\n                        comment. These cookies will last for one year.</p>\n                    <p>If you visit our login page, we will set a temporary cookie to determine if your browser\n                        accepts cookies. This cookie\n                        contains no personal data and is discarded when you close your browser.</p>\n                    <p>When you log in, we will also set up several cookies to save your login information and\n                        your screen display choices.\n                        Login cookies last for two days, and screen options cookies last for a year. If you\n                        select \"Remember Me\", your login\n                        will persist for two weeks. If you log out of your account, the login cookies will be\n                        removed.</p>\n                    <p>If you edit or publish an article, an additional cookie will be saved in your browser.\n                        This cookie includes no personal\n                        data and simply indicates the post ID of the article you just edited. It expires after 1\n                        day.</p>\n                    <h6 class=\"title\">Embedded content from other websites</h6>\n                    <p><b>Suggested text:</b> Articles on this site may include embedded content (e.g. videos,\n                        images, articles, etc.). Embedded\n                        content from other websites behaves in the exact same way as if the visitor has visited\n                        the other website.</p>\n                    <p>These websites may collect data about you, use cookies, embed additional third-party\n                        tracking, and monitor your\n                        interaction with that embedded content, including tracking your interaction with the\n                        embedded content if you have an\n                        account and are logged in to that website.</p>\n                    <p>For users that register on our website (if any), we also store the personal information\n                        they provide in their user\n                        profile. All users can see, edit, or delete their personal information at any time\n                        (except they cannot change their\n                        username). Website administrators can also see and edit that information. browser user\n                        agent string to help spam detection.</p>', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 2, 'en', 'Privacy Policy', '<p class=\"MsoNormal\"><strong>Effective Date: [1-04-2025]</strong><br><strong>Owned &amp; Operated by: Reseed Estate LLP &mdash; India</strong></p>\r\n<p class=\"MsoNormal\"><strong>1. Introduction</strong></p>\r\n<p class=\"MsoNormal\">Reseed Estate LLP (&ldquo;we&rdquo;, &ldquo;our&rdquo;, &ldquo;us&rdquo;) operates the FablePals digital platforms including website, online store, music player, streaming services, and related interfaces. This Privacy Policy explains how we collect, use, store, and protect personal information of our users (&ldquo;you&rdquo;).</p>\r\n<p class=\"MsoNormal\">By accessing or using our services, you agree to the collection and use of information in accordance with this policy.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>2. Information We Collect</strong></p>\r\n<p class=\"MsoNormal\"><strong>a) Information you provide directly</strong></p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\">Name</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\">Email address</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\">Billing address</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\">Shipping address (when applicable)</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\">Account preferences</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\">When purchasing: phone number or payment info</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l1 level1 lfo1; tab-stops: list 36.0pt;\">For newsletters: email subscription data</li>\r\n</ul>\r\n<p class=\"MsoNormal\"><strong>b) Data collected automatically</strong></p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l2 level1 lfo2; tab-stops: list 36.0pt;\">IP address</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l2 level1 lfo2; tab-stops: list 36.0pt;\">Device information</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l2 level1 lfo2; tab-stops: list 36.0pt;\">Browser type</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l2 level1 lfo2; tab-stops: list 36.0pt;\">Cookies</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l2 level1 lfo2; tab-stops: list 36.0pt;\">Usage behavior and analytics</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l2 level1 lfo2; tab-stops: list 36.0pt;\">Session data</li>\r\n</ul>\r\n<p class=\"MsoNormal\"><strong>c) Payment data</strong></p>\r\n<p class=\"MsoNormal\">Payment processing is handled by third-party payment gateways such as / cashfree / Razorpay / Stripe / PayPal / etc.<br>We <strong>do not store or process your credit/debit card details</strong>.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>3. Use of Information</strong></p>\r\n<p class=\"MsoNormal\">We use collected information for:</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo3; tab-stops: list 36.0pt;\">Processing purchases of digital &amp; physical goods</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo3; tab-stops: list 36.0pt;\">Delivering downloadable content</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo3; tab-stops: list 36.0pt;\">Order confirmation &amp; account communication</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo3; tab-stops: list 36.0pt;\">Maintaining user accounts</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo3; tab-stops: list 36.0pt;\">Improving user experience</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo3; tab-stops: list 36.0pt;\">Analytics and security</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l3 level1 lfo3; tab-stops: list 36.0pt;\">Marketing communications (with consent)</li>\r\n</ul>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>4. Cookies &amp; Tracking</strong></p>\r\n<p class=\"MsoNormal\">Our platform may use cookies to customize user experience and enable authentication. You may disable cookies in your browser settings, but some features may not work.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>5. Data Sharing &amp; Disclosure</strong></p>\r\n<p class=\"MsoNormal\">We do <strong>not</strong> sell or rent personal information.<br>We may share limited information with:</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo4; tab-stops: list 36.0pt;\">Payment processors</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo4; tab-stops: list 36.0pt;\">Shipping &amp; logistics partners</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo4; tab-stops: list 36.0pt;\">IT infrastructure providers</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l4 level1 lfo4; tab-stops: list 36.0pt;\">Legal authorities if required by law</li>\r\n</ul>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>6. Security</strong></p>\r\n<p class=\"MsoNormal\">We implement industry-standard security measures to protect your data. However, no system is 100% secure, and users accept inherent risks of online interaction.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>7. User Rights</strong></p>\r\n<p class=\"MsoNormal\">You may request:</p>\r\n<ul style=\"margin-top: 0cm;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-list: l0 level1 lfo5; tab-stops: list 36.0pt;\">Access to your stored personal data</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l0 level1 lfo5; tab-stops: list 36.0pt;\">Editing or correcting your data</li>\r\n<li class=\"MsoNormal\" style=\"mso-list: l0 level1 lfo5; tab-stops: list 36.0pt;\">Deleting your account &amp; associated data</li>\r\n</ul>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>8. Children&rsquo;s Privacy</strong></p>\r\n<p class=\"MsoNormal\">Our content is family-friendly, but we do not knowingly collect personal data from children under age 13 without guardian consent.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>9. Changes to Policy</strong></p>\r\n<p class=\"MsoNormal\">We may revise this Privacy Policy occasionally. Updates will be posted on this page.</p>\r\n<hr align=\"center\" size=\"2\" width=\"100%\">\r\n<p class=\"MsoNormal\"><strong>10. Contact</strong></p>\r\n<h2 class=\"title\"><span style=\"font-size: 11.0pt; line-height: 107%; font-family: \'Calibri\',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: Mangal; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-IN; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;\">For privacy requests or concerns:<br><strong>Email:</strong> reseedestate@gmail.com<br><strong>Business:</strong> Reseed Estate LLP &mdash; India</span></h2>', '2025-05-04 09:05:05', '2025-11-26 10:56:56'),
(5, 2, 'hi', 'Privacy Policy', '<h2 class=\"title\">Who we are</h2>\n                    <p><b>Suggested text:</b> Our website address is: https://yourwebsite.com</p>\n                    <h6 class=\"title\">Comments</h6>\n                    <p><b>Suggested text:</b> When visitors leave comments on the site we collect the data shown\n                        in the comments form, and also the visitor’s IP address and browser user agent string to\n                        help spam detection.</p>\n                    <p>An anonymized string created from your email address (also called a hash) may be provided\n                        to the Gravatar service to see if you are using it. The Gravatar service privacy policy\n                        is available here: https://automattic.com/privacy/. After approval of your comment, your\n                        profile picture is visible to the public in the context of your comment.</p>\n                    <h6 class=\"title\">Media</h6>\n                    <p><b>Suggested text:</b> If you upload images to the website, you should avoid uploading\n                        images with embedded location data (EXIF GPS) included. Visitors to the website can\n                        download and extract any location data from images on the website.</p>\n                    <h6 class=\"title\">Cookies</h6>\n                    <p><b>Suggested text:</b> If you leave a comment on our site you may opt-in to saving your\n                        name, email address and website in\n                        cookies. These are for your convenience so that you do not have to fill in your details\n                        again when you leave another\n                        comment. These cookies will last for one year.</p>\n                    <p>If you visit our login page, we will set a temporary cookie to determine if your browser\n                        accepts cookies. This cookie\n                        contains no personal data and is discarded when you close your browser.</p>\n                    <p>When you log in, we will also set up several cookies to save your login information and\n                        your screen display choices.\n                        Login cookies last for two days, and screen options cookies last for a year. If you\n                        select \"Remember Me\", your login\n                        will persist for two weeks. If you log out of your account, the login cookies will be\n                        removed.</p>\n                    <p>If you edit or publish an article, an additional cookie will be saved in your browser.\n                        This cookie includes no personal\n                        data and simply indicates the post ID of the article you just edited. It expires after 1\n                        day.</p>\n                    <h6 class=\"title\">Embedded content from other websites</h6>\n                    <p><b>Suggested text:</b> Articles on this site may include embedded content (e.g. videos,\n                        images, articles, etc.). Embedded\n                        content from other websites behaves in the exact same way as if the visitor has visited\n                        the other website.</p>\n                    <p>These websites may collect data about you, use cookies, embed additional third-party\n                        tracking, and monitor your\n                        interaction with that embedded content, including tracking your interaction with the\n                        embedded content if you have an\n                        account and are logged in to that website.</p>\n                    <p>For users that register on our website (if any), we also store the personal information\n                        they provide in their user\n                        profile. All users can see, edit, or delete their personal information at any time\n                        (except they cannot change their\n                        username). Website administrators can also see and edit that information. browser user\n                        agent string to help spam detection.</p>', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 3, 'en', 'Custom Page', '<h2 class=\"title\">Who we are</h2>\n                    <p><b>Suggested text:</b> Our website address is: https://yourwebsite.com</p>\n                    <h6 class=\"title\">Comments</h6>\n                    <p><b>Suggested text:</b> When visitors leave comments on the site we collect the data shown\n                        in the comments form, and also the visitor’s IP address and browser user agent string to\n                        help spam detection.</p>\n                    <p>An anonymized string created from your email address (also called a hash) may be provided\n                        to the Gravatar service to see if you are using it. The Gravatar service privacy policy\n                        is available here: https://automattic.com/privacy/. After approval of your comment, your\n                        profile picture is visible to the public in the context of your comment.</p>\n                    <h6 class=\"title\">Media</h6>\n                    <p><b>Suggested text:</b> If you upload images to the website, you should avoid uploading\n                        images with embedded location data (EXIF GPS) included. Visitors to the website can\n                        download and extract any location data from images on the website.</p>\n                    <h6 class=\"title\">Cookies</h6>\n                    <p><b>Suggested text:</b> If you leave a comment on our site you may opt-in to saving your\n                        name, email address and website in\n                        cookies. These are for your convenience so that you do not have to fill in your details\n                        again when you leave another\n                        comment. These cookies will last for one year.</p>\n                    <p>If you visit our login page, we will set a temporary cookie to determine if your browser\n                        accepts cookies. This cookie\n                        contains no personal data and is discarded when you close your browser.</p>\n                    <p>When you log in, we will also set up several cookies to save your login information and\n                        your screen display choices.\n                        Login cookies last for two days, and screen options cookies last for a year. If you\n                        select \"Remember Me\", your login\n                        will persist for two weeks. If you log out of your account, the login cookies will be\n                        removed.</p>\n                    <p>If you edit or publish an article, an additional cookie will be saved in your browser.\n                        This cookie includes no personal\n                        data and simply indicates the post ID of the article you just edited. It expires after 1\n                        day.</p>\n                    <h6 class=\"title\">Embedded content from other websites</h6>\n                    <p><b>Suggested text:</b> Articles on this site may include embedded content (e.g. videos,\n                        images, articles, etc.). Embedded\n                        content from other websites behaves in the exact same way as if the visitor has visited\n                        the other website.</p>\n                    <p>These websites may collect data about you, use cookies, embed additional third-party\n                        tracking, and monitor your\n                        interaction with that embedded content, including tracking your interaction with the\n                        embedded content if you have an\n                        account and are logged in to that website.</p>\n                    <p>For users that register on our website (if any), we also store the personal information\n                        they provide in their user\n                        profile. All users can see, edit, or delete their personal information at any time\n                        (except they cannot change their\n                        username). Website administrators can also see and edit that information. browser user\n                        agent string to help spam detection.</p>', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 3, 'hi', 'Custom Page', '<h2 class=\"title\">Who we are</h2>\n                    <p><b>Suggested text:</b> Our website address is: https://yourwebsite.com</p>\n                    <h6 class=\"title\">Comments</h6>\n                    <p><b>Suggested text:</b> When visitors leave comments on the site we collect the data shown\n                        in the comments form, and also the visitor’s IP address and browser user agent string to\n                        help spam detection.</p>\n                    <p>An anonymized string created from your email address (also called a hash) may be provided\n                        to the Gravatar service to see if you are using it. The Gravatar service privacy policy\n                        is available here: https://automattic.com/privacy/. After approval of your comment, your\n                        profile picture is visible to the public in the context of your comment.</p>\n                    <h6 class=\"title\">Media</h6>\n                    <p><b>Suggested text:</b> If you upload images to the website, you should avoid uploading\n                        images with embedded location data (EXIF GPS) included. Visitors to the website can\n                        download and extract any location data from images on the website.</p>\n                    <h6 class=\"title\">Cookies</h6>\n                    <p><b>Suggested text:</b> If you leave a comment on our site you may opt-in to saving your\n                        name, email address and website in\n                        cookies. These are for your convenience so that you do not have to fill in your details\n                        again when you leave another\n                        comment. These cookies will last for one year.</p>\n                    <p>If you visit our login page, we will set a temporary cookie to determine if your browser\n                        accepts cookies. This cookie\n                        contains no personal data and is discarded when you close your browser.</p>\n                    <p>When you log in, we will also set up several cookies to save your login information and\n                        your screen display choices.\n                        Login cookies last for two days, and screen options cookies last for a year. If you\n                        select \"Remember Me\", your login\n                        will persist for two weeks. If you log out of your account, the login cookies will be\n                        removed.</p>\n                    <p>If you edit or publish an article, an additional cookie will be saved in your browser.\n                        This cookie includes no personal\n                        data and simply indicates the post ID of the article you just edited. It expires after 1\n                        day.</p>\n                    <h6 class=\"title\">Embedded content from other websites</h6>\n                    <p><b>Suggested text:</b> Articles on this site may include embedded content (e.g. videos,\n                        images, articles, etc.). Embedded\n                        content from other websites behaves in the exact same way as if the visitor has visited\n                        the other website.</p>\n                    <p>These websites may collect data about you, use cookies, embed additional third-party\n                        tracking, and monitor your\n                        interaction with that embedded content, including tracking your interaction with the\n                        embedded content if you have an\n                        account and are logged in to that website.</p>\n                    <p>For users that register on our website (if any), we also store the personal information\n                        they provide in their user\n                        profile. All users can see, edit, or delete their personal information at any time\n                        (except they cannot change their\n                        username). Website administrators can also see and edit that information. browser user\n                        agent string to help spam detection.</p>', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(10, 4, 'en', 'Tiggo', '<p>asd</p>', '2025-05-05 07:10:15', '2025-05-05 07:10:15'),
(11, 4, 'hi', 'Tiggo', '<p>asd</p>', '2025-05-05 07:10:15', '2025-05-05 07:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `customizeable_pages`
--

CREATE TABLE `customizeable_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customizeable_pages`
--

INSERT INTO `customizeable_pages` (`id`, `slug`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'terms-conditions', NULL, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 'privacy-policy', NULL, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 'custom', NULL, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 'tiggo', NULL, 1, '2025-05-05 07:10:15', '2025-05-05 07:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `custom_addons`
--

CREATE TABLE `custom_addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `isPaid` tinyint(1) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `author` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`author`)),
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `icon` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_codes`
--

CREATE TABLE `custom_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `css` text DEFAULT NULL,
  `header_javascript` text DEFAULT NULL,
  `body_javascript` text DEFAULT NULL,
  `footer_javascript` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_paginations`
--

CREATE TABLE `custom_paginations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_name` varchar(255) NOT NULL,
  `item_qty` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_paginations`
--

INSERT INTO `custom_paginations` (`id`, `section_name`, `item_qty`, `created_at`, `updated_at`) VALUES
(1, 'Blog List', 4, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(2, 'Blog Comment', 4, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(3, 'Portfolio List', 5, '2025-05-04 09:05:04', '2025-05-07 11:49:38'),
(4, 'Service List', 6, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(5, 'Team List', 4, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(6, 'Language List', 10, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(7, 'Product List', 6, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(8, 'Related Product List', 6, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(9, 'Customer Reviews', 4, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(10, 'Wishlist', 4, '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(11, 'Pricing Plan', 4, '2025-05-04 09:05:04', '2025-05-04 09:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `user_id`, `country_id`, `title`, `first_name`, `last_name`, `email`, `phone`, `address`, `province`, `city`, `zip_code`, `created_at`, `updated_at`) VALUES
(1, 11, 77, 'sdfchgvjh', 'Anjali', 'Kumari', 'anjali92kumarisingh@gmail.com', '09109710856', 'Saidpurakhurd , baghra bus stand', 'Uttar Pradesh', 'Muzaffarnagar', '251306', '2026-02-24 06:39:04', '2026-02-24 06:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `payment_status` enum('pending','success','failed') DEFAULT 'pending',
  `payment_id` varchar(255) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `name`, `mobile`, `email`, `amount`, `purpose`, `payment_status`, `payment_id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 'anjali', '9109710856', NULL, 100.00, NULL, 'pending', NULL, NULL, '2026-02-05 06:56:02', '2026-02-05 06:56:02'),
(2, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'asd', 'pending', NULL, NULL, '2026-02-05 10:30:15', '2026-02-05 10:30:15'),
(3, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'asd', 'pending', NULL, 'DON_1770287725_3', '2026-02-05 10:35:25', '2026-02-05 10:35:25'),
(4, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'qwe', 'pending', NULL, 'DON_1770288612_4', '2026-02-05 10:50:12', '2026-02-05 10:50:12'),
(5, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'lll', 'success', NULL, 'DON_1770289452_5', '2026-02-05 11:04:12', '2026-02-05 11:07:59'),
(6, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'qwse', 'success', NULL, 'DON_1770292359_6', '2026-02-05 11:52:39', '2026-02-05 11:53:51'),
(7, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'an', 'pending', NULL, 'DON_1770293754_7', '2026-02-05 12:15:54', '2026-02-05 12:15:54'),
(8, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'aqsw', 'success', NULL, 'DON_1770293986_8', '2026-02-05 12:19:46', '2026-02-05 12:20:32'),
(9, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'as', 'failed', NULL, 'DON_1770294058_9', '2026-02-05 12:20:58', '2026-02-05 12:21:12'),
(10, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'as', 'failed', NULL, 'DON_1770296751_10', '2026-02-05 13:05:51', '2026-02-05 13:06:12'),
(11, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'as', 'success', NULL, 'DON_1770296828_11', '2026-02-05 13:07:08', '2026-02-05 13:08:04'),
(12, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'asdewq', 'failed', NULL, 'DON_1770298742_12', '2026-02-05 13:39:02', '2026-02-05 13:39:13'),
(13, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'polkju', 'failed', NULL, 'DON_1770300007_13', '2026-02-05 14:00:07', '2026-02-05 14:00:59'),
(14, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'mjkl', 'failed', NULL, 'DON_1770300161_14', '2026-02-05 14:02:41', '2026-02-05 14:02:48'),
(15, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'mko', 'failed', NULL, 'DON_1770302936_15', '2026-02-05 14:48:56', '2026-02-05 14:49:03'),
(16, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, '4rtgf', 'failed', NULL, 'DON_1770304380_16', '2026-02-05 15:13:00', '2026-02-05 15:13:20'),
(17, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'qa', 'failed', NULL, 'DON_1770305994_17', '2026-02-05 15:39:54', '2026-02-05 15:40:02'),
(18, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'sd', 'success', NULL, 'DON_1770306082_18', '2026-02-05 15:41:22', '2026-02-05 15:42:08'),
(19, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'asdes', 'failed', NULL, 'DON_1770353728_19', '2026-02-06 04:55:28', '2026-02-06 04:55:41'),
(20, 'Anjali', '9109710856', NULL, 1.00, 'asdf', 'failed', NULL, 'DON_1770359814_20', '2026-02-06 06:36:54', '2026-02-06 06:37:06'),
(21, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'nj', 'failed', NULL, 'DON_1770359968_21', '2026-02-06 06:39:28', '2026-02-06 06:39:33'),
(22, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'asddf', 'success', NULL, 'DON_1770360048_22', '2026-02-06 06:40:48', '2026-02-06 06:41:28'),
(23, 'rishi kashyap', '8375996566', 'rishikashyapp.10@gmail.com', 1.00, 'for testing', 'failed', NULL, 'DON_1770467437_23', '2026-02-07 12:30:37', '2026-02-07 12:30:59'),
(24, 'rishi kashyap', '8375996566', 'rishikashyapp.10@gmail.com', 1.00, 'for testing', 'success', NULL, 'DON_1770467474_24', '2026-02-07 12:31:14', '2026-02-07 12:31:37'),
(25, 'Anjali Kumari', '9109710856', 'anjali92kumarisingh@gmail.com', 1.00, 'nm', 'failed', NULL, 'DON_1770620959_25', '2026-02-09 07:09:19', '2026-02-09 07:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'password_reset', 'Password Reset', '<p>Dear {{user_name}},</p>\n                <p>Do you want to reset your password? Please Click the following link and Reset Your Password.</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(2, 'contact_mail', 'Contact Email', '<p>Hello there,</p>\n                <p>&nbsp;Mr. {{name}} has sent a new message. you can see the message details below.&nbsp;</p>\n                <p>Email: {{email}}</p>\n                <p>Website: {{website}}</p>\n                <p>Subject: {{subject}}</p>\n                <p>Message: {{message}}</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(3, 'contact_team_mail', 'Contact Email', '<p>Hello there,</p>\n                <p>&nbsp;Mr. {{name}} has sent a new message. you can see the message details below.&nbsp;</p>\n                <p>Email: {{email}}</p>\n                <p>Message: {{message}}</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(4, 'subscribe_notification', 'Subscribe Notification', '<p>Hi there, Congratulations! Your Subscription has been created successfully. Please Click the following link and Verified Your Subscription. If you will not approve this link, you can not get any newsletter from us.</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(5, 'social_login', 'Social Login', '<p>Hello {{user_name}},</p>\n                <p>Welcome to {{app_name}}! Your account has been created successfully.</p>\n                <p>Your password: {{password}}</p>\n                <p>You can log in to your account at <a href=\"https://websolutionus.com\">https://websolutionus.com</a></p>\n                <p>Thank you for joining us.</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(6, 'user_verification', 'User Verification', '<p>Dear {{user_name}},</p>\n                <p>Congratulations! Your account has been created successfully. Please click the following link to activate your account.</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(7, 'new_refund', 'New Refund Request', '<p>Hello websolutionus, </p>\n\n                <p>Mr. {{user_name}} has send a new refund request to you.</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(8, 'approved_refund', 'Refund Request Approval', '<p>Dear {{user_name}},</p>\n                <p>We are happy to say that, we have send {{refund_amount}} to your provided account information. </p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(9, 'reject_refund', 'Reject Refund Request', '<p>Dear {{user_name}},</p>\n                <p>We regret to inform you that your refund request for order {{order_id}} has been declined.</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(10, 'blog_comment', 'New Blog Comment', '<p>Hello {{admin_name}},</p>\n                <p> A new pending comment has been added by <b>{{user_name}}</b> on <a href=\"{{link}}\">{{blog_title}}</a></p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(11, 'order_mail', 'Order Confirmation Mail', '<p>Hi {{user_name}},</p><p>Thanks for your new order. Your order id has been submitted .</p><p><strong>Sub Total :</strong>  {{sub_total}},</p><p><strong>Discount :</strong>  {{discount}},</p><p><strong>Tax :</strong>  {{tax}},</p><p><strong>Delivery Charge :</strong>  {{delivery_charge}},</p><p><strong>Total Amount :</strong>  {{total_amount}},</p><p><strong>Payment Method :</strong> {{payment_method}},</p><p><strong>Payment Status :</strong> {{payment_status}},</p><p><strong>Order Status :</strong> {{order_status}},</p><p><strong>Order Date:</strong> {{order_date}},</p><div>{{order_detail}}</div>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(12, 'order_status', 'Order Status Update', '<p>Dear {{user_name}},</p>\n                <p>Your order #{{order_id}} is now <b>{{order_status}}</b>.</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(13, 'approved_payment', 'Payment Approved', '<p>Dear {{user_name}},</p>\n                <p>Your order #{{order_id}} payment is approved.</p></p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(14, 'reject_payment', 'Payment Reject', '<p>Dear {{user_name}},</p>\n                <p>Your order #{{order_id}} payment is rejected.</p>', '2025-05-04 09:05:04', '2025-05-04 09:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `fabworlds`
--

CREATE TABLE `fabworlds` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `banner_heading` varchar(255) NOT NULL,
  `banner_sub_heading` text DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `line_color` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fabworlds`
--

INSERT INTO `fabworlds` (`id`, `title`, `slug`, `banner`, `banner_heading`, `banner_sub_heading`, `description`, `category_id`, `line_color`, `seo_title`, `seo_description`, `tags`, `status`, `updated_at`, `created_at`) VALUES
(3, 'Fablepals Mystic World', 'new-title', 'uploads/custom-images/image_1755063076.webp', 'Earth Elemental World', '\"Once the unshakable heart of Terra Prime, the Earth Element now rests in Fabland — carrying the strength of stone, the life of forests, and the memory of its Mighty Guardian Grok.\"', '<p style=\"text-align: center;\" data-start=\"324\" data-end=\"793\">Today, the Earth Element rests within Fabland, its crystal heart beating quietly among the other scattered elements. It is a shard of something far greater &mdash; a remnant of a world that once stood unshaken. After the <strong data-start=\"539\" data-end=\"559\">Scattering Event</strong>, the power of the Earth was torn from its home, carried across the void, and anchored in this new land. But long before that fracture, the Earth Element belonged to a planet of towering strength and eternal growth: <strong data-start=\"775\" data-end=\"790\">Terra Prime</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"795\" data-end=\"1168\">Terra Prime was a realm where the ground itself breathed life. Its landscapes were vast and varied &mdash; colossal crystal-capped mountains glimmering in sunlight, endless green valleys threaded with mineral-rich rivers, and forests whose roots ran deep into veins of glowing emerald stone. Every rock, every tree, every gust of wind carried the quiet hum of elemental energy.</p>\r\n<p style=\"text-align: center;\" data-start=\"1170\" data-end=\"1606\">At the heart of this world stood <strong data-start=\"1203\" data-end=\"1211\">Grok</strong>, the Earth Mystic Guardian &mdash; a colossal knight born from the planet&rsquo;s core. His body was shaped from stone older than time, his armor draped in moss and roots, and in his hand rested the <strong data-start=\"1399\" data-end=\"1426\">Crystal Hammer of Terra</strong>, forged from the planet&rsquo;s deepest emerald. Grok was more than a protector; he was the memory of the land, able to hear the whispers of stone and feel the pulse of every crystal.</p>\r\n<p style=\"text-align: center;\" data-start=\"1608\" data-end=\"2172\">The people of Terra Prime lived in harmony with their environment. Villages were built into the sides of cliffs, bridges carved from living rock, and homes crowned with moss gardens that glowed under the moonlight. The native species were as resilient as the land itself &mdash; <strong data-start=\"1881\" data-end=\"1901\">Stonehorn Beasts</strong>, massive creatures with crystal-encrusted horns used to unearth minerals; <strong data-start=\"1976\" data-end=\"1989\">Mosswings</strong>, small bird-like animals that could camouflage perfectly against rock and foliage; and <strong data-start=\"2077\" data-end=\"2094\">Burrowrunners</strong>, nimble creatures that tunneled through the soil, keeping the land fertile.</p>\r\n<p style=\"text-align: center;\" data-start=\"2174\" data-end=\"2454\">Each species had its role in maintaining the balance of Terra Prime&rsquo;s ecosystem. The forests were tended by the gentle Mosswings, the rivers safeguarded by Burrowrunners, and the mountains defended by the mighty Stonehorns. Under Grok&rsquo;s watchful eye, life thrived for centuries.</p>\r\n<p style=\"text-align: center;\" data-start=\"2456\" data-end=\"2900\">But the harmony could not last forever. The Shadow Legion&rsquo;s hunger for crystal energy eventually reached Terra Prime. Battles shook the land, and the once-untouched valleys echoed with the sound of breaking stone. To protect the essence of his world, Grok called upon the ancient rite of scattering &mdash; sending the Earth Element away before the Shadow Legion could corrupt it. That choice saved the power, but left Terra Prime silent and still.</p>\r\n<p style=\"text-align: center;\" data-start=\"2902\" data-end=\"3066\">Now, only its stories and the heartbeat of the Earth Element remain &mdash; carried into Fabland, waiting for the day when its Guardian&rsquo;s strength will be needed again.</p>', 1, '#84ff00', NULL, NULL, NULL, 1, '2025-11-15 11:08:45', '2025-08-11 11:10:29'),
(4, 'Fablepals Mystic World', 'air-elemental-world', 'uploads/custom-images/image_1755083118.webp', 'Air Elemental World', '\"Once the boundless breath of the open skies, the Air Element now soars in Fabland — carrying the freedom of wind, the grace of flight, and the wisdom of its Mighty Guardian Aeron.\"', '<p style=\"text-align: center;\" data-start=\"158\" data-end=\"518\">Today, the Air Element drifts high above Fabland, an invisible current carrying its whisper across the skies. It is a fragment of something once far greater &mdash; a breath from a world where the wind was alive and endless. Long before the Scattering Event sent it here, the Air Element belonged to a realm of soaring heights and eternal freedom: <strong data-start=\"500\" data-end=\"515\">Aero Zenith</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"520\" data-end=\"963\">Aero Zenith was a kingdom of clouds and light, where the land floated in the open sky. Gigantic airborne isles drifted slowly through the heavens, their edges draped in waterfalls that vanished into the mist below. Towers of silver stone and crystal bridges linked the floating lands, swaying gently with the breeze. The air itself shimmered with unseen currents, carrying scents of blooming sky-flowers and the soft hum of elemental energy.</p>\r\n<p style=\"text-align: center;\" data-start=\"965\" data-end=\"1349\">At the heart of this sky realm soared <strong data-start=\"1003\" data-end=\"1012\">Aeron</strong>, the Air Mystic Guardian &mdash; a mighty, majestic falcon with wings as vast as the horizon. His feathers shone like polished silver tipped with gold, and his eyes held the clarity of a cloudless dawn. Aeron was not just a protector; he was the sky&rsquo;s memory, able to read the winds like stories and summon storms or calm with a single cry.</p>\r\n<p style=\"text-align: center;\" data-start=\"1351\" data-end=\"1865\">Life in Aero Zenith was as light and agile as the air it breathed. Villages clung to cliff-like island edges, sails and windcatchers spinning endlessly to harness the currents. The skies teemed with creatures shaped by freedom: <strong data-start=\"1579\" data-end=\"1592\">Skywhales</strong>, massive gentle beings that drifted between islands, singing deep, echoing songs; <strong data-start=\"1675\" data-end=\"1691\">Gale Runners</strong>, swift fox-like animals with fur like soft clouds who could run on the very wind; and <strong data-start=\"1778\" data-end=\"1793\">Zephyrwings</strong>, tiny glowing birds that left trails of sparkling dust in their wake.</p>\r\n<p style=\"text-align: center;\" data-start=\"1867\" data-end=\"2148\">Each species played its part in keeping the balance &mdash; Skywhales kept the air currents steady, Gale Runners spread seeds between islands, and Zephyrwings pollinated sky-flowers that fed both creatures and people. Under Aeron&rsquo;s watchful gaze, the winds carried peace for centuries.</p>\r\n<p style=\"text-align: center;\" data-start=\"2150\" data-end=\"2576\">But peace is fragile. When the Shadow Legion&rsquo;s greed reached the skies, they sought to harness the Air Element&rsquo;s speed and power. Battles raged across the heavens, lightning tearing through cloud palaces. Aeron fought with unmatched swiftness, but even the strongest wings could not hold the storm forever. In a final act, he released the Air Element into the void, letting the currents scatter it beyond the Legion&rsquo;s grasp.</p>\r\n<p style=\"text-align: center;\" data-start=\"2578\" data-end=\"2729\">Now, only the whispers of the wind remain &mdash; the breath of Aero Zenith carried into Fabland, waiting for the day its Guardian&rsquo;s wings will rise again.</p>', 1, '#03f8fc', NULL, NULL, NULL, 1, '2025-11-15 11:08:58', '2025-08-13 10:12:46'),
(5, 'Fablepals Mystic World', 'fire-elemental-world', 'uploads/custom-images/image_1755581510.webp', 'Fire Elemental World', '\"Once the eternal heart of the burning core, the Fire Element now blazes in Fabland — carrying the fury of flame, the warmth of life, and the might of its Inferno Guardian Skarion.\"', '<p style=\"text-align: center;\" data-start=\"185\" data-end=\"492\">Today, the Fire Element flickers across Fabland, not in a roaring blaze but in a quiet ember &mdash; a spark waiting to awaken. Yet this ember is not ordinary. It is a fragment of something once far greater &mdash; a flame torn from the heart of a world where fire was alive, eternal, and sovereign: <strong data-start=\"473\" data-end=\"489\">Inferno Core</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"494\" data-end=\"918\">Inferno Core was a realm carved from living flame and molten stone, a kingdom where rivers of lava glowed brighter than sunlight and volcanoes pulsed like beating hearts. The land itself breathed fire &mdash; mountains rumbled with smoldering veins, and the air shimmered with heat that carried both creation and destruction. Night never truly fell here, for the sky was lit by a constant glow of burning clouds and ember stars.</p>\r\n<p style=\"text-align: center;\" data-start=\"920\" data-end=\"1441\">At the heart of this blazing realm rose <strong data-start=\"960\" data-end=\"971\">Skarion</strong>, the Fire Mystic Guardian &mdash; a colossal phoenix crowned in magma and flame. His wings blazed like twin infernos, every beat scattering embers across the sky. Magma plates armored parts of his body, glowing cracks between them releasing rivers of fire as though he carried the world&rsquo;s volcanoes within himself. His eyes burned with both fury and wisdom, for Skarion was not just fire&rsquo;s protector &mdash; he was its eternal cycle: destruction that cleared the way for renewal.</p>\r\n<p style=\"text-align: center;\" data-start=\"1443\" data-end=\"1879\">Life in Inferno Core thrived not in spite of the flames but because of them. Vast habitats were built into the obsidian cliffs and cooled magma plains, glowing with fiery crystal lanterns. Great forges roared in every settlement, crafting weapons, tools, and art from the living heat of the world. The people adapted to the blaze, their homes shaped like volcanic spires, with flowing lava channels harnessed as both warmth and power.</p>\r\n<p style=\"text-align: center;\" data-start=\"1881\" data-end=\"2433\">Creatures of fire roamed freely &mdash; <strong data-start=\"1915\" data-end=\"1929\">Emberhorns</strong>, bull-like beasts with molten horns dripping sparks, plowed the lava fields; <strong data-start=\"2007\" data-end=\"2023\">Ash Serpents</strong>, massive snakes of smoldering rock, slithered through magma rivers; and <strong data-start=\"2096\" data-end=\"2111\">Cinderwings</strong>, bat-like flyers with ember-lined wings, filled the fiery skies. Each was dangerous, yet vital &mdash; Emberhorns fertilized volcanic soil with ash, Serpents kept lava flows steady, and Cinderwings pollinated the fire-bloom flowers that glowed like lanterns across the plains. Together, under Skarion&rsquo;s shadow, fire was life.</p>\r\n<p style=\"text-align: center;\" data-start=\"2435\" data-end=\"2857\">But life forged in fire is always contested. The Shadow Legion hungered for Inferno Core&rsquo;s boundless energy, seeing in its flames the key to fueling their dark machines and rituals. Their assault turned volcanoes into weapons, magma into chains. The battles raged with the fury of wildfires, skies lit by storms of ash and lightning. Skarion fought with wings that burned like suns, but even a phoenix&rsquo;s fire has limits.&nbsp;In his final defiance, Skarion let his body collapse into living flame, scattering the Fire Element across the void. The blaze that had once lit Inferno Core dimmed, reduced to scattered sparks &mdash; one of which now flickers in Fabland.</p>\r\n<p style=\"text-align: center;\" data-start=\"3096\" data-end=\"3333\">What remains here is only a fragment: a small, glowing ember. But within it lies the memory of a world ablaze, waiting for the moment when its Guardian&rsquo;s flames will rise again &mdash; and with them, the heart of Inferno Core will burn anew.</p>', 1, '#ed7428', NULL, NULL, NULL, 1, '2025-11-15 11:09:19', '2025-08-19 05:31:50'),
(6, 'Fablepals Cinematic Universe', 'element-collection-sage', 'uploads/custom-images/image_1755600879.webp', 'Element Collection Saga', 'Seven elements, eight journeys, one destiny. From earth to sky, fire to water, time to light and shadow, each story reveals a hero’s path—uniting the FablePals against the Void in a battle for all realms.', '<p style=\"text-align: center;\" data-start=\"191\" data-end=\"380\">In a universe woven from seven elemental forces, harmony has long safeguarded every realm. But when the ancient Void begins to stir, the balance trembles, and forgotten prophecies awaken.</p>\r\n<p style=\"text-align: center;\" data-start=\"382\" data-end=\"741\">From the crystal roots of Terra Prime to the soaring skies of Aero Zenith, from the blazing furnaces of Inferno Core to the endless tides of Aqua Realm, chosen heroes rise to face trials that test their courage and spirit. Time itself bends in the labyrinth of Chrono Nexus, while the light of truth and the shadow of redemption carve new paths for destiny.</p>\r\n<p style=\"text-align: center;\" data-start=\"743\" data-end=\"959\">Each tale reveals not only the struggle of its hero but also a fragment of a greater design. As their journeys intertwine, the FablePals and their allies begin to uncover the hidden threads that bind them together.</p>\r\n<p style=\"text-align: center;\" data-start=\"961\" data-end=\"1217\">Yet with every step forward, the looming darkness grows stronger. The Void watches, waiting for the moment when realms fracture and courage falters. Only by uniting their elements&mdash;and their hearts&mdash;can the heroes hope to preserve creation from unraveling.</p>', 6, '#dbfc03', NULL, NULL, NULL, 1, '2025-11-18 05:19:33', '2025-08-19 07:32:59'),
(7, 'Fablepals Cinematic Universe', 'lore-expansion-saga', 'uploads/custom-images/image_1755604996.webp', 'Lore Expansion Saga', 'A journey through elemental worlds, lost guardians, and ancient battles—unveiling the origins that shaped the FablePals’ destiny.', '<p style=\"text-align: center;\" data-start=\"239\" data-end=\"602\">Long before the rise of the FablePals, the elemental realms carried secrets of their own. In Terra&rsquo;s crystal roots, Aero&rsquo;s sky citadels, Inferno&rsquo;s fire-forged cities, Aqua&rsquo;s living tides, and the shifting gears of Chrono Nexus, each world shaped its Guardian and its people. Their stories tell of courage, betrayal, and the endless struggle to preserve balance.</p>\r\n<p style=\"text-align: center;\" data-start=\"604\" data-end=\"912\">Amid these chronicles stands Kane, a warrior torn between shadow and light, whose path of redemption ties the forgotten past to the battles yet to come. And at the heart of it all lies the Dawn of Fractured Realms&mdash;the ancient clash that shattered creation and set the stage for every destiny that followed.</p>\r\n<p style=\"text-align: center;\" data-start=\"914\" data-end=\"1105\">The Lore Expansion Saga unveils the myths, struggles, and choices that forged the very foundation of the elemental age&mdash;echoes that still guide the FablePals in their fight against the Void.</p>', 6, '#dbfc03', NULL, NULL, NULL, 1, '2025-11-18 05:19:16', '2025-08-19 11:41:21'),
(8, 'Fablepals Mystic World', 'primora-the-origin-realm', 'uploads/custom-images/image_1755674093.webp', 'Primora - The Origin Realm', 'The first realm of existence, where Light and Shadow lived in perfect harmony. Its shattering birthed the cosmic flare that gave rise to all elemental worlds, forever carrying echoes of balance and conflict.', '<p style=\"text-align: center;\" data-start=\"213\" data-end=\"438\">At the dawn of existence, before stars, time, or the lands of the elements, there was only one realm &mdash; <strong data-start=\"316\" data-end=\"327\">Primora</strong>. It was the origin of all things, a boundless realm where <strong data-start=\"386\" data-end=\"395\">Light</strong> and <strong data-start=\"400\" data-end=\"410\">Shadow</strong> lived in perfect harmony.</p>\r\n<p style=\"text-align: center;\" data-start=\"440\" data-end=\"705\">The <strong data-start=\"444\" data-end=\"462\">Light Guardian</strong>, calm and serene, believed in letting the universe flow as it was meant to be &mdash; untouched, pure, and orderly. The <strong data-start=\"577\" data-end=\"596\">Shadow Guardian</strong>, curious and restless, longed to understand the secrets of creation and the hidden workings of the cosmos.</p>\r\n<p style=\"text-align: center;\" data-start=\"707\" data-end=\"974\">For ages, their bond kept the realm balanced. But as the Shadow Guardian&rsquo;s hunger for knowledge deepened, it clashed with the Light Guardian&rsquo;s vow of non-interference. What began as a difference in thought grew into a rift that shook the very foundation of Primora.</p>\r\n<p style=\"text-align: center;\" data-start=\"976\" data-end=\"1324\">When Light and Shadow finally collided, the harmony of Primora shattered. A great eruption tore across the skies of the realm &mdash; a storm of brilliance and darkness entwined, sending out <strong data-start=\"1161\" data-end=\"1196\">waves of colorful cosmic energy</strong> that stretched endlessly. The blast echoed into the <strong data-start=\"1249\" data-end=\"1265\">Cosmic Ocean</strong>, sending ripples that shaped the birth of new realities.</p>\r\n<p style=\"text-align: center;\" data-start=\"1326\" data-end=\"1381\">From these ripples, the <strong data-start=\"1350\" data-end=\"1370\">Elemental Worlds</strong> emerged: <strong data-start=\"1384\" data-end=\"1407\">Terra Prime (Earth)</strong>, grounded in strength and growth. <strong data-start=\"1446\" data-end=\"1467\">Aero Zenith (Air)</strong>, free and unbound above the skies. <strong data-start=\"1507\" data-end=\"1530\">Inferno Core (Fire)</strong>, blazing with passion and fury. <strong data-start=\"1567\" data-end=\"1589\">Aqua Realm (Water)</strong>, flowing with mystery and life. <strong data-start=\"1626\" data-end=\"1649\">Chrono Nexus (Time)</strong>, the keeper of change and destiny.</p>\r\n<p style=\"text-align: center;\" data-start=\"1688\" data-end=\"1803\">Though wondrous, each world carried traces of both Light and Shadow, forever marked by the separation of Primora.&nbsp;Thus began the eternal story of the realms &mdash; a search for harmony, a battle for balance, and the echoes of one truth: that all creation was once one.</p>\r\n<p style=\"text-align: center;\" data-start=\"1688\" data-end=\"1803\">&ldquo;From unity came division, and from division, all worlds were born.&rdquo;</p>', 1, '#ffe924', NULL, NULL, NULL, 1, '2025-11-14 09:57:20', '2025-08-20 07:14:53'),
(9, 'Fablepals Mystic World', 'water-elemental-world', 'uploads/custom-images/image_1755775579.webp', 'Water Elemental World', '\"Once the boundless mirror of infinite oceans, the Water Element now flows through Fabland — carrying the calm of tides, the wisdom of currents, and the serenity of its Guardian Aqualis.\"', '<p style=\"text-align: center;\" data-start=\"1166\" data-end=\"1209\"><strong data-start=\"1166\" data-end=\"1209\">&ldquo;The Whispering Currents of Aqua Realm&rdquo;</strong></p>\r\n<p style=\"text-align: center;\" data-start=\"1211\" data-end=\"1474\">Today, the Water Element glides through Fabland like a soft sigh&mdash;gentle, healing, yet filled with memory. It was once the heartbeat of <strong data-start=\"1346\" data-end=\"1360\">Aqua Realm</strong>, a planet where water was more than just a resource&mdash;it was the lifeblood of every creature, structure, and story.</p>\r\n<p style=\"text-align: center;\" data-start=\"1476\" data-end=\"1818\">Aqua Realm was a world sculpted by flowing oceans and luminous reefs. Cities floated within crystal-clear depths, built atop living coral pillars and bubble-domed homes shimmering with bioluminescence. Stairways of woven kelp and flowing water linked dwellings, while jelly-lanterns drifted overhead, lighting pathways in soft, ethereal glow.</p>\r\n<p style=\"text-align: center;\" data-start=\"1820\" data-end=\"2281\">At the heart of this serene world reigned <strong data-start=\"1862\" data-end=\"1873\">Aqualis</strong>, the Celestial Sea Serpent&mdash;an elegant guardian of flowing scales and glowing fins. Within each ripple of water lay the memory of ages, and the hiss of currents spoke in tales only Aqualis could understand. Under her gaze, schools of rune-inscribed koi wove graceful patterns, manta ray mounts glided silently past homes shaped from spiraling shells, and turtle sages carried floating gardens on their backs.</p>\r\n<p style=\"text-align: center;\" data-start=\"2283\" data-end=\"2568\">But peace, even in water, can be disrupted. When the <strong data-start=\"2336\" data-end=\"2353\">Shadow Legion</strong> poisoned the currents with dark intent, storms rose, currents turned violent, and the serenity began to erode. Aqualis fought to contain the damage, weaving protection from tides and healing from the ocean&rsquo;s heart.</p>\r\n<p style=\"text-align: center;\" data-start=\"2570\" data-end=\"2837\">In the final act of protection, she submerged herself in the deepest Memory Pool and scattered the Water Element across time and space. The currents vanished, only to resurface in Fabland as a whisper of the ocean&rsquo;s lore, waiting for the day its Guardian will return.</p>', 1, '#49fcfc', NULL, NULL, NULL, 1, '2025-11-15 11:09:47', '2025-08-21 11:26:19'),
(11, 'Fablepals Mystic World', 'time-elemental-world', 'uploads/custom-images/image_1755779431.webp', 'Time Elemental World', 'A mystic realm where past, present, and future flow together. Floating islands, silver sand rivers, and colossal gears shape the land, guarded by Titanox, the iron bison of time and balance.', '<p style=\"text-align: center;\" data-start=\"272\" data-end=\"590\">The <strong data-start=\"276\" data-end=\"292\">Chrono Nexus</strong> is a mystic world where time itself breathes life into the land. Golden deserts shift like moving hourglasses, clockwork forests tick with living gears, and crystal rivers flow both forward and backward. Here, every grain of sand holds a memory, every gust of wind whispers a future yet to come.</p>\r\n<p style=\"text-align: center;\" data-start=\"592\" data-end=\"944\">At the heart of this realm stands <strong data-start=\"626\" data-end=\"653\">Titanox, the Iron Bison</strong> &mdash; the mighty Guardian of Time. His unbreakable iron hide glows with shifting runes, each marking an age long past or yet to arrive. Titanox embodies patience, endurance, and eternal strength. With every stomp of his hooves, time stabilizes, preventing chaos from unraveling across realms.</p>\r\n<p style=\"text-align: center;\" data-start=\"946\" data-end=\"1389\">The <strong data-start=\"950\" data-end=\"979\">villagers of Chrono Nexus</strong> are resilient animal beings adapted to the eternal clockwork rhythms. Some wear flowing robes adorned with hourglass beads, while others craft intricate armor from bronze and steel infused with temporal energy. They live in harmony with <strong data-start=\"1217\" data-end=\"1245\">time-forged architecture</strong> &mdash; spiraling towers that shift with the sun, bridges that appear only at certain hours, and markets that open at dawn and dusk simultaneously.</p>\r\n<p style=\"text-align: center;\" data-start=\"1391\" data-end=\"1503\">Chrono Nexus is not just a world &mdash; it is a <strong data-start=\"1434\" data-end=\"1450\">living clock</strong>, where destiny is crafted, guarded, and preserved.</p>', 1, '#f6fc49', NULL, NULL, NULL, 1, '2025-11-15 11:10:04', '2025-08-21 12:30:31'),
(12, 'Fabland World', 'elemental-fabcouncil', 'uploads/custom-images/image_1756019610.webp', 'Elemental Fabcouncil', 'The heart of Fabville, where wisdom meets training. Surrounded by five elemental arenas, it guides young cubs to master Earth, Fire, Water, Air, and Time — forging the Warriors of tomorrow.', '<p style=\"text-align: center;\" data-start=\"64\" data-end=\"460\">At the very heart of Fabville, rising above every village, bridge, and river, stands the <strong data-start=\"153\" data-end=\"167\">Fabcouncil</strong>, sheltered beneath the vast canopy of the <strong data-start=\"210\" data-end=\"233\">Elemental Root Tree</strong> &mdash; a living giant said to be older than Fabville itself. Its roots twist deep into the land, carrying the essence of all five elements, while its branches stretch toward the skies as if holding the balance of Fabland together.</p>\r\n<p style=\"text-align: center;\" data-start=\"462\" data-end=\"838\">Encircling this sacred core are the <strong data-start=\"498\" data-end=\"527\">Elemental Training Arenas</strong>, each shaped by its element &mdash; flowing Aqua Domes, blazing Fire Rings, solid Earth Grounds, soaring Air Spires, radiant Light Courts, and timeless Chrono Chambers. Here, young cubs train, guided by the wisdom of the council, learning not only to wield their gifts but also to respect the harmony between them.</p>\r\n<p style=\"text-align: center;\" data-start=\"840\" data-end=\"1162\">Within the great hall of the Fabcouncil, a circular table awaits the <strong data-start=\"909\" data-end=\"928\">Council Masters</strong> &mdash; representatives chosen from every terrain of Fabland. Each voice carries the weight of their people, and every decision taken under the Root Tree is meant to preserve peace, resolve disputes, and ensure balance across the realms.</p>\r\n<p style=\"text-align: center;\" data-start=\"1164\" data-end=\"1360\">Together, the council and the arenas form the living heart of Fabville &mdash; a place where history, training, and governance flow as one, protecting Fabland from discord and guiding it toward unity.</p>\r\n<p style=\"text-align: center;\" data-start=\"1164\" data-end=\"1360\">&ldquo;At the heart of Fabville, where roots hold history and council shapes harmony.&rdquo;</p>', 2, '#fcbf30', NULL, NULL, NULL, 1, '2025-11-15 11:11:29', '2025-08-24 07:13:30'),
(13, 'Fabland World', 'fabville-village', 'uploads/custom-images/image_1756125783.webp', 'Fabville Village', 'A magical village where animal villagers live in unity, with homes, markets, farms, and play spaces shaped by the power of the five elements—earth, water, fire, air, and time.', '<p style=\"text-align: center;\" data-start=\"266\" data-end=\"717\">Beyond the FabCouncil chambers and elemental training arenas lies the true heart of Fabville &mdash; a thriving village where everyday life flows in balance with the elements. The cobblestone streets wind through colorful homes built in harmony with each clan&rsquo;s elemental style: moss-covered earth dwellings, airy treetop nests, glowing ember-lit houses, crystal-clear water huts along streams, and shimmering time-forged towers with gentle glowing runes.</p>\r\n<p style=\"text-align: center;\" data-start=\"719\" data-end=\"1107\">The village beats with the rhythm of its people. In the <strong data-start=\"775\" data-end=\"788\">FabMarket</strong>, animal villagers trade fresh harvests, hand-crafted tools, fish from sparkling ponds, fiery blacksmith wares, woven sky-cloths, and delicate time-gadgets &mdash; each stall powered by elemental energy. Music, chatter, and laughter echo as cubs dart between vendors while storytellers and performers bring the plaza alive.</p>\r\n<p style=\"text-align: center;\" data-start=\"1109\" data-end=\"1411\">At the <strong data-start=\"1116\" data-end=\"1134\">FabTown Square</strong>, festivals bloom with glowing lanterns, water fountains that dance in sync with melodies, and wind chimes ringing with joy. It is the place of celebrations, community decisions, and nightly gatherings, where villagers share tales of the Guardians and the unity of the clans.</p>\r\n<p style=\"text-align: center;\" data-start=\"1413\" data-end=\"1916\">Around the village stretch <strong data-start=\"1440\" data-end=\"1476\">farms, workshops, and play areas</strong> that reflect the beauty of balance: earth clan terraces rich with harvest, water clan fish farms glistening with life, fire clan forges blazing with creative sparks, airy rooftops alive with cloth-weaving, and time clan workshops quietly ticking with glowing inventions. Children play on elemental-powered playgrounds &mdash; floating swings, stream-fed slides, and shifting hourglass mazes &mdash; a symbol of harmony passed to the next generation.</p>\r\n<p style=\"text-align: center;\" data-start=\"1918\" data-end=\"2231\">Together, these spaces form a community where every villager, every craft, and every celebration is tied to the flow of elemental balance. Fabville thrives not just because of its protectors, but because of its people, who live every day in joyful unity, carrying forward the true spirit of the FablePals world.</p>\r\n<p style=\"text-align: center;\" data-start=\"171\" data-end=\"225\"><strong data-start=\"171\" data-end=\"223\">&ldquo;A Village of Balance, Joy, and Everyday Magic.&rdquo; </strong></p>\r\n<p style=\"text-align: center;\" data-start=\"171\" data-end=\"225\"><strong data-start=\"229\" data-end=\"284\">&ldquo;Where Markets, Memories, and Magic Flow Together.&rdquo;</strong></p>', 2, '#28faa9', NULL, NULL, NULL, 1, '2025-11-15 11:12:14', '2025-08-25 12:36:17'),
(14, 'Fabland World', 'fabguard-zone', 'uploads/custom-images/image_1756364158.webp', 'Fabguard Zone', 'The FabGuard Zone forms the third ring of Fabland, extending from Fabville into vast landscapes and blends the Elemental Houses with a strong defense line, where the FabGuard army lives in harmony with nature and its people.', '<p style=\"text-align: center;\" data-start=\"169\" data-end=\"647\">Beyond the lively heart of Fabville lies the vast <strong data-start=\"219\" data-end=\"236\">FabGuard Zone</strong>, the third great ring of Fabland. It is here that the balance between nature, elemental power, and protection comes to life. Sprawling lush green fields stretch into the horizon, broken by clusters of village communities belonging to the <strong data-start=\"475\" data-end=\"500\">four elemental houses</strong>&mdash;Earth, Water, Fire, and Air. Each house thrives in harmony with its element, building homes, farms, and crafts that reflect their natural gifts.</p>\r\n<p style=\"text-align: center;\" data-start=\"649\" data-end=\"1239\">The villagers are not only farmers, miners, and craftsmen&mdash;they are the <strong data-start=\"720\" data-end=\"750\">first line of guardianship</strong> for Fabville. Flowing rivers feed water clans&rsquo; rice terraces and fish ponds; emerald hills hide the earth clans&rsquo; crystal mines; fire clans forge brilliant weapons and ember lanterns under glowing lava kilns; and wind clans build floating farms and aerial bridges that dance with the breeze. All four zones remain connected to the <strong data-start=\"1081\" data-end=\"1100\">Fabville Centre</strong> by great elemental bridges&mdash;stone for Earth, flowing aqua channels for Water, flame-lit arches for Fire, and glimmering skywalks for Air.</p>\r\n<p style=\"text-align: center;\" data-start=\"1241\" data-end=\"1719\">But at the farthest edge, rising like a crown of protection, stands the <strong data-start=\"1313\" data-end=\"1340\">ancient wall of Fabland</strong>. It is here that the <strong data-start=\"1362\" data-end=\"1379\">FabGuard army</strong> resides: noble rangers, scouts, and commanders sworn to defend the harmony of the land. Their barracks blend into the cliffs and forests, surrounded by fertile fields that they themselves farm when not on patrol. Watchtowers pierce the sky at intervals, ever-watchful, glowing softly with runic markings that pulse with elemental energy.</p>\r\n<p style=\"text-align: center;\" data-start=\"1721\" data-end=\"2217\">The FabGuard Zone is more than farmland or defense&mdash;it is a living shield. The villagers&rsquo; daily work of mining crystals, harvesting crops, forging, weaving, and farming directly fuels the lifeblood of Fabland. In return, the FabGuard protects them, ensuring peace within and security from threats beyond the wall. Together, they form a <strong data-start=\"2056\" data-end=\"2090\">circle of strength and harmony</strong>, where duty and life are one, and where every river, flame, breeze, and stone flows into the protection of Fabville&rsquo;s heart.</p>', 2, '#ffda1f', NULL, NULL, NULL, 1, '2025-11-18 05:18:45', '2025-08-28 05:56:10'),
(15, 'Fabland World', 'elemental-terrains', 'uploads/custom-images/image_1756380178.webp', 'Elemental Terrains', 'Meet outer ring of Fabland — the forbidden Elemental Terrains. This is where the world feels more dangerous, wild, and mysterious, shaped by both the ancient scattering of elemental power and the Shadow Legion’s dark corruption.', '<p style=\"text-align: center;\" data-start=\"175\" data-end=\"608\">Long ago, when the Void Entity clashed with the Guardians, the elements scattered across Fabland, reshaping the wild lands beyond Fabville&rsquo;s protective walls. What rose from that chaos were the <strong data-start=\"369\" data-end=\"391\">Elemental Terrains</strong>&mdash;each forever marked by the essence of Earth, Water, Air, and Fire. These places became both a treasure and a curse, for while they hold the purest crystals of creation, they also drew the gaze of the Shadow Legion.</p>\r\n<p style=\"text-align: center;\" data-start=\"610\" data-end=\"993\">To the villagers of Fabville, the lands beyond the wall are forbidden&mdash;spoken of only in whispers. Few know the truth: that the <strong data-start=\"737\" data-end=\"751\">FabCouncil</strong> hides many secrets, and the FabGuard sends expeditions into these terrains, risking life to uncover their mysteries. Every journey is a battle against the Shadow Legion, who have turned these terrains into strongholds for their dark plans.</p>\r\n<p style=\"text-align: center;\" data-start=\"995\" data-end=\"1277\">🌍 <strong data-start=\"998\" data-end=\"1020\">Terra Boulderlands</strong><br data-start=\"1020\" data-end=\"1023\">The land where the earth still breathes. Towering cliffs and endless canyons hide crystals that pulse like the heart of Fabland itself. But deep in its caverns, the Shadow Legion mines endlessly, forging energy cores to fuel their destructive machines.</p>\r\n<p style=\"text-align: center;\" data-start=\"1279\" data-end=\"1542\">🌊 <strong data-start=\"1282\" data-end=\"1299\">Aquara Depths</strong><br data-start=\"1299\" data-end=\"1302\">A realm of rivers, waterfalls, and glowing lakes, where ancient aquatic spirits once guided the flow of life. Now, blackened currents twist through its waters as the Legion poisons streams, bending the power of water into storms of chaos.</p>\r\n<p style=\"text-align: center;\" data-start=\"1544\" data-end=\"1804\">🌬️ <strong data-start=\"1548\" data-end=\"1564\">Aerion Peaks</strong><br data-start=\"1564\" data-end=\"1567\">Where the skies break into floating islands and crystalline spires, touched by eternal winds. To soar here was once freedom itself&mdash;but the Shadow Legion has built storm forges in the clouds, chaining the skies to their endless thunder.</p>\r\n<p style=\"text-align: center;\" data-start=\"1806\" data-end=\"2047\">🔥 <strong data-start=\"1809\" data-end=\"1826\">Inferno Crates</strong><br data-start=\"1826\" data-end=\"1829\">The land of living flame, where molten rivers carved the world&rsquo;s fiercest forges. Fire once brought creation and renewal, but under the Legion&rsquo;s hand, it burns only for destruction&mdash;breeding armies from ash and magma.</p>\r\n<p style=\"text-align: center;\" data-start=\"2049\" data-end=\"2368\">And so, beyond the FabGuard wall lies a forbidden frontier&mdash;lands that hold the answers to Fabland&rsquo;s creation and its greatest danger. For in every terrain, the Shadow Legion builds its share of a terrible device meant to awaken the Void once more&hellip; while the FabGuard fights to uncover the truth before it is too late.</p>', 2, '#ff1f31', NULL, NULL, NULL, 1, '2025-11-18 05:18:31', '2025-08-28 10:27:10'),
(16, 'Fabland World', 'the-silent-order', 'uploads/custom-images/image_1756553182.webp', 'The Silent Order', 'A shadowy syndicate that serves no side, dealing in relics, forbidden tech, and mercenary work. Crystals and coins are their only justice, and betrayal is their trademark. Both heroes and villains risk dealing with them when desperation calls.', '<p style=\"text-align: center;\">The Silent Order is not bound by honor or allegiance; to them, crystals and coins are justice. Existing in the shadows of Fabland, they thrive as brokers of secrecy&mdash;running the black market where forbidden relics, stolen technologies, assassinations, and mercenary contracts are traded. Their loyalty bends only to the highest bidder, making them both indispensable and impossible to trust. Even the Shadow Legion and FabCouncil, bitter enemies, have turned to the Order when desperation outweighed distrust. But betrayal is their art&mdash;every deal carries the risk of collapse if a better offer appears.</p>\r\n<p style=\"text-align: center;\" data-start=\"774\" data-end=\"1250\">At the heart of this shadow empire stands <strong data-start=\"816\" data-end=\"834\">Asher, the Fox</strong>&mdash;once Bravest Warrior in Inferno Core. Once a believer in justice, Asher&rsquo;s world burned in betrayal during a tragedy that shattered his faith. &nbsp;Now, Asher hides his scars behind sharp wit and cold calculation, weaving the Order into a web of secrecy and profit.</p>\r\n<p style=\"text-align: center;\" data-start=\"1252\" data-end=\"1978\">Beside him is <strong data-start=\"1266\" data-end=\"1286\">Draven, the Wolf</strong>&mdash;the enforcer and predator whose silence carries more weight than words. Once a decorated warrior in the FabCouncil&rsquo;s outer guard, Draven stood as a shield for the weak along the far trade routes and border villages. But years of corruption, bribes, and hollow politics eroded his faith. The breaking point came when the council chose politics over lives, allowing hundreds to die in a village raid that could have been prevented. Draven abandoned his oath, swearing never again to bleed for false ideals. In Asher&rsquo;s vision, he found kinship. Now, he is the Order&rsquo;s ruthless arm, training assassins known as the Silent Claws and reminding the world that fear itself is the strongest weapon.</p>\r\n<p style=\"text-align: center;\" data-start=\"1980\" data-end=\"2366\">The Silent Order&rsquo;s fortress&mdash;<strong data-start=\"2008\" data-end=\"2020\">The Veil</strong>&mdash;is a labyrinth hidden in the no-man&rsquo;s land between Shadow Legion&rsquo;s spiked territories and Fabville&rsquo;s towering wall. Inside, its shadow-lit halls hum with whispers of deals, glowing relics, secret auctions, and mercenaries sharpening blades in the dark. The fortress feels alive, its heart beating to the rhythm of greed, secrecy, and betrayal.</p>\r\n<p style=\"text-align: center;\" data-start=\"2368\" data-end=\"2741\">For the heroes, the Silent Order represents temptation and danger in equal measure. When relics, maps, or forbidden gadgets cannot be obtained through noble means, they may have no choice but to gamble with the Order. But every deal is a risk&mdash;the Shadow Legion may always pay more. The Order profits most from imbalance, fanning chaos to keep their black market thriving.</p>', 2, '#ad1fff', NULL, NULL, NULL, 1, '2025-11-18 05:18:17', '2025-08-30 11:18:22'),
(17, 'Mystic Gadgets & Relics', 'elementrix-chronicles', 'uploads/custom-images/image_1756618426.webp', 'Elementrix Chronicles', '“Born from Maxi’s wisdom in the unified realm of Primora, the Elementrix wrist gears were scattered across Fabland after the clash of Guardians and the Void Entity—now awaiting heroes to unlock their relic-bound powers.”', '<p style=\"text-align: center;\" data-start=\"162\" data-end=\"632\">Long before Fabland&rsquo;s heroes ever rose, there was <strong data-start=\"212\" data-end=\"223\">Primora</strong>, a realm where <strong data-start=\"239\" data-end=\"286\">Light and Shadow existed in perfect harmony</strong>. From that balance, the <strong data-start=\"311\" data-end=\"324\">Guardians</strong> were born, and with them emerged <strong data-start=\"358\" data-end=\"366\">Maxi</strong>, not a machine, but a conscious intelligence designed to preserve unity and knowledge. Maxi recorded the laws of creation, the flow of elements, and the secrets of the Guardians, ensuring that if the balance of Primora ever fractured, its truth would not be lost.</p>\r\n<p style=\"text-align: center;\" data-start=\"634\" data-end=\"1303\">But when the <strong data-start=\"647\" data-end=\"669\">Void Entity Draxus</strong> corrupted Shadow and waged war against Light, Primora itself shattered into many realms. The Guardians, torn between sides, could no longer maintain order. To protect their legacy, Maxi forged the <strong data-start=\"867\" data-end=\"893\">Elementrix Wrist Gears</strong>, embedding fragments of its own intelligence within them. Each gear became a conduit of elemental power, a bridge between mortal wielders and the Guardians&rsquo; energy. These fragment AIs&mdash;playful, fierce, or wise depending on the element&mdash;were the &ldquo;children&rdquo; of Maxi, guiding chosen wielders while always syncing back to the <strong data-start=\"1214\" data-end=\"1236\">Prime Core of Maxi</strong>, hidden deep within the <strong data-start=\"1261\" data-end=\"1278\">Crystal Nexus</strong>, the bridge of worlds.</p>\r\n<p style=\"text-align: center;\" data-start=\"1305\" data-end=\"1916\">Yet even Maxi could not stop the cataclysm. In the final clash, the Guardians vanished, and Draxus was sealed beyond the void. Maxi&rsquo;s Prime Core splintered, scattering both the <strong data-start=\"1482\" data-end=\"1497\">Wrist Gears</strong> and the <strong data-start=\"1506\" data-end=\"1524\">Ancient Relics</strong> across Fabland. The relics were different from the gears&mdash;pure elemental essences of Primora itself, forged before the fracture. Where the gears served as vessels and guides, the relics were untamed shards of creation, holding forgotten power and wisdom. Maxi designed the gears with secret conduits to sync with relics, ensuring that only chosen wielders could awaken their true potential.</p>\r\n<p style=\"text-align: center;\" data-start=\"1918\" data-end=\"2432\">Now, in the present, the <strong data-start=\"1943\" data-end=\"1956\">FablePals</strong> awaken these gears, each one greeted by its own AI companion. At first, they believe these AIs are their full guides&mdash;but slowly, through relic quests and sync events, they discover they are all fragments of something far greater: Maxi, the <strong data-start=\"2197\" data-end=\"2230\">Prime Intelligence of Fabland</strong>, still watching, still guiding. With every relic recovered, Maxi&rsquo;s memory and Prime Core grow stronger, drip-feeding the heroes visions of Primora, the Guardians, and the truth of the First Fracture.</p>\r\n<p style=\"text-align: center;\" data-start=\"2434\" data-end=\"2886\">The relics themselves test the heroes, granting seismic might, storm-born speed, firestorms, tidal mastery, or even control of time. Some whisper Guardian voices, others fuse to unlock dual powers between teammates. Yet each use comes with risk&mdash;burning energy, attracting Void Entities, or tempting corruption. And in the shadows, the <strong data-start=\"2769\" data-end=\"2786\">Shadow Legion</strong> seeks to gather relics for their mega-device, to tear open the void and release Draxus once more.</p>\r\n<p style=\"text-align: center;\" data-start=\"2888\" data-end=\"3255\">Thus, the story of Fabland begins: the <strong data-start=\"2927\" data-end=\"3031\">heroes wield gears forged by Maxi, guided by AI fragments, questing for relics that restore balance.</strong> Maxi is not just their mentor&mdash;it is the last spark of Primora&rsquo;s unity, waiting for the day it can reassemble and decide whether balance can be restored&hellip; or if the heroes themselves must become the new keepers of creation.</p>', 4, '#1fff48', NULL, NULL, NULL, 1, '2025-11-17 13:20:21', '2025-08-31 05:33:25'),
(18, 'Fabland Characters', 'toko-the-timeless', 'uploads/custom-images/image_1756725972.webp', 'Toko - The Timeless', 'Toko, the timeless tortoise, is the founder of the FabCouncil and keeper of the Ancient Library. Exiled after a betrayal, he now waits beneath a crystal-grown tree with Maxi AI, holding the secrets of the Elemental Worlds.', '<p style=\"text-align: center;\" data-start=\"293\" data-end=\"688\">Toko is older than Fabland itself &mdash; a timeless tortoise whose shell carries the marks of countless eras. He is the <strong data-start=\"408\" data-end=\"439\">first of knowledge</strong>, the one who was chosen when Element Scattering event occured on Fabland. From the beginning, Toko has protected the secrets of the&nbsp;<strong data-start=\"588\" data-end=\"608\">Elemental Worlds</strong>, preserving scrolls, relics, and prophecies that foretell the rise of heroes.</p>\r\n<p style=\"text-align: center;\" data-start=\"690\" data-end=\"1131\">It was Toko who founded the <strong data-start=\"718\" data-end=\"732\">FabCouncil</strong>, shaping Fabland into a place of order, wisdom, and balance. But history hides a painful truth &mdash; a betrayal or an unforeseen event led to his downfall. Stripped of his place in the council, Toko chose exile rather than vengeance. He withdrew into the <strong data-start=\"984\" data-end=\"1015\">Ancient Underground Library</strong>, hidden beneath the roots of a colossal crystal-grown tree, where the world&rsquo;s oldest knowledge sleeps in silence.</p>\r\n<p style=\"text-align: center;\" data-start=\"1133\" data-end=\"1358\">Through centuries, Toko remained watchful, accompanied only by <strong data-start=\"1196\" data-end=\"1207\">Maxi AI</strong>, the sentient intelligence forged in the age of the Guardians. Together, they guard wisdom and wait for the time when prophecy calls for new heroes.</p>\r\n<p style=\"text-align: center;\" data-start=\"1360\" data-end=\"1610\">When the <strong data-start=\"1369\" data-end=\"1386\">Shadow Legion</strong> rises and threatens all of Fabland, Toko will return from the shadows, guiding the FabHeroes on their <strong data-start=\"1489\" data-end=\"1508\">Elemental Quest</strong> &mdash; not as a ruler, but as the eternal teacher, carrying the weight of forgotten worlds on his shell.</p>', 3, '#1fff26', NULL, NULL, NULL, 1, '2025-11-18 05:17:37', '2025-09-01 11:26:12'),
(19, 'Fabland Characters', 'general-rock-bako', 'uploads/custom-images/image_1756728428.webp', 'General Rock & Bako', 'General Rock, the mighty rhino, stands as Fabland’s shield of strength, while young Bako, the clever gorilla tactician, guides with brilliant strategy. Together, they form the perfect balance of power and wisdom.', '<p style=\"text-align: center;\" data-start=\"120\" data-end=\"593\">Long before the rise of the FabCouncil, Fabland&rsquo;s borders were threatened by chaos, wild creatures, and the first shadows of the Legion. Out of this unrest rose <strong data-start=\"281\" data-end=\"297\">General Rock</strong>, a powerful rhino whose courage and strength became legend. With unshakable resolve, he defended Fabland&rsquo;s villages, earning the title of the Wall of Fabland. His leadership was rooted not only in strength but in loyalty&mdash;he saw every villager as family, every battle as a promise to protect.</p>\r\n<p style=\"text-align: center;\" data-start=\"595\" data-end=\"953\">At his side came <strong data-start=\"612\" data-end=\"620\">Bako</strong>, a young gorilla prodigy whose mind worked like a battlefield map. Unlike Rock, Bako lacked size and brute force, but his brilliance in tactics and ability to read enemy movements made him indispensable. Rock recognized Bako&rsquo;s gift and took him under his wing, forming a bond like mentor and apprentice, yet also comrades-in-arms.</p>\r\n<p style=\"text-align: center;\" data-start=\"955\" data-end=\"1254\">Together, they restructured Fabland&rsquo;s defenses, building watchtowers, training armies, and forging battle strategies that outsmarted foes many times stronger. Rock&rsquo;s unmatched might crushed opposition on the frontlines, while Bako&rsquo;s strategies ensured that every move was part of a larger victory.</p>\r\n<p style=\"text-align: center;\" data-start=\"1256\" data-end=\"1567\">But their journey was not only about war&mdash;they were the pillars of discipline, honor, and unity in Fabland. When the FabHeroes arrive, it is Rock and Bako who prepare them for the harsh realities of battle. Rock teaches endurance and courage, while Bako instills foresight and the art of outthinking the enemy.</p>\r\n<p style=\"text-align: center;\" data-start=\"1569\" data-end=\"1737\">As the Shadow Legion grows stronger, their bond becomes vital&mdash;showing that true leadership is not found in strength or intelligence alone, but in the harmony of both.</p>', 3, '#d95d16', NULL, NULL, NULL, 1, '2025-11-18 05:17:24', '2025-09-01 12:07:08');
INSERT INTO `fabworlds` (`id`, `title`, `slug`, `banner`, `banner_heading`, `banner_sub_heading`, `description`, `category_id`, `line_color`, `seo_title`, `seo_description`, `tags`, `status`, `updated_at`, `created_at`) VALUES
(20, 'Fabland Characters', 'chef-truffle', 'uploads/custom-images/image_1756730427.webp', 'Chef Truffle', 'With his magical recipes and warm smile, Chef Truffle keeps Fabville’s spirit alive. His cooking not only fills bellies but also heals hearts, bringing joy and strength to every hero.', '<p style=\"text-align: center;\" data-start=\"177\" data-end=\"599\">Chef Truffle is Fabland&rsquo;s beloved master cook, a cheerful pig with a round belly and a heart twice as big. His kitchen is more than a place for meals&mdash;it&rsquo;s the soul of Fabville, where villagers gather to share laughter, comfort, and friendship. Truffle believes that food carries stories and healing power, so every dish he prepares is infused with love, tradition, and a sprinkle of mystical herbs found only in Fabland.</p>\r\n<p style=\"text-align: center;\" data-start=\"601\" data-end=\"904\">But Chef Truffle is more than just a cook. Long ago, he studied under the <strong data-start=\"675\" data-end=\"692\">Healer Willow</strong>, learning how ingredients from each elemental region hold unique energies. Through his meals, he restores strength to weary FabGuard soldiers, calms restless hearts, and sometimes even boosts elemental powers.</p>\r\n<p style=\"text-align: center;\" data-start=\"906\" data-end=\"1269\">Though jolly and a little clumsy at times, Truffle is also brave. When danger comes, he doesn&rsquo;t wield weapons&mdash;he wields courage, compassion, and a giant iron ladle that doubles as both spoon and shield. For the FabHeroes, Chef Truffle is family: a mentor who teaches that true strength doesn&rsquo;t only come from battles, but also from sharing a warm meal together.</p>', 3, '#d96a16', NULL, NULL, NULL, 1, '2025-11-18 05:17:15', '2025-09-01 12:40:27'),
(21, 'Fabland Characters', 'healer-willow', 'uploads/custom-images/image_1756881837.webp', 'Healer Willow', 'A kind and wise deer, devoted to caring for Fabland through herbal remedies and healing magic. Her compassion and gentle strength make her one of Fabland’s most trusted guides.', '<p style=\"text-align: center;\" data-start=\"822\" data-end=\"1196\">Long before Fabland was threatened by shadows, Willow wandered as a healer across distant valleys, guided only by the whispers of the forest. Her journey led her to a sacred cliff where life-energy bloomed in endless abundance. There, she founded <strong data-start=\"1069\" data-end=\"1086\">Verdant Haven</strong>, a magical nursery where herbs glowed under her care, and potions were brewed with both science and spirit.</p>\r\n<p style=\"text-align: center;\" data-start=\"1198\" data-end=\"1508\">Her heart, however, longed not only to heal but to teach. On a nearby hilltop, she created the <strong data-start=\"1293\" data-end=\"1311\">Medical School</strong>, an open-air dome where young cubs of every kind gathered. Under Willow&rsquo;s guidance, they learned to mix herbs, channel light through leaves, and most importantly &mdash; to treat others with kindness.</p>\r\n<p style=\"text-align: center;\" data-start=\"1510\" data-end=\"1939\">But as the <strong data-start=\"1521\" data-end=\"1538\">Shadow Legion</strong> cast its dark influence across Fabland, Willow&rsquo;s gentle role grew heavier. No longer only tending to fevers and wounds, she became a pillar of hope &mdash; mending the injured after battles, shielding the Fabvillagers with protective magic, and guiding the heroes when despair threatened their spirits. Her soft voice carried strength, and her healing touch restored courage as much as it restored flesh.</p>\r\n<p style=\"text-align: center;\" data-start=\"1510\" data-end=\"1939\">Within the FabCouncil, Healer Willow is the voice of compassion and balance. While <strong data-start=\"206\" data-end=\"222\">General Rock</strong> brings unshakable strength and <strong data-start=\"254\" data-end=\"262\">Bako</strong> delivers sharp strategies, Willow grounds their decisions with empathy, ensuring Fabland&rsquo;s people are never forgotten in times of war. She reminds the council that protecting Fabland isn&rsquo;t only about walls and armies &mdash; it is also about hearts, families, and hope.</p>\r\n<p style=\"text-align: center;\" data-start=\"1510\" data-end=\"1939\">Though she avoids the frontlines, Healer Willow&rsquo;s presence is felt in every fight &mdash; in the resilience of her people, the wisdom of her students, and the life that blooms wherever she walks.</p>', 3, '#4bf542', NULL, NULL, NULL, 1, '2025-11-18 05:17:05', '2025-09-03 06:43:57'),
(22, 'Fabland Characters', 'mr-beavers', 'uploads/custom-images/image_1756884146.webp', 'Mr. Beavers - Master Builders', 'The hardworking Beaver family are Fabville’s master builders, crafting homes, bridges, and grand structures with skill and heart. Led by their wise elder and joined by energetic cub apprentices, they bring safety and creativity to every corner of Fabland.', '<p style=\"text-align: center;\" data-start=\"138\" data-end=\"539\">The Beaver family, lovingly known as <strong data-start=\"175\" data-end=\"190\">Mr. Beavers</strong>, are the master builders of Fabville. With strong teeth, steady paws, and endless creativity, they construct everything from cozy homes to towering bridges and sturdy walls that protect the village. Their work isn&rsquo;t just about wood and stone &mdash; they blend construction with ingenuity, weaving <strong data-start=\"483\" data-end=\"504\">elemental harmony</strong> into every structure they raise.</p>\r\n<p style=\"text-align: center;\" data-start=\"541\" data-end=\"874\">Generations of Beavers have passed their craft down, and now the current family &mdash; led by the wise elder builder, <strong data-start=\"654\" data-end=\"673\">Mr. Beavers Sr.</strong>, and his energetic twin cub apprentices &mdash; work together as one. Their construction yard, filled with glowing crystal tools, wood piles, and half-finished blueprints, is always buzzing with activity.</p>\r\n<p style=\"text-align: center;\" data-start=\"876\" data-end=\"1179\">Though humble in nature, <strong data-start=\"901\" data-end=\"964\">Mr. Beavers is generous, always ready to lend a helping paw</strong>. He is a perfectionist in his craft, ensuring every wall stands firm and every bridge endures the test of time. His family&rsquo;s work fuels Fabville&rsquo;s expansion, allowing the community to grow safely and beautifully.</p>\r\n<p style=\"text-align: center;\" data-start=\"1181\" data-end=\"1426\">Without the Beavers, Fabville&rsquo;s walls would crumble, its bridges would fall, and its homes would stand empty. To them, every nail and every stone is not just work &mdash; <strong data-start=\"1346\" data-end=\"1423\">it&rsquo;s a gift of safety, progress, and belonging to the community they love</strong>.</p>', 3, '#f5a442', NULL, NULL, NULL, 1, '2025-11-18 05:16:53', '2025-09-03 07:22:26'),
(23, 'Fabland Characters', 'drummer-riffy', 'uploads/custom-images/image_1756982525.webp', 'Drummer Riffy', 'The joyful panda and heartbeat of Fabville, Riffy spreads laughter and rhythm wherever he goes. With his enchanted crystal drums, he turns every moment into music — lifting spirits and uniting villagers.', '<p style=\"text-align: center;\" data-start=\"113\" data-end=\"461\">Among the laughter and chatter of Fabville, one sound always rises above &mdash; the joyful rhythm of <strong data-start=\"209\" data-end=\"226\">Drummer Riffy</strong>. A carefree panda with boundless energy, Riffy lives for music, fun, and the freedom of expression. With a set of enchanted crystal drums strapped to his waist, he turns every gathering into a festival and every street into a stage.</p>\r\n<p style=\"text-align: center;\" data-start=\"463\" data-end=\"829\">Riffy is loved not just for his music but for his <strong data-start=\"513\" data-end=\"547\">spirited, unpredictable nature</strong>. One moment he&rsquo;s cracking jokes and pulling pranks, the next he&rsquo;s lost in the beat of his drums, pouring out his emotions with raw honesty. His moody swings are no secret &mdash; when he&rsquo;s down, his rhythms grow slow and heavy, but the villagers know it&rsquo;s his way of sharing his heart.</p>\r\n<p style=\"text-align: center;\" data-start=\"831\" data-end=\"1108\">He plays at festivals, welcomes travelers with music, and often sneaks into the <strong data-start=\"911\" data-end=\"929\">village square</strong> to perform under the lantern lights. When danger looms, Riffy&rsquo;s drumming becomes more than entertainment &mdash; it&rsquo;s a rallying cry, lifting spirits and uniting Fabville in courage.</p>\r\n<p style=\"text-align: center;\" data-start=\"1110\" data-end=\"1378\">Though carefree, Riffy carries a quiet dream: to one day use his music not just for joy, but to help the Fabheroes on their quests, channeling elemental rhythm into strength. In him, Fabville has not just a drummer, but <strong data-start=\"1330\" data-end=\"1375\">a heartbeat &mdash; fun, wild, and deeply alive</strong>.</p>', 3, '#ff2626', NULL, NULL, NULL, 1, '2025-11-18 05:16:43', '2025-09-04 10:42:05'),
(24, 'Shadow Legion Order', 'supreme-void-entity', 'uploads/custom-images/image_1757223702.webp', 'Supreme Void Entity', 'A primordial force of nothingness, the Supreme Void Entity seeks to corrupt the elements, shatter balance, and unmake creation itself.', '<p style=\"text-align: center;\" data-start=\"197\" data-end=\"560\">Before the Guardians shaped the realms, before light ever touched Fabland, there was only the <strong data-start=\"291\" data-end=\"299\">Void</strong> &mdash; a silence without time, form, or end. From this abyss rose the <strong data-start=\"365\" data-end=\"388\">Supreme Void Entity</strong>, a consciousness born of nothingness itself. Unlike the Guardians, who embodied balance and creation, the Void Entity existed only to <strong data-start=\"523\" data-end=\"557\">consume, corrupt, and collapse</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"562\" data-end=\"903\">When <strong data-start=\"567\" data-end=\"578\">Primora</strong> split into the Light Realm and the Shadow Realm, its fracture gave birth to the Five Elemental Worlds. The Guardians rose to protect them, forging the <strong data-start=\"730\" data-end=\"752\">Elemental Crystals</strong>, vessels of pure balance. But in their brilliance, the crystals scarred the Void &mdash; forcing it into retreat. And in retreat, the Void learned hunger.</p>\r\n<p style=\"text-align: center;\" data-start=\"905\" data-end=\"1251\">It discovered that by <strong data-start=\"927\" data-end=\"973\">infecting elemental energy with corruption</strong>, it could twist creation against itself. It began whispering across the Shadow Realm, seeking a vessel. From these whispers came its first disciple &mdash; <strong data-start=\"1124\" data-end=\"1154\">Draxus, the Panther Herald</strong>, a once-chosen warrior who surrendered to the abyss and became the Entity&rsquo;s living instrument.</p>\r\n<p style=\"text-align: center;\" data-start=\"1253\" data-end=\"1669\">The Void sought to consume the newborn realms, but the Guardians would not yield. In a desperate stand, the <strong data-start=\"1361\" data-end=\"1405\">Five Elemental Guardians merged into one</strong> &mdash; the Singular Elemental Guardian &mdash; and battled the Supreme Void Entity in a war that shook existence itself. The Entity could not be destroyed, for nothingness cannot be slain. Instead, it was <strong data-start=\"1600\" data-end=\"1637\">trapped beyond the Seal of Realms</strong>, imprisoned outside creation.</p>\r\n<p style=\"text-align: center;\" data-start=\"1671\" data-end=\"1938\">Victory, however, demanded sacrifice. The Guardians shattered, their forms lost forever, their essences scattered into the raw elements that now flow across Fabland &mdash; Earth, Air, Fire, Water, and Time. Their sacrifice forged harmony&hellip; but left the realms vulnerable.</p>\r\n<p style=\"text-align: center;\" data-start=\"1940\" data-end=\"2303\">From beyond the Seal, the <strong data-start=\"1966\" data-end=\"2003\">Supreme Void Entity still watches</strong>. Through Draxus, it birthed the <strong data-start=\"2036\" data-end=\"2053\">Shadow Legion</strong> &mdash; an army designed to <strong data-start=\"2076\" data-end=\"2116\">bleed the elemental worlds of purity</strong>, replacing crystal light with blood-crystal corruption. Every crystal stolen, every Guardian weakened, every realm cracked open is one more step toward <strong data-start=\"2269\" data-end=\"2300\">unsealing the Void&rsquo;s prison</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"2305\" data-end=\"2331\">Its purpose is singular:</p>\r\n<p style=\"text-align: center;\" data-start=\"2334\" data-end=\"2384\">&nbsp;To <strong data-start=\"2337\" data-end=\"2381\">shatter the balance of the Five Elements</strong>.</p>\r\n<p style=\"text-align: center;\" data-start=\"2334\" data-end=\"2384\">To&nbsp;<strong data-start=\"2390\" data-end=\"2441\">consume the Guardians and enslave their essence</strong>.&nbsp;</p>\r\n<p style=\"text-align: center;\" data-start=\"2334\" data-end=\"2384\">To <strong data-start=\"2450\" data-end=\"2478\">break the Seal of Realms</strong> and manifest fully into the world &mdash; not as shadow, but as formless eternity that devours all.</p>\r\n<p style=\"text-align: center;\" data-start=\"2576\" data-end=\"2705\">When it awakens, there will be <strong data-start=\"2607\" data-end=\"2654\">no sky, no earth, no flame, no sea, no time</strong>.<br data-start=\"2655\" data-end=\"2658\">Only the <strong data-start=\"2667\" data-end=\"2702\">endless red horizon of the Void</strong>.</p>', 5, '#eb6b34', NULL, NULL, NULL, 1, '2025-11-18 05:16:30', '2025-09-07 05:30:56'),
(25, 'Shadow Legion Order', 'lord-draxus-commaders', 'uploads/custom-images/image_1757243283.webp', 'Lord Draxus & Commaders', 'Bound by fear and ambition, five commanders embody the Legion’s cruelty—fangs of corruption that tear through realms, united under the will of their Shadow Warlord Draxus and the Supreme Void Entity.', '<p style=\"text-align: center;\" data-start=\"206\" data-end=\"616\">When the Supreme Void Entity was chained beyond the stars, it needed a hand to carry its will across Fabland. From the ashes of a once-great warrior, it forged its herald &mdash; <strong data-start=\"379\" data-end=\"421\">Warlord Draxus, the Panther of Shadows</strong>. Neither fully beast nor fully spirit, Draxus became the living link between the Void and the mortal realms. His essence burns with corrupted crystal, his soul tethered to the Entity&rsquo;s hunger.</p>\r\n<p style=\"text-align: center;\" data-start=\"618\" data-end=\"884\">But even the strongest warlord cannot conquer alone. To spread terror across the elemental worlds, Draxus raised an elite circle of commanders &mdash; his <strong data-start=\"767\" data-end=\"781\">Five Fangs</strong>, each a reflection of the Void&rsquo;s cruelty, chosen for their savagery, cunning, and unstoppable might.</p>\r\n<p style=\"text-align: center;\" data-start=\"888\" data-end=\"1058\"><strong data-start=\"888\" data-end=\"916\">Venyl, the Blood Serpent</strong> &ndash; A venomous snake-being who thrives on ritual sacrifice, draining life-force into blood-crystals that fuel the Shadow Legion&rsquo;s corruption. <strong data-start=\"1061\" data-end=\"1087\">Kruger, the Iron Rhino</strong> &ndash; A juggernaut of brute strength, armored in void-forged iron plates. His charge shatters defenses, leaving armies crushed beneath his relentless rage. <strong data-start=\"1244\" data-end=\"1269\">Raven, the Shade Wing</strong> &ndash; A dark assassin who bends shadows into blades. Silent and merciless, she is the dagger in the dark, the whisper of death across the skies. <strong data-start=\"1415\" data-end=\"1445\">Gravor, the Scorpion Dread</strong> &ndash; Twisted into half-beast, half-machine, his crystalline stinger injects corruption that spreads through land and living alike. Each strike poisons both body and spirit. <strong data-start=\"1620\" data-end=\"1648\">Xandar, the Wolf Ravager</strong> &ndash; A feral berserker, unchained madness made flesh. With dual blood-crystal axes and crimson runes burning across his body, he revels in slaughter, leaving only silence where villages once stood.</p>\r\n<p style=\"text-align: center;\" data-start=\"1847\" data-end=\"2042\">Together, these five became more than lieutenants. They became <strong data-start=\"1910\" data-end=\"1941\">extensions of Draxus&rsquo;s will</strong> &mdash; claws of the panther, gnashing at the walls of balance, tearing holes into the elemental worlds.</p>\r\n<p style=\"text-align: center;\" data-start=\"2044\" data-end=\"2229\">Across Fabland, their names are whispered as omens. Where the Five Fangs march, corruption follows. Where Draxus leads, the very ground trembles with the promise of the Void&rsquo;s return.</p>\r\n<p style=\"text-align: center;\" data-start=\"2231\" data-end=\"2344\">Their ultimate mission: <strong data-start=\"2255\" data-end=\"2342\">to shatter the Seal of Realms and bring the Supreme Void Entity into full dominion.</strong></p>', 5, '#fc8803', NULL, NULL, NULL, 1, '2025-11-18 05:16:19', '2025-09-07 11:04:22'),
(26, 'Shadow Legion Order', 'shadow-legion-army', 'uploads/custom-images/image_1757588078.webp', 'Shadow Legion Army', 'An endless horde of corruption, forged by the Void and led by Draxus. Seven ruthless divisions strike, hunt, deceive, drain, crush, revive, and command — spreading red crystal corruption to shatter Fabland’s balance.', '<p style=\"text-align: center;\" data-start=\"143\" data-end=\"506\">The Shadow Legion is not a simple army &mdash; it is a machine of corruption, designed by the Supreme Void Entity and enforced by Warlord Draxus. Each of its seven divisions serves a distinct, merciless role in unraveling the harmony of the elemental realms. Together, they spread red crystal corruption into the heart of Fabland, draining the essence of life itself.</p>\r\n<p style=\"text-align: center;\" data-start=\"508\" data-end=\"947\">The <strong data-start=\"512\" data-end=\"530\">Shadow Rangers</strong>, brutal frontline infantry of panthers, wolves, and hyenas, storm villages without warning. Their jagged blades and blood-crystal spears cut through defenders while their crimson eyes blaze with unrelenting hunger. Once a settlement is weakened, the <strong data-start=\"781\" data-end=\"798\">Shadow Scouts</strong> descend from the forests and mountains, tracking survivors, marking elemental crystal veins, and ensuring no soul can hide from the Legion&rsquo;s hunt.</p>\r\n<p style=\"text-align: center;\" data-start=\"949\" data-end=\"1479\">From the shadows, the <strong data-start=\"971\" data-end=\"987\">Shadow Spies</strong> manipulate and deceive, sowing fear long before battle arrives. They infiltrate councils, spread whispers of betrayal, and weaken alliances so that when the Legion strikes, the defenders are already fractured. Following in their wake, the <strong data-start=\"1227\" data-end=\"1248\">Shadow Collectors</strong> carve into Fabland&rsquo;s land itself. Beetles, rats, and vultures extract elemental crystals from the earth, draining them of their pure energy and twisting them into blood-crystal shards that fuel the Legion&rsquo;s endless war machines.</p>\r\n<p style=\"text-align: center;\" data-start=\"1481\" data-end=\"1939\">Where resistance still stands, the <strong data-start=\"1516\" data-end=\"1537\">Shadow War Beasts</strong> become the hammer of destruction. Corrupted bears, serpents, and rhinos, fused with molten red crystal, crash through fortress walls and scatter armies with unstoppable force. And when the battle is done, the <strong data-start=\"1747\" data-end=\"1771\">Shadow Necro-Menders</strong> desecrate the fallen. Their runes pulse crimson as they stitch shattered soldiers into husks, breathing unholy life into them to serve again in chains of corruption.</p>\r\n<p style=\"text-align: center;\" data-start=\"1941\" data-end=\"2192\">Overseeing it all, the <strong data-start=\"1964\" data-end=\"1984\">Shadow Overseers</strong> enforce order with cruelty. Clad in jagged blood-crystal masks, they march entire squadrons into war, raise banners bearing the Void&rsquo;s mark, and ensure the will of Draxus is carried out without hesitation.</p>\r\n<p style=\"text-align: center;\" data-start=\"2194\" data-end=\"2602\">Together, these divisions are a tide of unending darkness. Villages burn, crystal veins bleed red, and the elemental terrains grow weaker with every raid. What they cannot conquer, they corrupt; what they cannot corrupt, they erase. The Shadow Legion&rsquo;s purpose is singular and absolute &mdash; to unravel Fabland&rsquo;s balance, bleed its elemental crystals dry, and pave the way for the Supreme Void Entity&rsquo;s return.</p>', 5, '#fc8803', NULL, NULL, NULL, 1, '2025-11-18 05:16:03', '2025-09-11 10:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `fabworld_categories`
--

CREATE TABLE `fabworld_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fabworld_categories`
--

INSERT INTO `fabworld_categories` (`id`, `name`, `slug`, `updated_at`, `created_at`) VALUES
(1, 'Fablepals Mystic World', 'fablepals-mystic-world', '2025-11-14 13:24:09', '2025-11-14 13:24:09'),
(2, 'Fabland World', 'fabland-world', '2025-11-14 13:24:09', '2025-11-14 13:24:09'),
(3, 'Fabworld Villagers', 'fabworld-villagers', '2025-11-14 13:24:09', '2025-11-14 13:24:09'),
(4, 'Mystic Gadgets & Relics', 'mystic-gadgets-and-relics', '2025-11-14 13:24:09', '2025-11-14 13:24:09'),
(5, 'Shadow Legion Order', 'shadow-legion-order', '2025-11-14 13:24:09', '2025-11-14 13:24:09'),
(6, 'Fab Cinematic Universe', 'fab-cinematic-universe', '2025-11-14 13:24:09', '2025-11-14 13:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `fabworld_galleries`
--

CREATE TABLE `fabworld_galleries` (
  `id` int(11) NOT NULL,
  `fabworld_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fabworld_galleries`
--

INSERT INTO `fabworld_galleries` (`id`, `fabworld_id`, `image`, `updated_at`, `created_at`) VALUES
(8, 3, 'uploads/gallery/gallery_1755063733_0.webp', '2025-08-13 05:42:13', '2025-08-13 05:42:13'),
(9, 3, 'uploads/gallery/gallery_1755066740_0.webp', '2025-08-13 06:32:20', '2025-08-13 06:32:20'),
(10, 3, 'uploads/gallery/gallery_1755068087_0.webp', '2025-08-13 06:54:47', '2025-08-13 06:54:47'),
(11, 3, 'uploads/gallery/gallery_1755069992_0.webp', '2025-08-13 07:26:32', '2025-08-13 07:26:32'),
(12, 3, 'uploads/gallery/gallery_1755069992_1.webp', '2025-08-13 07:26:32', '2025-08-13 07:26:32'),
(13, 3, 'uploads/gallery/gallery_1755069992_2.webp', '2025-08-13 07:26:32', '2025-08-13 07:26:32'),
(14, 3, 'uploads/gallery/gallery_1755069992_3.webp', '2025-08-13 07:26:32', '2025-08-13 07:26:32'),
(15, 3, 'uploads/gallery/gallery_1755070290_0.webp', '2025-08-13 07:31:30', '2025-08-13 07:31:30'),
(16, 4, 'uploads/gallery/gallery_1755085521_0.webp', '2025-08-13 11:45:21', '2025-08-13 11:45:21'),
(17, 4, 'uploads/gallery/gallery_1755085521_1.webp', '2025-08-13 11:45:21', '2025-08-13 11:45:21'),
(18, 4, 'uploads/gallery/gallery_1755085521_2.webp', '2025-08-13 11:45:21', '2025-08-13 11:45:21'),
(19, 4, 'uploads/gallery/gallery_1755085521_3.webp', '2025-08-13 11:45:21', '2025-08-13 11:45:21'),
(20, 4, 'uploads/gallery/gallery_1755085521_4.webp', '2025-08-13 11:45:21', '2025-08-13 11:45:21'),
(21, 4, 'uploads/gallery/gallery_1755085521_5.webp', '2025-08-13 11:45:21', '2025-08-13 11:45:21'),
(22, 4, 'uploads/gallery/gallery_1755085870_0.webp', '2025-08-13 11:51:10', '2025-08-13 11:51:10'),
(23, 4, 'uploads/gallery/gallery_1755087620_0.webp', '2025-08-13 12:20:20', '2025-08-13 12:20:20'),
(24, 5, 'uploads/gallery/gallery_1755581510_0.webp', '2025-08-19 05:31:50', '2025-08-19 05:31:50'),
(25, 5, 'uploads/gallery/gallery_1755581510_1.webp', '2025-08-19 05:31:50', '2025-08-19 05:31:50'),
(26, 5, 'uploads/gallery/gallery_1755581510_2.webp', '2025-08-19 05:31:50', '2025-08-19 05:31:50'),
(27, 5, 'uploads/gallery/gallery_1755587030_0.webp', '2025-08-19 07:03:50', '2025-08-19 07:03:50'),
(28, 5, 'uploads/gallery/gallery_1755587030_1.webp', '2025-08-19 07:03:50', '2025-08-19 07:03:50'),
(29, 5, 'uploads/gallery/gallery_1755587030_2.webp', '2025-08-19 07:03:50', '2025-08-19 07:03:50'),
(30, 6, 'uploads/gallery/gallery_1755588779_0.webp', '2025-08-19 07:32:59', '2025-08-19 07:32:59'),
(31, 6, 'uploads/gallery/gallery_1755588779_1.webp', '2025-08-19 07:32:59', '2025-08-19 07:32:59'),
(32, 6, 'uploads/gallery/gallery_1755588779_2.webp', '2025-08-19 07:32:59', '2025-08-19 07:32:59'),
(33, 6, 'uploads/gallery/gallery_1755588779_3.webp', '2025-08-19 07:32:59', '2025-08-19 07:32:59'),
(34, 6, 'uploads/gallery/gallery_1755588779_4.webp', '2025-08-19 07:32:59', '2025-08-19 07:32:59'),
(35, 6, 'uploads/gallery/gallery_1755588779_5.webp', '2025-08-19 07:32:59', '2025-08-19 07:32:59'),
(36, 6, 'uploads/gallery/gallery_1755588779_6.webp', '2025-08-19 07:32:59', '2025-08-19 07:32:59'),
(37, 6, 'uploads/gallery/gallery_1755588779_7.webp', '2025-08-19 07:32:59', '2025-08-19 07:32:59'),
(38, 7, 'uploads/gallery/gallery_1755603681_0.webp', '2025-08-19 11:41:21', '2025-08-19 11:41:21'),
(39, 7, 'uploads/gallery/gallery_1755603681_1.webp', '2025-08-19 11:41:21', '2025-08-19 11:41:21'),
(40, 7, 'uploads/gallery/gallery_1755603681_2.webp', '2025-08-19 11:41:21', '2025-08-19 11:41:21'),
(41, 7, 'uploads/gallery/gallery_1755603681_3.webp', '2025-08-19 11:41:21', '2025-08-19 11:41:21'),
(42, 7, 'uploads/gallery/gallery_1755603681_4.webp', '2025-08-19 11:41:21', '2025-08-19 11:41:21'),
(43, 7, 'uploads/gallery/gallery_1755603681_5.webp', '2025-08-19 11:41:21', '2025-08-19 11:41:21'),
(44, 7, 'uploads/gallery/gallery_1755603681_6.webp', '2025-08-19 11:41:21', '2025-08-19 11:41:21'),
(45, 8, 'uploads/gallery/gallery_1755694539_0.webp', '2025-08-20 12:55:39', '2025-08-20 12:55:39'),
(46, 8, 'uploads/gallery/gallery_1755694539_1.webp', '2025-08-20 12:55:39', '2025-08-20 12:55:39'),
(47, 8, 'uploads/gallery/gallery_1755694539_2.webp', '2025-08-20 12:55:39', '2025-08-20 12:55:39'),
(48, 8, 'uploads/gallery/gallery_1755694539_3.webp', '2025-08-20 12:55:39', '2025-08-20 12:55:39'),
(49, 9, 'uploads/gallery/gallery_1755777464_0.webp', '2025-08-21 11:57:44', '2025-08-21 11:57:44'),
(50, 9, 'uploads/gallery/gallery_1755777464_1.webp', '2025-08-21 11:57:44', '2025-08-21 11:57:44'),
(51, 9, 'uploads/gallery/gallery_1755777464_2.webp', '2025-08-21 11:57:44', '2025-08-21 11:57:44'),
(52, 9, 'uploads/gallery/gallery_1755777464_3.webp', '2025-08-21 11:57:44', '2025-08-21 11:57:44'),
(53, 9, 'uploads/gallery/gallery_1755777464_4.webp', '2025-08-21 11:57:44', '2025-08-21 11:57:44'),
(54, 9, 'uploads/gallery/gallery_1755777464_5.webp', '2025-08-21 11:57:44', '2025-08-21 11:57:44'),
(55, 9, 'uploads/gallery/gallery_1755777464_6.webp', '2025-08-21 11:57:44', '2025-08-21 11:57:44'),
(56, 9, 'uploads/gallery/gallery_1755777464_7.webp', '2025-08-21 11:57:44', '2025-08-21 11:57:44'),
(57, 11, 'uploads/gallery/gallery_1755847294_0.webp', '2025-08-22 07:21:34', '2025-08-22 07:21:34'),
(58, 11, 'uploads/gallery/gallery_1755847294_1.webp', '2025-08-22 07:21:34', '2025-08-22 07:21:34'),
(59, 11, 'uploads/gallery/gallery_1755847294_2.webp', '2025-08-22 07:21:34', '2025-08-22 07:21:34'),
(60, 11, 'uploads/gallery/gallery_1755847294_3.webp', '2025-08-22 07:21:34', '2025-08-22 07:21:34'),
(61, 11, 'uploads/gallery/gallery_1755847294_4.webp', '2025-08-22 07:21:34', '2025-08-22 07:21:34'),
(62, 11, 'uploads/gallery/gallery_1755847294_5.webp', '2025-08-22 07:21:34', '2025-08-22 07:21:34'),
(63, 11, 'uploads/gallery/gallery_1755847294_6.webp', '2025-08-22 07:21:34', '2025-08-22 07:21:34'),
(64, 11, 'uploads/gallery/gallery_1755847294_7.webp', '2025-08-22 07:21:34', '2025-08-22 07:21:34'),
(65, 12, 'uploads/gallery/gallery_1756019766_0.webp', '2025-08-24 07:16:06', '2025-08-24 07:16:06'),
(66, 12, 'uploads/gallery/gallery_1756019766_1.webp', '2025-08-24 07:16:06', '2025-08-24 07:16:06'),
(67, 12, 'uploads/gallery/gallery_1756019766_2.webp', '2025-08-24 07:16:06', '2025-08-24 07:16:06'),
(68, 12, 'uploads/gallery/gallery_1756019766_3.webp', '2025-08-24 07:16:06', '2025-08-24 07:16:06'),
(69, 12, 'uploads/gallery/gallery_1756019766_4.webp', '2025-08-24 07:16:06', '2025-08-24 07:16:06'),
(70, 12, 'uploads/gallery/gallery_1756019766_5.webp', '2025-08-24 07:16:06', '2025-08-24 07:16:06'),
(71, 12, 'uploads/gallery/gallery_1756019766_6.webp', '2025-08-24 07:16:06', '2025-08-24 07:16:06'),
(72, 12, 'uploads/gallery/gallery_1756019766_7.webp', '2025-08-24 07:16:06', '2025-08-24 07:16:06'),
(73, 13, 'uploads/gallery/gallery_1756359712_0.webp', '2025-08-28 05:41:52', '2025-08-28 05:41:52'),
(74, 13, 'uploads/gallery/gallery_1756359712_1.webp', '2025-08-28 05:41:52', '2025-08-28 05:41:52'),
(75, 13, 'uploads/gallery/gallery_1756359712_2.webp', '2025-08-28 05:41:52', '2025-08-28 05:41:52'),
(76, 13, 'uploads/gallery/gallery_1756359712_3.webp', '2025-08-28 05:41:52', '2025-08-28 05:41:52'),
(77, 13, 'uploads/gallery/gallery_1756359712_4.webp', '2025-08-28 05:41:52', '2025-08-28 05:41:52'),
(78, 13, 'uploads/gallery/gallery_1756359712_5.webp', '2025-08-28 05:41:52', '2025-08-28 05:41:52'),
(79, 13, 'uploads/gallery/gallery_1756359712_6.webp', '2025-08-28 05:41:52', '2025-08-28 05:41:52'),
(80, 13, 'uploads/gallery/gallery_1756359712_7.webp', '2025-08-28 05:41:52', '2025-08-28 05:41:52'),
(81, 14, 'uploads/gallery/gallery_1756376445_0.webp', '2025-08-28 10:20:45', '2025-08-28 10:20:45'),
(82, 14, 'uploads/gallery/gallery_1756376445_1.webp', '2025-08-28 10:20:45', '2025-08-28 10:20:45'),
(83, 14, 'uploads/gallery/gallery_1756376445_2.webp', '2025-08-28 10:20:45', '2025-08-28 10:20:45'),
(84, 14, 'uploads/gallery/gallery_1756376445_3.webp', '2025-08-28 10:20:45', '2025-08-28 10:20:45'),
(85, 14, 'uploads/gallery/gallery_1756376445_4.webp', '2025-08-28 10:20:45', '2025-08-28 10:20:45'),
(86, 14, 'uploads/gallery/gallery_1756376445_5.webp', '2025-08-28 10:20:45', '2025-08-28 10:20:45'),
(87, 14, 'uploads/gallery/gallery_1756376445_6.webp', '2025-08-28 10:20:45', '2025-08-28 10:20:45'),
(88, 14, 'uploads/gallery/gallery_1756376445_7.webp', '2025-08-28 10:20:45', '2025-08-28 10:20:45'),
(89, 15, 'uploads/gallery/gallery_1756379090_0.webp', '2025-08-28 11:04:50', '2025-08-28 11:04:50'),
(90, 15, 'uploads/gallery/gallery_1756379090_1.webp', '2025-08-28 11:04:50', '2025-08-28 11:04:50'),
(91, 15, 'uploads/gallery/gallery_1756379090_2.webp', '2025-08-28 11:04:50', '2025-08-28 11:04:50'),
(92, 15, 'uploads/gallery/gallery_1756379090_3.webp', '2025-08-28 11:04:50', '2025-08-28 11:04:50'),
(93, 15, 'uploads/gallery/gallery_1756380178_0.webp', '2025-08-28 11:22:58', '2025-08-28 11:22:58'),
(94, 16, 'uploads/gallery/gallery_1756553182_0.webp', '2025-08-30 11:26:22', '2025-08-30 11:26:22'),
(95, 16, 'uploads/gallery/gallery_1756553182_1.webp', '2025-08-30 11:26:22', '2025-08-30 11:26:22'),
(96, 16, 'uploads/gallery/gallery_1756553182_2.webp', '2025-08-30 11:26:22', '2025-08-30 11:26:22'),
(97, 16, 'uploads/gallery/gallery_1756553220_0.webp', '2025-08-30 11:27:00', '2025-08-30 11:27:00'),
(98, 16, 'uploads/gallery/gallery_1756553220_1.webp', '2025-08-30 11:27:00', '2025-08-30 11:27:00'),
(99, 16, 'uploads/gallery/gallery_1756553220_2.webp', '2025-08-30 11:27:00', '2025-08-30 11:27:00'),
(100, 16, 'uploads/gallery/gallery_1756553220_3.webp', '2025-08-30 11:27:00', '2025-08-30 11:27:00'),
(101, 17, 'uploads/gallery/gallery_1756636216_0.webp', '2025-08-31 10:30:16', '2025-08-31 10:30:16'),
(102, 17, 'uploads/gallery/gallery_1756636216_1.webp', '2025-08-31 10:30:16', '2025-08-31 10:30:16'),
(103, 17, 'uploads/gallery/gallery_1756636216_2.webp', '2025-08-31 10:30:16', '2025-08-31 10:30:16'),
(104, 17, 'uploads/gallery/gallery_1756636216_3.webp', '2025-08-31 10:30:16', '2025-08-31 10:30:16'),
(105, 18, 'uploads/gallery/gallery_1756727009_0.webp', '2025-09-01 11:43:29', '2025-09-01 11:43:29'),
(106, 18, 'uploads/gallery/gallery_1756727009_1.webp', '2025-09-01 11:43:29', '2025-09-01 11:43:29'),
(107, 18, 'uploads/gallery/gallery_1756727009_2.webp', '2025-09-01 11:43:29', '2025-09-01 11:43:29'),
(108, 18, 'uploads/gallery/gallery_1756727009_3.webp', '2025-09-01 11:43:29', '2025-09-01 11:43:29'),
(109, 19, 'uploads/gallery/gallery_1756729353_0.webp', '2025-09-01 12:22:33', '2025-09-01 12:22:33'),
(110, 19, 'uploads/gallery/gallery_1756729353_1.webp', '2025-09-01 12:22:33', '2025-09-01 12:22:33'),
(111, 19, 'uploads/gallery/gallery_1756729353_2.webp', '2025-09-01 12:22:33', '2025-09-01 12:22:33'),
(112, 19, 'uploads/gallery/gallery_1756729353_3.webp', '2025-09-01 12:22:33', '2025-09-01 12:22:33'),
(113, 20, 'uploads/gallery/gallery_1756731543_0.webp', '2025-09-01 12:59:03', '2025-09-01 12:59:03'),
(114, 20, 'uploads/gallery/gallery_1756731543_1.webp', '2025-09-01 12:59:03', '2025-09-01 12:59:03'),
(115, 20, 'uploads/gallery/gallery_1756731543_2.webp', '2025-09-01 12:59:03', '2025-09-01 12:59:03'),
(116, 20, 'uploads/gallery/gallery_1756731543_3.webp', '2025-09-01 12:59:03', '2025-09-01 12:59:03'),
(117, 21, 'uploads/gallery/gallery_1756882761_0.webp', '2025-09-03 06:59:21', '2025-09-03 06:59:21'),
(118, 21, 'uploads/gallery/gallery_1756882761_1.webp', '2025-09-03 06:59:21', '2025-09-03 06:59:21'),
(119, 21, 'uploads/gallery/gallery_1756882761_2.webp', '2025-09-03 06:59:21', '2025-09-03 06:59:21'),
(120, 21, 'uploads/gallery/gallery_1756882761_3.webp', '2025-09-03 06:59:21', '2025-09-03 06:59:21'),
(121, 22, 'uploads/gallery/gallery_1756884828_0.webp', '2025-09-03 07:33:48', '2025-09-03 07:33:48'),
(122, 22, 'uploads/gallery/gallery_1756884828_1.webp', '2025-09-03 07:33:48', '2025-09-03 07:33:48'),
(123, 22, 'uploads/gallery/gallery_1756884828_2.webp', '2025-09-03 07:33:48', '2025-09-03 07:33:48'),
(124, 22, 'uploads/gallery/gallery_1756885612_0.webp', '2025-09-03 07:46:52', '2025-09-03 07:46:52'),
(125, 23, 'uploads/gallery/gallery_1756984122_0.webp', '2025-09-04 11:08:42', '2025-09-04 11:08:42'),
(126, 23, 'uploads/gallery/gallery_1756984122_1.webp', '2025-09-04 11:08:42', '2025-09-04 11:08:42'),
(127, 23, 'uploads/gallery/gallery_1756984122_2.webp', '2025-09-04 11:08:42', '2025-09-04 11:08:42'),
(128, 23, 'uploads/gallery/gallery_1756984122_3.webp', '2025-09-04 11:08:42', '2025-09-04 11:08:42'),
(129, 24, 'uploads/gallery/gallery_1757229072_0.webp', '2025-09-07 07:11:12', '2025-09-07 07:11:12'),
(130, 24, 'uploads/gallery/gallery_1757229072_1.webp', '2025-09-07 07:11:12', '2025-09-07 07:11:12'),
(131, 24, 'uploads/gallery/gallery_1757229072_2.webp', '2025-09-07 07:11:12', '2025-09-07 07:11:12'),
(132, 24, 'uploads/gallery/gallery_1757229072_3.webp', '2025-09-07 07:11:12', '2025-09-07 07:11:12'),
(133, 25, 'uploads/gallery/gallery_1757245175_0.webp', '2025-09-07 11:39:35', '2025-09-07 11:39:35'),
(134, 25, 'uploads/gallery/gallery_1757245175_1.webp', '2025-09-07 11:39:35', '2025-09-07 11:39:35'),
(135, 25, 'uploads/gallery/gallery_1757245175_2.webp', '2025-09-07 11:39:35', '2025-09-07 11:39:35'),
(136, 25, 'uploads/gallery/gallery_1757245175_3.webp', '2025-09-07 11:39:35', '2025-09-07 11:39:35'),
(137, 25, 'uploads/gallery/gallery_1757245175_4.webp', '2025-09-07 11:39:35', '2025-09-07 11:39:35'),
(138, 25, 'uploads/gallery/gallery_1757245175_5.webp', '2025-09-07 11:39:35', '2025-09-07 11:39:35'),
(139, 25, 'uploads/gallery/gallery_1757245175_6.webp', '2025-09-07 11:39:35', '2025-09-07 11:39:35'),
(140, 25, 'uploads/gallery/gallery_1757245175_7.webp', '2025-09-07 11:39:35', '2025-09-07 11:39:35'),
(141, 26, 'uploads/gallery/gallery_1757588629_0.webp', '2025-09-11 11:03:49', '2025-09-11 11:03:49'),
(142, 26, 'uploads/gallery/gallery_1757588629_1.webp', '2025-09-11 11:03:49', '2025-09-11 11:03:49'),
(143, 26, 'uploads/gallery/gallery_1757588629_2.webp', '2025-09-11 11:03:49', '2025-09-11 11:03:49'),
(144, 26, 'uploads/gallery/gallery_1757588629_3.webp', '2025-09-11 11:03:49', '2025-09-11 11:03:49'),
(145, 26, 'uploads/gallery/gallery_1757588833_0.webp', '2025-09-11 11:07:13', '2025-09-11 11:07:13'),
(146, 26, 'uploads/gallery/gallery_1757588833_1.webp', '2025-09-11 11:07:13', '2025-09-11 11:07:13'),
(147, 26, 'uploads/gallery/gallery_1757588833_2.webp', '2025-09-11 11:07:13', '2025-09-11 11:07:13'),
(148, 26, 'uploads/gallery/gallery_1757588833_3.webp', '2025-09-11 11:07:13', '2025-09-11 11:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `fabworld_slides`
--

CREATE TABLE `fabworld_slides` (
  `id` int(11) NOT NULL,
  `fabworld_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fabworld_slides`
--

INSERT INTO `fabworld_slides` (`id`, `fabworld_id`, `title`, `description`, `image`, `updated_at`, `created_at`) VALUES
(335, 8, 'Primora - Origin Realm', 'The origin of all creation. A realm where Light and Shadow lived in harmony before their great separation. From its shattering, the Elemental Worlds were born.', 'uploads/custom-images/mystic_form_1755694539_0.webp', '2025-11-14 09:57:20', '2025-11-14 09:57:20'),
(336, 8, 'Light Realm', 'Home of the Light Guardian. A realm of purity, order, and timeless radiance, untouched by chaos, where creation flows freely without interference.', 'uploads/custom-images/mystic_form_1755694539_1.webp', '2025-11-14 09:57:20', '2025-11-14 09:57:20'),
(337, 8, 'Shadow Realm', 'Domain of the Shadow Guardian. A realm of secrets, mystery, and endless curiosity, where the hidden truths of the universe lie waiting to be uncovered.', 'uploads/custom-images/mystic_form_1755694539_2.webp', '2025-11-14 09:57:20', '2025-11-14 09:57:20'),
(338, 3, 'Earth Element', '\"The Earth Element is the crystal heart of Terra Prime — an ancient emerald stone veined with golden minerals, holding the planet’s strength, life, and memories within its timeless glow.\"', 'uploads/custom-images/mystic_form_1755066740_0.webp', '2025-11-15 11:08:45', '2025-11-15 11:08:45'),
(339, 3, 'Guardian Grok', '\"Grok, the Mighty Guardian of Earth, is a colossal knight of living stone, forged from the core of Terra Prime. Covered in moss and crystal veins, he wields the legendary Crystal Hammer and stands as the eternal protector of the planet’s heart and its ancient harmony.\"', 'uploads/custom-images/mystic_form_1755063733_1.webp', '2025-11-15 11:08:45', '2025-11-15 11:08:45'),
(340, 3, 'Terra Prime World', '\"Terra Prime is a breathtaking realm of floating mountains, crystal-laced cliffs, and cascading waterfalls, where stone bridges connect vibrant habitats teeming with life. Its diverse creatures, from armored stonebeasts to agile vine gliders, live in perfect balance with the land, drawing strength from the planet’s deep crystal veins.\"', 'uploads/custom-images/mystic_form_1755068087_2.webp', '2025-11-15 11:08:45', '2025-11-15 11:08:45'),
(341, 4, 'Air Element', 'The Air Element is the boundless soul of Aero Zenith — a shimmering sphere of swirling sky-blue light laced with silver currents, holding the freedom, speed, and unending breath of the skies within its eternal dance.', 'uploads/custom-images/mystic_form_1755085521_0.webp', '2025-11-15 11:08:58', '2025-11-15 11:08:58'),
(342, 4, 'Guardian Aeron', 'Aeron, the Majestic Guardian of Air, is a mighty falcon born of the purest winds, his vast wings casting shadows across entire cloudlands. Feathers tipped in silver and eyes like twin storms, he commands the gales and carries the wisdom of every breeze that has ever crossed the skies.', 'uploads/custom-images/mystic_form_1755085521_1.webp', '2025-11-15 11:08:58', '2025-11-15 11:08:58'),
(343, 4, 'Aero Zenith', 'Aero Zenith is a magnificent realm of floating islands, wind-carved spires, and endless cloud oceans. Skybridges and airships link its airborne villages, while cloud-whales drift lazily in the distance. From soaring avian-folk to fox-winged couriers, every creature here lives in harmony with the ever-shifting winds, drawing life from the Air Element’s ceaseless flow.', 'uploads/custom-images/mystic_form_1755085522_2.webp', '2025-11-15 11:08:58', '2025-11-15 11:08:58'),
(344, 5, 'Fire Element', '\"Once the eternal flame of creation, the Fire Element now blazes in Fabland — carrying the heat of passion, the fury of battle, and the spark of endless rebirth.\"', 'uploads/custom-images/mystic_form_1755581510_0.webp', '2025-11-15 11:09:19', '2025-11-15 11:09:19'),
(345, 5, 'Guardian Skarion', '\"The Inferno Guardian, a phoenix wreathed in molten armor and living fire, Skarion rises from ash to flame — an eternal sentinel of destruction and renewal.\"', 'uploads/custom-images/mystic_form_1755581510_1.webp', '2025-11-15 11:09:19', '2025-11-15 11:09:19'),
(346, 5, 'Inferno Core', '\"A realm of blazing mountains and rivers of magma, Inferno Core is where flame breathes life and trial alike, its burning heart forged under Skarion’s eternal watch.\"', 'uploads/custom-images/mystic_form_1755581510_2.webp', '2025-11-15 11:09:19', '2025-11-15 11:09:19'),
(347, 9, 'Water Element', '\"The Water Element embodies purity, adaptability, and renewal. It flows endlessly, shaping lands and nurturing life. Gentle as a stream yet mighty as a tidal wave, it is the essence of harmony and resilience.\"', 'uploads/custom-images/mystic_form_1755777464_0.webp', '2025-11-15 11:09:47', '2025-11-15 11:09:47'),
(348, 9, 'Guardian Aqualis', '\"Aqualis, the Celestial Sea Serpent, is the eternal guardian of Aqua Realm. With scales that shimmer like liquid crystal and eyes that hold the wisdom of the deep, Aqualis guides the balance of tides, protects the coral kingdoms, and connects all life through the mystic flow of water.\"', 'uploads/custom-images/mystic_form_1755777464_1.webp', '2025-11-15 11:09:47', '2025-11-15 11:09:47'),
(349, 9, 'Aqua Realm', '\"Aqua Realm is a mystical oceanic world where coral towers glow like lanterns, villages float within bubble-domes, and currents carry travelers between radiant reefs. A realm of endless blue, where every creature lives in harmony with the tides, celebrating the beauty and mystery of water.\"', 'uploads/custom-images/mystic_form_1755777464_2.webp', '2025-11-15 11:09:47', '2025-11-15 11:09:47'),
(350, 11, 'Time Element', '\"The Time Element governs past, present, and future, weaving them into one eternal flow. It holds the power to preserve memories, guide destiny, and reshape reality itself.\"', 'uploads/custom-images/mystic_form_1755847294_0.webp', '2025-11-15 11:10:04', '2025-11-15 11:10:04'),
(351, 11, 'Guardian Titanox', '\"Titanox, the Iron Bison, is the indomitable Guardian of Time. His armored body carries the weight of ages, and with each step, he balances the shifting currents of destiny.\"', 'uploads/custom-images/mystic_form_1755847294_1.webp', '2025-11-15 11:10:04', '2025-11-15 11:10:04'),
(352, 11, 'Chrono Nexus', '\"Chrono Nexus is the mystic realm of time — a land of shifting deserts, clockwork forests, and glowing crystal pathways. Here, time is alive, and every moment shapes eternity.\"', 'uploads/custom-images/mystic_form_1755847294_2.webp', '2025-11-15 11:10:04', '2025-11-15 11:10:04'),
(353, 12, 'Fab Council', 'At the heart of Fabville, beneath the towering Ancient Root Tree, lies the Fabcouncil — the living core of the city. Guided by the Council Masters, it serves as the center of wisdom and balance, with elemental training arenas branching around it.', 'uploads/custom-images/mystic_form_1756031001_0.webp', '2025-11-15 11:11:29', '2025-11-15 11:11:29'),
(354, 12, 'Seat at Council Table', 'Arranged in a circle beneath the Ancient Root Tree, each seat is carved from elemental crystal. Here the Council Masters gather, their places symbolizing unity and balance at the core of Fabville. All decisions related to fabland are taken here.', 'uploads/custom-images/mystic_form_1756031001_1.webp', '2025-11-15 11:11:29', '2025-11-15 11:11:29'),
(355, 12, 'Elemental Training Arenas', 'Encircling the Fabcouncil, each arena embodies its element — water, fire, earth, air and time. Here, young cubs hone their elemental power energy under the guidance of council masters, preparing to safeguard Fabville.', 'uploads/custom-images/mystic_form_1756031001_2.webp', '2025-11-15 11:11:29', '2025-11-15 11:11:29'),
(356, 13, 'FabMarket', 'A lively marketplace where stalls powered by elemental energy overflow with colorful goods, fresh produce, crafted tools, and magical trinkets, creating a vibrant hub of trade and culture.', 'uploads/custom-images/mystic_form_1756359712_0.webp', '2025-11-15 11:12:14', '2025-11-15 11:12:14'),
(357, 13, 'FabTown Square', 'The beating heart of Fabville, where villagers gather for celebrations, storytelling, music, and festivals under glowing elemental lanterns, radiating joy and togetherness.', 'uploads/custom-images/mystic_form_1756359712_1.webp', '2025-11-15 11:12:14', '2025-11-15 11:12:14'),
(358, 13, 'Fabville Community', 'A close-knit family of animal villagers, each bringing their unique traditions, skills, and kindness, living in perfect harmony with nature and the elements.', 'uploads/custom-images/mystic_form_1756359712_2.webp', '2025-11-15 11:12:14', '2025-11-15 11:12:14'),
(359, 17, 'Maxi AI', 'The ancient guiding intelligence from Primora, creator of the Elementrix wrist gears and keeper of lost wisdom.', 'uploads/custom-images/mystic_form_1756636216_0.webp', '2025-11-17 13:20:21', '2025-11-17 13:20:21'),
(360, 17, 'Elementrix Wrist Gears', 'Fusion of ancient magic and modern design, these gears channel elemental powers, summon creatures, and guide heroes on their quests.', 'uploads/custom-images/mystic_form_1756636216_1.webp', '2025-11-17 13:20:21', '2025-11-17 13:20:21'),
(361, 17, 'Ancient Relics', 'Mystic artifacts tied to each element, holding hidden powers that awaken when united with the wrist gears.', 'uploads/custom-images/mystic_form_1756636216_2.webp', '2025-11-17 13:20:21', '2025-11-17 13:20:21'),
(362, 26, 'Shadow Rangers', 'Twisted panthers, wolves, and hyenas, clad in jagged armor with glowing red veins. They charge first into battle, overwhelming with sheer ferocity.', 'uploads/custom-images/mystic_form_1757588629_0.webp', '2025-11-18 05:16:03', '2025-11-18 05:16:03'),
(363, 26, 'Shadow Scouts', 'Bat-winged creatures, corrupted owls, and lizards with void eyes. They stalk silently, mapping terrain and hunting elemental heroes from the dark.', 'uploads/custom-images/mystic_form_1757588629_1.webp', '2025-11-18 05:16:03', '2025-11-18 05:16:03'),
(364, 26, 'Shadow Spies', 'Ravens, foxes, and serpents cloaked in shifting shadow. They infiltrate villages and councils, spreading fear, lies, and chaos before battles even begin.', 'uploads/custom-images/mystic_form_1757588629_2.webp', '2025-11-18 05:16:03', '2025-11-18 05:16:03'),
(365, 26, 'Shadow Collectors', 'Beetles, vultures, and rats fused with blood-crystal growths. Their role is to dig, drain, and extract elemental crystals, feeding corruption back to the Void.', 'uploads/custom-images/mystic_form_1757588833_3.webp', '2025-11-18 05:16:03', '2025-11-18 05:16:03'),
(366, 26, 'Shadow War Beasts', 'Colossal, mutated beasts — blood-crystal bears, corrupted rhinos, and serpents bound in armor. They tear through walls, bridges, and entire armies.', 'uploads/custom-images/mystic_form_1757588833_4.webp', '2025-11-18 05:16:03', '2025-11-18 05:16:03'),
(367, 26, 'Shadow Necro - Benders', 'Insectoid and bat-like shamans that channel red energy into fallen soldiers, reanimating corpses as shadow husks to continue the fight.', 'uploads/custom-images/mystic_form_1757588833_5.webp', '2025-11-18 05:16:03', '2025-11-18 05:16:03'),
(368, 26, 'Shadow Overseer', 'Elite mid-rank officers chosen by the Five Fangs, each wearing void-crystal masks. They maintain order and spread terror among their own soldiers and prisoners alike.', 'uploads/custom-images/mystic_form_1757588833_6.webp', '2025-11-18 05:16:03', '2025-11-18 05:16:03'),
(369, 25, 'Warlord Draxus', 'Silent and relentless, Draxus is the chosen herald of the Supreme Void Entity. Cloaked in smoke and jagged armor, he spreads corruption with calm precision, leading the Shadow Legion toward Fabland’s doom.', 'uploads/custom-images/mystic_form_1757245175_0.webp', '2025-11-18 05:16:19', '2025-11-18 05:16:19'),
(370, 25, 'Venyl - The Blood Serpent', 'A venomous cultist who siphons life-force into blood-crystals, weaving corruption through sacrifice and ritual to fuel the Legion’s dark power.', 'uploads/custom-images/mystic_form_1757245175_1.webp', '2025-11-18 05:16:19', '2025-11-18 05:16:19'),
(371, 25, 'Kruger - The Iron Rhino', 'An unstoppable juggernaut clad in void-forged armor, leading brutal sieges and breaking defenses with overwhelming force.', 'uploads/custom-images/mystic_form_1757245175_2.webp', '2025-11-18 05:16:19', '2025-11-18 05:16:19'),
(372, 25, 'Raven - The Shade Wing', 'A silent assassin who commands living shadows, serving as the master of espionage, infiltration, and silent executions.', 'uploads/custom-images/mystic_form_1757245262_3.webp', '2025-11-18 05:16:19', '2025-11-18 05:16:19'),
(373, 25, 'Gravor - The Scorpion Dread', 'Half-beast, half-machine, his crystalline stinger spreads corruption into land and soul, enforcing Legion rule through fear and poison.', 'uploads/custom-images/mystic_form_1757245262_4.webp', '2025-11-18 05:16:19', '2025-11-18 05:16:19'),
(374, 25, 'Xandar - Wolf Ravager', 'A feral warlord who revels in slaughter, commanding shock troops and unleashing chaos at the frontlines with blood-crystal axes.', 'uploads/custom-images/mystic_form_1757245262_5.webp', '2025-11-18 05:16:19', '2025-11-18 05:16:19'),
(375, 24, 'Suprme Void Entity', 'Born from the abyss before time, the Supreme Void Entity is a cosmic force of corruption and hunger. It cannot be destroyed, only imprisoned, and now seeks to break free, devour the elemental worlds, and drown Fabland in an endless red horizon of nothingness.', 'uploads/custom-images/mystic_form_1757229072_0.webp', '2025-11-18 05:16:30', '2025-11-18 05:16:30'),
(376, 24, 'Void Realm', 'The Void Realm is the seat of the Shadow Legion, a world of blood-crystal rivers, storm-torn skies, and a fortress pulsing with corruption. From here, Draxus commands endless armies under the will of the Supreme Void Entity, forging weapons of darkness and bleeding the elemental worlds of their light.', 'uploads/custom-images/mystic_form_1757229072_1.webp', '2025-11-18 05:16:30', '2025-11-18 05:16:30'),
(377, 23, 'Crystal Beats', 'The Crystal Beats are Fabville’s beloved music band, blending rhythm, harmony, and elemental crystal magic to fill the village with joy. Led by Riffy the Panda on drums, the group includes Strummo the Goat on guitar, Tootoo the Toucan on trumpet, Luma the Cat on violin, Bibble the Rabbit as the lively singer, and Quacky the Duck on flute.', 'uploads/custom-images/mystic_form_1756984122_0.webp', '2025-11-18 05:16:43', '2025-11-18 05:16:43'),
(378, 22, 'Workshop Yard', 'The heart of Fabville’s construction — always buzzing with saws, hammers, and glowing crystal tools. Here, the Beaver family shapes homes, bridges, and walls with teamwork and precision, turning blueprints into reality.', 'uploads/custom-images/mystic_form_1756884828_0.webp', '2025-11-18 05:16:53', '2025-11-18 05:16:53'),
(379, 22, 'Blueprint Hall', 'A quiet chamber where glowing scrolls, elemental maps, and crystal models are stored. It’s the place where Mr. Beavers Sr. dreams up Fabville’s next expansion, teaching his cub apprentices the art of building with balance and care.', 'uploads/custom-images/mystic_form_1756884828_1.webp', '2025-11-18 05:16:53', '2025-11-18 05:16:53'),
(380, 21, 'Verdant Haven - Magical Nursery', 'Perched on a cliffside, this lush sanctuary is filled with glowing herbs, enchanted plants, and rare flowers. Here, Willow grows remedies and offers healing to Fabvillagers in need.', 'uploads/custom-images/mystic_form_1756882761_0.webp', '2025-11-18 05:17:05', '2025-11-18 05:17:05'),
(381, 21, 'Hilltop Medical School', 'An open-air dome classroom where Willow teaches young Fabvillage cubs the art of herbal care and healing magic, ensuring the knowledge of nature’s medicine is passed to the next generation.', 'uploads/custom-images/mystic_form_1756882761_1.webp', '2025-11-18 05:17:05', '2025-11-18 05:17:05'),
(382, 20, 'Truffle\'s Restaurant', 'The heart of Fabville’s flavors, where bubbling stews, fresh pastries, and warm laughter fill the air. It’s more than a restaurant—it’s a place where villagers gather as family.', 'uploads/custom-images/mystic_form_1756731543_0.webp', '2025-11-18 05:17:15', '2025-11-18 05:17:15'),
(383, 20, 'Truffle\'s Grove', 'A secret grove just outside Fabville where Chef Truffle grows rare herbs, fruits, and mushrooms. It’s his peaceful retreat for experimenting with new recipes, away from the bustle.', 'uploads/custom-images/mystic_form_1756731543_1.webp', '2025-11-18 05:17:15', '2025-11-18 05:17:15'),
(384, 19, 'General Rock', 'A towering rhino with unmatched resilience, General Rock stands as Fabland’s frontline protector. His loyalty and raw strength make him a living fortress, always ready to shield his people from harm.', 'uploads/custom-images/mystic_form_1756729353_0.webp', '2025-11-18 05:17:24', '2025-11-18 05:17:24'),
(385, 19, 'Tactician Bako', 'Though smaller in size, Bako’s sharp intellect makes him a vital force on the battlefield. This young gorilla sees patterns where others see chaos, guiding Fabland’s armies with clever strategies and foresight.', 'uploads/custom-images/mystic_form_1756729353_1.webp', '2025-11-18 05:17:24', '2025-11-18 05:17:24'),
(386, 18, 'Ancient Library', 'The Ancient Library – Hidden deep beneath the roots of a colossal crystal tree, this timeless sanctuary preserves the wisdom of Fabland. Towering shelves of relics, glowing tomes, and elemental scripts surround Toko’s meditation chamber, where he waits in silence for the prophecy to awaken.', 'uploads/custom-images/mystic_form_1756727009_0.webp', '2025-11-18 05:17:37', '2025-11-18 05:17:37'),
(387, 18, 'Ancient Battleground', 'Carved in secret beneath the roots of the crystal tree, this sacred arena echoes with the clashes of forgotten wars. Here, Toko prepares the FabHeroes, training them with relic weapons and elemental trials to face the coming darkness.', 'uploads/custom-images/mystic_form_1756727009_1.webp', '2025-11-18 05:17:37', '2025-11-18 05:17:37'),
(388, 16, 'Asher', 'Once Inferno Core’s closest Ally, now a mastermind of shadows. A cunning strategist who turned betrayal into power, weaving the Silent Order into Fabland’s most dangerous syndicate.', 'uploads/custom-images/mystic_form_1756553220_0.webp', '2025-11-18 05:18:17', '2025-11-18 05:18:17'),
(389, 16, 'Draven', 'A fallen guardian who lost faith in the FabCouncil’s justice. Now the ruthless enforcer of the Order, he wields silence and fear as his greatest weapons.', 'uploads/custom-images/mystic_form_1756553220_1.webp', '2025-11-18 05:18:17', '2025-11-18 05:18:17'),
(390, 15, 'Terra Boulderlands', 'The land where the earth still breathes. Towering cliffs and endless canyons hide crystals that pulse like the heart of Fabland itself. But deep in its caverns, the Shadow Legion mines endlessly, forging energy cores to fuel their destructive machines.', 'uploads/custom-images/mystic_form_1756379090_0.webp', '2025-11-18 05:18:31', '2025-11-18 05:18:31'),
(391, 15, 'Aquara Depths', 'A realm of rivers, waterfalls, and glowing lakes, where ancient aquatic spirits once guided the flow of life. Now, blackened currents twist through its waters as the Legion poisons streams, bending the power of water into storms of chaos.', 'uploads/custom-images/mystic_form_1756379090_1.webp', '2025-11-18 05:18:31', '2025-11-18 05:18:31'),
(392, 15, 'Aerion peaks', 'Where the skies break into floating islands and crystalline spires, touched by eternal winds. To soar here was once freedom itself—but the Shadow Legion has built storm forges in the clouds, chaining the skies to their endless thunder.', 'uploads/custom-images/mystic_form_1756379090_2.webp', '2025-11-18 05:18:31', '2025-11-18 05:18:31'),
(393, 15, 'Inferno Crates', 'The land of living flame, where molten rivers carved the world’s fiercest forges. Fire once brought creation and renewal, but under the Legion’s hand, it burns only for destruction—breeding armies from ash and magma.', 'uploads/custom-images/mystic_form_1756379090_3.webp', '2025-11-18 05:18:31', '2025-11-18 05:18:31'),
(394, 14, 'House of Earth', 'Rooted in strength and resilience, the Earth House thrives on fertile lands, farming, and forging unity under the guidance of General Rok.', 'uploads/custom-images/mystic_form_1756376327_0.webp', '2025-11-18 05:18:45', '2025-11-18 05:18:45'),
(395, 14, 'House of Air', 'High among floating meadows and sky bridges, the Air House values freedom, wisdom, and exploration led by their keen-eyed leaders.', 'uploads/custom-images/mystic_form_1756376327_1.webp', '2025-11-18 05:18:45', '2025-11-18 05:18:45'),
(396, 14, 'House of Water', 'Nestled by shimmering waterfalls and crystal ponds, the Water House embodies flow, healing, and harmony within their community.', 'uploads/custom-images/mystic_form_1756376327_2.webp', '2025-11-18 05:18:45', '2025-11-18 05:18:45'),
(397, 14, 'House of Fire', 'Amid blazing forges and volcanic valleys, the Fire House channels passion, craftsmanship, and courage to protect Fabland.', 'uploads/custom-images/mystic_form_1756376327_3.webp', '2025-11-18 05:18:45', '2025-11-18 05:18:45'),
(398, 7, 'Terra Prime : Legacy of Earth Guardian', 'The crystal-veined lands of Terra hold the first Guardian’s secrets—where strength, endurance, and harmony shaped the foundation of balance.', 'uploads/custom-images/mystic_form_1755603902_0.webp', '2025-11-18 05:19:16', '2025-11-18 05:19:16'),
(399, 7, 'Aero Zenith : City of Sky Keepers', 'Above the clouds lies Aero Zenith, a city of soaring towers and keepers of truth, where freedom and loyalty battle against betrayal in the skies.', 'uploads/custom-images/mystic_form_1755603991_1.webp', '2025-11-18 05:19:16', '2025-11-18 05:19:16'),
(400, 7, 'Inferno Core : Guardians of Fire Realm', 'Born in fire and forged by magma, Inferno Core’s defenders stand as living shields—protectors of their realm when the flames threaten to consume all.', 'uploads/custom-images/mystic_form_1755603991_2.webp', '2025-11-18 05:19:16', '2025-11-18 05:19:16'),
(401, 7, 'Aqua Realm : Mysteries of Deep', 'Beneath vast oceans, the Aqua Realm hides ancient secrets within coral labyrinths and memory tides, where water whispers the power of healing and resilience.', 'uploads/custom-images/mystic_form_1755604084_3.webp', '2025-11-18 05:19:16', '2025-11-18 05:19:16'),
(402, 7, 'Chrono Nexus: Era of Time Travel', 'A realm beyond time, woven of gears and echoes. Chrono Nexus reveals how every choice bends destiny—and how fragile the river of time can be.', 'uploads/custom-images/mystic_form_1755604084_4.webp', '2025-11-18 05:19:16', '2025-11-18 05:19:16'),
(403, 7, 'Kane: Legacy of Lost Guardian', 'A warrior raised in shadow, torn between darkness and light. Kane’s path reveals the truth of the Shadow Guardian and the cost of redemption.', 'uploads/custom-images/mystic_form_1755604170_5.webp', '2025-11-18 05:19:16', '2025-11-18 05:19:16'),
(404, 7, 'FablePals: Dawn of Fractured Realms', 'An ancient war of Guardians and Void shattered the realms. This origin tale uncovers the battle that set destiny in motion long before the FablePals.', 'uploads/custom-images/mystic_form_1755604170_6.webp', '2025-11-18 05:19:16', '2025-11-18 05:19:16'),
(405, 6, 'Fablepals : The Awakening', 'The journey begins when four unlikely cubs uncover the forgotten Guardians of Elements. Together, they awaken powers hidden within and step into a destiny that will decide the balance of their world.', 'uploads/custom-images/mystic_form_1755588779_0.webp', '2025-11-18 05:19:33', '2025-11-18 05:19:33'),
(406, 6, 'Tiggo : Heart of Terra Prime', 'Deep within Terra’s crystal-veined lands, Tiggo discovers the true bond between courage and earth itself. To protect his people, he must master Terra’s strength while dismantling the Shadow Legion’s energy-draining machines.', 'uploads/custom-images/mystic_form_1755601051_1.webp', '2025-11-18 05:19:33', '2025-11-18 05:19:33'),
(407, 6, 'Luna : Wings of Aero Zenith', 'High among the floating cloud-cities, Luna learns to ride the currents of truth and freedom. Her voice and wind-born wings become weapons against aerial conspiracies that threaten the skies above.', 'uploads/custom-images/mystic_form_1755601209_2.webp', '2025-11-18 05:19:33', '2025-11-18 05:19:33'),
(408, 6, 'Blaze :  Fury of Inferno Core', 'Forged in the fiery cities of magma and steel, Blaze struggles with the fury of flames that could either consume him or protect his kin. His fire must be controlled—or it will turn the heart of Inferno Core to ash.', 'uploads/custom-images/mystic_form_1755601209_3.webp', '2025-11-18 05:19:33', '2025-11-18 05:19:33'),
(409, 6, 'Waver : Secrets of Aqua Realm', 'In the living oceans of Aqua Realm, Waver uncovers mysteries flowing through coral labyrinths and memory tides. Guided by Aqualis, she learns that healing can be as powerful as battle when darkness poisons the waters.', 'uploads/custom-images/mystic_form_1755601209_4.webp', '2025-11-18 05:19:33', '2025-11-18 05:19:33'),
(410, 6, 'Toko : Echoes of Chrono Nexus', 'Within the shifting gears of time’s labyrinth, Toko confronts echoes of countless futures. Every step risks unraveling fate itself, yet he must choose wisely which moments to save before the Nexus collapses.', 'uploads/custom-images/mystic_form_1755601334_5.webp', '2025-11-18 05:19:33', '2025-11-18 05:19:33'),
(411, 6, 'Fablepals : Chronicles of Kane', 'Raised under Draxus’s shadow yet destined for balance, Kane’s story is one of conflict and redemption. His struggle between darkness and light will shape not only his soul but also the fate of the Guardians themselves.', 'uploads/custom-images/mystic_form_1755601334_6.webp', '2025-11-18 05:19:33', '2025-11-18 05:19:33'),
(412, 6, 'Fablepals : War of Realms', 'As the elemental worlds fracture, every Guardian and FablePal must unite for a battle that spans across realms. The Void rises once more—and the final clash will decide whether creation itself survives.', 'uploads/custom-images/mystic_form_1755601334_7.webp', '2025-11-18 05:19:33', '2025-11-18 05:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `faq_translations`
--

CREATE TABLE `faq_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faq_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_translations`
--

INSERT INTO `faq_translations` (`id`, `faq_id`, `lang_code`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Will you be updating the program?', 'We design high quality websites that make users come back for more. A good website tells a story that will make users fully immerse themselves operating', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'hi', 'क्या आप कार्यक्रम को अद्यतन करेंगे?', 'हम उच्च गुणवत्ता वाली वेबसाइटें डिज़ाइन करते हैं जो उपयोगकर्ताओं को और अधिक देखने के लिए वापस लाती हैं। एक अच्छी वेबसाइट एक ऐसी कहानी बताती है जो उपयोगकर्ताओं को पूरी तरह से संचालन में डुबो देगी', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 2, 'en', 'What happens to my data if I cancel?', 'We design high quality websites that make users come back for more. A good website tells a story that will make users fully immerse themselves operating', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 2, 'hi', 'यदि मैं रद्द कर दूं तो मेरे डेटा का क्या होगा?', 'हम उच्च गुणवत्ता वाली वेबसाइटें डिज़ाइन करते हैं जो उपयोगकर्ताओं को और अधिक देखने के लिए वापस लाती हैं। एक अच्छी वेबसाइट एक ऐसी कहानी बताती है जो उपयोगकर्ताओं को पूरी तरह से संचालन में डुबो देगी', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 3, 'en', 'How I can optimize voice search?', 'We design high quality websites that make users come back for more. A good website tells a story that will make users fully immerse themselves operating', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 3, 'hi', 'मैं ध्वनि खोज को कैसे अनुकूलित कर सकता हूँ?', 'हम उच्च गुणवत्ता वाली वेबसाइटें डिज़ाइन करते हैं जो उपयोगकर्ताओं को और अधिक देखने के लिए वापस लाती हैं। एक अच्छी वेबसाइट एक ऐसी कहानी बताती है जो उपयोगकर्ताओं को पूरी तरह से संचालन में डुबो देगी', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(10, 4, 'en', 'If I have questions, where can I find answers?', 'We design high quality websites that make users come back for more. A good website tells a story that will make users fully immerse themselves operating', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(11, 4, 'hi', 'यदि मेरे कोई प्रश्न हों तो मैं उत्तर कहां पा सकता हूं?', 'हम उच्च गुणवत्ता वाली वेबसाइटें डिज़ाइन करते हैं जो उपयोगकर्ताओं को और अधिक देखने के लिए वापस लाती हैं। एक अच्छी वेबसाइट एक ऐसी कहानी बताती है जो उपयोगकर्ताओं को पूरी तरह से संचालन में डुबो देगी', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `favorite_product_user`
--

CREATE TABLE `favorite_product_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorite_product_user`
--

INSERT INTO `favorite_product_user` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 3, 38, '2026-01-13 08:34:27', '2026-01-13 08:34:27'),
(4, 4, 38, '2026-01-13 11:23:06', '2026-01-13 11:23:06'),
(5, 6, 37, '2026-01-14 07:16:14', '2026-01-14 07:16:14'),
(7, 11, 38, '2026-02-17 06:46:20', '2026-02-17 06:46:20'),
(8, 11, 37, '2026-02-17 11:55:15', '2026-02-17 11:55:15'),
(9, 13, 38, '2026-02-18 07:05:08', '2026-02-18 07:05:08'),
(10, 13, 39, '2026-02-18 07:05:12', '2026-02-18 07:05:12'),
(11, 13, 34, '2026-02-18 08:14:15', '2026-02-18 08:14:15'),
(12, 13, 35, '2026-02-18 08:14:16', '2026-02-18 08:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `file_uploads`
--

CREATE TABLE `file_uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `extension` varchar(255) NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `expiry_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homes`
--

CREATE TABLE `homes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homes`
--

INSERT INTO `homes` (`id`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'main', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 'two', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 'three', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 'four', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `home_banners`
--

CREATE TABLE `home_banners` (
  `id` int(11) NOT NULL,
  `desktop` tinyint(1) DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `title_two` varchar(255) DEFAULT NULL,
  `title_three` varchar(255) DEFAULT NULL,
  `sub_title` varchar(500) DEFAULT NULL,
  `action_button_text` varchar(100) DEFAULT NULL,
  `action_button_url` varchar(500) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_banners`
--

INSERT INTO `home_banners` (`id`, `desktop`, `title`, `title_two`, `title_three`, `sub_title`, `action_button_text`, `action_button_url`, `image`, `created_at`, `updated_at`) VALUES
(2, 1, 'Mystic', 'Adventure', 'Fab Tales', '“Join the FablePals on a mystic adventure—where brave cubs, ancient guardians, and elemental worlds unite in an epic battle against the Shadow Legion to protect Fabland.”', 'Subscribe Youtube', 'https://www.youtube.com/@FablePalsTV?sub_confirmation=1', '1758266689_Webpage wallpaper (1).webp', '2025-09-16 00:06:15', '2025-11-01 10:21:36'),
(4, 1, 'Mystic', 'Wielder', 'Fab Heroes', '“Join the FablePals on a mystic adventure—where brave wielders, ancient guardians, and elemental worlds unite in an epic battle against the Shadow Legion to protect Fabland.”', 'Subscribe Youtube', 'https://www.youtube.com/@FablePalsTV?sub_confirmation=1', '1758282995_Webpage wallpaper (1).webp', '2025-09-19 11:39:17', '2025-11-01 10:21:45'),
(5, 0, 'Mystic', 'Wielder', 'Fab Heroes', '“Join the FablePals on a mystic adventure—where brave wielders, ancient guardians, and elemental worlds unite in an epic battle against the Shadow Legion to protect Fabland.”', 'Subscribe Youtube', 'https://www.youtube.com/@FablePalsTV?sub_confirmation=1', '1764077968_Wielder mobile banne.webp', '2025-11-25 12:02:50', '2025-11-25 13:39:28'),
(6, 0, 'Mystic', 'Adventure', 'Fab Tales', '“Join the FablePals on a mystic adventure—where brave cubs, ancient guardians, and elemental worlds unite in an epic battle against the Shadow Legion to protect Fabland.”', 'Subscribe Youtube', 'https://www.youtube.com/@FablePalsTV?sub_confirmation=1', '1764078852_cub Mobile Wallpaper 2.webp', '2025-11-25 12:11:35', '2025-11-25 13:54:12');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `direction` varchar(255) NOT NULL DEFAULT 'ltr',
  `status` varchar(255) NOT NULL DEFAULT '1',
  `is_default` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `direction`, `status`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'ltr', '1', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(2, 'Hindi', 'hi', 'ltr', '1', '0', '2025-05-04 09:05:04', '2025-05-04 09:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Main Menu', 'main-menu', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 'Footer Menu', 'footer-menu', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 'Footer Second Menu', 'footer-second-menu', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `custom_item` tinyint(1) NOT NULL DEFAULT 0,
  `open_new_tab` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `label`, `link`, `parent_id`, `sort`, `menu_id`, `custom_item`, `open_new_tab`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', 0, 1, 1, 0, 0, '2025-05-04 09:05:05', '2025-11-18 13:40:20'),
(15, 'Privacy Policy', '/privacy-policy', 0, 1, 3, 0, 0, '2025-05-04 09:05:05', '2025-11-25 12:40:33'),
(16, 'Terms Conditions', '/terms-condition', 0, 2, 3, 0, 0, '2025-05-04 09:05:05', '2025-11-25 12:40:33'),
(17, 'Characters', 'https://fablepals.kids/characters', 0, 2, 1, 1, 0, '2025-05-05 06:42:05', '2025-11-18 13:40:20'),
(20, 'Fabworld', 'https://fablepals.kids/fabworlds', 0, 3, 1, 1, 0, '2025-05-05 10:06:00', '2025-11-18 13:40:20'),
(21, 'FabTv', '/fabtv', 0, 4, 1, 1, 0, '2025-05-05 10:06:55', '2025-11-18 13:40:20'),
(22, 'Digi Store', '/shop', 0, 6, 1, 1, 0, '2025-05-05 10:07:26', '2025-11-18 13:40:20'),
(31, 'Luna', 'https://fablepals.kids/character/luna-the-speedster', 17, 2, 1, 1, 0, '2025-05-06 12:07:42', '2025-10-13 15:17:16'),
(32, 'Ollie', 'https://fablepals.kids/character/ollie-the-wise-', 17, 6, 1, 1, 0, '2025-05-06 12:09:29', '2025-10-13 15:21:53'),
(33, 'Bolt', 'https://fablepals.kids/character/bolt-the-genius-mechanic', 17, 4, 1, 1, 0, '2025-05-06 12:09:50', '2025-10-13 15:21:37'),
(34, 'Blaze', 'https://fablepals.kids/character/blaze-the-warrior', 17, 3, 1, 1, 0, '2025-05-06 12:12:29', '2025-10-13 15:21:28'),
(35, 'Waver', 'https://fablepals.kids/character/waver-the-oceans-heart', 17, 5, 1, 1, 0, '2025-05-06 12:49:22', '2025-10-13 15:23:13'),
(36, 'Kane', 'https://fablepals.kids/character/kane-the-prodigal-knight', 17, 7, 1, 1, 0, '2025-05-06 12:49:56', '2025-10-13 15:22:04'),
(39, 'Shadow Legion Order', 'https://fablepals.kids/fabworld/category/shadow-legion-order', 20, 5, 1, 1, 0, '2025-05-06 12:53:47', '2025-11-18 13:39:50'),
(40, 'Fabland World', 'https://fablepals.kids/fabworld/category/fabland-world', 20, 2, 1, 1, 0, '2025-05-06 12:55:00', '2025-11-18 13:38:45'),
(48, 'Supreme Void Entity', 'https://fablepals.kids/fabworld/supreme-void-entity', 39, 1, 1, 1, 0, '2025-05-06 13:12:20', '2025-10-13 15:31:07'),
(49, 'Shadow Legion Army', 'https://fablepals.kids/fabworld/shadow-legion-army', 39, 3, 1, 1, 0, '2025-05-06 13:12:32', '2025-10-13 15:30:46'),
(50, 'Fabville Village', 'https://fablepals.kids/fabworld/fabville-village', 40, 2, 1, 1, 0, '2025-05-06 13:13:23', '2025-10-13 15:28:34'),
(51, 'Elemental Fab Council', 'https://fablepals.kids/fabworld/elemental-fabcouncil', 40, 1, 1, 1, 0, '2025-05-06 13:13:42', '2025-10-13 15:28:24'),
(52, 'FabGuard Zone', 'https://fablepals.kids/fabworld/fabguard-zone', 40, 3, 1, 1, 0, '2025-05-06 13:14:48', '2025-10-13 15:28:43'),
(60, 'Toko - The Timeless', 'https://fablepals.kids/fabworld/toko-the-timeless', 68, 1, 1, 1, 0, '2025-05-06 13:23:18', '2025-10-13 15:33:20'),
(61, 'Elemental Terrains', 'https://fablepals.kids/fabworld/elemental-terrains', 40, 4, 1, 1, 0, '2025-05-06 13:24:40', '2025-10-13 15:28:54'),
(63, 'Lord Draxus & Commanders', 'https://fablepals.kids/fabworld/lord-draxus-commaders', 39, 2, 1, 1, 0, '2025-05-06 13:28:17', '2025-10-13 15:30:56'),
(65, 'Tiggo', 'https://fablepals.kids/character/tiggo-the-leader', 17, 1, 1, 1, 0, '2025-07-21 07:17:56', '2025-10-13 15:16:51'),
(66, 'Music', '/playlists', 0, 5, 1, 1, 0, '2025-08-01 05:23:16', '2025-11-18 13:40:20'),
(68, 'Fabworld Villagers', 'https://fablepals.kids/fabworld/category/fabworld-villagers', 20, 3, 1, 1, 0, '2025-08-03 12:31:25', '2025-11-18 13:39:08'),
(69, 'Mystic Gadgets & Relics', 'https://fablepals.kids/fabworld/category/mystic-gadgets-and-relics', 20, 4, 1, 1, 0, '2025-08-03 13:23:08', '2025-11-18 13:39:29'),
(70, 'Elementrix Chronicles', 'https://fablepals.kids/fabworld/elementrix-chronicles', 69, 1, 1, 1, 0, '2025-08-03 13:24:57', '2025-10-13 15:31:29'),
(73, 'Rock and Bako', 'https://fablepals.kids/fabworld/general-rock-bako', 68, 2, 1, 1, 0, '2025-08-03 13:28:02', '2025-10-13 15:33:12'),
(74, 'The Silent Order', 'https://fablepals.kids/fabworld/the-silent-order', 40, 5, 1, 1, 0, '2025-08-03 13:31:20', '2025-10-13 15:29:03'),
(75, 'Fablepals Mystic World', 'https://fablepals.kids/fabworld/category/fablepals-mystic-world', 20, 1, 1, 1, 0, '2025-08-04 06:34:23', '2025-11-18 13:38:25'),
(76, 'Earth Elemental World', 'https://fablepals.kids/fabworld/new-title', 75, 2, 1, 1, 0, '2025-08-04 06:35:12', '2025-10-13 15:25:44'),
(77, 'Water Elemental World', 'https://fablepals.kids/fabworld/water-elemental-world', 75, 5, 1, 1, 0, '2025-08-04 06:35:30', '2025-10-13 15:26:18'),
(78, 'Fire Elemental World', 'https://fablepals.kids/fabworld/fire-elemental-world', 75, 4, 1, 1, 0, '2025-08-04 06:35:40', '2025-10-13 15:26:06'),
(79, 'Air Elemental World', 'https://fablepals.kids/fabworld/air-elemental-world', 75, 3, 1, 1, 0, '2025-08-04 06:36:01', '2025-10-13 15:25:55'),
(80, 'Time Elemental World', 'https://fablepals.kids/fabworld/time-elemental-world', 75, 6, 1, 1, 0, '2025-08-04 06:36:14', '2025-10-13 15:26:28'),
(82, 'Primora - Origin Realm', 'https://fablepals.kids/fabworld/primora-the-origin-realm', 75, 1, 1, 1, 0, '2025-08-04 06:36:42', '2025-10-13 15:25:32'),
(84, 'Fab Cinematic Universe', 'https://fablepals.kids/fabworld/category/fab-cinematic-universe', 20, 6, 1, 1, 0, '2025-08-06 11:45:27', '2025-11-18 13:40:16'),
(85, 'Element Collection Saga', 'https://fablepals.kids/fabworld/element-collection-sage', 84, 1, 1, 1, 0, '2025-08-06 11:46:37', '2025-10-13 15:30:08'),
(86, 'Lore Expansion Saga', 'https://fablepals.kids/fabworld/lore-expansion-saga', 84, 2, 1, 1, 0, '2025-08-06 11:48:08', '2025-10-13 15:30:22'),
(93, 'Shop', '/shop', 0, 7, 1, 0, 1, '2025-08-22 10:42:26', '2025-11-18 13:40:20'),
(94, 'Chef Truffle', 'https://fablepals.kids/fabworld/chef-truffle', 68, 3, 1, 1, 0, '2025-09-01 12:41:07', '2025-10-13 15:33:03'),
(95, 'Healer Willow', 'https://fablepals.kids/fabworld/healer-willow', 68, 4, 1, 1, 0, '2025-09-01 13:00:44', '2025-10-13 15:32:54'),
(96, 'Mr. Beavers', 'https://fablepals.kids/fabworld/mr-beavers', 68, 5, 1, 1, 0, '2025-09-03 07:05:53', '2025-10-13 15:32:44'),
(97, 'Drummer Riffy', 'https://fablepals.kids/fabworld/drummer-riffy', 68, 6, 1, 1, 0, '2025-09-04 10:45:49', '2025-10-13 15:32:35'),
(98, 'FabTV', 'https://fablepals.kids/fabtv', 0, 2, 2, 1, 0, '2025-11-08 10:20:43', '2026-02-19 09:32:03'),
(99, 'FabMusic', 'https://fablepals.kids/playlists', 0, 3, 2, 1, 0, '2025-11-08 10:21:29', '2026-02-19 09:32:03'),
(100, 'DigiStore', 'https://fablepals.kids/shop', 0, 4, 2, 1, 0, '2025-11-08 10:21:59', '2026-02-19 09:32:03'),
(101, 'Home', 'https://fablepals.kids/', 0, 1, 2, 1, 0, '2025-11-08 10:22:35', '2026-02-19 09:32:03'),
(102, 'Contact', '/contact', 0, 3, 3, 0, 0, '2025-11-18 06:52:28', '2025-11-25 12:40:33'),
(103, 'Terms Conditions', '/terms-condition', 0, 5, 2, 0, 0, '2025-11-26 10:45:11', '2026-02-19 09:32:03'),
(104, 'Privacy Policy', '/privacy-policy', 0, 6, 2, 0, 0, '2025-11-26 10:45:24', '2026-02-19 09:32:03'),
(105, 'Support FablePals', 'https://fablepals.kids/donation', 0, 7, 2, 1, 0, '2026-02-19 09:31:59', '2026-02-19 09:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_translations`
--

CREATE TABLE `menu_item_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item_translations`
--

INSERT INTO `menu_item_translations` (`id`, `menu_item_id`, `lang_code`, `label`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Home', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'hi', 'घर', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(43, 15, 'en', 'Privacy Policy', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(44, 15, 'hi', 'गोपनीयता नीति', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(46, 16, 'en', 'Terms Conditions', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(47, 16, 'hi', 'नियम एवं शर्तें', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(49, 17, 'en', 'Characters', '2025-05-05 06:42:05', '2025-09-04 11:11:33'),
(50, 17, 'hi', 'Characters', '2025-05-05 06:42:05', '2025-05-05 06:42:05'),
(55, 20, 'en', 'Fabworld', '2025-05-05 10:06:00', '2025-05-05 10:06:00'),
(56, 20, 'hi', 'Fabworld', '2025-05-05 10:06:00', '2025-05-05 10:06:00'),
(57, 21, 'en', 'FabTv', '2025-05-05 10:06:55', '2025-05-05 10:06:55'),
(58, 21, 'hi', 'FabTv', '2025-05-05 10:06:55', '2025-05-05 10:06:55'),
(59, 22, 'en', 'Digi Store', '2025-05-05 10:07:26', '2025-07-19 12:55:27'),
(60, 22, 'hi', 'Learning', '2025-05-05 10:07:26', '2025-05-05 10:07:26'),
(77, 31, 'en', 'Luna', '2025-05-06 12:07:42', '2025-05-06 12:09:08'),
(78, 31, 'hi', 'Luna', '2025-05-06 12:07:42', '2025-05-06 12:07:42'),
(79, 32, 'en', 'Ollie', '2025-05-06 12:09:29', '2025-05-06 12:09:29'),
(80, 32, 'hi', 'Ollie', '2025-05-06 12:09:29', '2025-05-06 12:09:29'),
(81, 33, 'en', 'Bolt', '2025-05-06 12:09:50', '2025-05-06 12:09:50'),
(82, 33, 'hi', 'Bolt', '2025-05-06 12:09:50', '2025-05-06 12:09:50'),
(83, 34, 'en', 'Blaze', '2025-05-06 12:12:29', '2025-05-06 12:12:29'),
(84, 34, 'hi', 'Blaze', '2025-05-06 12:12:29', '2025-05-06 12:12:29'),
(85, 35, 'en', 'Waver', '2025-05-06 12:49:22', '2025-05-06 12:49:22'),
(86, 35, 'hi', 'Waver', '2025-05-06 12:49:22', '2025-05-06 12:49:22'),
(87, 36, 'en', 'Kane', '2025-05-06 12:49:56', '2025-05-06 12:49:56'),
(88, 36, 'hi', 'Kane', '2025-05-06 12:49:56', '2025-05-06 12:49:56'),
(93, 39, 'en', 'Shadow Legion Order', '2025-05-06 12:53:47', '2025-05-06 12:55:33'),
(94, 39, 'hi', 'Shadow Legion', '2025-05-06 12:53:47', '2025-05-06 12:53:47'),
(95, 40, 'en', 'Fabland World', '2025-05-06 12:55:00', '2025-08-06 11:47:33'),
(96, 40, 'hi', 'Fabland', '2025-05-06 12:55:00', '2025-05-06 12:55:00'),
(111, 48, 'en', 'Supreme Void Entity', '2025-05-06 13:12:20', '2025-05-06 13:12:20'),
(112, 48, 'hi', 'Supreme Void Entity', '2025-05-06 13:12:20', '2025-05-06 13:12:20'),
(113, 49, 'en', 'Shadow Legion Army', '2025-05-06 13:12:32', '2025-09-07 11:42:48'),
(114, 49, 'hi', 'Shadow Army', '2025-05-06 13:12:32', '2025-05-06 13:12:32'),
(115, 50, 'en', 'Fabville Village', '2025-05-06 13:13:23', '2025-05-06 13:13:23'),
(116, 50, 'hi', 'Fabville Village', '2025-05-06 13:13:23', '2025-05-06 13:13:23'),
(117, 51, 'en', 'Elemental Fab Council', '2025-05-06 13:13:42', '2025-08-22 10:45:15'),
(118, 51, 'hi', 'Fab council', '2025-05-06 13:13:42', '2025-05-06 13:13:42'),
(119, 52, 'en', 'FabGuard Zone', '2025-05-06 13:14:48', '2025-08-22 10:52:12'),
(120, 52, 'hi', 'Fab Army', '2025-05-06 13:14:48', '2025-05-06 13:14:48'),
(135, 60, 'en', 'Toko - The Timeless', '2025-05-06 13:23:18', '2025-09-01 11:26:55'),
(136, 60, 'hi', 'Toko', '2025-05-06 13:23:18', '2025-05-06 13:23:18'),
(137, 61, 'en', 'Elemental Terrains', '2025-05-06 13:24:40', '2025-08-22 10:52:56'),
(138, 61, 'hi', 'Fab Terrains', '2025-05-06 13:24:40', '2025-05-06 13:24:40'),
(141, 63, 'en', 'Lord Draxus & Commanders', '2025-05-06 13:28:17', '2025-09-07 10:42:53'),
(142, 63, 'hi', 'Shadow Commanders', '2025-05-06 13:28:17', '2025-05-06 13:28:17'),
(145, 65, 'en', 'Tiggo', '2025-07-21 07:17:56', '2025-07-21 07:17:56'),
(146, 65, 'hi', 'Tiggo', '2025-07-21 07:17:56', '2025-07-21 07:17:56'),
(147, 66, 'en', 'Music', '2025-08-01 05:23:16', '2025-08-01 05:23:16'),
(148, 66, 'hi', 'Music', '2025-08-01 05:23:16', '2025-08-01 05:23:16'),
(151, 68, 'en', 'Fabworld Villagers', '2025-08-03 12:31:25', '2025-09-04 11:12:07'),
(152, 68, 'hi', 'Fabworld Characters', '2025-08-03 12:31:25', '2025-08-03 12:31:25'),
(153, 69, 'en', 'Mystic Gadgets & Relics', '2025-08-03 13:23:08', '2025-08-03 13:24:24'),
(154, 69, 'hi', 'Gadgets & Relics', '2025-08-03 13:23:08', '2025-08-03 13:23:08'),
(155, 70, 'en', 'Elementrix Chronicles', '2025-08-03 13:24:57', '2025-08-31 05:35:07'),
(156, 70, 'hi', 'Elementrix Wrist Gear', '2025-08-03 13:24:57', '2025-08-03 13:24:57'),
(161, 73, 'en', 'Rock and Bako', '2025-08-03 13:28:02', '2025-09-01 13:38:32'),
(162, 73, 'hi', 'Asher', '2025-08-03 13:28:02', '2025-08-03 13:28:02'),
(163, 74, 'en', 'The Silent Order', '2025-08-03 13:31:20', '2025-08-03 13:31:20'),
(164, 74, 'hi', 'The Silent Order', '2025-08-03 13:31:20', '2025-08-03 13:31:20'),
(165, 75, 'en', 'Fablepals Mystic World', '2025-08-04 06:34:23', '2025-08-04 06:34:23'),
(166, 75, 'hi', 'Fablepals Mystic World', '2025-08-04 06:34:23', '2025-08-04 06:34:23'),
(167, 76, 'en', 'Earth Elemental World', '2025-08-04 06:35:12', '2025-08-04 06:35:12'),
(168, 76, 'hi', 'Earth Elemental World', '2025-08-04 06:35:12', '2025-08-04 06:35:12'),
(169, 77, 'en', 'Water Elemental World', '2025-08-04 06:35:30', '2025-08-04 06:35:30'),
(170, 77, 'hi', 'Water Elemental World', '2025-08-04 06:35:30', '2025-08-04 06:35:30'),
(171, 78, 'en', 'Fire Elemental World', '2025-08-04 06:35:40', '2025-08-04 06:35:40'),
(172, 78, 'hi', 'Fire Elemental World', '2025-08-04 06:35:40', '2025-08-04 06:35:40'),
(173, 79, 'en', 'Air Elemental World', '2025-08-04 06:36:01', '2025-08-04 06:36:01'),
(174, 79, 'hi', 'Air Elemental World', '2025-08-04 06:36:01', '2025-08-04 06:36:01'),
(175, 80, 'en', 'Time Elemental World', '2025-08-04 06:36:14', '2025-08-04 06:36:14'),
(176, 80, 'hi', 'Time Elemental World', '2025-08-04 06:36:14', '2025-08-04 06:36:14'),
(179, 82, 'en', 'Primora - Origin Realm', '2025-08-04 06:36:42', '2025-08-20 06:57:51'),
(180, 82, 'hi', 'Dark Realm World', '2025-08-04 06:36:42', '2025-08-04 06:36:42'),
(183, 84, 'en', 'Fab Cinematic Universe', '2025-08-06 11:45:28', '2025-08-06 11:46:12'),
(184, 84, 'hi', 'Fablepals Cinematic Universe', '2025-08-06 11:45:28', '2025-08-06 11:45:28'),
(185, 85, 'en', 'Element Collection Saga', '2025-08-06 11:46:37', '2025-08-13 12:37:19'),
(186, 85, 'hi', 'Fablepals : The Awakening', '2025-08-06 11:46:37', '2025-08-06 11:46:37'),
(187, 86, 'en', 'Lore Expansion Saga', '2025-08-06 11:48:08', '2025-08-13 12:37:50'),
(188, 86, 'hi', 'Tiggo : Heart of Terra Prime', '2025-08-06 11:48:08', '2025-08-06 11:48:08'),
(201, 93, 'en', 'Shop', '2025-08-22 10:42:26', '2025-08-22 10:42:26'),
(202, 93, 'hi', 'Shop', '2025-08-22 10:42:26', '2025-08-22 10:42:26'),
(203, 94, 'en', 'Chef Truffle', '2025-09-01 12:41:07', '2025-09-01 12:41:07'),
(204, 94, 'hi', 'Chef Truffle', '2025-09-01 12:41:07', '2025-09-01 12:41:07'),
(205, 95, 'en', 'Healer Willow', '2025-09-01 13:00:44', '2025-09-01 13:00:44'),
(206, 95, 'hi', 'Healer Willow', '2025-09-01 13:00:44', '2025-09-01 13:00:44'),
(207, 96, 'en', 'Mr. Beavers', '2025-09-03 07:05:53', '2025-09-03 07:05:53'),
(208, 96, 'hi', 'Mr. Beavers', '2025-09-03 07:05:53', '2025-09-03 07:05:53'),
(209, 97, 'en', 'Drummer Riffy', '2025-09-04 10:45:49', '2025-09-04 10:45:49'),
(210, 97, 'hi', 'Drummer Riffy', '2025-09-04 10:45:49', '2025-09-04 10:45:49'),
(211, 98, 'en', 'FabTV', '2025-11-08 10:20:43', '2025-11-08 10:21:06'),
(212, 98, 'hi', 'FABTV', '2025-11-08 10:20:43', '2025-11-08 10:20:43'),
(213, 99, 'en', 'FabMusic', '2025-11-08 10:21:29', '2025-11-08 10:21:40'),
(214, 99, 'hi', 'Fabmusic', '2025-11-08 10:21:29', '2025-11-08 10:21:29'),
(215, 100, 'en', 'DigiStore', '2025-11-08 10:21:59', '2025-11-08 10:21:59'),
(216, 100, 'hi', 'DigiStore', '2025-11-08 10:21:59', '2025-11-08 10:21:59'),
(217, 101, 'en', 'Home', '2025-11-08 10:22:35', '2025-11-08 10:22:35'),
(218, 101, 'hi', 'Home', '2025-11-08 10:22:35', '2025-11-08 10:22:35'),
(219, 102, 'en', 'Contact', '2025-11-18 06:52:28', '2025-11-18 06:52:28'),
(220, 102, 'hi', 'Contact', '2025-11-18 06:52:28', '2025-11-18 06:52:28'),
(221, 103, 'en', 'Terms Conditions', '2025-11-26 10:45:11', '2025-11-26 10:45:11'),
(222, 103, 'hi', 'Terms Conditions', '2025-11-26 10:45:11', '2025-11-26 10:45:11'),
(223, 104, 'en', 'Privacy Policy', '2025-11-26 10:45:24', '2025-11-26 10:45:24'),
(224, 104, 'hi', 'Privacy Policy', '2025-11-26 10:45:24', '2025-11-26 10:45:24'),
(225, 105, 'en', 'Support FablePals', '2026-02-19 09:31:59', '2026-02-19 09:31:59'),
(226, 105, 'hi', 'Support FablePals', '2026-02-19 09:31:59', '2026-02-19 09:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `menu_translations`
--

CREATE TABLE `menu_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_translations`
--

INSERT INTO `menu_translations` (`id`, `menu_id`, `lang_code`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Main Menu', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'hi', 'मुख्य मेन्यू', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 2, 'en', 'Footer Menu', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 2, 'hi', 'फ़ुटर मेनू', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 3, 'en', 'Footer Second Menu', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 3, 'hi', 'फ़ुटर दूसरा मेनू', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_22_090256_create_our_teams_table', 1),
(6, '2023_11_05_045432_create_admins_table', 1),
(7, '2023_11_05_114814_create_languages_table', 1),
(8, '2023_11_06_043247_create_settings_table', 1),
(9, '2023_11_06_054251_create_seo_settings_table', 1),
(10, '2023_11_06_094842_create_custom_paginations_table', 1),
(11, '2023_11_06_115856_create_email_templates_table', 1),
(12, '2023_11_07_051924_create_multi_currencies_table', 1),
(13, '2023_11_07_103108_create_basic_payments_table', 1),
(14, '2023_11_07_104315_create_blog_categories_table', 1),
(15, '2023_11_07_104328_create_blog_category_translations_table', 1),
(16, '2023_11_07_104336_create_blogs_table', 1),
(17, '2023_11_07_104343_create_blog_translations_table', 1),
(18, '2023_11_07_104546_create_blog_comments_table', 1),
(19, '2023_11_09_100621_create_jobs_table', 1),
(20, '2023_11_12_052417_create_subscription_plans_table', 1),
(21, '2023_11_19_064341_create_banned_histories_table', 1),
(22, '2023_11_19_091457_create_customizeable_pages_table', 1),
(23, '2023_11_21_043030_create_news_letters_table', 1),
(24, '2023_11_21_094702_create_contact_messages_table', 1),
(25, '2023_11_22_105539_create_permission_tables', 1),
(26, '2023_11_29_055540_create_orders_table', 1),
(27, '2023_11_29_095126_create_coupons_table', 1),
(28, '2023_11_29_104658_create_testimonials_table', 1),
(29, '2023_11_29_104704_create_testimonial_translations_table', 1),
(30, '2023_11_29_105234_create_coupon_histories_table', 1),
(31, '2023_11_30_041502_create_refund_requests_table', 1),
(32, '2023_11_30_044838_create_faqs_table', 1),
(33, '2023_11_30_044844_create_faq_translations_table', 1),
(34, '2024_01_01_054644_create_socialite_credentials_table', 1),
(35, '2024_01_03_030857_create_customizable_page_translations_table', 1),
(36, '2024_01_03_092007_create_custom_codes_table', 1),
(37, '2024_02_10_060044_create_configurations_table', 1),
(38, '2024_03_28_095206_create_custom_addons_table', 1),
(39, '2024_03_28_095207_create_menus_wp_table', 1),
(40, '2024_03_28_095208_create_menu_translations_table', 1),
(41, '2024_03_28_095209_create_menu_items_wp_table', 1),
(42, '2024_03_28_095210_create_menu_item_translations_table', 1),
(43, '2024_05_16_084001_create_product_categories_table', 1),
(44, '2024_05_16_084002_create_product_category_translations_table', 1),
(45, '2024_05_16_084003_create_products_table', 1),
(46, '2024_05_16_084030_create_product_translations_table', 1),
(47, '2024_05_16_084153_create_product_images_table', 1),
(48, '2024_05_19_014046_create_news_tickers_table', 1),
(49, '2024_05_19_014103_create_news_ticker_translations_table', 1),
(50, '2024_05_19_030300_create_product_reviews_table', 1),
(51, '2024_05_19_064102_create_favorite_product_user_table', 1),
(52, '2024_05_20_040058_create_countries_table', 1),
(53, '2024_05_20_040118_create_country_translations_table', 1),
(54, '2024_05_20_052819_create_brands_table', 1),
(55, '2024_05_21_033623_create_order_addresses_table', 1),
(56, '2024_05_21_033746_create_order_products_table', 1),
(57, '2024_05_26_032547_create_section_settings_table', 1),
(58, '2024_05_26_065953_create_social_links_table', 1),
(59, '2024_05_26_164008_create_contact_sections_table', 1),
(60, '2024_06_01_041041_create_shipping_methods_table', 1),
(61, '2024_06_01_041116_create_shipping_method_translations_table', 1),
(62, '2024_10_08_060425_create_homes_table', 1),
(63, '2024_10_08_060618_create_sections_table', 1),
(64, '2024_10_08_060636_create_section_translations_table', 1),
(65, '2024_10_23_095300_create_services_table', 1),
(66, '2024_10_23_095301_create_service_translations_table', 1),
(67, '2024_10_23_095307_create_projects_table', 1),
(68, '2024_10_23_095352_create_project_translations_table', 1),
(69, '2024_10_27_032544_create_awards_table', 1),
(70, '2024_10_27_032623_create_award_translations_table', 1),
(71, '2024_10_30_005709_create_project_images_table', 1),
(72, '2024_11_18_043302_create_subscription_plan_translations_table', 1),
(73, '2025_03_08_042533_create_delivery_addresses_table', 1),
(74, '2025_04_06_114300_add_new_column_to_products_table', 1),
(75, '2025_04_06_114303_create_file_uploads_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `multi_currencies`
--

CREATE TABLE `multi_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_icon` varchar(255) NOT NULL,
  `is_default` varchar(255) NOT NULL,
  `currency_rate` double NOT NULL,
  `currency_position` varchar(255) NOT NULL DEFAULT 'before_price',
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_currencies`
--

INSERT INTO `multi_currencies` (`id`, `currency_name`, `country_code`, `currency_code`, `currency_icon`, `is_default`, `currency_rate`, `currency_position`, `status`, `created_at`, `updated_at`) VALUES
(1, '$-USD', 'US', 'USD', '$', 'no', 1, 'before_price', 'inactive', '2025-05-04 09:05:04', '2025-10-24 10:56:28'),
(3, '₹-Rupee', 'IN', 'INR', '₹', 'yes', 1, 'before_price', 'active', '2025-05-04 09:05:04', '2025-09-06 10:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `news_letters`
--

CREATE TABLE `news_letters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'not_verified',
  `verify_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_tickers`
--

CREATE TABLE `news_tickers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_tickers`
--

INSERT INTO `news_tickers` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, '2025-05-04 09:05:05', '2025-05-05 07:02:27'),
(2, 0, '2025-05-04 09:05:05', '2025-05-05 07:02:28'),
(3, 0, '2025-05-04 09:05:05', '2025-05-05 07:02:29'),
(4, 0, '2025-05-04 09:05:05', '2025-05-05 07:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `news_ticker_translations`
--

CREATE TABLE `news_ticker_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news_ticker_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_ticker_translations`
--

INSERT INTO `news_ticker_translations` (`id`, `news_ticker_id`, `lang_code`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'We Give Unparalleled Flexibility', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'hi', 'हम अद्वितीय लचीलापन देते हैं', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 2, 'en', 'We Give Unparalleled Flexibility', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 2, 'hi', 'हम अद्वितीय लचीलापन देते हैं', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 3, 'en', 'We Give Unparalleled Flexibility', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 3, 'hi', 'हम अद्वितीय लचीलापन देते हैं', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(10, 4, 'en', 'We Give Unparalleled Flexibility', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(11, 4, 'hi', 'हम अद्वितीय लचीलापन देते हैं', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `sub_total_usd` double NOT NULL DEFAULT 0,
  `order_tax_usd` double NOT NULL DEFAULT 0,
  `discount_usd` double NOT NULL DEFAULT 0,
  `delivery_charge_usd` double NOT NULL DEFAULT 0,
  `amount_usd` double NOT NULL DEFAULT 0,
  `sub_total` varchar(255) NOT NULL DEFAULT '0',
  `order_tax` varchar(255) NOT NULL DEFAULT '0',
  `discount` varchar(255) NOT NULL DEFAULT '0',
  `delivery_charge` varchar(255) NOT NULL DEFAULT '0',
  `paid_amount` varchar(255) NOT NULL,
  `gateway_charge` varchar(255) DEFAULT NULL,
  `payable_with_charge` varchar(255) DEFAULT NULL,
  `payable_currency` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `payment_status` enum('pending','success','rejected','refund') NOT NULL DEFAULT 'pending',
  `order_status` enum('draft','pending','process','success','refund','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_details` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_id`, `product_qty`, `sub_total_usd`, `order_tax_usd`, `discount_usd`, `delivery_charge_usd`, `amount_usd`, `sub_total`, `order_tax`, `discount`, `delivery_charge`, `paid_amount`, `gateway_charge`, `payable_with_charge`, `payable_currency`, `payment_method`, `transaction_id`, `payment_status`, `order_status`, `created_at`, `updated_at`, `payment_details`) VALUES
(1, 1, '1336323226', 3, 310, 31, 20, 35, 356, '310', '31', '20', '35', '356', '0', '356', 'USD', 'stripe', 'txn_3PVRqSF56Pb8BOOX0JoBPtfL', 'success', 'success', '2025-05-04 09:05:06', '2025-10-24 17:08:48', '{\"transaction_id\":\"txn_3PVRqSF56Pb8BOOX0JoBPtfL\",\"amount\":16284,\"currency\":\"usd\",\"paid\":true,\"description\":\"Cresta\",\"seller_message\":\"Payment complete.\",\"payment_method\":\"card_1PVRqMF56Pb8BOOXvTEhlAhB\",\"card_last4_digit\":\"4242\",\"card_brand\":\"visa - US\",\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xSlU2MWFGNTZQYjhCT09YKLyo6bMGMgara-EpY086LBbmENfUZ25sXxMlcpRNfNz_20CkAFVtAMathz0pv_YI3rwNZX1HWU8N50Vl\",\"status\":\"succeeded\"}'),
(3, 1, '1247239869', 2, 718, 71.8, 99, 40, 730.08, '718', '71.8', '99', '40', '730.08', '0', '730.08', 'USD', 'paypal', 'HUR3FNQ2XCB2U', 'success', 'success', '2025-05-04 09:05:06', '2025-10-24 17:08:30', '{\"payments_captures_id\":\"81D80058RX438825R\",\"amount\":\"871.01\",\"currency\":\"USD\",\"paid\":\"871.01\",\"paypal_fee\":\"30.89\",\"net_amount\":\"840.12\",\"status\":\"COMPLETED\"}'),
(4, 1, '690390906', 2, 88, 8, 0, 0, 96, '88', '8', '0', '0', '96', '0', '96', 'USD', 'stripe', 'txn_3PVRqSF56Pb8KEDJYUSDPtfL', 'success', 'success', '2025-05-04 09:05:06', '2025-10-24 17:08:06', '{\"transaction_id\":\"txn_3PVRqSF56Pb8KEDJYUSDPtfL\",\"amount\":16284,\"currency\":\"usd\",\"paid\":true,\"description\":\"Frisk\",\"seller_message\":\"Payment complete.\",\"payment_method\":\"card_1PVRqMF56Pb8BOOXvTEhlAhB\",\"card_last4_digit\":\"4242\",\"card_brand\":\"visa - US\",\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xSlU2MWFGNTZQYjhCT09YKLyo6bMGMgara-EpY086LBbmENfUZ25sXxMlcpRNfNz_20CkAFVtAMathz0pv_YI3rwNZX1HWU8N50Vl\",\"status\":\"succeeded\"}'),
(5, 10, 'ORD_1768636627', 1, 9, 0, 0, 0, 9, '9', '0', '0', '0', '9', NULL, NULL, 'INR', 'cashfree', NULL, 'pending', 'draft', '2026-01-17 07:57:08', '2026-01-17 07:57:08', '{\"cart_details\":{\"cart_id\":\"35598827\"},\"cf_order_id\":\"5208739621\",\"created_at\":\"2026-01-17T13:27:08+05:30\",\"customer_details\":{\"customer_id\":\"USER_10\",\"customer_name\":\"Rishabh Sharma\",\"customer_email\":\"rbh.sharmaa@gmail.com\",\"customer_phone\":\"7988370920\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":9,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-02-16T13:27:08+05:30\",\"order_id\":\"ORD_1768636627\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session_Vb_oIrh13TdQrQY1B9VCk_40wYELJ0mOQs6Cbku8TbS5XeVW-60PDkEISHvbIjcE94X8zBj1e5YRRLhvvqBHdsTQcRaavx7iUJHlUB3W1tdbAoLele_HQev4wYEQ\",\"terminal_data\":null}'),
(6, 11, 'ORD_1768656363', 1, 9, 0, 0, 0, 9, '9', '0', '0', '0', '9', NULL, NULL, 'INR', 'cashfree', NULL, 'success', 'success', '2026-01-17 13:26:03', '2026-01-17 14:30:00', '{\"cart_details\":{\"cart_id\":\"35615052\"},\"cf_order_id\":\"5209915627\",\"created_at\":\"2026-01-17T18:56:04+05:30\",\"customer_details\":{\"customer_id\":\"USER_11\",\"customer_name\":\"rishi kashyap\",\"customer_email\":\"rishikashyapp.10@gmail.com\",\"customer_phone\":\"8375996566\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":9,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-02-16T18:56:04+05:30\",\"order_id\":\"ORD_1768656363\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session_T4G-IjbAWW40irgCH1jipGT5Jio-ieHwBWg0EN8a5CAWgpQOt6n0SnieRaJ4dRAoNA-Bh8tA36myhjC6L1GEVrOmGWEAS0j4C0_CeqLitaqgruE9U46vYOETtkQ8\",\"terminal_data\":null}'),
(7, 10, 'ORD_1768800581', 1, 9, 0, 0, 0, 9, '9', '0', '0', '0', '9', NULL, NULL, 'INR', 'cashfree', NULL, 'pending', 'draft', '2026-01-19 05:29:41', '2026-01-19 05:29:41', '{\"cart_details\":{\"cart_id\":\"35728847\"},\"cf_order_id\":\"5217286767\",\"created_at\":\"2026-01-19T10:59:42+05:30\",\"customer_details\":{\"customer_id\":\"USER_10\",\"customer_name\":\"Rishabh Sharma\",\"customer_email\":\"rbh.sharmaa@gmail.com\",\"customer_phone\":\"7988370920\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":9,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-02-18T10:59:42+05:30\",\"order_id\":\"ORD_1768800581\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session__c4O1258iqvvDsqQJLm1ovgTFnlb4B_rr46Ycl3ZN-LLKn8262QHLuVOL1ZJccwr6xYYws3McoihvCr4xqEcR6HqPdR75mr0eUq4yYlQ_0-BXdKAK-kS6y-BcVG8\",\"terminal_data\":null}'),
(8, 10, 'ORD_1768914766', 1, 9, 0, 0, 0, 9, '9', '0', '0', '0', '9', NULL, NULL, 'INR', 'cashfree', NULL, 'success', 'success', '2026-01-20 13:12:46', '2026-01-20 13:13:16', '{\"cart_details\":{\"cart_id\":\"35832980\"},\"cf_order_id\":\"5223946840\",\"created_at\":\"2026-01-20T18:42:47+05:30\",\"customer_details\":{\"customer_id\":\"USER_10\",\"customer_name\":\"Rishabh Sharma\",\"customer_email\":\"rbh.sharmaa@gmail.com\",\"customer_phone\":\"7988370920\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":9,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-02-19T18:42:47+05:30\",\"order_id\":\"ORD_1768914766\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session_JBamkRDx8krPs-47-IXyWhQLjslAm4ZKn3TWr2Nbw0gYhvH1Y6IuQAdIhuski-cuNmihcYstUt79IRFGlrp0cph87zGkFE9D4H5Xzz--ciLlehcIA8zLqqEF4qU9\",\"terminal_data\":null}'),
(9, 9, 'ORD_1769235695', 1, 25, 0, 0, 0, 25, '25', '0', '0', '0', '25', NULL, NULL, 'INR', 'cashfree', NULL, 'success', 'success', '2026-01-24 06:21:36', '2026-01-24 06:22:07', '{\"cart_details\":{\"cart_id\":\"36068925\"},\"cf_order_id\":\"5241922783\",\"created_at\":\"2026-01-24T11:51:36+05:30\",\"customer_details\":{\"customer_id\":\"USER_9\",\"customer_name\":\"vaibhav satasiya\",\"customer_email\":\"vaibhav.satasiya1995@gmail.com\",\"customer_phone\":\"7405188056\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":25,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-02-23T11:51:36+05:30\",\"order_id\":\"ORD_1769235695\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session_SdXUd3v07f-SjQdPgQBJyDeMkLm1mHAO8CstYH0dBcwFTQMW-7HqwTc-6vXzwyenp14isjCnUkx5qakFSBAsMKNKxm4QoNTPSvC6b9oraiBB9LoBIIxwzTF7RRod\",\"terminal_data\":null}'),
(10, 12, 'ORD_1769327702', 1, 9, 0, 0, 0, 9, '9', '0', '0', '0', '9', NULL, NULL, 'INR', 'cashfree', NULL, 'success', 'success', '2026-01-25 07:55:03', '2026-01-25 07:55:39', '{\"cart_details\":{\"cart_id\":\"36135625\"},\"cf_order_id\":\"5246680240\",\"created_at\":\"2026-01-25T13:25:03+05:30\",\"customer_details\":{\"customer_id\":\"USER_12\",\"customer_name\":\"RIshi Kashyap\",\"customer_email\":\"rishikashyapp.10@gmail.com\",\"customer_phone\":\"8375898789\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":9,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-02-24T13:25:03+05:30\",\"order_id\":\"ORD_1769327702\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session_XSCBTxP9VPNpxSVAjmBFtctFaF-9rC98TmD6N9d1saE9QJUKKjxlRvzhteYBpeY8tf5UIxTiWINXvx0RfRUPUvc0x9j0g9eWV3jfHRPW0qQemT9on9V69ehBWm7V\",\"terminal_data\":null}'),
(11, 9, 'ORD_1769410290', 1, 30, 0, 0, 0, 30, '30', '0', '0', '0', '30', NULL, NULL, 'INR', 'cashfree', NULL, 'success', 'success', '2026-01-26 06:51:30', '2026-01-26 06:52:09', '{\"cart_details\":{\"cart_id\":\"36189962\"},\"cf_order_id\":\"5250973478\",\"created_at\":\"2026-01-26T12:21:30+05:30\",\"customer_details\":{\"customer_id\":\"USER_9\",\"customer_name\":\"vaibhav satasiya\",\"customer_email\":\"balu.patel2@gmail.com\",\"customer_phone\":\"7405188056\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":30,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-02-25T12:21:30+05:30\",\"order_id\":\"ORD_1769410290\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session__wiLU-8MvrzKnHyrJgHxx_tAADfJzGW2bWXRqJ8Ws-_OKr3sCqvT9k_ccoHm2diBv5eHMlR04tyFpq-DhQr-Le16Ef3LMQOIbrFslfONb-SjkKzM9ipIm_0JWETZ\",\"terminal_data\":null}'),
(12, 9, 'ORD_1770212393', 1, 9, 0, 0, 0, 9, '9', '0', '0', '0', '9', NULL, NULL, 'INR', 'cashfree', NULL, 'success', 'success', '2026-02-04 13:39:53', '2026-02-04 13:40:55', '{\"cart_details\":{\"cart_id\":\"36840278\"},\"cf_order_id\":\"5300329249\",\"created_at\":\"2026-02-04T19:09:53+05:30\",\"customer_details\":{\"customer_id\":\"USER_9\",\"customer_name\":\"vaibhav satasiya\",\"customer_email\":\"balu.patel2@gmail.com\",\"customer_phone\":\"7405188056\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":9,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-03-06T19:09:53+05:30\",\"order_id\":\"ORD_1770212393\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session_oe2VXJZVtK_ecV5vEFEf1KtAa_Hqn58iXDpWEyfXJ3G-4pmaQN1Id7bxIrRbJjFG_ANyxnzdbdj3eB5CWheF8g5Y0fPmj1qtJkdSpkZbzNQKUxsM_tpdNrySqShS\",\"terminal_data\":null}'),
(13, 11, 'ORD_1771419862', 1, 25, 0, 0, 0, 25, '25', '0', '0', '0', '25', NULL, NULL, 'INR', 'cashfree', NULL, 'pending', 'draft', '2026-02-18 13:04:22', '2026-02-18 13:04:22', '{\"cart_details\":{\"cart_id\":\"37804436\"},\"cf_order_id\":\"5380028108\",\"created_at\":\"2026-02-18T18:34:23+05:30\",\"customer_details\":{\"customer_id\":\"USER_11\",\"customer_name\":\"rishi kashyap\",\"customer_email\":\"anjali92kumarisingh@gmail.com\",\"customer_phone\":\"8375996566\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":25,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-03-20T18:34:23+05:30\",\"order_id\":\"ORD_1771419862\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session_uMDnlHXbYnErneGBbheG63cxKCw44ie2ajtuj5K7_NPYEshwwQqLiqmL36XIEU0qgI5feErvRLtImvrP3WJyNEhNcpjedXNBcnHyK80VVkgRDoTElJ5DnUEiDu1a\",\"terminal_data\":null}'),
(14, 9, 'ORD_1771584216', 1, 9, 0, 0, 0, 9, '9', '0', '0', '0', '9', NULL, NULL, 'INR', 'cashfree', NULL, 'success', 'success', '2026-02-20 10:43:36', '2026-02-20 10:44:03', '{\"cart_details\":{\"cart_id\":\"38025036\"},\"cf_order_id\":\"5391773467\",\"created_at\":\"2026-02-20T16:13:37+05:30\",\"customer_details\":{\"customer_id\":\"USER_9\",\"customer_name\":\"vaibhav satasiya\",\"customer_email\":\"vaibhav.satasiya1995@gmail.com\",\"customer_phone\":\"7405188056\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":9,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-03-22T16:13:37+05:30\",\"order_id\":\"ORD_1771584216\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session_I37R6jPJw0VDxXywhkpnjJo-fuHZaj5YC71Wp2snRS7pYZroNoIipyDqqJXHtAF7xUKlxO_q5Mvcn1RmrttX0tXNyOTBBUI4Ev4bGLaYk7RIePTte8k_w7b56LE5\",\"terminal_data\":null}'),
(15, 11, 'ORD_1771831048', 1, 9, 0, 0, 0, 9, '9', '0', '0', '0', '9', NULL, NULL, 'INR', 'cashfree', NULL, 'pending', 'draft', '2026-02-23 07:17:28', '2026-02-23 07:17:28', '{\"cart_details\":{\"cart_id\":\"38312818\"},\"cf_order_id\":\"5407677297\",\"created_at\":\"2026-02-23T12:47:29+05:30\",\"customer_details\":{\"customer_id\":\"USER_11\",\"customer_name\":\"rishi kashyap\",\"customer_email\":\"rishi@gmail.com\",\"customer_phone\":\"8375996566\",\"customer_uid\":null},\"entity\":\"order\",\"order_amount\":9,\"order_currency\":\"INR\",\"order_expiry_time\":\"2026-03-25T12:47:29+05:30\",\"order_id\":\"ORD_1771831048\",\"order_meta\":{\"return_url\":\"https:\\/\\/fablepals.kids\\/cashfree\\/callback?order_id={order_id}\",\"notify_url\":null,\"payment_methods\":null},\"order_note\":null,\"order_splits\":[],\"order_status\":\"ACTIVE\",\"order_tags\":null,\"payment_session_id\":\"session_orjNGL3oJRVuY0i-8j6oNXji8wgh5Tz08EZajjLL3YUDMxj_qbJDyHMpIthBh3K2yosaY_rSZ-aos5LHmf_w1jTsweYSHbJvaH03DousEusdD28z1utIhLauy-Oy\",\"terminal_data\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE `order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `billing_first_name` varchar(255) DEFAULT NULL,
  `billing_last_name` varchar(255) DEFAULT NULL,
  `billing_email` varchar(255) DEFAULT NULL,
  `billing_phone` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) NOT NULL DEFAULT '0',
  `billing_state` varchar(255) DEFAULT NULL,
  `billing_city` varchar(255) DEFAULT NULL,
  `billing_zip_code` varchar(255) DEFAULT NULL,
  `shipping_first_name` varchar(255) DEFAULT NULL,
  `shipping_last_name` varchar(255) DEFAULT NULL,
  `shipping_email` varchar(255) DEFAULT NULL,
  `shipping_phone` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_country` varchar(255) NOT NULL DEFAULT '0',
  `shipping_state` varchar(255) DEFAULT NULL,
  `shipping_city` varchar(255) DEFAULT NULL,
  `shipping_zip_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_addresses`
--

INSERT INTO `order_addresses` (`id`, `order_id`, `billing_first_name`, `billing_last_name`, `billing_email`, `billing_phone`, `billing_address`, `billing_country`, `billing_state`, `billing_city`, `billing_zip_code`, `shipping_first_name`, `shipping_last_name`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_country`, `shipping_state`, `shipping_city`, `shipping_zip_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Curtis Campher', NULL, 'user@gmail.com', '2420 -136- 1452', '4A, Park Street', 'United States', 'Florida', 'Washington DC', '8834', 'Curtis Campher', NULL, 'user@gmail.com', '2420 -136- 1452', '4A, Park Street', 'United States', 'Florida', 'Washington DC', '8834', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(3, 3, 'Curtis Campher', NULL, 'user@gmail.com', '2420 -136- 1452', '4A, Park Street', 'United States', 'Florida', 'Washington DC', '8834', 'Curtis Campher', NULL, 'user@gmail.com', '2420 -136- 1452', '4A, Park Street', 'United States', 'Florida', 'Washington DC', '8834', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(4, 4, 'Curtis Campher', NULL, 'user@gmail.com', '2420 -136- 1452', '4A, Park Street', 'United States', 'Florida', 'Washington DC', '8834', 'Curtis Campher', NULL, 'user@gmail.com', '2420 -136- 1452', '4A, Park Street', 'United States', 'Florida', 'Washington DC', '8834', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(5, 5, 'Rishabh', 'Sharma', 'rbh.sharmaa@gmail.com', '7988370920', '100', 'India', 'Delhi', 'New Delhi', '155445', 'Rishabh', 'Sharma', 'rbh.sharmaa@gmail.com', '7988370920', '100', 'India', 'Delhi', 'New Delhi', '155445', '2026-01-17 07:57:08', '2026-01-17 07:57:08'),
(6, 6, 'rishi', 'kashyap', 'rishikashyapp.10@gmail.com', '8375996566', 'L BLOCK', 'India', 'Delhi', 'NEW DELHI', '110017', 'rishi', 'kashyap', 'rishikashyapp.10@gmail.com', '8375996566', 'L BLOCK', 'India', 'Delhi', 'NEW DELHI', '110017', '2026-01-17 13:26:03', '2026-01-17 13:26:03'),
(7, 7, 'Rishabh', 'Sharma', 'rbh.sharmaa@gmail.com', '7988370920', '100', 'India', 'Delhi', 'New Delhi', '155445', 'Rishabh', 'Sharma', 'rbh.sharmaa@gmail.com', '7988370920', '100', 'India', 'Delhi', 'New Delhi', '155445', '2026-01-19 05:29:41', '2026-01-19 05:29:41'),
(8, 8, 'Rishabh', 'Sharma', 'rbh.sharmaa@gmail.com', '7988370920', '100', 'India', 'Delhi', 'New Delhi', '155445', 'Rishabh', 'Sharma', 'rbh.sharmaa@gmail.com', '7988370920', '100', 'India', 'Delhi', 'New Delhi', '155445', '2026-01-20 13:12:46', '2026-01-20 13:12:46'),
(9, 9, 'vaibhav', 'satasiya', 'vaibhav.satasiya1995@gmail.com', '7405188056', 'Manjalpur, Vadodara', 'India', 'Gujarat', 'Vadodara', '390011', 'vaibhav', 'satasiya', 'vaibhav.satasiya1995@gmail.com', '7405188056', 'Manjalpur, Vadodara', 'India', 'Gujarat', 'Vadodara', '390011', '2026-01-24 06:21:36', '2026-01-24 06:21:36'),
(10, 10, 'RIshi', 'Kashyap', 'rishikashyapp.10@gmail.com', '8375898789', 'L BLOCK', 'India', 'Delhi', 'NEW DELHI', '110017', 'RIshi', 'Kashyap', 'rishikashyapp.10@gmail.com', '8375898789', 'L BLOCK', 'India', 'Delhi', 'NEW DELHI', '110017', '2026-01-25 07:55:03', '2026-01-25 07:55:03'),
(11, 11, 'vaibhav', 'satasiya', 'balu.patel2@gmail.com', '7405188056', 'Manjalpur, Vadodara', 'India', 'Gujarat', 'Vadodara', '390011', 'vaibhav', 'satasiya', 'balu.patel2@gmail.com', '7405188056', 'Manjalpur, Vadodara', 'India', 'Gujarat', 'Vadodara', '390011', '2026-01-26 06:51:30', '2026-01-26 06:51:30'),
(12, 12, 'vaibhav', 'satasiya', 'balu.patel2@gmail.com', '7405188056', 'Manjalpur, Vadodara', 'India', 'Gujarat', 'Vadodara', '390011', 'vaibhav', 'satasiya', 'balu.patel2@gmail.com', '7405188056', 'Manjalpur, Vadodara', 'India', 'Gujarat', 'Vadodara', '390011', '2026-02-04 13:39:53', '2026-02-04 13:39:53'),
(13, 13, 'rishi', 'kashyap', 'anjali92kumarisingh@gmail.com', '8375996566', 'L BLOCK', 'India', 'Delhi', 'NEW DELHI', '110017', 'rishi', 'kashyap', 'anjali92kumarisingh@gmail.com', '8375996566', 'L BLOCK', 'India', 'Delhi', 'NEW DELHI', '110017', '2026-02-18 13:04:22', '2026-02-18 13:04:22'),
(14, 14, 'vaibhav', 'satasiya', 'vaibhav.satasiya1995@gmail.com', '7405188056', 'Manjalpur, Vadodara', 'India', 'Gujarat', 'Vadodara', '390011', 'vaibhav', 'satasiya', 'vaibhav.satasiya1995@gmail.com', '7405188056', 'Manjalpur, Vadodara', 'India', 'Gujarat', 'Vadodara', '390011', '2026-02-20 10:43:36', '2026-02-20 10:43:36'),
(15, 15, 'rishi', 'kashyap', 'rishi@gmail.com', '8375996566', 'L BLOCK', 'India', 'Delhi', 'NEW DELHI', '110017', 'rishi', 'kashyap', 'rishi@gmail.com', '8375996566', 'L BLOCK', 'India', 'Delhi', 'NEW DELHI', '110017', '2026-02-23 07:17:28', '2026-02-23 07:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `unit_price_usd` double NOT NULL DEFAULT 0,
  `total_usd` double NOT NULL DEFAULT 0,
  `unit_price` varchar(255) NOT NULL DEFAULT '0',
  `total` varchar(255) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `product_name`, `unit_price_usd`, `total_usd`, `unit_price`, `total`, `qty`, `created_at`, `updated_at`) VALUES
(6, 4, 15, 'Aabcserv', 29, 29, '29', '29', 1, '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(7, 4, 16, 'FindEstate', 59, 59, '59', '59', 1, '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(8, 5, 37, 'Luna’s Big Breaking News Storybook (Digital Download)', 9, 9, '9', '9', 1, '2026-01-17 07:57:08', '2026-01-17 07:57:08'),
(9, 6, 37, 'Luna’s Big Breaking News Storybook (Digital Download)', 9, 9, '9', '9', 1, '2026-01-17 13:26:03', '2026-01-17 13:26:03'),
(10, 7, 37, 'Luna’s Big Breaking News Storybook (Digital Download)', 9, 9, '9', '9', 1, '2026-01-19 05:29:41', '2026-01-19 05:29:41'),
(11, 8, 36, 'Tiggo and the Missing Mangoes Storybook (Digital Download)', 9, 9, '9', '9', 1, '2026-01-20 13:12:46', '2026-01-20 13:12:46'),
(12, 9, 38, 'Tiggo 4K Desktop Wallpaper Bundle ( Digital Download )', 25, 25, '25', '25', 1, '2026-01-24 06:21:36', '2026-01-24 06:21:36'),
(13, 10, 33, 'Number Tracing Sheets 0–9 (Digital Download)', 9, 9, '9', '9', 1, '2026-01-25 07:55:03', '2026-01-25 07:55:03'),
(14, 11, 39, 'Tiggo Mobile Wallpaper Bundle ( Digital Download )', 30, 30, '30', '30', 1, '2026-01-26 06:51:30', '2026-01-26 06:51:30'),
(15, 12, 37, 'Luna’s Big Breaking News Storybook (Digital Download)', 9, 9, '9', '9', 1, '2026-02-04 13:39:53', '2026-02-04 13:39:53'),
(16, 13, 38, 'Tiggo 4K Desktop Wallpaper Bundle ( Digital Download )', 25, 25, '25', '25', 1, '2026-02-18 13:04:22', '2026-02-18 13:04:22'),
(17, 14, 40, 'Educational Animal Learning PDF for Kids [ Digital Download ]', 9, 9, '9', '9', 1, '2026-02-20 10:43:36', '2026-02-20 10:43:36'),
(18, 15, 40, 'Educational Animal Learning PDF for Kids [ Digital Download ]', 9, 9, '9', '9', 1, '2026-02-23 07:17:28', '2026-02-23 07:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `our_teams`
--

CREATE TABLE `our_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` text NOT NULL,
  `designation` varchar(255) NOT NULL,
  `sort_description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `dribbble` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `our_teams`
--

INSERT INTO `our_teams` (`id`, `name`, `slug`, `designation`, `sort_description`, `image`, `email`, `phone`, `facebook`, `twitter`, `dribbble`, `instagram`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Daniyel Karlos', 'daniyel-karlos', 'Web Developer', 'BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia’s brand identity, website, and other collaterals. \\\\For almost 50 years Leighton Asia, one of the region’s largest most respected construction companies been progressively', 'uploads/custom-images/team-1-1.webp', 'daugherty.angel@yahoo.com', '+1 (520) 356-1253', 'https://www.facebook.com/', 'https://twitter.com/', 'https://dribbble.com/', 'https://www.instagram.com/', 'active', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 'Ashikur Rahman', 'ashikur-rahman', 'Graphic Designer', 'BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia’s brand identity, website, and other collaterals. \\\\For almost 50 years Leighton Asia, one of the region’s largest most respected construction companies been progressively', 'uploads/custom-images/team-1-2.webp', 'weimann.ludie@hotmail.com', '812-443-3031', 'https://www.facebook.com/', 'https://twitter.com/', 'https://dribbble.com/', 'https://www.instagram.com/', 'active', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 'Albert Flores', 'albert-flores', 'Web Designer', 'BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia’s brand identity, website, and other collaterals. \\\\For almost 50 years Leighton Asia, one of the region’s largest most respected construction companies been progressively', 'uploads/custom-images/team-1-3.webp', 'francisca.lockman@hotmail.com', '1-785-516-0351', 'https://www.facebook.com/', 'https://twitter.com/', 'https://dribbble.com/', 'https://www.instagram.com/', 'active', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 'Arnoldo Flint', 'arnoldo-flint', 'IT expert', 'BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia’s brand identity, website, and other collaterals. \\\\For almost 50 years Leighton Asia, one of the region’s largest most respected construction companies been progressively', 'uploads/custom-images/team-1-4.webp', 'price.macejkovic@beier.org', '856-324-0604', 'https://www.facebook.com/', 'https://twitter.com/', 'https://dribbble.com/', 'https://www.instagram.com/', 'active', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_orders`
--

CREATE TABLE `payment_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cashfree_order_id` varchar(64) NOT NULL,
  `cashfree_payment_session_id` varchar(128) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'INR',
  `customer_name` varchar(191) NOT NULL,
  `customer_email` varchar(191) NOT NULL,
  `customer_phone` varchar(32) NOT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `status` enum('PENDING','PAID','FAILED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `cf_order_status` varchar(32) DEFAULT NULL,
  `cf_payment_id` varchar(128) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_orders`
--

INSERT INTO `payment_orders` (`id`, `user_id`, `cashfree_order_id`, `cashfree_payment_session_id`, `amount`, `currency`, `customer_name`, `customer_email`, `customer_phone`, `address_line1`, `address_line2`, `city`, `state`, `pincode`, `country`, `status`, `cf_order_status`, `cf_payment_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ORD_1765977409', 'session_P6o-zeZkvtrKxtjiWcfQqHJWAuRYyEAB_DBZYfS5WbThZ2F0XcIT1Nhsvm3zOxOrk8dwB9oQE-8dGEdDGv_unA737yZ119HntPzzmeV9x0MLcc52tl1XzHbA', 9.00, 'INR', 'Rishabh', 'rbh.sharmaa@gmail.com', '7988370920', NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING', 'ACTIVE', NULL, '2025-12-17 13:16:50', '2025-12-17 13:16:50'),
(2, NULL, 'ORD_1766034246', 'session_15Q7EGPN_Tm5TcI34pve3qHSgkYVqh9XZv9l5llMEk1px-7EnLYzi69vPjPQhCUZKO0LHWp5PK0Nk3jHovDHVcy4O2eSXHr3ZHBqxj-cQ_pVLvtr-XOoPNR8', 9.00, 'INR', 'Rishabh', 'rbh.sharmaa@gmail.com', '7988370920', NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING', 'ACTIVE', NULL, '2025-12-18 05:04:06', '2025-12-18 05:04:06'),
(3, NULL, 'ORD_1766036436', 'session_VF4zvvCfcITETDxdWFrpsqlbCD24BewQa2VZ4-1aJLJUzXJmD-TgS_1-dSm-OUz8t9w3nTAnMoMyLTUQT1F8urI0phhy1lgY2IMbpHQ69AlH2o9gjXo_5xv9', 528.00, 'INR', 'Rishabh', 'rbh.sharmaa@gmail.com', '7988370920', NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING', 'ACTIVE', NULL, '2025-12-18 05:40:37', '2025-12-18 05:40:37'),
(4, NULL, 'ORD_1766142307', 'session_IYScx91D2dc_YV0FqBLIS0MtL5fPSsAlDZAU5NE-pvai4y5HBUufGkULLQshQ5M1KBufSTJelEU6WbHLmc-fFrw0zRpNFdTfj_QuzNU6scwTHvX1Fjq4GU5M', 25.00, 'INR', 'vaibhav satasiya', 'balu.patel2@gmail.com', '7405188056', NULL, NULL, NULL, NULL, NULL, NULL, 'FAILED', 'ACTIVE', NULL, '2025-12-19 11:05:07', '2025-12-19 11:06:05'),
(5, 3, 'ORD_1768293296', 'session_wFi7faEwsO_BMGizgLOpTEJRhQUPT9cOMo8ZF3AUS9JTRGYtchcGOjVdvss_XqmoPc8gZ0XwKnHhBjwpI7thtZSdhFHS1EY78B9o7dObGkkOJGrn3GsIVShi', 25.00, 'INR', 'Rishabh', 'rishabh@gmail.com', '7988370920', NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING', 'ACTIVE', NULL, '2026-01-13 08:34:57', '2026-01-13 08:34:57'),
(6, 4, 'ORD_1768303490', 'session_P1_GFhOVnZsmuj3cj3EvyAX1-bUKS97NvZ1oXHO1czw4dJ8LE5XOYv94QQqC8rez5SH2MN_BdXcp_I7C6SIbZ6QvGYYRz49baZ8s_3TPF521_b8A_X8dvIcW', 50.00, 'INR', 'rishi kashyap', 'rishikashyapp.10@gmail.com', '8375996566', NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING', 'ACTIVE', NULL, '2026-01-13 11:24:50', '2026-01-13 11:24:50'),
(7, 4, 'ORD_1768303518', 'session_bpcvjKescXexlGOHce8IbeJNGy3oOfmDEFBb6jte0dI9n7HfwEZN_L4XPaBdxZt3zXhiaGc7R2lO139mvPhMCoXdQRbjfYc8wO7BnczsSQ9tJbUm4A-ygtO8', 9.00, 'INR', 'rishi kashyap', 'rishikashyapp.10@gmail.com', '08375996566', NULL, NULL, NULL, NULL, NULL, NULL, 'PENDING', 'ACTIVE', NULL, '2026-01-13 11:25:18', '2026-01-13 11:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'admin', 'dashboard', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(2, 'admin.profile.view', 'admin', 'admin profile', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(3, 'admin.profile.update', 'admin', 'admin profile', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(4, 'brand.management', 'admin', 'brand management', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(5, 'team.management', 'admin', 'our team', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(6, 'award.view', 'admin', 'marquee', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(7, 'award.management', 'admin', 'marquee', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(8, 'country.view', 'admin', 'country', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(9, 'country.management', 'admin', 'country', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(10, 'marquee.view', 'admin', 'marquee', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(11, 'marquee.management', 'admin', 'marquee', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(12, 'service.view', 'admin', 'service', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(13, 'service.management', 'admin', 'service', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(14, 'project.view', 'admin', 'project', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(15, 'project.management', 'admin', 'project', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(16, 'coupon.management', 'admin', 'coupon management', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(17, 'order.management', 'admin', 'order management', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(18, 'shipping.method.view', 'admin', 'shipping method', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(19, 'shipping.method.management', 'admin', 'shipping method', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(20, 'refund.management', 'admin', 'refund management', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(21, 'product.category.management', 'admin', 'shop', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(22, 'product.management', 'admin', 'shop', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(23, 'product.review.management', 'admin', 'shop', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(24, 'admin.view', 'admin', 'admin', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(25, 'admin.create', 'admin', 'admin', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(26, 'admin.store', 'admin', 'admin', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(27, 'admin.edit', 'admin', 'admin', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(28, 'admin.update', 'admin', 'admin', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(29, 'admin.delete', 'admin', 'admin', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(30, 'blog.category.view', 'admin', 'blog category', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(31, 'blog.category.create', 'admin', 'blog category', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(32, 'blog.category.translate', 'admin', 'blog category', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(33, 'blog.category.store', 'admin', 'blog category', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(34, 'blog.category.edit', 'admin', 'blog category', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(35, 'blog.category.update', 'admin', 'blog category', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(36, 'blog.category.delete', 'admin', 'blog category', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(37, 'blog.view', 'admin', 'blog', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(38, 'blog.create', 'admin', 'blog', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(39, 'blog.translate', 'admin', 'blog', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(40, 'blog.store', 'admin', 'blog', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(41, 'blog.edit', 'admin', 'blog', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(42, 'blog.update', 'admin', 'blog', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(43, 'blog.delete', 'admin', 'blog', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(44, 'blog.comment.view', 'admin', 'blog comment', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(45, 'blog.comment.update', 'admin', 'blog comment', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(46, 'blog.comment.replay', 'admin', 'blog comment', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(47, 'blog.comment.delete', 'admin', 'blog comment', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(48, 'role.view', 'admin', 'role', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(49, 'role.create', 'admin', 'role', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(50, 'role.store', 'admin', 'role', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(51, 'role.assign', 'admin', 'role', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(52, 'role.edit', 'admin', 'role', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(53, 'role.update', 'admin', 'role', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(54, 'role.delete', 'admin', 'role', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(55, 'setting.view', 'admin', 'setting', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(56, 'setting.update', 'admin', 'setting', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(57, 'footer.management', 'admin', 'footer management', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(58, 'appearance.management', 'admin', 'site appearance management', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(59, 'section.management', 'admin', 'section management', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(60, 'basic.payment.view', 'admin', 'basic payment', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(61, 'basic.payment.update', 'admin', 'basic payment', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(62, 'contact.message.view', 'admin', 'contact message', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(63, 'contact.message.delete', 'admin', 'contact message', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(64, 'currency.view', 'admin', 'currency', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(65, 'currency.create', 'admin', 'currency', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(66, 'currency.store', 'admin', 'currency', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(67, 'currency.edit', 'admin', 'currency', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(68, 'currency.update', 'admin', 'currency', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(69, 'currency.delete', 'admin', 'currency', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(70, 'customer.view', 'admin', 'customer', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(71, 'customer.bulk.mail', 'admin', 'customer', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(72, 'customer.update', 'admin', 'customer', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(73, 'customer.delete', 'admin', 'customer', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(74, 'language.view', 'admin', 'language', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(75, 'language.create', 'admin', 'language', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(76, 'language.store', 'admin', 'language', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(77, 'language.edit', 'admin', 'language', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(78, 'language.update', 'admin', 'language', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(79, 'language.delete', 'admin', 'language', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(80, 'language.translate', 'admin', 'language', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(81, 'language.single.translate', 'admin', 'language', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(82, 'menu.view', 'admin', 'menu builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(83, 'menu.create', 'admin', 'menu builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(84, 'menu.update', 'admin', 'menu builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(85, 'menu.delete', 'admin', 'menu builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(86, 'page.view', 'admin', 'page builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(87, 'page.create', 'admin', 'page builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(88, 'page.store', 'admin', 'page builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(89, 'page.edit', 'admin', 'page builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(90, 'page.update', 'admin', 'page builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(91, 'page.delete', 'admin', 'page builder', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(92, 'pricing.view', 'admin', 'pricing', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(93, 'pricing.management', 'admin', 'pricing', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(94, 'social.link.management', 'admin', 'social link management', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(95, 'sitemap.management', 'admin', 'sitemap management', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(96, 'newsletter.view', 'admin', 'newsletter', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(97, 'newsletter.mail', 'admin', 'newsletter', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(98, 'newsletter.delete', 'admin', 'newsletter', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(99, 'testimonial.view', 'admin', 'testimonial', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(100, 'testimonial.create', 'admin', 'testimonial', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(101, 'testimonial.translate', 'admin', 'testimonial', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(102, 'testimonial.store', 'admin', 'testimonial', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(103, 'testimonial.edit', 'admin', 'testimonial', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(104, 'testimonial.update', 'admin', 'testimonial', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(105, 'testimonial.delete', 'admin', 'testimonial', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(106, 'faq.view', 'admin', 'faq', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(107, 'faq.create', 'admin', 'faq', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(108, 'faq.translate', 'admin', 'faq', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(109, 'faq.store', 'admin', 'faq', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(110, 'faq.edit', 'admin', 'faq', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(111, 'faq.update', 'admin', 'faq', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(112, 'faq.delete', 'admin', 'faq', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(113, 'addon.view', 'admin', 'Addons', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(114, 'addon.install', 'admin', 'Addons', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(115, 'addon.update', 'admin', 'Addons', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(116, 'addon.status.change', 'admin', 'Addons', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(117, 'addon.remove', 'admin', 'Addons', '2025-05-04 09:05:04', '2025-05-04 09:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `product_category_id` bigint(20) UNSIGNED NOT NULL,
  `fabworld_id` int(11) DEFAULT NULL,
  `character_id` int(11) DEFAULT NULL,
  `slug` text NOT NULL,
  `type` enum('physical','digital') NOT NULL DEFAULT 'physical',
  `file_path` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `qty` varchar(255) DEFAULT '10',
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `is_new` tinyint(1) NOT NULL DEFAULT 0,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `tags` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `admin_id`, `product_category_id`, `fabworld_id`, `character_id`, `slug`, `type`, `file_path`, `sku`, `qty`, `price`, `sale_price`, `image`, `views`, `is_new`, `is_popular`, `tags`, `status`, `created_at`, `updated_at`) VALUES
(15, 1, 6, NULL, NULL, 'aabcserv', 'digital', 'public/products/script.zip', 'TY6HMRHT', '14', 29.00, 19.00, 'uploads/website-images/product/digital_product_1.png', 29535, 1, 0, '[{\"value\":\"qui\"},{\"value\":\"totam\"},{\"value\":\"accusamus\"}]', 0, '2025-04-25 19:45:03', '2025-10-24 17:03:05'),
(16, 1, 6, NULL, NULL, 'findestate', 'digital', 'public/products/script.zip', 'TH4ZYKBD', '9', 59.00, 49.00, 'uploads/website-images/product/digital_product_3.png', 84096, 0, 0, '[{\"value\":\"rerum\"},{\"value\":\"ad\"},{\"value\":\"enim\"}]', 0, '2024-09-09 16:30:22', '2025-09-04 10:47:30'),
(28, 1, 8, NULL, NULL, 'alphabet-coloring-sheets-with-tracing-letters-digital-download', 'digital', NULL, 'FAB01', '10', 49.00, 10.00, 'uploads/custom-images/wsus-img-2025-09-06-02-04-34-6969.webp', 0, 1, 0, '[]', 1, '2025-09-06 14:04:34', '2025-10-30 12:01:29'),
(33, 1, 8, NULL, 25, 'number-tracing-sheets-09-digital-download', 'digital', NULL, 'FAB02', '10', 49.00, 9.00, 'uploads/custom-images/wsus-img-2025-10-29-05-13-47-7682.webp', 0, 1, 0, '[]', 1, '2025-10-29 05:13:47', '2025-10-30 12:01:42'),
(34, 1, 8, NULL, 26, 'alphabet-tracing-sheets-bundle-digital-download', 'digital', NULL, 'FAB03', '10', 499.00, 49.00, 'uploads/custom-images/wsus-img-2025-10-29-05-33-54-1242.webp', 0, 0, 1, '[]', 1, '2025-10-29 05:33:54', '2025-10-30 12:01:55'),
(35, 1, 8, 13, 25, 'fablepals-14-flashcards-mega-bundle-digital-download', 'digital', 'public/products/4_Flashcards_Bundle_pZbA7fmqDX.zip', 'FAB04', '10', 999.00, 99.00, 'uploads/custom-images/wsus-img-2025-10-30-11-55-08-2035.webp', 0, 0, 1, '[]', 1, '2025-10-30 11:55:08', '2025-11-05 11:53:59'),
(36, 1, 9, NULL, 25, 'tiggo-and-the-missing-mangoes-storybook-digital-download', 'digital', NULL, 'FAB05', '10', 49.00, 9.00, 'uploads/custom-images/wsus-img-2025-11-01-10-18-34-3177.webp', 0, 1, 0, NULL, 1, '2025-11-01 10:18:34', '2025-11-01 10:19:01'),
(37, 1, 9, NULL, 26, 'lunas-big-breaking-news-storybook-digital-download', 'digital', 'public/products/sample_xeYLDGXGoB.zip', 'FAB06', '10', 49.00, 9.00, 'uploads/custom-images/wsus-img-2025-11-03-04-04-49-5714.webp', 0, 1, 0, NULL, 1, '2025-11-03 16:04:49', '2025-11-05 07:40:00'),
(38, 1, 10, 3, 25, 'tiggo-4k-desktop-wallpaper-bundle-digital-download-', 'digital', NULL, 'FAB07', '10', 249.00, 25.00, 'uploads/custom-images/wsus-img-2025-11-05-11-24-52-1421.webp', 0, 0, 1, NULL, 1, '2025-11-05 11:24:52', '2025-11-05 11:25:00'),
(39, 1, 6, 3, 25, 'tiggo-mobile-wallpaper-bundle-digital-download-', 'digital', 'public/products/Tiggo_Mobile_Wallpaper_Bundle_dzJPrLZLqY.zip', 'FAB08', '10', 300.00, 30.00, 'uploads/custom-images/wsus-img-2026-01-26-05-44-12-5268.png', 0, 0, 1, NULL, 1, '2026-01-26 05:44:12', '2026-01-26 05:48:49'),
(40, 1, 15, NULL, NULL, 'educational-animal-learning-pdf-for-kids-digital-download-', 'digital', 'public/products/Animals_Learning_for_Kids_KDbQIa1LLE.zip', 'FAB09', '10', 49.00, 9.00, 'uploads/custom-images/wsus-img-2026-02-19-11-04-11-3858.png', 0, 1, 0, NULL, 1, '2026-02-19 11:04:11', '2026-02-19 11:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `parent_id` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `slug`, `position`, `parent_id`, `status`, `created_at`, `updated_at`) VALUES
(6, 'script', 27, NULL, 1, '2025-05-04 09:05:05', '2025-10-25 09:54:46'),
(8, 'kids-worksheets', 0, NULL, 1, '2025-09-05 07:08:13', '2025-09-05 07:08:13'),
(9, 'wallpapers', 0, NULL, 1, '2025-10-08 07:41:07', '2025-10-08 07:41:07'),
(10, 'laptop-wallpapers', 0, NULL, 1, '2025-10-25 09:54:58', '2025-10-25 09:54:58'),
(11, 'creative-products', 0, NULL, 1, '2025-10-25 09:58:05', '2025-10-25 09:58:05'),
(12, 'printables', 0, NULL, 1, '2025-10-25 09:58:43', '2025-10-25 09:58:43'),
(13, 't-shirt-print-designs', 0, NULL, 1, '2025-10-25 09:59:26', '2025-10-25 09:59:26'),
(14, 'interactive-digital-games', 0, NULL, 1, '2025-10-25 10:00:08', '2025-10-25 10:00:08'),
(15, 'educational-learning-pdfs', 0, NULL, 1, '2026-02-19 10:48:48', '2026-02-19 10:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_category_translations`
--

CREATE TABLE `product_category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_category_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_category_translations`
--

INSERT INTO `product_category_translations` (`id`, `product_category_id`, `lang_code`, `title`, `created_at`, `updated_at`) VALUES
(16, 6, 'en', 'Mobile Wallpapers', '2025-05-04 09:05:05', '2025-10-25 09:54:39'),
(17, 6, 'hi', 'लिखी हुई कहानी', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(21, 8, 'en', 'Kids Worksheets', '2025-09-05 07:08:13', '2025-09-05 07:08:13'),
(22, 8, 'hi', 'Kids Worksheets', '2025-09-05 07:08:13', '2025-09-05 07:08:13'),
(23, 9, 'en', 'Storybooks', '2025-10-08 07:41:07', '2025-10-08 07:41:27'),
(24, 9, 'hi', 'Wallpapers', '2025-10-08 07:41:07', '2025-10-08 07:41:07'),
(25, 10, 'en', 'Desktop Wallpapers', '2025-10-25 09:54:58', '2025-10-25 09:58:18'),
(26, 10, 'hi', 'Laptop Wallpapers', '2025-10-25 09:54:58', '2025-10-25 09:54:58'),
(27, 11, 'en', 'Creative Products', '2025-10-25 09:58:05', '2025-10-25 09:58:05'),
(28, 11, 'hi', 'Creative Products', '2025-10-25 09:58:05', '2025-10-25 09:58:05'),
(29, 12, 'en', 'Printables', '2025-10-25 09:58:43', '2025-10-25 09:58:43'),
(30, 12, 'hi', 'Printables', '2025-10-25 09:58:43', '2025-10-25 09:58:43'),
(31, 13, 'en', 'T shirt Print Designs', '2025-10-25 09:59:26', '2025-10-25 09:59:26'),
(32, 13, 'hi', 'T shirt Print Designs', '2025-10-25 09:59:26', '2025-10-25 09:59:26'),
(33, 14, 'en', 'Interactive Digital Games', '2025-10-25 10:00:08', '2025-10-25 10:00:08'),
(34, 14, 'hi', 'Interactive Digital Games', '2025-10-25 10:00:08', '2025-10-25 10:00:08'),
(35, 15, 'en', 'Educational Learning PDFs', '2026-02-19 10:48:48', '2026-02-19 10:48:48'),
(36, 15, 'hi', 'Educational Learning PDFs', '2026-02-19 10:48:48', '2026-02-19 10:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_files`
--

CREATE TABLE `product_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_files`
--

INSERT INTO `product_files` (`id`, `product_id`, `file_path`, `file_type`, `created_at`, `updated_at`) VALUES
(1, 30, 'uploads/product-files/1756103705_68ac04192c063.webp', 'image', '2025-08-25 01:05:05', '2025-08-25 01:05:05'),
(2, 30, 'uploads/product-files/1756103705_68ac0419341cf.webp', 'image', '2025-08-25 01:05:05', '2025-08-25 01:05:05'),
(4, 30, 'uploads/product-files/1756104759_68ac083727b96.webp', 'image', '2025-08-25 01:22:39', '2025-08-25 01:22:39'),
(5, 30, 'uploads/product-files/1756107525_68ac1305d5b02.pdf', 'pdf', '2025-08-25 02:08:45', '2025-08-25 02:08:45'),
(9, 25, 'uploads/product-files/1756109939_68ac1c73887ad.jpeg', 'image', '2025-08-25 08:18:59', '2025-08-25 08:18:59'),
(10, 25, 'uploads/product-files/1756110020_68ac1cc479d60.pdf', 'pdf', '2025-08-25 08:20:20', '2025-08-25 08:20:20'),
(11, 25, 'uploads/product-files/1756120264_68ac44c8a8880.png', 'image', '2025-08-25 11:11:04', '2025-08-25 11:11:04'),
(12, 25, 'uploads/product-files/1756120290_68ac44e23e3bc.png', 'image', '2025-08-25 11:11:30', '2025-08-25 11:11:30'),
(14, 28, 'uploads/product-files/1757167474_68bc3f722fcab.pdf', 'pdf', '2025-09-06 14:04:34', '2025-09-06 14:04:34'),
(15, 31, 'uploads/product-files/1761632850_69006252a5eea.jpg', 'image', '2025-10-28 06:27:30', '2025-10-28 06:27:30'),
(16, 32, 'uploads/product-files/1761633075_69006333a8032.webp', 'image', '2025-10-28 06:31:15', '2025-10-28 06:31:15'),
(17, 33, 'uploads/product-files/1761714827_6901a28b183f4.pdf', 'pdf', '2025-10-29 05:13:47', '2025-10-29 05:13:47'),
(18, 34, 'uploads/product-files/1761716034_6901a742ade6b.pdf', 'pdf', '2025-10-29 05:33:54', '2025-10-29 05:33:54'),
(19, 34, 'uploads/product-files/1761716034_6901a742b1031.pdf', 'pdf', '2025-10-29 05:33:54', '2025-10-29 05:33:54'),
(20, 34, 'uploads/product-files/1761716034_6901a742b42cc.pdf', 'pdf', '2025-10-29 05:33:54', '2025-10-29 05:33:54'),
(21, 34, 'uploads/product-files/1761716034_6901a742b7ff8.pdf', 'pdf', '2025-10-29 05:33:54', '2025-10-29 05:33:54'),
(22, 35, 'uploads/product-files/1761825308_6903521c92604.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(23, 35, 'uploads/product-files/1761825308_6903521c94a5c.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(24, 35, 'uploads/product-files/1761825308_6903521c99745.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(25, 35, 'uploads/product-files/1761825308_6903521c9cac6.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(26, 35, 'uploads/product-files/1761825308_6903521c9f6fd.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(27, 35, 'uploads/product-files/1761825308_6903521ca1ac0.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(28, 35, 'uploads/product-files/1761825308_6903521ca4532.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(29, 35, 'uploads/product-files/1761825308_6903521ca6dfa.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(30, 35, 'uploads/product-files/1761825308_6903521ca9673.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(31, 35, 'uploads/product-files/1761825308_6903521cabf22.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(32, 35, 'uploads/product-files/1761825308_6903521cafba0.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(33, 35, 'uploads/product-files/1761825308_6903521cb29a2.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(34, 35, 'uploads/product-files/1761825308_6903521cb4603.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(35, 35, 'uploads/product-files/1761825308_6903521cb72c2.pdf', 'pdf', '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(36, 36, 'uploads/product-files/1761992314_6905de7ad784a.pdf', 'pdf', '2025-11-01 10:18:34', '2025-11-01 10:18:34'),
(37, 37, 'uploads/product-files/1762185889_6908d2a142e1e.pdf', 'pdf', '2025-11-03 16:04:49', '2025-11-03 16:04:49'),
(38, 38, 'uploads/product-files/1762341993_690b3469d06f5.png', 'image', '2025-11-05 11:26:33', '2025-11-05 11:26:33'),
(52, 38, 'uploads/product-files/1762342635_690b36ebe9624.png', 'image', '2025-11-05 11:37:15', '2025-11-05 11:37:15'),
(53, 38, 'uploads/product-files/1762342635_690b36ebecc25.png', 'image', '2025-11-05 11:37:15', '2025-11-05 11:37:15'),
(54, 38, 'uploads/product-files/1762342695_690b3727480e0.png', 'image', '2025-11-05 11:38:15', '2025-11-05 11:38:15'),
(55, 38, 'uploads/product-files/1762342695_690b37274a9f1.png', 'image', '2025-11-05 11:38:15', '2025-11-05 11:38:15'),
(56, 38, 'uploads/product-files/1762342695_690b37274da7c.png', 'image', '2025-11-05 11:38:15', '2025-11-05 11:38:15'),
(57, 38, 'uploads/product-files/1762342703_690b372f58619.png', 'image', '2025-11-05 11:38:23', '2025-11-05 11:38:23'),
(58, 38, 'uploads/product-files/1762342703_690b372f5c6fe.png', 'image', '2025-11-05 11:38:23', '2025-11-05 11:38:23'),
(59, 38, 'uploads/product-files/1762342736_690b375023605.png', 'image', '2025-11-05 11:38:56', '2025-11-05 11:38:56'),
(60, 39, 'uploads/product-files/1769406253_6976ff2d01056.png', 'image', '2026-01-26 05:44:13', '2026-01-26 05:44:13'),
(61, 39, 'uploads/product-files/1769406253_6976ff2d04048.png', 'image', '2026-01-26 05:44:13', '2026-01-26 05:44:13'),
(62, 39, 'uploads/product-files/1769406253_6976ff2d06c15.png', 'image', '2026-01-26 05:44:13', '2026-01-26 05:44:13'),
(63, 39, 'uploads/product-files/1769406306_6976ff62418ca.png', 'image', '2026-01-26 05:45:06', '2026-01-26 05:45:06'),
(64, 39, 'uploads/product-files/1769406306_6976ff62439f5.png', 'image', '2026-01-26 05:45:06', '2026-01-26 05:45:06'),
(65, 39, 'uploads/product-files/1769406306_6976ff62462fa.png', 'image', '2026-01-26 05:45:06', '2026-01-26 05:45:06'),
(66, 39, 'uploads/product-files/1769406338_6976ff8258345.png', 'image', '2026-01-26 05:45:38', '2026-01-26 05:45:38'),
(67, 39, 'uploads/product-files/1769406338_6976ff825b911.png', 'image', '2026-01-26 05:45:38', '2026-01-26 05:45:38'),
(68, 39, 'uploads/product-files/1769406338_6976ff825df07.png', 'image', '2026-01-26 05:45:38', '2026-01-26 05:45:38'),
(69, 39, 'uploads/product-files/1769406338_6976ff8260728.png', 'image', '2026-01-26 05:45:38', '2026-01-26 05:45:38'),
(70, 40, 'uploads/product-files/Animals_Learning_for_Kids_Fablepals.pdf', 'pdf', '2026-02-19 11:04:11', '2026-02-19 11:04:11');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `preview` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `preview`, `image`, `created_at`, `updated_at`) VALUES
(59, 15, 'uploads/website-images/product/digital_product_1.png', 'uploads/website-images/product/digital_product_1.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(60, 15, 'uploads/website-images/product/digital_product_2.png', 'uploads/website-images/product/digital_product_2.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(61, 15, 'uploads/website-images/product/digital_product_3.png', 'uploads/website-images/product/digital_product_3.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(62, 15, 'uploads/website-images/product/digital_product_4.png', 'uploads/website-images/product/digital_product_4.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(63, 15, 'uploads/website-images/product/digital_product_5.png', 'uploads/website-images/product/digital_product_5.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(64, 15, 'uploads/website-images/product/digital_product_2.png', 'uploads/website-images/product/digital_product_2.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(65, 16, 'uploads/website-images/product/digital_product_3.png', 'uploads/website-images/product/digital_product_3.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(66, 16, 'uploads/website-images/product/digital_product_1.png', 'uploads/website-images/product/digital_product_1.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(67, 16, 'uploads/website-images/product/digital_product_4.png', 'uploads/website-images/product/digital_product_4.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(68, 16, 'uploads/website-images/product/digital_product_1.png', 'uploads/website-images/product/digital_product_1.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(69, 16, 'uploads/website-images/product/digital_product_2.png', 'uploads/website-images/product/digital_product_2.png', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(108, 28, 'uploads/custom-images/wsus-img-2025-09-06-02-05-04-3256.webp', 'uploads/custom-images/wsus-img-2025-09-06-02-05-04-3256.webp', '2025-09-06 14:05:04', '2025-09-06 14:05:04'),
(109, 28, 'uploads/custom-images/wsus-img-2025-09-06-02-05-04-3584.webp', 'uploads/custom-images/wsus-img-2025-09-06-02-05-04-3584.webp', '2025-09-06 14:05:04', '2025-09-06 14:05:04'),
(110, 28, 'uploads/custom-images/wsus-img-2025-09-06-02-05-04-3627.webp', 'uploads/custom-images/wsus-img-2025-09-06-02-05-04-3627.webp', '2025-09-06 14:05:04', '2025-09-06 14:05:04'),
(111, 28, 'uploads/custom-images/wsus-img-2025-09-06-02-17-43-2342.webp', 'uploads/custom-images/wsus-img-2025-09-06-02-17-43-2342.webp', '2025-09-06 14:17:43', '2025-09-06 14:17:43'),
(112, 33, 'uploads/custom-images/wsus-img-2025-10-29-05-14-01-3882.webp', 'uploads/custom-images/wsus-img-2025-10-29-05-14-01-3882.webp', '2025-10-29 05:14:01', '2025-10-29 05:14:01'),
(113, 33, 'uploads/custom-images/wsus-img-2025-10-29-05-14-01-8717.webp', 'uploads/custom-images/wsus-img-2025-10-29-05-14-01-8717.webp', '2025-10-29 05:14:01', '2025-10-29 05:14:01'),
(114, 33, 'uploads/custom-images/wsus-img-2025-10-29-05-14-01-3066.webp', 'uploads/custom-images/wsus-img-2025-10-29-05-14-01-3066.webp', '2025-10-29 05:14:01', '2025-10-29 05:14:01'),
(115, 34, 'uploads/custom-images/wsus-img-2025-10-29-05-34-09-7471.webp', 'uploads/custom-images/wsus-img-2025-10-29-05-34-09-7471.webp', '2025-10-29 05:34:09', '2025-10-29 05:34:09'),
(116, 34, 'uploads/custom-images/wsus-img-2025-10-29-05-34-18-5453.webp', 'uploads/custom-images/wsus-img-2025-10-29-05-34-18-5453.webp', '2025-10-29 05:34:18', '2025-10-29 05:34:18'),
(117, 34, 'uploads/custom-images/wsus-img-2025-10-29-05-34-18-8094.webp', 'uploads/custom-images/wsus-img-2025-10-29-05-34-18-8094.webp', '2025-10-29 05:34:18', '2025-10-29 05:34:18'),
(118, 34, 'uploads/custom-images/wsus-img-2025-10-29-05-34-18-2071.webp', 'uploads/custom-images/wsus-img-2025-10-29-05-34-18-2071.webp', '2025-10-29 05:34:18', '2025-10-29 05:34:18'),
(119, 34, 'uploads/custom-images/wsus-img-2025-10-29-05-34-18-3021.webp', 'uploads/custom-images/wsus-img-2025-10-29-05-34-18-3021.webp', '2025-10-29 05:34:18', '2025-10-29 05:34:18'),
(120, 35, 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-5074.webp', 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-5074.webp', '2025-10-30 11:57:42', '2025-10-30 11:57:42'),
(121, 35, 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-2881.webp', 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-2881.webp', '2025-10-30 11:57:42', '2025-10-30 11:57:42'),
(122, 35, 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-6381.webp', 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-6381.webp', '2025-10-30 11:57:42', '2025-10-30 11:57:42'),
(123, 35, 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-6632.webp', 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-6632.webp', '2025-10-30 11:57:42', '2025-10-30 11:57:42'),
(124, 35, 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-7783.webp', 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-7783.webp', '2025-10-30 11:57:42', '2025-10-30 11:57:42'),
(125, 35, 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-4177.webp', 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-4177.webp', '2025-10-30 11:57:42', '2025-10-30 11:57:42'),
(126, 35, 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-3259.webp', 'uploads/custom-images/wsus-img-2025-10-30-11-57-42-3259.webp', '2025-10-30 11:57:42', '2025-10-30 11:57:42'),
(127, 36, 'uploads/custom-images/wsus-img-2025-11-01-10-18-46-8609.webp', 'uploads/custom-images/wsus-img-2025-11-01-10-18-46-8609.webp', '2025-11-01 10:18:46', '2025-11-01 10:18:46'),
(128, 36, 'uploads/custom-images/wsus-img-2025-11-01-10-18-46-8272.webp', 'uploads/custom-images/wsus-img-2025-11-01-10-18-46-8272.webp', '2025-11-01 10:18:46', '2025-11-01 10:18:46'),
(129, 36, 'uploads/custom-images/wsus-img-2025-11-01-10-18-46-8636.webp', 'uploads/custom-images/wsus-img-2025-11-01-10-18-46-8636.webp', '2025-11-01 10:18:46', '2025-11-01 10:18:46'),
(130, 37, 'uploads/custom-images/wsus-img-2025-11-03-04-04-58-7502.webp', 'uploads/custom-images/wsus-img-2025-11-03-04-04-58-7502.webp', '2025-11-03 16:04:58', '2025-11-03 16:04:58'),
(131, 37, 'uploads/custom-images/wsus-img-2025-11-03-04-04-58-3555.webp', 'uploads/custom-images/wsus-img-2025-11-03-04-04-58-3555.webp', '2025-11-03 16:04:58', '2025-11-03 16:04:58'),
(132, 38, 'uploads/custom-images/wsus-img-2025-11-05-11-28-50-8117.webp', 'uploads/custom-images/wsus-img-2025-11-05-11-28-50-8117.webp', '2025-11-05 11:28:50', '2025-11-05 11:28:50'),
(133, 38, 'uploads/custom-images/wsus-img-2025-11-05-11-28-50-3408.webp', 'uploads/custom-images/wsus-img-2025-11-05-11-28-50-3408.webp', '2025-11-05 11:28:50', '2025-11-05 11:28:50'),
(134, 39, 'uploads/custom-images/wsus-img-2026-01-26-05-44-38-3927.webp', 'uploads/custom-images/wsus-img-2026-01-26-05-44-38-3927.webp', '2026-01-26 05:44:38', '2026-01-26 05:44:38'),
(135, 39, 'uploads/custom-images/wsus-img-2026-01-26-05-44-38-3339.webp', 'uploads/custom-images/wsus-img-2026-01-26-05-44-38-3339.webp', '2026-01-26 05:44:38', '2026-01-26 05:44:38'),
(136, 39, 'uploads/custom-images/wsus-img-2026-01-26-05-44-38-8636.webp', 'uploads/custom-images/wsus-img-2026-01-26-05-44-38-8636.webp', '2026-01-26 05:44:38', '2026-01-26 05:44:38'),
(147, 40, 'uploads/custom-images/wsus-img-2026-02-19-11-11-18-9665.png', 'uploads/custom-images/wsus-img-2026-02-19-11-11-18-9665.png', '2026-02-19 11:11:18', '2026-02-19 11:11:18'),
(148, 40, 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-8480.png', 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-8480.png', '2026-02-19 11:11:37', '2026-02-19 11:11:37'),
(149, 40, 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-7984.png', 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-7984.png', '2026-02-19 11:11:37', '2026-02-19 11:11:37'),
(150, 40, 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-2736.png', 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-2736.png', '2026-02-19 11:11:37', '2026-02-19 11:11:37'),
(151, 40, 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-3791.png', 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-3791.png', '2026-02-19 11:11:37', '2026-02-19 11:11:37'),
(152, 40, 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-6458.png', 'uploads/custom-images/wsus-img-2026-02-19-11-11-37-6458.png', '2026-02-19 11:11:37', '2026-02-19 11:11:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT 0,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `review` text NOT NULL,
  `rating` varchar(255) DEFAULT '0',
  `admin_id` bigint(20) UNSIGNED DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext NOT NULL,
  `additional_description` text DEFAULT NULL,
  `seo_title` text DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `lang_code`, `title`, `short_description`, `description`, `additional_description`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(43, 15, 'en', 'Aabcserv', 'Step into style and comfort with our Urban Sneakers. Designed for versatility, they effortlessly complement your casual and active lifestyles.', '<p>Aabcserv – Multivendor On-Demand Service & Handyman Marketplace Flutter User App is a comprehensive solution for selling and finding on-demand services. It boasts a well-crafted design and development that offers maximum features in the market. This platform is suitable for any business or service seller dealing with services such as AC repair, car repair, plumbing, home cleaning, cleaning services, or any other service available in the market based on demand.</p><p>Aabcserv – Multivendor On-Demand Service & Handyman Marketplace Flutter App is built using the latest Flutter technology, ensuring top-notch security with no possibility of SQL injection, XSS attacks, or CSRF attacks. Additionally, the platform offers an extensive range of features tailored to meet the unique requirements of users or sellers.</p>', '<table class=\'woocommerce-table\'>\n                    <tbody>\n                        <tr>\n                            <th>High resolution</th>\n                            <td>Cross browser</td>\n                        </tr>\n                        <tr>\n                            <th>Yes</th>\n                            <td>Yes</td>\n                        </tr>\n                    </tbody>\n                </table>', 'Aabcserv', 'Step into style and comfort with our Urban Sneakers. Designed for versatility, they effortlessly complement your casual and active lifestyles.', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(44, 15, 'hi', 'Aabcserv', 'हमारे अर्बन स्नीकर्स के साथ स्टाइल और आराम का अनुभव लें। बहुमुखी प्रतिभा के लिए डिज़ाइन किए गए, वे आसानी से आपकी कैज़ुअल और सक्रिय जीवनशैली को पूरा करते हैं।', '<p>Aabcserv – मल्टीवेंडर ऑन-डिमांड सर्विस और हैंडीमैन मार्केटप्लेस फ़्लटर यूजर ऐप ऑन-डिमांड सेवाओं को बेचने और खोजने के लिए एक व्यापक समाधान है। यह एक अच्छी तरह से तैयार की गई डिज़ाइन और विकास का दावा करता है जो बाजार में अधिकतम सुविधाएँ प्रदान करता है। यह प्लेटफ़ॉर्म किसी भी व्यवसाय या सेवा विक्रेता के लिए उपयुक्त है जो एसी मरम्मत, कार मरम्मत, प्लंबिंग, घर की सफाई, सफाई सेवाएँ, या मांग के आधार पर बाजार में उपलब्ध किसी भी अन्य सेवा से संबंधित है।</p><p>Aabcserv – मल्टीवेंडर ऑन-डिमांड सर्विस और हैंडीमैन मार्केटप्लेस फ़्लटर ऐप नवीनतम फ़्लटर तकनीक का उपयोग करके बनाया गया है, जो SQL इंजेक्शन, XSS हमलों या CSRF हमलों की कोई संभावना नहीं होने के साथ शीर्ष पायदान सुरक्षा सुनिश्चित करता है। इसके अतिरिक्त, प्लेटफ़ॉर्म उपयोगकर्ताओं या विक्रेताओं की अनूठी आवश्यकताओं को पूरा करने के लिए तैयार की गई सुविधाओं की एक विस्तृत श्रृंखला प्रदान करता है।</p>', '<table class=\'woocommerce-table\'>\n                    <tbody>\n                        <tr>\n                            <th>High resolution</th>\n                            <td>Cross browser</td>\n                        </tr>\n                        <tr>\n                            <th>Yes</th>\n                            <td>Yes</td>\n                        </tr>\n                    </tbody>\n                </table>', 'Aabcserv', 'हमारे अर्बन स्नीकर्स के साथ स्टाइल और आराम का अनुभव लें। बहुमुखी प्रतिभा के लिए डिज़ाइन किए गए, वे आसानी से आपकी कैज़ुअल और सक्रिय जीवनशैली को पूरा करते हैं।', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(46, 16, 'en', 'FindEstate', 'Step into style and comfort with our Urban Sneakers. Designed for versatility, they effortlessly complement your casual and active lifestyles.', '<p>FindEstate is a real estate management Laravel script. Here users or agents can publish their real estate listing based on some pricing plans and visitors can easily contact with the real estate agent to buy or sell properties.</p><p>This is mainly a listing website to build connection between buyers and sellers; and you will get the SaaS version completely free in regular license.</p>', '<table class=\'woocommerce-table\'>\n                    <tbody>\n                        <tr>\n                            <th>High resolution</th>\n                            <td>Cross browser</td>\n                        </tr>\n                        <tr>\n                            <th>Yes</th>\n                            <td>Yes</td>\n                        </tr>\n                    </tbody>\n                </table>', 'FindEstate', 'Step into style and comfort with our Urban Sneakers. Designed for versatility, they effortlessly complement your casual and active lifestyles.', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(47, 16, 'hi', 'FindEstate', 'हमारे अर्बन स्नीकर्स के साथ स्टाइल और आराम का अनुभव लें। बहुमुखी प्रतिभा के लिए डिज़ाइन किए गए, वे आसानी से आपकी कैज़ुअल और सक्रिय जीवनशैली को पूरा करते हैं।', '<p>FindEstate एक रियल एस्टेट मैनेजमेंट Laravel स्क्रिप्ट है। यहाँ उपयोगकर्ता या एजेंट कुछ मूल्य निर्धारण योजनाओं के आधार पर अपनी रियल एस्टेट लिस्टिंग प्रकाशित कर सकते हैं और आगंतुक आसानी से संपत्ति खरीदने या बेचने के लिए रियल एस्टेट एजेंट से संपर्क कर सकते हैं।</p><p>यह मुख्य रूप से खरीदारों और विक्रेताओं के बीच संबंध बनाने के लिए एक लिस्टिंग वेबसाइट है; और आपको SaaS संस्करण नियमित लाइसेंस में पूरी तरह से मुफ़्त मिलेगा।</p>', '<table class=\'woocommerce-table\'>\n                    <tbody>\n                        <tr>\n                            <th>High resolution</th>\n                            <td>Cross browser</td>\n                        </tr>\n                        <tr>\n                            <th>Yes</th>\n                            <td>Yes</td>\n                        </tr>\n                    </tbody>\n                </table>', 'FindEstate', 'हमारे अर्बन स्नीकर्स के साथ स्टाइल और आराम का अनुभव लें। बहुमुखी प्रतिभा के लिए डिज़ाइन किए गए, वे आसानी से आपकी कैज़ुअल और सक्रिय जीवनशैली को पूरा करते हैं।', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(80, 28, 'en', 'Alphabet Coloring Sheets with Tracing Letters (Digital Download)', 'Fun and educational alphabet worksheets! Kids can color, trace letters, and learn new words. Instant digital download – Buy, Download, Print & Enjoy!', '<p data-start=\"374\" data-end=\"629\">Make learning the alphabet an exciting adventure with <strong data-start=\"447\" data-end=\"485\">FablePals Alphabet Coloring Sheets</strong> 🌟. This digital pack includes <strong data-start=\"517\" data-end=\"535\">A&ndash;Z worksheets</strong>, each with a picture to color, traceable letters, and simple words to reinforce vocabulary.</p>\r\n<p data-start=\"631\" data-end=\"818\">Perfect for preschoolers and early learners, these sheets turn study time into playtime. Parents and teachers can easily print and use them for fun learning at home or in the classroom.</p>\r\n<p data-start=\"631\" data-end=\"818\">Lifetime Access to Download !</p>\r\n<p data-start=\"820\" data-end=\"838\">✨ What&rsquo;s Inside:</p>\r\n<ul data-start=\"839\" data-end=\"975\">\r\n<li data-start=\"839\" data-end=\"871\">\r\n<p data-start=\"841\" data-end=\"871\">26 alphabet worksheets (A&ndash;Z)</p>\r\n</li>\r\n<li data-start=\"872\" data-end=\"903\">\r\n<p data-start=\"874\" data-end=\"903\">Cute illustrations to color</p>\r\n</li>\r\n<li data-start=\"904\" data-end=\"934\">\r\n<p data-start=\"906\" data-end=\"934\">Easy letter-tracing guides</p>\r\n</li>\r\n<li data-start=\"935\" data-end=\"975\">\r\n<p data-start=\"937\" data-end=\"975\">Simple vocabulary words for practice</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"977\" data-end=\"1088\">🖨️ <strong data-start=\"981\" data-end=\"1006\">Digital Download Only</strong> &ndash; No physical product shipped.<br data-start=\"1037\" data-end=\"1040\">Just <strong data-start=\"1045\" data-end=\"1083\">Buy &ndash; Download &ndash; Print &ndash; Have fun!</strong> 🎨</p>\r\n<h3 data-start=\"1095\" data-end=\"1114\"><span style=\"font-size: 14pt;\">How to Use ?</span></h3>\r\n<p data-start=\"1115\" data-end=\"1330\">1️⃣ <strong data-start=\"1119\" data-end=\"1137\">Buy &amp; Download</strong> &ndash; Get your instant digital file right after purchase.<br data-start=\"1191\" data-end=\"1194\">2️⃣ <strong data-start=\"1198\" data-end=\"1215\">Print at Home</strong> &ndash; Use any home printer or print shop.<br data-start=\"1253\" data-end=\"1256\">3️⃣ <strong data-start=\"1260\" data-end=\"1281\">Fun Activity Time</strong> &ndash; Color, trace, and learn with your kids! 🖍️✨</p>\r\n<p data-start=\"1332\" data-end=\"1422\">Great for homeschooling, classroom practice, weekend fun, or early literacy development.</p>\r\n<hr data-start=\"1424\" data-end=\"1427\">\r\n<p data-start=\"1429\" data-end=\"1596\">👉 For more fun learning resources and activities, <strong data-start=\"1480\" data-end=\"1516\">subscribe to our YouTube channel</strong>:&nbsp;</p>\r\n<p data-start=\"1429\" data-end=\"1596\">Youtube Channel Link : [ <a href=\"https://www.youtube.com/@FablePalsTV\">https://www.youtube.com/@FablePalsTV</a> ]<br><br></p>', NULL, NULL, NULL, '2025-09-06 14:04:34', '2025-10-29 05:17:59'),
(81, 28, 'hi', 'Alphabet Coloring Sheets with Tracing Letters (Digital Download)', 'Fun and educational alphabet worksheets! Kids can color, trace letters, and learn new words. Instant digital download – Buy, Download, Print & Enjoy!', '<p data-start=\"374\" data-end=\"629\">Make learning the alphabet an exciting adventure with <strong data-start=\"447\" data-end=\"485\">FablePals Alphabet Coloring Sheets</strong> 🌟. This digital pack includes <strong data-start=\"517\" data-end=\"535\">A&ndash;Z worksheets</strong>, each with a picture to color, traceable letters, and simple words to reinforce vocabulary.</p>\r\n<p data-start=\"631\" data-end=\"818\">Perfect for preschoolers and early learners, these sheets turn study time into playtime. Parents and teachers can easily print and use them for fun learning at home or in the classroom.</p>\r\n<p data-start=\"631\" data-end=\"818\">Lifetime Access to Download !</p>\r\n<p data-start=\"820\" data-end=\"838\">✨ What&rsquo;s Inside:</p>\r\n<ul data-start=\"839\" data-end=\"975\">\r\n<li data-start=\"839\" data-end=\"871\">\r\n<p data-start=\"841\" data-end=\"871\">26 alphabet worksheets (A&ndash;Z)</p>\r\n</li>\r\n<li data-start=\"872\" data-end=\"903\">\r\n<p data-start=\"874\" data-end=\"903\">Cute illustrations to color</p>\r\n</li>\r\n<li data-start=\"904\" data-end=\"934\">\r\n<p data-start=\"906\" data-end=\"934\">Easy letter-tracing guides</p>\r\n</li>\r\n<li data-start=\"935\" data-end=\"975\">\r\n<p data-start=\"937\" data-end=\"975\">Simple vocabulary words for practice</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"977\" data-end=\"1088\">🖨️ <strong data-start=\"981\" data-end=\"1006\">Digital Download Only</strong> &ndash; No physical product shipped.<br data-start=\"1037\" data-end=\"1040\">Just <strong data-start=\"1045\" data-end=\"1083\">Buy &ndash; Download &ndash; Print &ndash; Have fun!</strong> 🎨</p>\r\n<hr data-start=\"1090\" data-end=\"1093\">\r\n<h3 data-start=\"1095\" data-end=\"1114\">📖 How to Use</h3>\r\n<p data-start=\"1115\" data-end=\"1330\">1️⃣ <strong data-start=\"1119\" data-end=\"1137\">Buy &amp; Download</strong> &ndash; Get your instant digital file right after purchase.<br data-start=\"1191\" data-end=\"1194\">2️⃣ <strong data-start=\"1198\" data-end=\"1215\">Print at Home</strong> &ndash; Use any home printer or print shop.<br data-start=\"1253\" data-end=\"1256\">3️⃣ <strong data-start=\"1260\" data-end=\"1281\">Fun Activity Time</strong> &ndash; Color, trace, and learn with your kids! 🖍️✨</p>\r\n<p data-start=\"1332\" data-end=\"1422\">Great for homeschooling, classroom practice, weekend fun, or early literacy development.</p>\r\n<hr data-start=\"1424\" data-end=\"1427\">\r\n<p data-start=\"1429\" data-end=\"1596\">👉 For more fun learning resources and activities, <strong data-start=\"1480\" data-end=\"1516\">subscribe to our YouTube channel</strong>:&nbsp;</p>\r\n<p data-start=\"1429\" data-end=\"1596\">Youtube Channel Link : https://www.youtube.com/@FablePalsTV</p>', NULL, NULL, NULL, '2025-09-06 14:04:34', '2025-09-06 14:04:34'),
(90, 33, 'en', 'Number Tracing Sheets 0–9 (Digital Download)', 'Fun number-learning worksheets for kids! Trace and count from 0 to 9. Instant digital download – Buy, Download, Print & Learn!', '<p data-start=\"365\" data-end=\"670\">Turn number practice into a joyful learning moment with our <strong data-start=\"444\" data-end=\"490\">FablePals Number Tracing Sheets</strong> 🌟. This digital pack features <strong data-start=\"522\" data-end=\"539\">10 worksheets</strong>, each focused on a single number from <strong data-start=\"578\" data-end=\"588\">0 to 9</strong>, with cute illustrations to color and easy tracing guides for writing practice.</p>\r\n<p data-start=\"672\" data-end=\"828\">Perfect for toddlers, preschoolers, and early learners who are just beginning their number journey. Great for both home learning and classroom activities!</p>\r\n<p data-start=\"830\" data-end=\"848\">✨ What&rsquo;s Inside:</p>\r\n<ul data-start=\"849\" data-end=\"1030\">\r\n<li data-start=\"849\" data-end=\"882\">\r\n<p data-start=\"851\" data-end=\"882\">10 printable worksheets (0&ndash;9)</p>\r\n</li>\r\n<li data-start=\"883\" data-end=\"925\">\r\n<p data-start=\"885\" data-end=\"925\">Counting objects to reinforce quantity</p>\r\n</li>\r\n<li data-start=\"926\" data-end=\"956\">\r\n<p data-start=\"928\" data-end=\"956\">Easy number-tracing guides</p>\r\n</li>\r\n<li data-start=\"957\" data-end=\"988\">\r\n<p data-start=\"959\" data-end=\"988\">Cute illustrations to color</p>\r\n</li>\r\n<li data-start=\"989\" data-end=\"1030\">\r\n<p data-start=\"991\" data-end=\"1030\">Builds fine motor &amp; early math skills</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1032\" data-end=\"1151\">🖨️ <strong data-start=\"1036\" data-end=\"1061\">Digital Download Only</strong> &ndash; No physical product shipped.<br data-start=\"1092\" data-end=\"1095\">Just <strong data-start=\"1100\" data-end=\"1146\">Buy &ndash; Download &ndash; Print &ndash; Learn &amp; Have Fun!</strong> 🎨</p>\r\n<p data-start=\"1032\" data-end=\"1151\">&nbsp;</p>\r\n<h3 data-start=\"1158\" data-end=\"1177\"><span style=\"font-size: 12pt;\">How to Use ?</span></h3>\r\n<p data-start=\"1178\" data-end=\"1367\">1️⃣ <strong data-start=\"1182\" data-end=\"1200\">Buy &amp; Download</strong> &mdash; Get your file instantly after purchase<br data-start=\"1241\" data-end=\"1244\">2️⃣ <strong data-start=\"1248\" data-end=\"1265\">Print at Home</strong> &mdash; Use any printer or print shop<br data-start=\"1297\" data-end=\"1300\">3️⃣ <strong data-start=\"1304\" data-end=\"1327\">Enjoy Learning Time</strong> &mdash; Let kids color, trace &amp; count! 🖍️✨</p>\r\n<p data-start=\"1369\" data-end=\"1383\">Perfect for:</p>\r\n<ul data-start=\"1384\" data-end=\"1496\">\r\n<li data-start=\"1384\" data-end=\"1401\">\r\n<p data-start=\"1386\" data-end=\"1401\">Homeschooling</p>\r\n</li>\r\n<li data-start=\"1402\" data-end=\"1429\">\r\n<p data-start=\"1404\" data-end=\"1429\">Kindergarten activities</p>\r\n</li>\r\n<li data-start=\"1430\" data-end=\"1454\">\r\n<p data-start=\"1432\" data-end=\"1454\">Weekend learning fun</p>\r\n</li>\r\n<li data-start=\"1455\" data-end=\"1496\">\r\n<p data-start=\"1457\" data-end=\"1496\">Math readiness &amp; handwriting practice</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1498\" data-end=\"1501\">\r\n<p data-start=\"1503\" data-end=\"1657\">👉 For more fun learning activities, <strong data-start=\"1540\" data-end=\"1576\">subscribe to our YouTube channel.<br></strong></p>\r\n<p data-start=\"1503\" data-end=\"1657\"><strong data-start=\"1540\" data-end=\"1576\">Link : [ <a href=\"https://www.youtube.com/@FablePalsTV\">https://www.youtube.com/@FablePalsTV</a> ]</strong></p>\r\n<p data-start=\"1503\" data-end=\"1657\"><strong data-start=\"1540\" data-end=\"1576\">Know More about Our Leader Tiggo : [ <a href=\"../../../character/tiggo-the-leader\">https://fablepals.kids/character/tiggo-the-leader</a> ]</strong></p>', NULL, NULL, NULL, '2025-10-29 05:13:47', '2025-10-29 05:18:15'),
(91, 33, 'hi', 'Number Tracing Sheets 0–9 (Digital Download)', 'Fun number-learning worksheets for kids! Trace and count from 0 to 9. Instant digital download – Buy, Download, Print & Learn!', '<p data-start=\"365\" data-end=\"670\">Turn number practice into a joyful learning moment with our <strong data-start=\"444\" data-end=\"490\">FablePals Number Tracing Sheets</strong> 🌟. This digital pack features <strong data-start=\"522\" data-end=\"539\">10 worksheets</strong>, each focused on a single number from <strong data-start=\"578\" data-end=\"588\">0 to 9</strong>, with cute illustrations to color and easy tracing guides for writing practice.</p>\r\n<p data-start=\"672\" data-end=\"828\">Perfect for toddlers, preschoolers, and early learners who are just beginning their number journey. Great for both home learning and classroom activities!</p>\r\n<p data-start=\"830\" data-end=\"848\">✨ What&rsquo;s Inside:</p>\r\n<ul data-start=\"849\" data-end=\"1030\">\r\n<li data-start=\"849\" data-end=\"882\">\r\n<p data-start=\"851\" data-end=\"882\">10 printable worksheets (0&ndash;9)</p>\r\n</li>\r\n<li data-start=\"883\" data-end=\"925\">\r\n<p data-start=\"885\" data-end=\"925\">Counting objects to reinforce quantity</p>\r\n</li>\r\n<li data-start=\"926\" data-end=\"956\">\r\n<p data-start=\"928\" data-end=\"956\">Easy number-tracing guides</p>\r\n</li>\r\n<li data-start=\"957\" data-end=\"988\">\r\n<p data-start=\"959\" data-end=\"988\">Cute illustrations to color</p>\r\n</li>\r\n<li data-start=\"989\" data-end=\"1030\">\r\n<p data-start=\"991\" data-end=\"1030\">Builds fine motor &amp; early math skills</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1032\" data-end=\"1151\">🖨️ <strong data-start=\"1036\" data-end=\"1061\">Digital Download Only</strong> &ndash; No physical product shipped.<br data-start=\"1092\" data-end=\"1095\">Just <strong data-start=\"1100\" data-end=\"1146\">Buy &ndash; Download &ndash; Print &ndash; Learn &amp; Have Fun!</strong> 🎨</p>\r\n<p data-start=\"1032\" data-end=\"1151\">&nbsp;</p>\r\n<h3 data-start=\"1158\" data-end=\"1177\">📘 How to Use</h3>\r\n<p data-start=\"1178\" data-end=\"1367\">1️⃣ <strong data-start=\"1182\" data-end=\"1200\">Buy &amp; Download</strong> &mdash; Get your file instantly after purchase<br data-start=\"1241\" data-end=\"1244\">2️⃣ <strong data-start=\"1248\" data-end=\"1265\">Print at Home</strong> &mdash; Use any printer or print shop<br data-start=\"1297\" data-end=\"1300\">3️⃣ <strong data-start=\"1304\" data-end=\"1327\">Enjoy Learning Time</strong> &mdash; Let kids color, trace &amp; count! 🖍️✨</p>\r\n<p data-start=\"1369\" data-end=\"1383\">Perfect for:</p>\r\n<ul data-start=\"1384\" data-end=\"1496\">\r\n<li data-start=\"1384\" data-end=\"1401\">\r\n<p data-start=\"1386\" data-end=\"1401\">Homeschooling</p>\r\n</li>\r\n<li data-start=\"1402\" data-end=\"1429\">\r\n<p data-start=\"1404\" data-end=\"1429\">Kindergarten activities</p>\r\n</li>\r\n<li data-start=\"1430\" data-end=\"1454\">\r\n<p data-start=\"1432\" data-end=\"1454\">Weekend learning fun</p>\r\n</li>\r\n<li data-start=\"1455\" data-end=\"1496\">\r\n<p data-start=\"1457\" data-end=\"1496\">Math readiness &amp; handwriting practice</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1498\" data-end=\"1501\">\r\n<p data-start=\"1503\" data-end=\"1657\">👉 For more fun learning activities, <strong data-start=\"1540\" data-end=\"1576\">subscribe to our YouTube channel.<br></strong></p>\r\n<p data-start=\"1503\" data-end=\"1657\"><strong data-start=\"1540\" data-end=\"1576\">Link : [ <a href=\"https://www.youtube.com/@FablePalsTV\">https://www.youtube.com/@FablePalsTV</a> ]</strong></p>', NULL, NULL, NULL, '2025-10-29 05:13:47', '2025-10-29 05:13:47'),
(92, 34, 'en', 'Alphabet Tracing 4 Sheets Bundle (Digital Download)', 'A complete alphabet handwriting bundle featuring uppercase, lowercase, and mixed tracing sheets — plus a fun “All-in-One” activity page! Digital download: Buy – Download – Print – Learn with Luna!  ( 4 Worksheets )', '<p data-start=\"462\" data-end=\"784\">Help your child master the alphabet confidently with the <strong data-start=\"519\" data-end=\"581\">FablePals Learn with Luna &ndash; Alphabet Tracing Sheets Bundle</strong>! 🐰✨<br data-start=\"586\" data-end=\"589\">This digital learning pack includes <strong data-start=\"625\" data-end=\"659\">4 different tracing worksheets</strong> designed to build essential writing skills step-by-step &mdash; guided by Luna, our curious and cheerful bunny who loves learning!</p>\r\n<p data-start=\"786\" data-end=\"844\">Perfect for preschool, kindergarten, and beginner writers!</p>\r\n<hr data-start=\"846\" data-end=\"849\">\r\n<h3 data-start=\"851\" data-end=\"874\"><span style=\"font-size: 12pt;\">✨ What&rsquo;s Included</span></h3>\r\n<p data-start=\"875\" data-end=\"1155\">4 Printable Tracing Pages:<br data-start=\"901\" data-end=\"904\">1️⃣ <strong data-start=\"908\" data-end=\"944\">Uppercase Alphabet Tracing Sheet</strong> (A&ndash;Z)<br data-start=\"950\" data-end=\"953\">2️⃣ <strong data-start=\"957\" data-end=\"993\">Lowercase Alphabet Tracing Sheet</strong> (a&ndash;z)<br data-start=\"999\" data-end=\"1002\">3️⃣ <strong data-start=\"1006\" data-end=\"1033\">Upper + Lowercase Combo</strong> &mdash; Trace matching letter pairs (A/a, B/b&hellip;)<br data-start=\"1075\" data-end=\"1078\">4️⃣ <strong data-start=\"1082\" data-end=\"1120\">All-in-One Alphabet Activity Sheet</strong> &mdash; <strong data-start=\"1123\" data-end=\"1148\">Trace + Count + Color</strong> 🖍️✅</p>\r\n<p data-start=\"1157\" data-end=\"1296\">These activities help build:<br data-start=\"1185\" data-end=\"1188\">✔ Fine motor skills<br data-start=\"1207\" data-end=\"1210\">✔ Letter recognition<br data-start=\"1230\" data-end=\"1233\">✔ Correct handwriting formation<br data-start=\"1264\" data-end=\"1267\">✔ Confidence &amp; independence</p>\r\n<p data-start=\"1298\" data-end=\"1406\">🖨️ <strong data-start=\"1302\" data-end=\"1327\">DIGITAL DOWNLOAD ONLY</strong> &ndash; No physical product shipped.<br data-start=\"1358\" data-end=\"1361\">👉 Simply <strong data-start=\"1371\" data-end=\"1406\">Buy &ndash; Download &ndash; Print &ndash; Learn!</strong></p>\r\n<hr data-start=\"1408\" data-end=\"1411\">\r\n<h3 data-start=\"1413\" data-end=\"1432\"><span style=\"font-size: 12pt;\">📘 How to Use</span></h3>\r\n<p data-start=\"1433\" data-end=\"1568\">1️⃣ Purchase &amp; Download PDF instantly<br data-start=\"1470\" data-end=\"1473\">2️⃣ Print at home or at a local print shop<br data-start=\"1515\" data-end=\"1518\">3️⃣ Let Luna lead the fun tracing adventure ✏️🌈</p>\r\n<p data-start=\"1570\" data-end=\"1684\">Ideal for:<br data-start=\"1580\" data-end=\"1583\">✔ Homeschooling<br data-start=\"1598\" data-end=\"1601\">✔ Classroom practice<br data-start=\"1621\" data-end=\"1624\">✔ Early writing development<br data-start=\"1651\" data-end=\"1654\">✔ Daily handwriting routines</p>\r\n<hr data-start=\"1686\" data-end=\"1689\">\r\n<h3 data-start=\"1691\" data-end=\"1714\"><span style=\"font-size: 12pt;\">🎥 Bonus Learning</span></h3>\r\n<p data-start=\"1715\" data-end=\"1867\">📌 Love learning with Luna?<br data-start=\"1742\" data-end=\"1745\">Watch alphabet learning videos &amp; more on our YouTube Channel:<br data-start=\"1806\" data-end=\"1809\">👉 [ <a class=\"decorated-link\" href=\"https://www.youtube.com/@FablePalsTV?sub_confirmation=1\" target=\"_new\" rel=\"noopener\" data-start=\"1812\" data-end=\"1867\">https://www.youtube.com/@FablePalsTV?sub_confirmation=1</a></p>\r\n<p data-start=\"1715\" data-end=\"1867\">Learn more About our Speedster Luna&nbsp;</p>\r\n<p data-start=\"1715\" data-end=\"1867\">&nbsp;</p>', NULL, NULL, NULL, '2025-10-29 05:33:54', '2025-10-29 06:17:12'),
(93, 34, 'hi', 'Alphabet Tracing Sheets Bundle (Digital Download)', 'A complete alphabet handwriting bundle featuring uppercase, lowercase, and mixed tracing sheets — plus a fun “All-in-One” activity page! Digital download: Buy – Download – Print – Learn with Luna!', '<p data-start=\"462\" data-end=\"784\">Help your child master the alphabet confidently with the <strong data-start=\"519\" data-end=\"581\">FablePals Learn with Luna &ndash; Alphabet Tracing Sheets Bundle</strong>! 🐰✨<br data-start=\"586\" data-end=\"589\">This digital learning pack includes <strong data-start=\"625\" data-end=\"659\">4 different tracing worksheets</strong> designed to build essential writing skills step-by-step &mdash; guided by Luna, our curious and cheerful bunny who loves learning!</p>\r\n<p data-start=\"786\" data-end=\"844\">Perfect for preschool, kindergarten, and beginner writers!</p>\r\n<hr data-start=\"846\" data-end=\"849\">\r\n<h3 data-start=\"851\" data-end=\"874\"><span style=\"font-size: 12pt;\">✨ What&rsquo;s Included</span></h3>\r\n<p data-start=\"875\" data-end=\"1155\">4 Printable Tracing Pages:<br data-start=\"901\" data-end=\"904\">1️⃣ <strong data-start=\"908\" data-end=\"944\">Uppercase Alphabet Tracing Sheet</strong> (A&ndash;Z)<br data-start=\"950\" data-end=\"953\">2️⃣ <strong data-start=\"957\" data-end=\"993\">Lowercase Alphabet Tracing Sheet</strong> (a&ndash;z)<br data-start=\"999\" data-end=\"1002\">3️⃣ <strong data-start=\"1006\" data-end=\"1033\">Upper + Lowercase Combo</strong> &mdash; Trace matching letter pairs (A/a, B/b&hellip;)<br data-start=\"1075\" data-end=\"1078\">4️⃣ <strong data-start=\"1082\" data-end=\"1120\">All-in-One Alphabet Activity Sheet</strong> &mdash; <strong data-start=\"1123\" data-end=\"1148\">Trace + Count + Color</strong> 🖍️✅</p>\r\n<p data-start=\"1157\" data-end=\"1296\">These activities help build:<br data-start=\"1185\" data-end=\"1188\">✔ Fine motor skills<br data-start=\"1207\" data-end=\"1210\">✔ Letter recognition<br data-start=\"1230\" data-end=\"1233\">✔ Correct handwriting formation<br data-start=\"1264\" data-end=\"1267\">✔ Confidence &amp; independence</p>\r\n<p data-start=\"1298\" data-end=\"1406\">🖨️ <strong data-start=\"1302\" data-end=\"1327\">DIGITAL DOWNLOAD ONLY</strong> &ndash; No physical product shipped.<br data-start=\"1358\" data-end=\"1361\">👉 Simply <strong data-start=\"1371\" data-end=\"1406\">Buy &ndash; Download &ndash; Print &ndash; Learn!</strong></p>\r\n<hr data-start=\"1408\" data-end=\"1411\">\r\n<h3 data-start=\"1413\" data-end=\"1432\"><span style=\"font-size: 12pt;\">📘 How to Use</span></h3>\r\n<p data-start=\"1433\" data-end=\"1568\">1️⃣ Purchase &amp; Download PDF instantly<br data-start=\"1470\" data-end=\"1473\">2️⃣ Print at home or at a local print shop<br data-start=\"1515\" data-end=\"1518\">3️⃣ Let Luna lead the fun tracing adventure ✏️🌈</p>\r\n<p data-start=\"1570\" data-end=\"1684\">Ideal for:<br data-start=\"1580\" data-end=\"1583\">✔ Homeschooling<br data-start=\"1598\" data-end=\"1601\">✔ Classroom practice<br data-start=\"1621\" data-end=\"1624\">✔ Early writing development<br data-start=\"1651\" data-end=\"1654\">✔ Daily handwriting routines</p>\r\n<hr data-start=\"1686\" data-end=\"1689\">\r\n<h3 data-start=\"1691\" data-end=\"1714\">🎥 Bonus Learning</h3>\r\n<p data-start=\"1715\" data-end=\"1867\">📌 Love learning with Luna?<br data-start=\"1742\" data-end=\"1745\">Watch alphabet learning videos &amp; more on our YouTube Channel:<br data-start=\"1806\" data-end=\"1809\">👉 <a class=\"decorated-link\" href=\"https://www.youtube.com/@FablePalsTV?sub_confirmation=1\" target=\"_new\" rel=\"noopener\" data-start=\"1812\" data-end=\"1867\">https://www.youtube.com/@FablePalsTV?sub_confirmation=1</a></p>', NULL, NULL, NULL, '2025-10-29 05:33:54', '2025-10-29 05:33:54'),
(94, 35, 'en', 'FablePals 14 Flashcards Mega Bundle (Digital Download)', 'Explore, learn, and play with the FablePals! This mega bundle includes 14 themed flashcard sets based on your favorite FablePals characters — perfect for kids to learn colors, animals, shapes, numbers, and more. Instant digital download – PDFs + PNGs included!', '<p data-start=\"527\" data-end=\"775\">Make learning fun and interactive with the <strong data-start=\"570\" data-end=\"606\">FablePals Flashcards Mega Bundle</strong>! 🌟<br data-start=\"610\" data-end=\"613\">This digital pack includes <strong data-start=\"640\" data-end=\"668\">14 unique flashcard sets</strong>, each guided by one of our adorable FablePals heroes &mdash; Tiggo, Luna, Bolt, Ollie, Blaze, Waver, and Kane.</p>\r\n<p data-start=\"777\" data-end=\"931\">Each set is beautifully designed in FablePals&rsquo; signature colorful, Pixar-inspired style to keep kids excited while learning about the world around them.</p>\r\n<p data-start=\"933\" data-end=\"1179\">You&rsquo;ll receive both <strong data-start=\"953\" data-end=\"960\">PDF</strong> and <strong data-start=\"965\" data-end=\"972\">PNG</strong> versions for every flashcard set.<br data-start=\"1006\" data-end=\"1009\">👉 PDFs are ready to <strong data-start=\"1030\" data-end=\"1064\">view, learn, or print directly</strong>.<br data-start=\"1065\" data-end=\"1068\">👉 PNGs come in a <strong data-start=\"1086\" data-end=\"1098\">ZIP file</strong>, allowing you to <strong data-start=\"1116\" data-end=\"1176\">customize, arrange, or print multiple cards on one sheet</strong>.</p>\r\n<hr data-start=\"1181\" data-end=\"1184\">\r\n<h3 data-start=\"1186\" data-end=\"1210\"><span style=\"font-size: 12pt;\">✨ <strong data-start=\"1192\" data-end=\"1210\">What&rsquo;s Inside:</strong></span></h3>\r\n<p data-start=\"1211\" data-end=\"1699\"><strong data-start=\"1211\" data-end=\"1242\">14 Flashcard Sets Included:</strong><br data-start=\"1242\" data-end=\"1245\">1️⃣ Tiggo Colors Flashcards<br data-start=\"1272\" data-end=\"1275\">2️⃣ Tiggo Shapes Flashcards<br data-start=\"1302\" data-end=\"1305\">3️⃣ Luna Sea Animals Flashcards<br data-start=\"1336\" data-end=\"1339\">4️⃣ Luna Farm Animals Flashcards<br data-start=\"1371\" data-end=\"1374\">5️⃣ Bolt Wild Animals Flashcards<br data-start=\"1406\" data-end=\"1409\">6️⃣ Bolt Fruits Flashcards<br data-start=\"1435\" data-end=\"1438\">7️⃣ Ollie Vegetables Flashcards<br data-start=\"1469\" data-end=\"1472\">8️⃣ Ollie Transportation Flashcards<br data-start=\"1507\" data-end=\"1510\">9️⃣ Blaze ABCD Flashcards<br data-start=\"1529\" data-end=\"1532\">🔟 Blaze Occupation Flashcards<br data-start=\"1562\" data-end=\"1565\">11️⃣ Waver Numbers Flashcards<br data-start=\"1594\" data-end=\"1597\">12️⃣ Waver Family Members Flashcards<br data-start=\"1633\" data-end=\"1636\">13️⃣ Kane Emotions Flashcards<br data-start=\"1665\" data-end=\"1668\">14️⃣ Kane Opposite Flashcards</p>\r\n<p data-start=\"1701\" data-end=\"1773\">That&rsquo;s <strong data-start=\"1708\" data-end=\"1729\">hundreds of cards</strong> covering all key preschool learning topics!</p>\r\n<hr data-start=\"1775\" data-end=\"1778\">\r\n<h3 data-start=\"1780\" data-end=\"1805\"><span style=\"font-size: 12pt;\">🖨️ <strong data-start=\"1788\" data-end=\"1805\">File Details:</strong></span></h3>\r\n<ul data-start=\"1806\" data-end=\"2004\">\r\n<li data-start=\"1806\" data-end=\"1851\">\r\n<p data-start=\"1808\" data-end=\"1851\">14 Ready-to-Print <strong data-start=\"1826\" data-end=\"1849\">PDF Flashcard Files</strong></p>\r\n</li>\r\n<li data-start=\"1852\" data-end=\"1904\">\r\n<p data-start=\"1854\" data-end=\"1904\">1 <strong data-start=\"1856\" data-end=\"1870\">ZIP Folder</strong> containing all <strong data-start=\"1886\" data-end=\"1902\">PNG versions</strong></p>\r\n</li>\r\n<li data-start=\"1905\" data-end=\"1955\">\r\n<p data-start=\"1907\" data-end=\"1955\">High-quality images for clear printing</p>\r\n</li>\r\n<li data-start=\"1956\" data-end=\"2004\">\r\n<p data-start=\"1958\" data-end=\"2004\">Works on tablets, phones, or desktop screens</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"2006\" data-end=\"2298\">💡 <strong data-start=\"2009\" data-end=\"2037\">How to Use the ZIP File:</strong><br data-start=\"2037\" data-end=\"2040\">1️⃣ Download the ZIP file after purchase.<br data-start=\"2081\" data-end=\"2084\">2️⃣ Right-click the file and choose <strong data-start=\"2120\" data-end=\"2137\">&ldquo;Extract All&rdquo;</strong> (Windows) or <strong data-start=\"2151\" data-end=\"2176\">double-click to unzip</strong> (Mac).<br data-start=\"2183\" data-end=\"2186\">3️⃣ Use any free tool like <strong data-start=\"2213\" data-end=\"2241\">WinZip, 7-Zip, or WinRAR</strong> to open it.<br data-start=\"2253\" data-end=\"2256\">4️⃣ Access all PNG flashcards instantly!</p>\r\n<hr data-start=\"2300\" data-end=\"2303\">\r\n<h3 data-start=\"2305\" data-end=\"2327\"><span style=\"font-size: 12pt;\">📘 <strong data-start=\"2312\" data-end=\"2327\">How to Use:</strong></span></h3>\r\n<ul data-start=\"2328\" data-end=\"2531\">\r\n<li data-start=\"2328\" data-end=\"2394\">\r\n<p data-start=\"2330\" data-end=\"2394\">View and learn on digital devices (tablet, mobile, or laptop).</p>\r\n</li>\r\n<li data-start=\"2395\" data-end=\"2458\">\r\n<p data-start=\"2397\" data-end=\"2458\">Print individual flashcards or make your own custom sheets.</p>\r\n</li>\r\n<li data-start=\"2459\" data-end=\"2531\">\r\n<p data-start=\"2461\" data-end=\"2531\">Perfect for classrooms, homeschooling, or fun playtime with parents.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2533\" data-end=\"2536\">\r\n<h3 data-start=\"2538\" data-end=\"2564\"><span style=\"font-size: 12pt;\">🎥 <strong data-start=\"2545\" data-end=\"2564\">Bonus Learning:</strong></span></h3>\r\n<p data-start=\"2565\" data-end=\"2757\">Watch matching learning videos on our YouTube Channel:<br data-start=\"2619\" data-end=\"2622\">👉 <a class=\"decorated-link\" href=\"https://www.youtube.com/@FablePalsTV?sub_confirmation=1\" target=\"_blank\" rel=\"noopener\" data-start=\"2625\" data-end=\"2696\">FablePals TV</a><br data-start=\"2696\" data-end=\"2699\">Learn with your favorite FablePals heroes every week! 🌈</p>', NULL, NULL, NULL, '2025-10-30 11:55:08', '2025-10-30 11:59:21'),
(95, 35, 'hi', 'FablePals 14 Flashcards Mega Bundle (Digital Download)', 'Explore, learn, and play with the FablePals! This mega bundle includes 14 themed flashcard sets based on your favorite FablePals characters — perfect for kids to learn colors, animals, shapes, numbers, and more. Instant digital download – PDFs + PNGs included!', '<p data-start=\"527\" data-end=\"775\">Make learning fun and interactive with the <strong data-start=\"570\" data-end=\"606\">FablePals Flashcards Mega Bundle</strong>! 🌟<br data-start=\"610\" data-end=\"613\">This digital pack includes <strong data-start=\"640\" data-end=\"668\">14 unique flashcard sets</strong>, each guided by one of our adorable FablePals heroes &mdash; Tiggo, Luna, Bolt, Ollie, Blaze, Waver, and Kane.</p>\r\n<p data-start=\"777\" data-end=\"931\">Each set is beautifully designed in FablePals&rsquo; signature colorful, Pixar-inspired style to keep kids excited while learning about the world around them.</p>\r\n<p data-start=\"933\" data-end=\"1179\">You&rsquo;ll receive both <strong data-start=\"953\" data-end=\"960\">PDF</strong> and <strong data-start=\"965\" data-end=\"972\">PNG</strong> versions for every flashcard set.<br data-start=\"1006\" data-end=\"1009\">👉 PDFs are ready to <strong data-start=\"1030\" data-end=\"1064\">view, learn, or print directly</strong>.<br data-start=\"1065\" data-end=\"1068\">👉 PNGs come in a <strong data-start=\"1086\" data-end=\"1098\">ZIP file</strong>, allowing you to <strong data-start=\"1116\" data-end=\"1176\">customize, arrange, or print multiple cards on one sheet</strong>.</p>\r\n<hr data-start=\"1181\" data-end=\"1184\">\r\n<h3 data-start=\"1186\" data-end=\"1210\"><span style=\"font-size: 12pt;\">✨ <strong data-start=\"1192\" data-end=\"1210\">What&rsquo;s Inside:</strong></span></h3>\r\n<p data-start=\"1211\" data-end=\"1699\"><strong data-start=\"1211\" data-end=\"1242\">14 Flashcard Sets Included:</strong><br data-start=\"1242\" data-end=\"1245\">1️⃣ Tiggo Colors Flashcards<br data-start=\"1272\" data-end=\"1275\">2️⃣ Tiggo Shapes Flashcards<br data-start=\"1302\" data-end=\"1305\">3️⃣ Luna Sea Animals Flashcards<br data-start=\"1336\" data-end=\"1339\">4️⃣ Luna Farm Animals Flashcards<br data-start=\"1371\" data-end=\"1374\">5️⃣ Bolt Wild Animals Flashcards<br data-start=\"1406\" data-end=\"1409\">6️⃣ Bolt Fruits Flashcards<br data-start=\"1435\" data-end=\"1438\">7️⃣ Ollie Vegetables Flashcards<br data-start=\"1469\" data-end=\"1472\">8️⃣ Ollie Transportation Flashcards<br data-start=\"1507\" data-end=\"1510\">9️⃣ ABCD Flashcards<br data-start=\"1529\" data-end=\"1532\">🔟 Blaze Occupation Flashcards<br data-start=\"1562\" data-end=\"1565\">11️⃣ Waver Numbers Flashcards<br data-start=\"1594\" data-end=\"1597\">12️⃣ Waver Family Members Flashcards<br data-start=\"1633\" data-end=\"1636\">13️⃣ Kane Emotions Flashcards<br data-start=\"1665\" data-end=\"1668\">14️⃣ Kane Opposite Flashcards</p>\r\n<p data-start=\"1701\" data-end=\"1773\">That&rsquo;s <strong data-start=\"1708\" data-end=\"1729\">hundreds of cards</strong> covering all key preschool learning topics!</p>\r\n<hr data-start=\"1775\" data-end=\"1778\">\r\n<h3 data-start=\"1780\" data-end=\"1805\"><span style=\"font-size: 12pt;\">🖨️ <strong data-start=\"1788\" data-end=\"1805\">File Details:</strong></span></h3>\r\n<ul data-start=\"1806\" data-end=\"2004\">\r\n<li data-start=\"1806\" data-end=\"1851\">\r\n<p data-start=\"1808\" data-end=\"1851\">14 Ready-to-Print <strong data-start=\"1826\" data-end=\"1849\">PDF Flashcard Files</strong></p>\r\n</li>\r\n<li data-start=\"1852\" data-end=\"1904\">\r\n<p data-start=\"1854\" data-end=\"1904\">1 <strong data-start=\"1856\" data-end=\"1870\">ZIP Folder</strong> containing all <strong data-start=\"1886\" data-end=\"1902\">PNG versions</strong></p>\r\n</li>\r\n<li data-start=\"1905\" data-end=\"1955\">\r\n<p data-start=\"1907\" data-end=\"1955\">High-quality images for clear printing</p>\r\n</li>\r\n<li data-start=\"1956\" data-end=\"2004\">\r\n<p data-start=\"1958\" data-end=\"2004\">Works on tablets, phones, or desktop screens</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"2006\" data-end=\"2298\">💡 <strong data-start=\"2009\" data-end=\"2037\">How to Use the ZIP File:</strong><br data-start=\"2037\" data-end=\"2040\">1️⃣ Download the ZIP file after purchase.<br data-start=\"2081\" data-end=\"2084\">2️⃣ Right-click the file and choose <strong data-start=\"2120\" data-end=\"2137\">&ldquo;Extract All&rdquo;</strong> (Windows) or <strong data-start=\"2151\" data-end=\"2176\">double-click to unzip</strong> (Mac).<br data-start=\"2183\" data-end=\"2186\">3️⃣ Use any free tool like <strong data-start=\"2213\" data-end=\"2241\">WinZip, 7-Zip, or WinRAR</strong> to open it.<br data-start=\"2253\" data-end=\"2256\">4️⃣ Access all PNG flashcards instantly!</p>\r\n<hr data-start=\"2300\" data-end=\"2303\">\r\n<h3 data-start=\"2305\" data-end=\"2327\"><span style=\"font-size: 12pt;\">📘 <strong data-start=\"2312\" data-end=\"2327\">How to Use:</strong></span></h3>\r\n<ul data-start=\"2328\" data-end=\"2531\">\r\n<li data-start=\"2328\" data-end=\"2394\">\r\n<p data-start=\"2330\" data-end=\"2394\">View and learn on digital devices (tablet, mobile, or laptop).</p>\r\n</li>\r\n<li data-start=\"2395\" data-end=\"2458\">\r\n<p data-start=\"2397\" data-end=\"2458\">Print individual flashcards or make your own custom sheets.</p>\r\n</li>\r\n<li data-start=\"2459\" data-end=\"2531\">\r\n<p data-start=\"2461\" data-end=\"2531\">Perfect for classrooms, homeschooling, or fun playtime with parents.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2533\" data-end=\"2536\">\r\n<h3 data-start=\"2538\" data-end=\"2564\">🎥 <strong data-start=\"2545\" data-end=\"2564\">Bonus Learning:</strong></h3>\r\n<p data-start=\"2565\" data-end=\"2757\">Watch matching learning videos on our YouTube Channel:<br data-start=\"2619\" data-end=\"2622\">👉 <a class=\"decorated-link\" href=\"https://www.youtube.com/@FablePalsTV?sub_confirmation=1\" target=\"_blank\" rel=\"noopener\" data-start=\"2625\" data-end=\"2696\">FablePals TV</a><br data-start=\"2696\" data-end=\"2699\">Learn with your favorite FablePals heroes every week! 🌈</p>', NULL, NULL, NULL, '2025-10-30 11:55:08', '2025-10-30 11:55:08'),
(96, 36, 'en', 'Tiggo and the Missing Mangoes Storybook (Digital Download)', 'A heartwarming FablePals story where Tiggo learns the value of honesty and teamwork! Read, learn, and enjoy this moral-filled adventure on any device or in print. Includes PDF & PNG files for flexible use.', '<p data-start=\"565\" data-end=\"715\">Step into the colorful world of <strong data-start=\"597\" data-end=\"609\">FabVille</strong> with <strong data-start=\"615\" data-end=\"648\">Tiggo and the Missing Mangoes</strong> 🍋🐯 &mdash; a delightful moral storybook from the FablePals universe!</p>\r\n<p data-start=\"717\" data-end=\"985\">When all the mangoes from FabVille suddenly go missing, Tiggo sets out on a fun-filled mystery adventure with his friends to find the truth. Along the way, kids learn about <strong data-start=\"890\" data-end=\"933\">honesty, friendship, and helping others</strong> &mdash; core values every young heart should grow with.</p>\r\n<p data-start=\"987\" data-end=\"1245\">This storybook is designed to make <strong data-start=\"1022\" data-end=\"1045\">screen time smarter</strong> and more meaningful. Whether your little one reads on a <strong data-start=\"1102\" data-end=\"1121\">tablet or phone</strong>, or you choose to <strong data-start=\"1140\" data-end=\"1181\">print and share it as a bedtime story</strong>, this digital product makes learning morals fun and engaging.</p>\r\n<hr data-start=\"1247\" data-end=\"1250\">\r\n<h3 data-start=\"1252\" data-end=\"1278\"><span style=\"font-size: 12pt;\">✨ <strong data-start=\"1258\" data-end=\"1276\">What&rsquo;s Inside:</strong></span></h3>\r\n<p data-start=\"1279\" data-end=\"1337\">📘 1 Complete Storybook: Tiggo and the Missing Mangoes</p>\r\n<ul data-start=\"1338\" data-end=\"1600\">\r\n<li data-start=\"1338\" data-end=\"1390\">\r\n<p data-start=\"1340\" data-end=\"1390\">Full-color <strong data-start=\"1351\" data-end=\"1363\">PDF file</strong> &ndash; ready to read or print</p>\r\n</li>\r\n<li data-start=\"1391\" data-end=\"1472\">\r\n<p data-start=\"1393\" data-end=\"1472\"><strong data-start=\"1393\" data-end=\"1406\">PNG pages</strong> included &ndash; perfect for tablets, phones, or custom print layouts</p>\r\n</li>\r\n<li data-start=\"1473\" data-end=\"1524\">\r\n<p data-start=\"1475\" data-end=\"1524\">Easy-to-read text and Pixar-style illustrations</p>\r\n</li>\r\n<li data-start=\"1525\" data-end=\"1600\">\r\n<p data-start=\"1527\" data-end=\"1600\">Positive moral lesson: &ldquo;Honesty and teamwork make everything better.&rdquo;</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1602\" data-end=\"1605\">\r\n<h3 data-start=\"1607\" data-end=\"1634\"><span style=\"font-size: 12pt;\">🖨️ <strong data-start=\"1615\" data-end=\"1632\">File Details:</strong></span></h3>\r\n<ul data-start=\"1635\" data-end=\"1780\">\r\n<li data-start=\"1635\" data-end=\"1682\">\r\n<p data-start=\"1637\" data-end=\"1682\">Format: PDF + PNGs (included in ZIP folder)</p>\r\n</li>\r\n<li data-start=\"1728\" data-end=\"1780\">\r\n<p data-start=\"1730\" data-end=\"1780\">Works perfectly on tablets, phones, and desktops</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1782\" data-end=\"2024\">💡 <strong data-start=\"1785\" data-end=\"1804\">To Access PNGs:</strong><br data-start=\"1804\" data-end=\"1807\">1️⃣ Download and locate the ZIP file<br data-start=\"1843\" data-end=\"1846\">2️⃣ Right-click &rarr; <strong data-start=\"1864\" data-end=\"1879\">Extract All</strong> (Windows) or double-click to unzip (Mac)<br data-start=\"1920\" data-end=\"1923\">3️⃣ Use any free unzip tool (WinZip, 7-Zip, WinRAR)<br data-start=\"1974\" data-end=\"1977\">4️⃣ Open the folder and view pages instantly!</p>\r\n<hr data-start=\"2026\" data-end=\"2029\">\r\n<h3 data-start=\"2031\" data-end=\"2055\"><span style=\"font-size: 12pt;\">📘 <strong data-start=\"2038\" data-end=\"2053\">How to Use:</strong></span></h3>\r\n<p data-start=\"2056\" data-end=\"2244\">✅ Read digitally on tablets or phones<br data-start=\"2093\" data-end=\"2096\">✅ Print the pages to make your own storybook<br data-start=\"2140\" data-end=\"2143\">✅ Share story time with kids for moral learning<br data-start=\"2190\" data-end=\"2193\">✅ Great for bedtime, classrooms, or activity time</p>\r\n<hr data-start=\"2246\" data-end=\"2249\">\r\n<h3 data-start=\"2251\" data-end=\"2279\"><span style=\"font-size: 12pt;\">🎥 <strong data-start=\"2258\" data-end=\"2277\">Bonus Learning:</strong></span></h3>\r\n<p data-start=\"2280\" data-end=\"2431\">Watch Tiggo&rsquo;s adventures and other moral stories on our YouTube Channel:<br data-start=\"2352\" data-end=\"2355\">👉 <a class=\"decorated-link\" href=\"https://www.youtube.com/@FablePalsTV?sub_confirmation=1\" target=\"_new\" rel=\"noopener\" data-start=\"2358\" data-end=\"2429\">FablePals TV</a></p>\r\n<p data-start=\"2433\" data-end=\"2508\">Turn every story into a <strong data-start=\"2457\" data-end=\"2482\">smart learning moment</strong> with the FablePals! 🌈✨</p>', NULL, NULL, NULL, '2025-11-01 10:18:34', '2025-11-01 10:19:55');
INSERT INTO `product_translations` (`id`, `product_id`, `lang_code`, `title`, `short_description`, `description`, `additional_description`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(97, 36, 'hi', 'Tiggo and the Missing Mangoes Storybook (Digital Download)', 'A heartwarming FablePals story where Tiggo learns the value of honesty and teamwork! Read, learn, and enjoy this moral-filled adventure on any device or in print. Includes PDF & PNG files for flexible use.', '<p data-start=\"565\" data-end=\"715\">Step into the colorful world of <strong data-start=\"597\" data-end=\"609\">FabVille</strong> with <strong data-start=\"615\" data-end=\"648\">Tiggo and the Missing Mangoes</strong> 🍋🐯 &mdash; a delightful moral storybook from the FablePals universe!</p>\r\n<p data-start=\"717\" data-end=\"985\">When all the mangoes from FabVille suddenly go missing, Tiggo sets out on a fun-filled mystery adventure with his friends to find the truth. Along the way, kids learn about <strong data-start=\"890\" data-end=\"933\">honesty, friendship, and helping others</strong> &mdash; core values every young heart should grow with.</p>\r\n<p data-start=\"987\" data-end=\"1245\">This storybook is designed to make <strong data-start=\"1022\" data-end=\"1045\">screen time smarter</strong> and more meaningful. Whether your little one reads on a <strong data-start=\"1102\" data-end=\"1121\">tablet or phone</strong>, or you choose to <strong data-start=\"1140\" data-end=\"1181\">print and share it as a bedtime story</strong>, this digital product makes learning morals fun and engaging.</p>\r\n<hr data-start=\"1247\" data-end=\"1250\">\r\n<h3 data-start=\"1252\" data-end=\"1278\"><span style=\"font-size: 12pt;\">✨ <strong data-start=\"1258\" data-end=\"1276\">What&rsquo;s Inside:</strong></span></h3>\r\n<p data-start=\"1279\" data-end=\"1337\">📘 1 Complete Storybook: Tiggo and the Missing Mangoes</p>\r\n<ul data-start=\"1338\" data-end=\"1600\">\r\n<li data-start=\"1338\" data-end=\"1390\">\r\n<p data-start=\"1340\" data-end=\"1390\">Full-color <strong data-start=\"1351\" data-end=\"1363\">PDF file</strong> &ndash; ready to read or print</p>\r\n</li>\r\n<li data-start=\"1391\" data-end=\"1472\">\r\n<p data-start=\"1393\" data-end=\"1472\"><strong data-start=\"1393\" data-end=\"1406\">PNG pages</strong> included &ndash; perfect for tablets, phones, or custom print layouts</p>\r\n</li>\r\n<li data-start=\"1473\" data-end=\"1524\">\r\n<p data-start=\"1475\" data-end=\"1524\">Easy-to-read text and Pixar-style illustrations</p>\r\n</li>\r\n<li data-start=\"1525\" data-end=\"1600\">\r\n<p data-start=\"1527\" data-end=\"1600\">Positive moral lesson: &ldquo;Honesty and teamwork make everything better.&rdquo;</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1602\" data-end=\"1605\">\r\n<h3 data-start=\"1607\" data-end=\"1634\"><span style=\"font-size: 12pt;\">🖨️ <strong data-start=\"1615\" data-end=\"1632\">File Details:</strong></span></h3>\r\n<ul data-start=\"1635\" data-end=\"1780\">\r\n<li data-start=\"1635\" data-end=\"1682\">\r\n<p data-start=\"1637\" data-end=\"1682\">Format: PDF + PNGs (included in ZIP folder)</p>\r\n</li>\r\n<li data-start=\"1728\" data-end=\"1780\">\r\n<p data-start=\"1730\" data-end=\"1780\">Works perfectly on tablets, phones, and desktops</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1782\" data-end=\"2024\">💡 <strong data-start=\"1785\" data-end=\"1804\">To Access PNGs:</strong><br data-start=\"1804\" data-end=\"1807\">1️⃣ Download and locate the ZIP file<br data-start=\"1843\" data-end=\"1846\">2️⃣ Right-click &rarr; <strong data-start=\"1864\" data-end=\"1879\">Extract All</strong> (Windows) or double-click to unzip (Mac)<br data-start=\"1920\" data-end=\"1923\">3️⃣ Use any free unzip tool (WinZip, 7-Zip, WinRAR)<br data-start=\"1974\" data-end=\"1977\">4️⃣ Open the folder and view pages instantly!</p>\r\n<hr data-start=\"2026\" data-end=\"2029\">\r\n<h3 data-start=\"2031\" data-end=\"2055\">📘 <strong data-start=\"2038\" data-end=\"2053\">How to Use:</strong></h3>\r\n<p data-start=\"2056\" data-end=\"2244\">✅ Read digitally on tablets or phones<br data-start=\"2093\" data-end=\"2096\">✅ Print the pages to make your own storybook<br data-start=\"2140\" data-end=\"2143\">✅ Share story time with kids for moral learning<br data-start=\"2190\" data-end=\"2193\">✅ Great for bedtime, classrooms, or activity time</p>\r\n<hr data-start=\"2246\" data-end=\"2249\">\r\n<h3 data-start=\"2251\" data-end=\"2279\"><span style=\"font-size: 12pt;\">🎥 <strong data-start=\"2258\" data-end=\"2277\">Bonus Learning:</strong></span></h3>\r\n<p data-start=\"2280\" data-end=\"2431\">Watch Tiggo&rsquo;s adventures and other moral stories on our YouTube Channel:<br data-start=\"2352\" data-end=\"2355\">👉 <a class=\"decorated-link\" href=\"https://www.youtube.com/@FablePalsTV?sub_confirmation=1\" target=\"_new\" rel=\"noopener\" data-start=\"2358\" data-end=\"2429\">FablePals TV</a></p>\r\n<p data-start=\"2433\" data-end=\"2508\">Turn every story into a <strong data-start=\"2457\" data-end=\"2482\">smart learning moment</strong> with the FablePals! 🌈✨</p>', NULL, NULL, NULL, '2025-11-01 10:18:34', '2025-11-01 10:18:34'),
(98, 37, 'en', 'Luna’s Big Breaking News Storybook (Digital Download)', 'Join Luna on her adventure to uncover the truth and learn why honesty matters most! A delightful moral storybook for kids available in PDF & PNG formats. Read on any device or print at home.', '<p data-start=\"443\" data-end=\"608\">Step into the world of <strong data-start=\"466\" data-end=\"478\">FabVille</strong> with <strong data-start=\"484\" data-end=\"512\">Luna&rsquo;s Big Breaking News</strong> 🐰🗞️ &mdash; an inspiring FablePals story about truth, responsibility, and learning from mistakes.</p>\r\n<p data-start=\"610\" data-end=\"918\">When Luna dreams of becoming the best young reporter in FabVille, she rushes to share a big &ldquo;breaking news&rdquo; story before checking the facts. But when things don&rsquo;t go as planned, she learns the true meaning of <strong data-start=\"819\" data-end=\"870\">honesty, patience, and verifying before sharing</strong> &mdash; a wonderful lesson for curious young minds!</p>\r\n<p data-start=\"920\" data-end=\"1090\">This storybook transforms ordinary <strong data-start=\"955\" data-end=\"986\">screen time into smart time</strong> &mdash; perfect for reading on tablets, phones, or as a printed story for bedtime and classroom activities.</p>\r\n<hr data-start=\"1092\" data-end=\"1095\">\r\n<h3 data-start=\"1097\" data-end=\"1123\"><span style=\"font-size: 12pt;\">✨ <strong data-start=\"1103\" data-end=\"1121\">What&rsquo;s Inside:</strong></span></h3>\r\n<p data-start=\"1124\" data-end=\"1177\">📘 1 Complete Storybook: Luna&rsquo;s Big Breaking News</p>\r\n<ul data-start=\"1178\" data-end=\"1441\">\r\n<li data-start=\"1178\" data-end=\"1230\">\r\n<p data-start=\"1180\" data-end=\"1230\">Full-color <strong data-start=\"1191\" data-end=\"1203\">PDF file</strong> &ndash; ready to read or print</p>\r\n</li>\r\n<li data-start=\"1231\" data-end=\"1305\">\r\n<p data-start=\"1233\" data-end=\"1305\"><strong data-start=\"1233\" data-end=\"1246\">PNG pages</strong> included &ndash; ideal for tablets, phones, or custom printing</p>\r\n</li>\r\n<li data-start=\"1306\" data-end=\"1368\">\r\n<p data-start=\"1308\" data-end=\"1368\">Engaging Pixar-style illustrations and easy-to-follow text</p>\r\n</li>\r\n<li data-start=\"1369\" data-end=\"1441\">\r\n<p data-start=\"1371\" data-end=\"1441\">Moral message: &ldquo;Always check the facts before spreading the news.&rdquo;</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1443\" data-end=\"1446\">\r\n<h3 data-start=\"1448\" data-end=\"1475\"><span style=\"font-size: 12pt;\">🖨️ <strong data-start=\"1456\" data-end=\"1473\">File Details:</strong></span></h3>\r\n<ul data-start=\"1476\" data-end=\"1622\">\r\n<li data-start=\"1476\" data-end=\"1523\">\r\n<p data-start=\"1478\" data-end=\"1523\">Format: PDF + PNGs (included in ZIP folder)</p>\r\n</li>\r\n<li data-start=\"1524\" data-end=\"1568\">\r\n<p data-start=\"1526\" data-end=\"1568\">Print size:&nbsp; 8x9 inch (ready to print)</p>\r\n</li>\r\n<li data-start=\"1569\" data-end=\"1622\">\r\n<p data-start=\"1571\" data-end=\"1622\">Works seamlessly on tablets, phones, and desktops</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1624\" data-end=\"1878\">💡 <strong data-start=\"1627\" data-end=\"1646\">To Access PNGs:</strong><br data-start=\"1646\" data-end=\"1649\">1️⃣ Download and locate the ZIP file<br data-start=\"1685\" data-end=\"1688\">2️⃣ Right-click &rarr; <strong data-start=\"1706\" data-end=\"1721\">Extract All</strong> (Windows) or double-click to unzip (Mac)<br data-start=\"1762\" data-end=\"1765\">3️⃣ Use any free unzip tool (WinZip, 7-Zip, WinRAR)<br data-start=\"1816\" data-end=\"1819\">4️⃣ Open the folder to explore all story pages instantly!</p>\r\n<hr data-start=\"1880\" data-end=\"1883\">\r\n<h3 data-start=\"1885\" data-end=\"1909\"><span style=\"font-size: 12pt;\">📘 <strong data-start=\"1892\" data-end=\"1907\">How to Use:</strong></span></h3>\r\n<p data-start=\"1910\" data-end=\"2108\">✅ Read digitally on tablets or phones<br data-start=\"1947\" data-end=\"1950\">✅ Print the pages to create your own storybook<br data-start=\"1996\" data-end=\"1999\">✅ Encourage kids to discuss the story&rsquo;s message<br data-start=\"2046\" data-end=\"2049\">✅ Great for home learning, classrooms, or bedtime reading</p>\r\n<hr data-start=\"2110\" data-end=\"2113\">\r\n<h3 data-start=\"2115\" data-end=\"2143\"><span style=\"font-size: 12pt;\">🎥 <strong data-start=\"2122\" data-end=\"2141\">Bonus Learning:</strong></span></h3>\r\n<p data-start=\"2144\" data-end=\"2292\">Watch Luna&rsquo;s fun adventures and moral lessons on our YouTube Channel:<br data-start=\"2213\" data-end=\"2216\">👉 <a class=\"decorated-link\" href=\"https://www.youtube.com/@FablePalsTV?sub_confirmation=1\" target=\"_new\" rel=\"noopener\" data-start=\"2219\" data-end=\"2290\">FablePals TV</a></p>\r\n<p data-start=\"2294\" data-end=\"2377\">Let your little ones learn how truth and kindness always make the best story! 🌸✨</p>', NULL, NULL, NULL, '2025-11-03 16:04:49', '2025-11-03 16:04:49'),
(99, 37, 'hi', 'Luna’s Big Breaking News Storybook (Digital Download)', 'Join Luna on her adventure to uncover the truth and learn why honesty matters most! A delightful moral storybook for kids available in PDF & PNG formats. Read on any device or print at home.', '<p data-start=\"443\" data-end=\"608\">Step into the world of <strong data-start=\"466\" data-end=\"478\">FabVille</strong> with <strong data-start=\"484\" data-end=\"512\">Luna&rsquo;s Big Breaking News</strong> 🐰🗞️ &mdash; an inspiring FablePals story about truth, responsibility, and learning from mistakes.</p>\r\n<p data-start=\"610\" data-end=\"918\">When Luna dreams of becoming the best young reporter in FabVille, she rushes to share a big &ldquo;breaking news&rdquo; story before checking the facts. But when things don&rsquo;t go as planned, she learns the true meaning of <strong data-start=\"819\" data-end=\"870\">honesty, patience, and verifying before sharing</strong> &mdash; a wonderful lesson for curious young minds!</p>\r\n<p data-start=\"920\" data-end=\"1090\">This storybook transforms ordinary <strong data-start=\"955\" data-end=\"986\">screen time into smart time</strong> &mdash; perfect for reading on tablets, phones, or as a printed story for bedtime and classroom activities.</p>\r\n<hr data-start=\"1092\" data-end=\"1095\">\r\n<h3 data-start=\"1097\" data-end=\"1123\"><span style=\"font-size: 12pt;\">✨ <strong data-start=\"1103\" data-end=\"1121\">What&rsquo;s Inside:</strong></span></h3>\r\n<p data-start=\"1124\" data-end=\"1177\">📘 1 Complete Storybook: Luna&rsquo;s Big Breaking News</p>\r\n<ul data-start=\"1178\" data-end=\"1441\">\r\n<li data-start=\"1178\" data-end=\"1230\">\r\n<p data-start=\"1180\" data-end=\"1230\">Full-color <strong data-start=\"1191\" data-end=\"1203\">PDF file</strong> &ndash; ready to read or print</p>\r\n</li>\r\n<li data-start=\"1231\" data-end=\"1305\">\r\n<p data-start=\"1233\" data-end=\"1305\"><strong data-start=\"1233\" data-end=\"1246\">PNG pages</strong> included &ndash; ideal for tablets, phones, or custom printing</p>\r\n</li>\r\n<li data-start=\"1306\" data-end=\"1368\">\r\n<p data-start=\"1308\" data-end=\"1368\">Engaging Pixar-style illustrations and easy-to-follow text</p>\r\n</li>\r\n<li data-start=\"1369\" data-end=\"1441\">\r\n<p data-start=\"1371\" data-end=\"1441\">Moral message: &ldquo;Always check the facts before spreading the news.&rdquo;</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1443\" data-end=\"1446\">\r\n<h3 data-start=\"1448\" data-end=\"1475\"><span style=\"font-size: 12pt;\">🖨️ <strong data-start=\"1456\" data-end=\"1473\">File Details:</strong></span></h3>\r\n<ul data-start=\"1476\" data-end=\"1622\">\r\n<li data-start=\"1476\" data-end=\"1523\">\r\n<p data-start=\"1478\" data-end=\"1523\">Format: PDF + PNGs (included in ZIP folder)</p>\r\n</li>\r\n<li data-start=\"1524\" data-end=\"1568\">\r\n<p data-start=\"1526\" data-end=\"1568\">Print size:&nbsp; 8x9 inch (ready to print)</p>\r\n</li>\r\n<li data-start=\"1569\" data-end=\"1622\">\r\n<p data-start=\"1571\" data-end=\"1622\">Works seamlessly on tablets, phones, and desktops</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1624\" data-end=\"1878\">💡 <strong data-start=\"1627\" data-end=\"1646\">To Access PNGs:</strong><br data-start=\"1646\" data-end=\"1649\">1️⃣ Download and locate the ZIP file<br data-start=\"1685\" data-end=\"1688\">2️⃣ Right-click &rarr; <strong data-start=\"1706\" data-end=\"1721\">Extract All</strong> (Windows) or double-click to unzip (Mac)<br data-start=\"1762\" data-end=\"1765\">3️⃣ Use any free unzip tool (WinZip, 7-Zip, WinRAR)<br data-start=\"1816\" data-end=\"1819\">4️⃣ Open the folder to explore all story pages instantly!</p>\r\n<hr data-start=\"1880\" data-end=\"1883\">\r\n<h3 data-start=\"1885\" data-end=\"1909\"><span style=\"font-size: 12pt;\">📘 <strong data-start=\"1892\" data-end=\"1907\">How to Use:</strong></span></h3>\r\n<p data-start=\"1910\" data-end=\"2108\">✅ Read digitally on tablets or phones<br data-start=\"1947\" data-end=\"1950\">✅ Print the pages to create your own storybook<br data-start=\"1996\" data-end=\"1999\">✅ Encourage kids to discuss the story&rsquo;s message<br data-start=\"2046\" data-end=\"2049\">✅ Great for home learning, classrooms, or bedtime reading</p>\r\n<hr data-start=\"2110\" data-end=\"2113\">\r\n<h3 data-start=\"2115\" data-end=\"2143\"><span style=\"font-size: 12pt;\">🎥 <strong data-start=\"2122\" data-end=\"2141\">Bonus Learning:</strong></span></h3>\r\n<p data-start=\"2144\" data-end=\"2292\">Watch Luna&rsquo;s fun adventures and moral lessons on our YouTube Channel:<br data-start=\"2213\" data-end=\"2216\">👉 <a class=\"decorated-link\" href=\"https://www.youtube.com/@FablePalsTV?sub_confirmation=1\" target=\"_new\" rel=\"noopener\" data-start=\"2219\" data-end=\"2290\">FablePals TV</a></p>\r\n<p data-start=\"2294\" data-end=\"2377\">Let your little ones learn how truth and kindness always make the best story! 🌸✨</p>', NULL, NULL, NULL, '2025-11-03 16:04:49', '2025-11-03 16:04:49'),
(100, 38, 'en', 'Tiggo 4K Desktop Wallpaper Bundle ( Digital Download )', 'Tiggo 4K Wallpaper Bundle – 9 exclusive cinematic wallpapers featuring Tiggo’s cub, wielder, and guardian forms from FablePals. Each design captures his Earth energy, adventures, and gadgets in vivid 4K quality.', '<p data-start=\"533\" data-end=\"693\">Step into the world of <strong data-start=\"556\" data-end=\"571\">Terra Prime</strong> with this <strong data-start=\"582\" data-end=\"629\">exclusive 9-wallpaper 4K desktop collection</strong> featuring <strong data-start=\"640\" data-end=\"649\">Tiggo</strong>, the brave baby tiger from FablePals! 🐯✨</p>\r\n<p data-start=\"695\" data-end=\"915\">From his humble cub days in the village to his mighty <strong data-start=\"749\" data-end=\"766\">Earth Wielder</strong> and <strong data-start=\"771\" data-end=\"788\">Guardian Form</strong>, each wallpaper captures Tiggo&rsquo;s journey in stunning <strong data-start=\"842\" data-end=\"870\">Pixar-quality 3D renders</strong>. Experience every phase of his adventure &mdash;</p>\r\n<ul data-start=\"916\" data-end=\"1245\">\r\n<li data-start=\"916\" data-end=\"972\">\r\n<p data-start=\"918\" data-end=\"972\">Tiggo&rsquo;s <strong data-start=\"926\" data-end=\"938\">Cub Form</strong>: Innocent and full of dreams 🌅</p>\r\n</li>\r\n<li data-start=\"973\" data-end=\"1032\">\r\n<p data-start=\"975\" data-end=\"1032\"><strong data-start=\"975\" data-end=\"991\">Wielder Form</strong>: Hammer charged with emerald energy ⚒️</p>\r\n</li>\r\n<li data-start=\"1033\" data-end=\"1102\">\r\n<p data-start=\"1035\" data-end=\"1102\"><strong data-start=\"1035\" data-end=\"1052\">Guardian Form</strong>: Standing beside the colossal Earth Guardian 🌋</p>\r\n</li>\r\n<li data-start=\"1103\" data-end=\"1177\">\r\n<p data-start=\"1105\" data-end=\"1177\"><strong data-start=\"1105\" data-end=\"1122\">Action Scenes</strong> with his crystal bike, gadgets, and hammer strikes ⚡</p>\r\n</li>\r\n<li data-start=\"1178\" data-end=\"1245\">\r\n<p data-start=\"1180\" data-end=\"1245\"><strong data-start=\"1180\" data-end=\"1200\">Peaceful Moments</strong> like the Lantern Night of Terra Village 🎇</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1247\" data-end=\"1454\">Perfect for both <strong data-start=\"1264\" data-end=\"1299\">desktop and widescreen displays</strong>, these wallpapers are crafted in <strong data-start=\"1333\" data-end=\"1357\">cinematic 4K clarity</strong> with rich lighting, glowing effects, and balanced composition &mdash; making every frame come alive.</p>\r\n<p data-start=\"1456\" data-end=\"1581\">Bring Tiggo&rsquo;s courage, curiosity, and elemental power to your screen and keep the spirit of FablePals glowing every day! 💚</p>\r\n<p data-start=\"1456\" data-end=\"1581\">🔗 <strong data-start=\"1586\" data-end=\"1627\">Learn more about Tiggo and his story:</strong> <a class=\"decorated-link cursor-pointer\" title=\"Tiggo\" href=\"../../../character/tiggo-the-leader\" target=\"_blank\" rel=\"noopener\" data-start=\"1628\" data-end=\"1685\">www.fablepals.com/tiggo</a></p>', NULL, NULL, NULL, '2025-11-05 11:24:52', '2025-11-05 11:36:45'),
(101, 38, 'hi', 'Tiggo 4K Desktop Wallpaper Bundle ( Digital Download )', 'Tiggo 4K Wallpaper Bundle – 9 exclusive cinematic wallpapers featuring Tiggo’s cub, wielder, and guardian forms from FablePals. Each design captures his Earth energy, adventures, and gadgets in vivid 4K quality.', '<p data-start=\"533\" data-end=\"693\">Step into the world of <strong data-start=\"556\" data-end=\"571\">Terra Prime</strong> with this <strong data-start=\"582\" data-end=\"629\">exclusive 9-wallpaper 4K desktop collection</strong> featuring <strong data-start=\"640\" data-end=\"649\">Tiggo</strong>, the brave baby tiger from FablePals! 🐯✨</p>\r\n<p data-start=\"695\" data-end=\"915\">From his humble cub days in the village to his mighty <strong data-start=\"749\" data-end=\"766\">Earth Wielder</strong> and <strong data-start=\"771\" data-end=\"788\">Guardian Form</strong>, each wallpaper captures Tiggo&rsquo;s journey in stunning <strong data-start=\"842\" data-end=\"870\">Pixar-quality 3D renders</strong>. Experience every phase of his adventure &mdash;</p>\r\n<ul data-start=\"916\" data-end=\"1245\">\r\n<li data-start=\"916\" data-end=\"972\">\r\n<p data-start=\"918\" data-end=\"972\">Tiggo&rsquo;s <strong data-start=\"926\" data-end=\"938\">Cub Form</strong>: Innocent and full of dreams 🌅</p>\r\n</li>\r\n<li data-start=\"973\" data-end=\"1032\">\r\n<p data-start=\"975\" data-end=\"1032\"><strong data-start=\"975\" data-end=\"991\">Wielder Form</strong>: Hammer charged with emerald energy ⚒️</p>\r\n</li>\r\n<li data-start=\"1033\" data-end=\"1102\">\r\n<p data-start=\"1035\" data-end=\"1102\"><strong data-start=\"1035\" data-end=\"1052\">Guardian Form</strong>: Standing beside the colossal Earth Guardian 🌋</p>\r\n</li>\r\n<li data-start=\"1103\" data-end=\"1177\">\r\n<p data-start=\"1105\" data-end=\"1177\"><strong data-start=\"1105\" data-end=\"1122\">Action Scenes</strong> with his crystal bike, gadgets, and hammer strikes ⚡</p>\r\n</li>\r\n<li data-start=\"1178\" data-end=\"1245\">\r\n<p data-start=\"1180\" data-end=\"1245\"><strong data-start=\"1180\" data-end=\"1200\">Peaceful Moments</strong> like the Lantern Night of Terra Village 🎇</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1247\" data-end=\"1454\">Perfect for both <strong data-start=\"1264\" data-end=\"1299\">desktop and widescreen displays</strong>, these wallpapers are crafted in <strong data-start=\"1333\" data-end=\"1357\">cinematic 4K clarity</strong> with rich lighting, glowing effects, and balanced composition &mdash; making every frame come alive.</p>\r\n<p data-start=\"1456\" data-end=\"1581\">Bring Tiggo&rsquo;s courage, curiosity, and elemental power to your screen and keep the spirit of FablePals glowing every day! 💚</p>', NULL, NULL, NULL, '2025-11-05 11:24:52', '2025-11-05 11:24:52'),
(102, 39, 'en', 'Tiggo Mobile Wallpaper Bundle ( Digital Download )', '10 exclusive high-quality mobile wallpapers featuring Tiggo from FablePals — cub, wielder, guardian, attack, and happy poses. Beautifully crafted in cinematic 4K and optimized for smartphones.', '<p data-start=\"385\" data-end=\"543\">Bring the heart and heroism of <strong data-start=\"416\" data-end=\"425\">Tiggo</strong>, the beloved baby tiger from <strong data-start=\"455\" data-end=\"468\">FablePals</strong>, straight to your phone with this <strong data-start=\"503\" data-end=\"540\">exclusive mobile wallpaper bundle</strong>.</p>\r\n<p data-start=\"545\" data-end=\"823\">This collection includes <strong data-start=\"570\" data-end=\"609\">10 high-quality vertical wallpapers</strong>, beautifully crafted in <strong data-start=\"634\" data-end=\"657\">cinematic 4K detail</strong> and optimized for modern smartphones. Each wallpaper captures a unique side of Tiggo&rsquo;s journey &mdash; from his innocent beginnings to his powerful Earth-wielding destiny.</p>\r\n<p data-start=\"825\" data-end=\"872\">Inside this bundle, you&rsquo;ll experience Tiggo in:</p>\r\n<ul data-start=\"873\" data-end=\"1208\">\r\n<li data-start=\"873\" data-end=\"929\">\r\n<p data-start=\"875\" data-end=\"929\">His <strong data-start=\"879\" data-end=\"891\">Cub Form</strong> &mdash; pure, curious, and full of wonder</p>\r\n</li>\r\n<li data-start=\"930\" data-end=\"1002\">\r\n<p data-start=\"932\" data-end=\"1002\">His <strong data-start=\"936\" data-end=\"958\">Earth Wielder Form</strong> &mdash; armored and glowing with emerald energy</p>\r\n</li>\r\n<li data-start=\"1003\" data-end=\"1072\">\r\n<p data-start=\"1005\" data-end=\"1072\">His mighty <strong data-start=\"1016\" data-end=\"1033\">Guardian Form</strong> &mdash; standing strong with ancient power</p>\r\n</li>\r\n<li data-start=\"1073\" data-end=\"1136\">\r\n<p data-start=\"1075\" data-end=\"1136\">Dynamic <strong data-start=\"1083\" data-end=\"1099\">Attack Poses</strong> &mdash; hammer strikes and battle energy</p>\r\n</li>\r\n<li data-start=\"1137\" data-end=\"1208\">\r\n<p data-start=\"1139\" data-end=\"1208\">Warm <strong data-start=\"1144\" data-end=\"1171\">Happy &amp; Emotional Poses</strong> &mdash; showcasing Tiggo&rsquo;s joyful spirit</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1210\" data-end=\"1483\">Every wallpaper is carefully composed for <strong data-start=\"1252\" data-end=\"1275\">9:16 mobile screens</strong>, ensuring perfect framing, vivid colors, and smooth depth without cropping or distortion. Whether you want an energetic lock screen or a calming home screen, this bundle gives you a wallpaper for every mood.</p>\r\n<p data-start=\"1485\" data-end=\"1631\">This is not just a wallpaper pack &mdash; it&rsquo;s a <strong data-start=\"1528\" data-end=\"1554\">piece of Tiggo&rsquo;s story</strong>, designed for fans who want to keep the spirit of FablePals close every day.</p>\r\n<p data-start=\"1485\" data-end=\"1631\">🔗&nbsp;<strong>Learn more about Tiggo and his story:</strong>&nbsp;<a title=\"Tiggo\" href=\"../../character/tiggo-the-leader\">www.fablepals.com/tiggo</a></p>', NULL, NULL, NULL, '2026-01-26 05:44:13', '2026-01-26 05:44:13'),
(103, 39, 'hi', 'Tiggo Mobile Wallpaper Bundle ( Digital Download )', '10 exclusive high-quality mobile wallpapers featuring Tiggo from FablePals — cub, wielder, guardian, attack, and happy poses. Beautifully crafted in cinematic 4K and optimized for smartphones.', '<p data-start=\"385\" data-end=\"543\">Bring the heart and heroism of <strong data-start=\"416\" data-end=\"425\">Tiggo</strong>, the beloved baby tiger from <strong data-start=\"455\" data-end=\"468\">FablePals</strong>, straight to your phone with this <strong data-start=\"503\" data-end=\"540\">exclusive mobile wallpaper bundle</strong>.</p>\r\n<p data-start=\"545\" data-end=\"823\">This collection includes <strong data-start=\"570\" data-end=\"609\">10 high-quality vertical wallpapers</strong>, beautifully crafted in <strong data-start=\"634\" data-end=\"657\">cinematic 4K detail</strong> and optimized for modern smartphones. Each wallpaper captures a unique side of Tiggo&rsquo;s journey &mdash; from his innocent beginnings to his powerful Earth-wielding destiny.</p>\r\n<p data-start=\"825\" data-end=\"872\">Inside this bundle, you&rsquo;ll experience Tiggo in:</p>\r\n<ul data-start=\"873\" data-end=\"1208\">\r\n<li data-start=\"873\" data-end=\"929\">\r\n<p data-start=\"875\" data-end=\"929\">His <strong data-start=\"879\" data-end=\"891\">Cub Form</strong> &mdash; pure, curious, and full of wonder</p>\r\n</li>\r\n<li data-start=\"930\" data-end=\"1002\">\r\n<p data-start=\"932\" data-end=\"1002\">His <strong data-start=\"936\" data-end=\"958\">Earth Wielder Form</strong> &mdash; armored and glowing with emerald energy</p>\r\n</li>\r\n<li data-start=\"1003\" data-end=\"1072\">\r\n<p data-start=\"1005\" data-end=\"1072\">His mighty <strong data-start=\"1016\" data-end=\"1033\">Guardian Form</strong> &mdash; standing strong with ancient power</p>\r\n</li>\r\n<li data-start=\"1073\" data-end=\"1136\">\r\n<p data-start=\"1075\" data-end=\"1136\">Dynamic <strong data-start=\"1083\" data-end=\"1099\">Attack Poses</strong> &mdash; hammer strikes and battle energy</p>\r\n</li>\r\n<li data-start=\"1137\" data-end=\"1208\">\r\n<p data-start=\"1139\" data-end=\"1208\">Warm <strong data-start=\"1144\" data-end=\"1171\">Happy &amp; Emotional Poses</strong> &mdash; showcasing Tiggo&rsquo;s joyful spirit</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1210\" data-end=\"1483\">Every wallpaper is carefully composed for <strong data-start=\"1252\" data-end=\"1275\">9:16 mobile screens</strong>, ensuring perfect framing, vivid colors, and smooth depth without cropping or distortion. Whether you want an energetic lock screen or a calming home screen, this bundle gives you a wallpaper for every mood.</p>\r\n<p data-start=\"1485\" data-end=\"1631\">This is not just a wallpaper pack &mdash; it&rsquo;s a <strong data-start=\"1528\" data-end=\"1554\">piece of Tiggo&rsquo;s story</strong>, designed for fans who want to keep the spirit of FablePals close every day.</p>\r\n<p data-start=\"1485\" data-end=\"1631\">🔗&nbsp;<strong>Learn more about Tiggo and his story:</strong>&nbsp;<a title=\"Tiggo\" href=\"../../character/tiggo-the-leader\">www.fablepals.com/tiggo</a></p>', NULL, NULL, NULL, '2026-01-26 05:44:13', '2026-01-26 05:44:13'),
(104, 40, 'en', 'Educational Animal Learning PDF for Kids [ Digital Download ]', 'Help your little one explore the animal kingdom! This digital bundle includes an Animal Learning PDF with short, kid-friendly facts  — perfect for preschool and early learners. [ Digital Download ]', '<p data-start=\"592\" data-end=\"888\">Introduce your child to the amazing world of animals with this <strong data-start=\"655\" data-end=\"701\">fun and educational Animal Learning Bundle</strong>! Designed especially for young learners, this digital product helps kids recognize famous and well-known animals through <strong data-start=\"823\" data-end=\"887\">beautiful photos and simple, easy-to-understand descriptions</strong>.</p>\r\n<p data-start=\"890\" data-end=\"1045\">Perfect for early learning, homeschooling, preschool, and kindergarten activities, this bundle makes learning about animals exciting and visually engaging.</p>\r\n<h3 data-start=\"1047\" data-end=\"1069\"><span style=\"font-size: 12pt;\">📦 What&rsquo;s Included</span></h3>\r\n<ul data-start=\"1070\" data-end=\"1260\">\r\n<li data-start=\"1070\" data-end=\"1159\">\r\n<p data-start=\"1072\" data-end=\"1159\"><strong data-start=\"1072\" data-end=\"1102\">1 Animal Learning PDF Book &amp; ZIP File</strong>&nbsp;&ndash; Famous animals with short, kid-friendly descriptions</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"1262\" data-end=\"1286\"><span style=\"font-size: 12pt;\">🎯 Benefits for Kids</span></h3>\r\n<ul data-start=\"1287\" data-end=\"1522\">\r\n<li data-start=\"1287\" data-end=\"1331\">\r\n<p data-start=\"1289\" data-end=\"1331\">Improves animal recognition &amp; vocabulary</p>\r\n</li>\r\n<li data-start=\"1332\" data-end=\"1380\">\r\n<p data-start=\"1334\" data-end=\"1380\">Encourages curiosity about nature &amp; wildlife</p>\r\n</li>\r\n<li data-start=\"1381\" data-end=\"1424\">\r\n<p data-start=\"1383\" data-end=\"1424\">Visual learning with real animal photos</p>\r\n</li>\r\n<li data-start=\"1425\" data-end=\"1471\">\r\n<p data-start=\"1427\" data-end=\"1471\">Simple descriptions for easy understanding</p>\r\n</li>\r\n<li data-start=\"1472\" data-end=\"1522\">\r\n<p data-start=\"1474\" data-end=\"1522\">Great for early readers and preschool learners</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"1524\" data-end=\"1540\"><span style=\"font-size: 12pt;\">👶 Ideal For</span></h3>\r\n<ul data-start=\"1541\" data-end=\"1661\">\r\n<li data-start=\"1541\" data-end=\"1559\">\r\n<p data-start=\"1543\" data-end=\"1559\">Ages 2&ndash;6 years</p>\r\n</li>\r\n<li data-start=\"1560\" data-end=\"1593\">\r\n<p data-start=\"1562\" data-end=\"1593\">Preschool &amp; Kindergarten kids</p>\r\n</li>\r\n<li data-start=\"1594\" data-end=\"1630\">\r\n<p data-start=\"1596\" data-end=\"1630\">Homeschooling parents &amp; teachers</p>\r\n</li>\r\n<li data-start=\"1631\" data-end=\"1661\">\r\n<p data-start=\"1633\" data-end=\"1661\">Early learners &amp; beginners</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1663\" data-end=\"1765\">Make learning fun and interactive &mdash; let your little explorer discover the animal kingdom today!</p>', NULL, NULL, NULL, '2026-02-19 11:04:11', '2026-02-19 11:04:11'),
(105, 40, 'hi', 'Educational Animal Learning PDF for Kids [ Digital Download ]', 'Help your little one explore the animal kingdom! This digital bundle includes an Animal Learning PDF with short, kid-friendly facts  — perfect for preschool and early learners. [ Digital Download ]', '<p data-start=\"592\" data-end=\"888\">Introduce your child to the amazing world of animals with this <strong data-start=\"655\" data-end=\"701\">fun and educational Animal Learning Bundle</strong>! Designed especially for young learners, this digital product helps kids recognize famous and well-known animals through <strong data-start=\"823\" data-end=\"887\">beautiful photos and simple, easy-to-understand descriptions</strong>.</p>\r\n<p data-start=\"890\" data-end=\"1045\">Perfect for early learning, homeschooling, preschool, and kindergarten activities, this bundle makes learning about animals exciting and visually engaging.</p>\r\n<h3 data-start=\"1047\" data-end=\"1069\"><span style=\"font-size: 12pt;\">📦 What&rsquo;s Included</span></h3>\r\n<ul data-start=\"1070\" data-end=\"1260\">\r\n<li data-start=\"1070\" data-end=\"1159\">\r\n<p data-start=\"1072\" data-end=\"1159\"><strong data-start=\"1072\" data-end=\"1102\">1 Animal Learning PDF Book &amp; ZIP File</strong>&nbsp;&ndash; Famous animals with short, kid-friendly descriptions</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"1262\" data-end=\"1286\"><span style=\"font-size: 12pt;\">🎯 Benefits for Kids</span></h3>\r\n<ul data-start=\"1287\" data-end=\"1522\">\r\n<li data-start=\"1287\" data-end=\"1331\">\r\n<p data-start=\"1289\" data-end=\"1331\">Improves animal recognition &amp; vocabulary</p>\r\n</li>\r\n<li data-start=\"1332\" data-end=\"1380\">\r\n<p data-start=\"1334\" data-end=\"1380\">Encourages curiosity about nature &amp; wildlife</p>\r\n</li>\r\n<li data-start=\"1381\" data-end=\"1424\">\r\n<p data-start=\"1383\" data-end=\"1424\">Visual learning with real animal photos</p>\r\n</li>\r\n<li data-start=\"1425\" data-end=\"1471\">\r\n<p data-start=\"1427\" data-end=\"1471\">Simple descriptions for easy understanding</p>\r\n</li>\r\n<li data-start=\"1472\" data-end=\"1522\">\r\n<p data-start=\"1474\" data-end=\"1522\">Great for early readers and preschool learners</p>\r\n</li>\r\n</ul>\r\n<h3 data-start=\"1524\" data-end=\"1540\"><span style=\"font-size: 12pt;\">👶 Ideal For</span></h3>\r\n<ul data-start=\"1541\" data-end=\"1661\">\r\n<li data-start=\"1541\" data-end=\"1559\">\r\n<p data-start=\"1543\" data-end=\"1559\">Ages 2&ndash;6 years</p>\r\n</li>\r\n<li data-start=\"1560\" data-end=\"1593\">\r\n<p data-start=\"1562\" data-end=\"1593\">Preschool &amp; Kindergarten kids</p>\r\n</li>\r\n<li data-start=\"1594\" data-end=\"1630\">\r\n<p data-start=\"1596\" data-end=\"1630\">Homeschooling parents &amp; teachers</p>\r\n</li>\r\n<li data-start=\"1631\" data-end=\"1661\">\r\n<p data-start=\"1633\" data-end=\"1661\">Early learners &amp; beginners</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1663\" data-end=\"1765\">Make learning fun and interactive &mdash; let your little explorer discover the animal kingdom today!</p>', NULL, NULL, NULL, '2026-02-19 11:04:11', '2026-02-19 11:04:11');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` text NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `project_date` varchar(255) NOT NULL,
  `project_author` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_two` varchar(255) DEFAULT NULL,
  `image_three` varchar(255) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `miraculous` varchar(255) DEFAULT NULL,
  `transformation` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `weapon` varchar(255) DEFAULT NULL,
  `kwami` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_galleries`
--

CREATE TABLE `project_galleries` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_galleries`
--

INSERT INTO `project_galleries` (`id`, `project_id`, `image`, `updated_at`, `created_at`) VALUES
(1, 9, 'uploads/gallery/gallery_1752736626_0.avif', '2025-07-17 07:17:06', '2025-07-17 07:17:06'),
(2, 9, 'uploads/gallery/gallery_1752736626_1.avif', '2025-07-17 07:17:06', '2025-07-17 07:17:06'),
(3, 9, 'uploads/gallery/gallery_1752736626_2.avif', '2025-07-17 07:17:06', '2025-07-17 07:17:06'),
(4, 9, 'uploads/gallery/gallery_1752736626_3.avif', '2025-07-17 07:17:06', '2025-07-17 07:17:06'),
(5, 9, 'uploads/gallery/gallery_1752736626_4.avif', '2025-07-17 07:17:06', '2025-07-17 07:17:06'),
(6, 9, 'uploads/gallery/gallery_1752736626_5.avif', '2025-07-17 07:17:06', '2025-07-17 07:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `project_images`
--

CREATE TABLE `project_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `small_image` varchar(255) NOT NULL,
  `large_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_translations`
--

CREATE TABLE `project_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `project_category` varchar(255) NOT NULL,
  `seo_title` text DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_translations`
--

INSERT INTO `project_translations` (`id`, `project_id`, `lang_code`, `title`, `description`, `project_category`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(7, 3, 'en', 'Blade Fire', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\r\n<h6>Decentralized Platform</h6>\r\n<ul>\r\n<li>BaseCreate is pleased to announce that it has been commissioned.</li>\r\n<li>BaseCreate is pleased to announce that it has been.</li>\r\n<li>BaseCreate is pleased to announce that.</li>\r\n</ul>\r\n<p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p>\r\n<h6>Challenge &amp; Solution</h6>\r\n<p class=\"sec-text mb-n1\">Future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p>\r\n<h6 class=\"mt-35\">Final Result</h6>\r\n<p class=\"sec-text mb-n1\">For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p>', 'A smart Racoon', 'Shopify Redesign for a Nova Scotia Winery', NULL, '2025-05-04 09:05:05', '2025-05-05 08:45:32'),
(8, 3, 'hi', 'नोवा स्कोटिया वाइनरी के लिए शॉपिफ़ाई रीडिज़ाइन', '<p>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि इसे लीटन एशिया द्वारा अपने ब्रांड को पुनः स्थापित करने के लिए कमीशन दिया गया है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य संपार्श्विक को अपडेट करने के लिए जिम्मेदार होंगे।</p>\n                        <h6>विकेंद्रीकृत प्लेटफ़ॉर्म</h6>\n                        <ul>\n                        <li>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि इसे कमीशन दिया गया है।</li>\n                        <li>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है।</li>\n                        </ul>\n                        <p>लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे सम्मानित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतर्राष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढांचे की परियोजनाओं को पूरा किया है।</p>\n\n                        <h6>चुनौती और समाधान</h6>\n                        <p class=\"sec-text mb-n1\">भविष्य, क्योंकि यह अपने ग्राहकों के लिए दीर्घकालिक मूल्य प्रदान करने के लिए तकनीकी नवाचार और टिकाऊ निर्माण प्रथाओं में उद्योग का नेतृत्व करना चाहता है।</p>\n                        <h6 class=\"mt-35\">अंतिम परिणाम</h6>\n                        <p class=\"sec-text mb-n1\">लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक, स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढांचे की परियोजनाओं को पूरा किया है।</p>', 'Shopify', 'नोवा स्कोटिया वाइनरी के लिए शॉपिफ़ाई रीडिज़ाइन', NULL, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(10, 4, 'en', 'Kai', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\r\n<h6>Decentralized Platform</h6>\r\n<ul>\r\n<li>BaseCreate is pleased to announce that it has been commissioned.</li>\r\n<li>BaseCreate is pleased to announce that it has been.</li>\r\n<li>BaseCreate is pleased to announce that.</li>\r\n</ul>\r\n<p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p>\r\n<h6>Challenge &amp; Solution</h6>\r\n<p class=\"sec-text mb-n1\">Future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p>\r\n<h6 class=\"mt-35\">Final Result</h6>\r\n<p class=\"sec-text mb-n1\">For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p>', 'Stealth Lion', 'Anti Money Laundering Compliance Scanner', NULL, '2025-05-04 09:05:05', '2025-05-05 08:44:14'),
(11, 4, 'hi', 'एंटी मनी लॉन्ड्रिंग अनुपालन स्कैनर', '<p>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि इसे लीटन एशिया द्वारा अपने ब्रांड को पुनः स्थापित करने के लिए कमीशन दिया गया है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य संपार्श्विक को अपडेट करने के लिए जिम्मेदार होंगे।</p>\n                        <h6>विकेंद्रीकृत प्लेटफ़ॉर्म</h6>\n                        <ul>\n                        <li>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि इसे कमीशन दिया गया है।</li>\n                        <li>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है।</li>\n                        </ul>\n                        <p>लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे सम्मानित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतर्राष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढांचे की परियोजनाओं को पूरा किया है।</p>\n\n                        <h6>चुनौती और समाधान</h6>\n                        <p class=\"sec-text mb-n1\">भविष्य, क्योंकि यह अपने ग्राहकों के लिए दीर्घकालिक मूल्य प्रदान करने के लिए तकनीकी नवाचार और टिकाऊ निर्माण प्रथाओं में उद्योग का नेतृत्व करना चाहता है।</p>\n                        <h6 class=\"mt-35\">अंतिम परिणाम</h6>\n                        <p class=\"sec-text mb-n1\">लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक, स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढांचे की परियोजनाओं को पूरा किया है।</p>', 'ब्रांडिंग', 'एंटी मनी लॉन्ड्रिंग अनुपालन स्कैनर', NULL, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(13, 5, 'en', 'Bolt', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\r\n<h6>Decentralized Platform</h6>\r\n<ul>\r\n<li>BaseCreate is pleased to announce that it has been commissioned.</li>\r\n<li>BaseCreate is pleased to announce that it has been.</li>\r\n<li>BaseCreate is pleased to announce that.</li>\r\n</ul>\r\n<p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p>\r\n<h6>Challenge &amp; Solution</h6>\r\n<p class=\"sec-text mb-n1\">Future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p>\r\n<h6 class=\"mt-35\">Final Result</h6>\r\n<p class=\"sec-text mb-n1\">For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p>', 'Intelligent bear', 'Decentralized Lending Platform for Students', NULL, '2025-05-04 09:05:05', '2025-05-05 08:42:07'),
(14, 5, 'hi', 'छात्रों के लिए विकेन्द्रीकृत ऋण मंच', '<p>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि इसे लीटन एशिया द्वारा अपने ब्रांड को पुनः स्थापित करने के लिए कमीशन दिया गया है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य संपार्श्विक को अपडेट करने के लिए जिम्मेदार होंगे।</p>\n                        <h6>विकेंद्रीकृत प्लेटफ़ॉर्म</h6>\n                        <ul>\n                        <li>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि इसे कमीशन दिया गया है।</li>\n                        <li>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है।</li>\n                        </ul>\n                        <p>लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे सम्मानित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतर्राष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढांचे की परियोजनाओं को पूरा किया है।</p>\n\n                        <h6>चुनौती और समाधान</h6>\n                        <p class=\"sec-text mb-n1\">भविष्य, क्योंकि यह अपने ग्राहकों के लिए दीर्घकालिक मूल्य प्रदान करने के लिए तकनीकी नवाचार और टिकाऊ निर्माण प्रथाओं में उद्योग का नेतृत्व करना चाहता है।</p>\n                        <h6 class=\"mt-35\">अंतिम परिणाम</h6>\n                        <p class=\"sec-text mb-n1\">लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक, स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढांचे की परियोजनाओं को पूरा किया है।</p>', 'विकास', 'छात्रों के लिए विकेन्द्रीकृत ऋण मंच', NULL, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(16, 6, 'en', 'Our Supreme hero', '<p>BaseCreate is pleased to announce that it has been commissioned by Leighton Asia reposition its brand. We will help Leighton Asia evolve its brand strategy, and will be responsible updating Leighton Asia&rsquo;s brand identity, website, and other collaterals.</p>\r\n<h6>Decentralized Platform</h6>\r\n<ul>\r\n<li>BaseCreate is pleased to announce that it has been commissioned.</li>\r\n<li>BaseCreate is pleased to announce that it has been.</li>\r\n<li>BaseCreate is pleased to announce that.</li>\r\n</ul>\r\n<p>For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p>\r\n<h6>Challenge &amp; Solution</h6>\r\n<p class=\"sec-text mb-n1\">Future, as it seeks to lead the industry in technological innovation and sustainable building practices to deliver long-lasting value for its clients.</p>\r\n<h6 class=\"mt-35\">Final Result</h6>\r\n<p class=\"sec-text mb-n1\">For almost 50 years Leighton Asia, one of the region&rsquo;s largest and most respected construction companies, has been progressively building for a better future by leveraging international expertise with local intelligence. In that time Leighton has delivered some of Asia&rsquo;s prestigious buildings and transformational infrastructure projects.</p>', 'Tiggo', 'Our Supreme Hero', NULL, '2025-05-04 09:05:05', '2025-05-05 08:34:43'),
(17, 6, 'hi', 'मनी लॉन्ड्रिंग अनुपालन स्कैनर', '<p>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि इसे लीटन एशिया द्वारा अपने ब्रांड को पुनः स्थापित करने के लिए कमीशन दिया गया है। हम लीटन एशिया को अपनी ब्रांड रणनीति विकसित करने में मदद करेंगे, और लीटन एशिया की ब्रांड पहचान, वेबसाइट और अन्य संपार्श्विक को अपडेट करने के लिए जिम्मेदार होंगे।</p>\n                        <h6>विकेंद्रीकृत प्लेटफ़ॉर्म</h6>\n                        <ul>\n                        <li>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है कि इसे कमीशन दिया गया है।</li>\n                        <li>बेसक्रिएट को यह घोषणा करते हुए खुशी हो रही है।</li>\n                        </ul>\n                        <p>लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे सम्मानित निर्माण कंपनियों में से एक है, जो स्थानीय बुद्धिमत्ता के साथ अंतर्राष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढांचे की परियोजनाओं को पूरा किया है।</p>\n\n                        <h6>चुनौती और समाधान</h6>\n                        <p class=\"sec-text mb-n1\">भविष्य, क्योंकि यह अपने ग्राहकों के लिए दीर्घकालिक मूल्य प्रदान करने के लिए तकनीकी नवाचार और टिकाऊ निर्माण प्रथाओं में उद्योग का नेतृत्व करना चाहता है।</p>\n                        <h6 class=\"mt-35\">अंतिम परिणाम</h6>\n                        <p class=\"sec-text mb-n1\">लगभग 50 वर्षों से लीटन एशिया, क्षेत्र की सबसे बड़ी और सबसे प्रतिष्ठित निर्माण कंपनियों में से एक, स्थानीय बुद्धिमत्ता के साथ अंतरराष्ट्रीय विशेषज्ञता का लाभ उठाकर बेहतर भविष्य के लिए उत्तरोत्तर निर्माण कर रही है। उस समय में लीटन ने एशिया की कुछ प्रतिष्ठित इमारतों और परिवर्तनकारी बुनियादी ढांचे की परियोजनाओं को पूरा किया है।</p>', 'व्यापार', 'मनी लॉन्ड्रिंग अनुपालन स्कैनर', NULL, '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `refund_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `reason` text NOT NULL,
  `method` varchar(255) NOT NULL,
  `account_information` text NOT NULL,
  `admin_response` text DEFAULT NULL,
  `status` enum('pending','rejected','success') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin', '2025-05-04 09:05:04', '2025-05-04 09:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `home_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `global_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`global_content`)),
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `home_id`, `name`, `global_content`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'hero_section', '{\"action_button_url\":\"\\/portfolios\",\"hero_year_image\":\"uploads\\/custom-images\\/worldwide.svg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'about_section', '{\"button_url\":\"\\/about\",\"image\":\"uploads\\/custom-images\\/about_one.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 1, 'banner_section', '{\"image\":\"uploads\\/custom-images\\/video_1.jpg\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=vvNwlRLjLkU\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 1, 'testimonial_section', '{\"image\":\"uploads\\/custom-images\\/testi_thumb1_1.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 1, 'counter_section', '{\"year_experience_count\":26,\"project_count\":347,\"customer_count\":139}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(6, 1, 'choose_us_section', '{\"image\":\"uploads\\/custom-images\\/choose_us_section_1.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 2, 'hero_section', '{\"action_button_url\":\"https:\\/\\/www.youtube.com\\/channel\\/UC07A6WegbU6Ju8zFW-YH8jQ\",\"image\":\"uploads\\/custom-images\\/wsus-img-2025-05-07-10-10-00-3296.webp\"}', 1, '2025-05-04 09:05:05', '2025-05-07 10:10:00'),
(8, 2, 'service_feature_section', '{\"image\":\"uploads\\/custom-images\\/wsus-img-2025-05-07-09-37-28-5209.jpg\",\"skill_percentage_one\":\"95\",\"skill_percentage_two\":\"85\",\"skill_percentage_three\":\"75\",\"skill_percentage_four\":\"97\"}', 1, '2025-05-04 09:05:05', '2025-05-07 09:52:38'),
(9, 2, 'banner_section', '{\"image\":\"uploads\\/custom-images\\/wsus-img-2025-09-19-05-08-45-1837.webp\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=_XIrawnFjnc\"}', 1, '2025-05-04 09:05:05', '2025-11-07 08:30:31'),
(10, 2, 'testimonial_section', '{\"image\":\"uploads\\/custom-images\\/testi_thumb1_2.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(11, 2, 'counter_section', '{\"year_experience_count\":26,\"project_count\":347,\"customer_count\":139}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(12, 2, 'choose_us_section', '{\"image\":\"uploads\\/custom-images\\/choose_us_section_2.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(13, 3, 'hero_section', '{\"image\":\"uploads\\/custom-images\\/hero-3-1.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(14, 3, 'banner_section', '{\"image\":\"uploads\\/custom-images\\/video_3.jpg\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=vvNwlRLjLkU\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(15, 3, 'testimonial_section', '{\"image\":\"uploads\\/custom-images\\/testi_thumb1_3.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(16, 3, 'counter_section', '{\"year_experience_count\":26,\"project_count\":347,\"customer_count\":139}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(17, 3, 'choose_us_section', '{\"image\":\"uploads\\/custom-images\\/choose_us_section_3.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(18, 4, 'hero_section', '{\"action_button_url\":\"\\/portfolios\",\"image\":\"uploads\\/custom-images\\/hero-4-1.jpg\",\"image_two\":\"uploads\\/custom-images\\/total_customer.png\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(19, 4, 'banner_section', '{\"image\":\"uploads\\/custom-images\\/video_4.jpg\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=vvNwlRLjLkU\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(20, 4, 'testimonial_section', '{\"image\":\"uploads\\/custom-images\\/testi_thumb1_4.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(21, 4, 'counter_section', '{\"year_experience_count\":26,\"project_count\":347,\"customer_count\":139}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(22, 4, 'choose_us_section', '{\"image\":\"uploads\\/custom-images\\/choose_us_section_4.jpg\"}', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `section_settings`
--

CREATE TABLE `section_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hero_section` tinyint(1) NOT NULL DEFAULT 0,
  `about_section` tinyint(1) NOT NULL DEFAULT 0,
  `faq_section` tinyint(1) NOT NULL DEFAULT 0,
  `project_section` tinyint(1) NOT NULL DEFAULT 0,
  `team_section` tinyint(1) NOT NULL DEFAULT 0,
  `testimonial_section` tinyint(1) NOT NULL DEFAULT 0,
  `latest_blog_section` tinyint(1) NOT NULL DEFAULT 0,
  `service_section` tinyint(1) NOT NULL DEFAULT 0,
  `service_feature_section` tinyint(1) NOT NULL DEFAULT 0,
  `award_section` tinyint(1) NOT NULL DEFAULT 0,
  `marquee_section` tinyint(1) NOT NULL DEFAULT 0,
  `call_to_action_section` tinyint(1) NOT NULL DEFAULT 0,
  `counter_section` tinyint(1) NOT NULL DEFAULT 0,
  `choose_us_section` tinyint(1) NOT NULL DEFAULT 0,
  `pricing_section` tinyint(1) NOT NULL DEFAULT 0,
  `contact_us_section` tinyint(1) NOT NULL DEFAULT 0,
  `brands_section` tinyint(1) NOT NULL DEFAULT 0,
  `banner_section` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_settings`
--

INSERT INTO `section_settings` (`id`, `hero_section`, `about_section`, `faq_section`, `project_section`, `team_section`, `testimonial_section`, `latest_blog_section`, `service_section`, `service_feature_section`, `award_section`, `marquee_section`, `call_to_action_section`, `counter_section`, `choose_us_section`, `pricing_section`, `contact_us_section`, `brands_section`, `banner_section`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, '2025-05-04 09:05:05', '2025-09-10 06:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `section_translations`
--

CREATE TABLE `section_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`content`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_translations`
--

INSERT INTO `section_translations` (`id`, `section_id`, `lang_code`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '{\"title\":\"Next Generation\",\"title_two\":\"Digital Agency\",\"sub_title\":\"We are digital agency that helps businesses develop immersive and engaging user experiences that drive top level growth\",\"action_button_text\":\"View Our Works\",\"hero_year_text\":\"Agency of this year worldwide\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'hi', '{\"title\":\"\\u0906\\u0928\\u0947 \\u0935\\u093e\\u0932\\u0940 \\u092a\\u0940\\u0922\\u093c\\u0940\",\"title_two\":\"\\u0921\\u093f\\u091c\\u093f\\u091f\\u0932 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940\",\"sub_title\":\"\\u0939\\u092e \\u0921\\u093f\\u091c\\u093f\\u091f\\u0932 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u0935\\u094d\\u092f\\u0935\\u0938\\u093e\\u092f\\u094b\\u0902 \\u0915\\u094b \\u0935\\u094d\\u092f\\u093e\\u092a\\u0915 \\u0914\\u0930 \\u0906\\u0915\\u0930\\u094d\\u0937\\u0915 \\u0909\\u092a\\u092f\\u094b\\u0917\\u0915\\u0930\\u094d\\u0924\\u093e \\u0905\\u0928\\u0941\\u092d\\u0935 \\u0935\\u093f\\u0915\\u0938\\u093f\\u0924 \\u0915\\u0930\\u0928\\u0947 \\u092e\\u0947\\u0902 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0940 \\u0939\\u0948 \\u091c\\u094b \\u0936\\u0940\\u0930\\u094d\\u0937 \\u0938\\u094d\\u0924\\u0930 \\u0915\\u0947 \\u0935\\u093f\\u0915\\u093e\\u0938 \\u0915\\u094b \\u092c\\u0922\\u093c\\u093e\\u0935\\u093e \\u0926\\u0947\\u0924\\u0940 \\u0939\\u0948\",\"action_button_text\":\"\\u0939\\u092e\\u093e\\u0930\\u0947 \\u0915\\u093e\\u0930\\u094d\\u092f \\u0926\\u0947\\u0916\\u0947\\u0902\",\"hero_year_text\":\"\\u0926\\u0941\\u0928\\u093f\\u092f\\u093e \\u092d\\u0930 \\u092e\\u0947\\u0902 \\u0907\\u0938 \\u0938\\u093e\\u0932 \\u0915\\u0940 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 2, 'en', '{\"title\":\"Unlock Revenue Growth for Your Business\",\"description\":\"If you ask our clients what it\\u2019s like working with 36, they\\u2019ll\\n                                talk about how much we care about their success. For us, real relationships fuel\\n                                real success. We love building brands\\\\\\\\We are a creative agency working with brands building\\n                                insightful strategy, creating unique designs and crafting value\",\"button_text\":\"About Us\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 2, 'hi', '{\"title\":\"\\u0905\\u092a\\u0928\\u0947 \\u0935\\u094d\\u092f\\u0935\\u0938\\u093e\\u092f \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0930\\u093e\\u091c\\u0938\\u094d\\u0935 \\u0935\\u0943\\u0926\\u094d\\u0927\\u093f \\u0905\\u0928\\u0932\\u0949\\u0915 \\u0915\\u0930\\u0947\\u0902\",\"description\":\"\\u0905\\u0917\\u0930 \\u0906\\u092a \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0915\\u094d\\u0932\\u093e\\u0907\\u0902\\u091f \\u0938\\u0947 \\u092a\\u0942\\u091b\\u0947\\u0902 \\u0915\\u093f 36 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u0930\\u0928\\u093e \\u0915\\u0948\\u0938\\u093e \\u0932\\u0917\\u0924\\u093e \\u0939\\u0948, \\u0924\\u094b \\u0935\\u0947 \\u0907\\u0938 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u092c\\u093e\\u0924 \\u0915\\u0930\\u0947\\u0902\\u0917\\u0947 \\u0915\\u093f \\u0939\\u092e \\u0909\\u0928\\u0915\\u0940 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u0947 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u0915\\u093f\\u0924\\u0928\\u093e \\u0927\\u094d\\u092f\\u093e\\u0928 \\u0930\\u0916\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0932\\u093f\\u090f, \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0930\\u093f\\u0936\\u094d\\u0924\\u0947 \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u094b \\u092c\\u0922\\u093c\\u093e\\u0935\\u093e \\u0926\\u0947\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u0947\\u0902 \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921 \\u092c\\u0928\\u093e\\u0928\\u093e \\u092a\\u0938\\u0902\\u0926 \\u0939\\u0948 \\\\\\\\ \\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0941\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0942\\u0932\\u094d\\u092f \\u0924\\u0948\\u092f\\u093e\\u0930 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"button_text\":\"\\u0939\\u092e\\u093e\\u0930\\u0947 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 5, 'en', '{\"year_experience_title\":\"Years of Experience\",\"year_experience_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\",\"project_title\":\"Successful Projects\",\"project_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\",\"customer_title\":\"Satisfied Customers\",\"customer_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 5, 'hi', '{\"year_experience_title\":\"\\u0935\\u0930\\u094d\\u0937\\u094b\\u0902 \\u0915\\u093e \\u0905\\u0928\\u0941\\u092d\\u0935\",\"year_experience_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"project_title\":\"\\u0938\\u092b\\u0932 \\u092a\\u0930\\u093f\\u092f\\u094b\\u091c\\u0928\\u093e\\u090f\\u0901\",\"project_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"customer_title\":\"\\u0938\\u0902\\u0924\\u0941\\u0937\\u094d\\u091f \\u0909\\u092a\\u092d\\u094b\\u0915\\u094d\\u0924\\u093e\",\"customer_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(10, 6, 'en', '{\"title\":\"Passionate About Creating Quality Design\",\"sub_title\":\"<h4>We Love What We Do<\\/h4><p>We are a creative agency working with brands building insightful strategy, creating unique designs and crafting value<\\/p><h4>Why Work With Us<\\/h4><p>If you ask our clients what it\\u2019s like working with 36, they\\u2019ll talk about how much we care about their success. For us, real relationships fuel real success. We love building brands<\\/p>\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(11, 6, 'hi', '{\"title\":\"\\u0917\\u0941\\u0923\\u0935\\u0924\\u094d\\u0924\\u093e\\u092a\\u0942\\u0930\\u094d\\u0923 \\u0921\\u093f\\u091c\\u093c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0928\\u0947 \\u0915\\u0947 \\u092a\\u094d\\u0930\\u0924\\u093f \\u091c\\u0941\\u0928\\u0942\\u0928\\u0940\",\"sub_title\":\"<h4>\\u0939\\u092e\\u0947\\u0902 \\u091c\\u094b \\u0915\\u0930\\u0928\\u093e \\u092a\\u0938\\u0902\\u0926 \\u0939\\u0948<\\/h4><p>\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u092e\\u093f\\u0932\\u0915\\u0930 \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0940 \\u0939\\u0948, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0940 \\u0939\\u0948 \\u0914\\u0930 \\u092e\\u0942\\u0932\\u094d\\u092f \\u0924\\u0948\\u092f\\u093e\\u0930 \\u0915\\u0930\\u0924\\u0940 \\u0939\\u0948<\\/p><h4>\\u0939\\u092e\\u093e\\u0930\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u094d\\u092f\\u094b\\u0902 \\u0915\\u0930\\u0947\\u0902<\\/h4><p>\\u0905\\u0917\\u0930 \\u0906\\u092a \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0915\\u094d\\u0932\\u093e\\u0907\\u0902\\u091f \\u0938\\u0947 \\u092a\\u0942\\u091b\\u0947\\u0902 \\u0915\\u093f 36 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u0930\\u0928\\u093e \\u0915\\u0948\\u0938\\u093e \\u0932\\u0917\\u0924\\u093e \\u0939\\u0948, \\u0924\\u094b \\u0935\\u0947 \\u0907\\u0938 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u092c\\u093e\\u0924 \\u0915\\u0930\\u0947\\u0902\\u0917\\u0947 \\u0915\\u093f \\u0939\\u092e \\u0909\\u0928\\u0915\\u0940 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u0947 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u0915\\u093f\\u0924\\u0928\\u093e \\u0927\\u094d\\u092f\\u093e\\u0928 \\u0930\\u0916\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0932\\u093f\\u090f, \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0938\\u0902\\u092c\\u0902\\u0927 \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u094b \\u092c\\u0922\\u093c\\u093e\\u0935\\u093e \\u0926\\u0947\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u0947\\u0902 \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921 \\u092c\\u0928\\u093e\\u0928\\u093e \\u092a\\u0938\\u0902\\u0926 \\u0939\\u0948<\\/p>\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(13, 7, 'en', '{\"title\":\"Fablepals\",\"title_two\":\"Mystic\",\"title_three\":\"Adventure\",\"sub_title\":\"We are digital agency that helps immersive\\\\ and engaging user experiences that\",\"action_button_text\":\"View Story Line\"}', '2025-05-04 09:05:05', '2025-05-06 07:08:06'),
(14, 7, 'hi', '{\"title\":\"\\u0939\\u092e \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"title_two\":\"\\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u091a\\u0940\\u091c\\u0947\\u0902\",\"title_three\":\"\\u0930\\u094b\\u091c \\u0930\\u094b\\u091c\",\"sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0921\\u093f\\u091c\\u093f\\u091f\\u0932 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u0907\\u092e\\u0930\\u094d\\u0938\\u093f\\u0935 \\u0914\\u0930 \\u0906\\u0915\\u0930\\u094d\\u0937\\u0915\\\\ \\u0909\\u092a\\u092f\\u094b\\u0917\\u0915\\u0930\\u094d\\u0924\\u093e \\u0905\\u0928\\u0941\\u092d\\u0935 \\u092e\\u0947\\u0902 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0940 \\u0939\\u0948\",\"action_button_text\":\"\\u0939\\u092e\\u093e\\u0930\\u0947 \\u0915\\u093e\\u0930\\u094d\\u092f \\u0926\\u0947\\u0916\\u0947\\u0902\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(16, 8, 'en', '{\"title\":\"Let us Know more about Tiggo\",\"sub_title\":\"Leader of the Fab Team and Wielder of Earth Element.\",\"skill_title_one\":\"Battle Power\",\"skill_title_two\":\"Defense\",\"skill_title_three\":\"Reflexes\",\"skill_title_four\":\"Elemental Power\"}', '2025-05-04 09:05:05', '2025-05-07 10:40:51'),
(17, 8, 'hi', '{\"title\":\"\\u0939\\u092e \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921 \\u0938\\u0947\\u0935\\u093e\\u0913\\u0902 \\u0915\\u0940 \\u090f\\u0915 \\u0935\\u093f\\u0938\\u094d\\u0924\\u0943\\u0924 \\u0936\\u094d\\u0930\\u0943\\u0902\\u0916\\u0932\\u093e \\u092a\\u094d\\u0930\\u0926\\u093e\\u0928 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094b\\u0902 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u092e\\u093f\\u0932\\u0915\\u0930 \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0942\\u0932\\u094d\\u092f \\u0924\\u0948\\u092f\\u093e\\u0930 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"skill_title_one\":\"\\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u093f\\u0902\\u0917\",\"skill_title_two\":\"\\u0935\\u093f\\u0915\\u093e\\u0938\",\"skill_title_three\":\"\\u0935\\u093f\\u091c\\u094d\\u091e\\u093e\\u092a\\u0928\",\"skill_title_four\":\"\\u092e\\u093e\\u0930\\u094d\\u0915\\u0947\\u091f\\u093f\\u0902\\u0917\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(19, 11, 'en', '{\"year_experience_title\":\"Years of Experience\",\"year_experience_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\",\"project_title\":\"Successful Projects\",\"project_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\",\"customer_title\":\"Satisfied Customers\",\"customer_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(20, 11, 'hi', '{\"year_experience_title\":\"\\u0935\\u0930\\u094d\\u0937\\u094b\\u0902 \\u0915\\u093e \\u0905\\u0928\\u0941\\u092d\\u0935\",\"year_experience_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"project_title\":\"\\u0938\\u092b\\u0932 \\u092a\\u0930\\u093f\\u092f\\u094b\\u091c\\u0928\\u093e\\u090f\\u0901\",\"project_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"customer_title\":\"\\u0938\\u0902\\u0924\\u0941\\u0937\\u094d\\u091f \\u0909\\u092a\\u092d\\u094b\\u0915\\u094d\\u0924\\u093e\",\"customer_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(22, 12, 'en', '{\"title\":\"Passionate About Creating Quality Design\",\"sub_title\":\"<h4>We Love What We Do<\\/h4><p>We are a creative agency working with brands building insightful strategy, creating unique designs and crafting value<\\/p><h4>Why Work With Us<\\/h4><p>If you ask our clients what it\\u2019s like working with 36, they\\u2019ll talk about how much we care about their success. For us, real relationships fuel real success. We love building brands<\\/p>\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(23, 12, 'hi', '{\"title\":\"\\u0917\\u0941\\u0923\\u0935\\u0924\\u094d\\u0924\\u093e\\u092a\\u0942\\u0930\\u094d\\u0923 \\u0921\\u093f\\u091c\\u093c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0928\\u0947 \\u0915\\u0947 \\u092a\\u094d\\u0930\\u0924\\u093f \\u091c\\u0941\\u0928\\u0942\\u0928\\u0940\",\"sub_title\":\"<h4>\\u0939\\u092e\\u0947\\u0902 \\u091c\\u094b \\u0915\\u0930\\u0928\\u093e \\u092a\\u0938\\u0902\\u0926 \\u0939\\u0948<\\/h4><p>\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u092e\\u093f\\u0932\\u0915\\u0930 \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0940 \\u0939\\u0948, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0940 \\u0939\\u0948 \\u0914\\u0930 \\u092e\\u0942\\u0932\\u094d\\u092f \\u0924\\u0948\\u092f\\u093e\\u0930 \\u0915\\u0930\\u0924\\u0940 \\u0939\\u0948<\\/p><h4>\\u0939\\u092e\\u093e\\u0930\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u094d\\u092f\\u094b\\u0902 \\u0915\\u0930\\u0947\\u0902<\\/h4><p>\\u0905\\u0917\\u0930 \\u0906\\u092a \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0915\\u094d\\u0932\\u093e\\u0907\\u0902\\u091f \\u0938\\u0947 \\u092a\\u0942\\u091b\\u0947\\u0902 \\u0915\\u093f 36 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u0930\\u0928\\u093e \\u0915\\u0948\\u0938\\u093e \\u0932\\u0917\\u0924\\u093e \\u0939\\u0948, \\u0924\\u094b \\u0935\\u0947 \\u0907\\u0938 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u092c\\u093e\\u0924 \\u0915\\u0930\\u0947\\u0902\\u0917\\u0947 \\u0915\\u093f \\u0939\\u092e \\u0909\\u0928\\u0915\\u0940 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u0947 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u0915\\u093f\\u0924\\u0928\\u093e \\u0927\\u094d\\u092f\\u093e\\u0928 \\u0930\\u0916\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0932\\u093f\\u090f, \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0938\\u0902\\u092c\\u0902\\u0927 \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u094b \\u092c\\u0922\\u093c\\u093e\\u0935\\u093e \\u0926\\u0947\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u0947\\u0902 \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921 \\u092c\\u0928\\u093e\\u0928\\u093e \\u092a\\u0938\\u0902\\u0926 \\u0939\\u0948<\\/p>\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(25, 13, 'en', '{\"title\":\"Design Studio\",\"title_two\":\"with Experience\",\"sub_title\":\"We are digital agency that helps businesses develop immersive and\\\\engaging user experiences that drive top level growth\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(26, 13, 'hi', '{\"title\":\"\\u0939\\u092e \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"title_two\":\"\\u0905\\u0928\\u0941\\u092d\\u0935 \\u0915\\u0947 \\u0938\\u093e\\u0925\",\"sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0921\\u093f\\u091c\\u093f\\u091f\\u0932 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u0935\\u094d\\u092f\\u0935\\u0938\\u093e\\u092f\\u094b\\u0902 \\u0915\\u094b \\u0907\\u092e\\u0930\\u094d\\u0938\\u093f\\u0935 \\u0914\\u0930 \\u0906\\u0915\\u0930\\u094d\\u0937\\u0915 \\u0909\\u092a\\u092f\\u094b\\u0917\\u0915\\u0930\\u094d\\u0924\\u093e \\u0905\\u0928\\u0941\\u092d\\u0935\\\\ \\u0935\\u093f\\u0915\\u0938\\u093f\\u0924 \\u0915\\u0930\\u0928\\u0947 \\u092e\\u0947\\u0902 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0940 \\u0939\\u0948 \\u091c\\u094b \\u0936\\u0940\\u0930\\u094d\\u0937 \\u0938\\u094d\\u0924\\u0930 \\u0915\\u0940 \\u0935\\u0943\\u0926\\u094d\\u0927\\u093f \\u0915\\u094b \\u092c\\u0922\\u093c\\u093e\\u0935\\u093e \\u0926\\u0947\\u0924\\u0940 \\u0939\\u0948\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(28, 16, 'en', '{\"year_experience_title\":\"Years of Experience\",\"year_experience_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\",\"project_title\":\"Successful Projects\",\"project_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\",\"customer_title\":\"Satisfied Customers\",\"customer_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(29, 16, 'hi', '{\"year_experience_title\":\"\\u0935\\u0930\\u094d\\u0937\\u094b\\u0902 \\u0915\\u093e \\u0905\\u0928\\u0941\\u092d\\u0935\",\"year_experience_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"project_title\":\"\\u0938\\u092b\\u0932 \\u092a\\u0930\\u093f\\u092f\\u094b\\u091c\\u0928\\u093e\\u090f\\u0901\",\"project_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"customer_title\":\"\\u0938\\u0902\\u0924\\u0941\\u0937\\u094d\\u091f \\u0909\\u092a\\u092d\\u094b\\u0915\\u094d\\u0924\\u093e\",\"customer_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(31, 17, 'en', '{\"title\":\"Passionate About Creating Quality Design\",\"sub_title\":\"<h4>We Love What We Do<\\/h4><p>We are a creative agency working with brands building insightful strategy, creating unique designs and crafting value<\\/p><h4>Why Work With Us<\\/h4><p>If you ask our clients what it\\u2019s like working with 36, they\\u2019ll talk about how much we care about their success. For us, real relationships fuel real success. We love building brands<\\/p>\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(32, 17, 'hi', '{\"title\":\"\\u0917\\u0941\\u0923\\u0935\\u0924\\u094d\\u0924\\u093e\\u092a\\u0942\\u0930\\u094d\\u0923 \\u0921\\u093f\\u091c\\u093c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0928\\u0947 \\u0915\\u0947 \\u092a\\u094d\\u0930\\u0924\\u093f \\u091c\\u0941\\u0928\\u0942\\u0928\\u0940\",\"sub_title\":\"<h4>\\u0939\\u092e\\u0947\\u0902 \\u091c\\u094b \\u0915\\u0930\\u0928\\u093e \\u092a\\u0938\\u0902\\u0926 \\u0939\\u0948<\\/h4><p>\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u092e\\u093f\\u0932\\u0915\\u0930 \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0940 \\u0939\\u0948, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0940 \\u0939\\u0948 \\u0914\\u0930 \\u092e\\u0942\\u0932\\u094d\\u092f \\u0924\\u0948\\u092f\\u093e\\u0930 \\u0915\\u0930\\u0924\\u0940 \\u0939\\u0948<\\/p><h4>\\u0939\\u092e\\u093e\\u0930\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u094d\\u092f\\u094b\\u0902 \\u0915\\u0930\\u0947\\u0902<\\/h4><p>\\u0905\\u0917\\u0930 \\u0906\\u092a \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0915\\u094d\\u0932\\u093e\\u0907\\u0902\\u091f \\u0938\\u0947 \\u092a\\u0942\\u091b\\u0947\\u0902 \\u0915\\u093f 36 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u0930\\u0928\\u093e \\u0915\\u0948\\u0938\\u093e \\u0932\\u0917\\u0924\\u093e \\u0939\\u0948, \\u0924\\u094b \\u0935\\u0947 \\u0907\\u0938 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u092c\\u093e\\u0924 \\u0915\\u0930\\u0947\\u0902\\u0917\\u0947 \\u0915\\u093f \\u0939\\u092e \\u0909\\u0928\\u0915\\u0940 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u0947 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u0915\\u093f\\u0924\\u0928\\u093e \\u0927\\u094d\\u092f\\u093e\\u0928 \\u0930\\u0916\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0932\\u093f\\u090f, \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0938\\u0902\\u092c\\u0902\\u0927 \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u094b \\u092c\\u0922\\u093c\\u093e\\u0935\\u093e \\u0926\\u0947\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u0947\\u0902 \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921 \\u092c\\u0928\\u093e\\u0928\\u093e \\u092a\\u0938\\u0902\\u0926 \\u0939\\u0948<\\/p>\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(34, 18, 'en', '{\"title\":\"A Digital\\\\Marketing\\\\Agency\",\"sub_title\":\"We are digital agency that helps businesses develop immersive and\\\\engaging user experiences that drive top level growth\",\"action_button_text\":\"View Our Works\",\"total_customers\":\"10k+\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(35, 18, 'hi', '{\"title\":\"\\u090f\\u0915 \\u0921\\u093f\\u091c\\u093f\\u091f\\u0932\\\\\\u092e\\u093e\\u0930\\u094d\\u0915\\u0947\\u091f\\u093f\\u0902\\u0917\\\\\\u090f\\u091c\\u0947\\u0902\\u0938\\u0940\",\"sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0921\\u093f\\u091c\\u093f\\u091f\\u0932 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u0935\\u094d\\u092f\\u0935\\u0938\\u093e\\u092f\\u094b\\u0902 \\u0915\\u094b \\u0907\\u092e\\u0930\\u094d\\u0938\\u093f\\u0935 \\u0914\\u0930 \\u0906\\u0915\\u0930\\u094d\\u0937\\u0915 \\u0909\\u092a\\u092f\\u094b\\u0917\\u0915\\u0930\\u094d\\u0924\\u093e \\u0905\\u0928\\u0941\\u092d\\u0935\\\\ \\u0935\\u093f\\u0915\\u0938\\u093f\\u0924 \\u0915\\u0930\\u0928\\u0947 \\u092e\\u0947\\u0902 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0940 \\u0939\\u0948 \\u091c\\u094b \\u0936\\u0940\\u0930\\u094d\\u0937 \\u0938\\u094d\\u0924\\u0930 \\u0915\\u0940 \\u0935\\u0943\\u0926\\u094d\\u0927\\u093f \\u0915\\u094b \\u092c\\u0922\\u093c\\u093e\\u0935\\u093e \\u0926\\u0947\\u0924\\u0940 \\u0939\\u0948\",\"action_button_text\":\"\\u0939\\u092e\\u093e\\u0930\\u0947 \\u0915\\u093e\\u0930\\u094d\\u092f \\u0926\\u0947\\u0916\\u0947\\u0902\",\"total_customers\":\"10k+\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(37, 21, 'en', '{\"year_experience_title\":\"Years of Experience\",\"year_experience_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\",\"project_title\":\"Successful Projects\",\"project_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\",\"customer_title\":\"Satisfied Customers\",\"customer_sub_title\":\"We are a creative agency brands building insightful strategy, creating unique designs helping\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(38, 21, 'hi', '{\"year_experience_title\":\"\\u0935\\u0930\\u094d\\u0937\\u094b\\u0902 \\u0915\\u093e \\u0905\\u0928\\u0941\\u092d\\u0935\",\"year_experience_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"project_title\":\"\\u0938\\u092b\\u0932 \\u092a\\u0930\\u093f\\u092f\\u094b\\u091c\\u0928\\u093e\\u090f\\u0901\",\"project_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\",\"customer_title\":\"\\u0938\\u0902\\u0924\\u0941\\u0937\\u094d\\u091f \\u0909\\u092a\\u092d\\u094b\\u0915\\u094d\\u0924\\u093e\",\"customer_sub_title\":\"\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0914\\u0930 \\u092e\\u0926\\u0926 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(40, 22, 'en', '{\"title\":\"Empowering Your\\\\Businesses in the\\\\Digital Realm\",\"sub_title\":\"<h4>We Love What We Do<\\/h4><p>We are a creative agency working with brands building insightful strategy, creating unique designs and crafting value<\\/p><h4>Why Work With Us<\\/h4><p>If you ask our clients what it\\u2019s like working with 36, they\\u2019ll talk about how much we care about their success. For us, real relationships fuel real success. We love building brands<\\/p>\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(41, 22, 'hi', '{\"title\":\"\\u0921\\u093f\\u091c\\u093f\\u091f\\u0932 \\u0915\\u094d\\u0937\\u0947\\u0924\\u094d\\u0930 \\u092e\\u0947\\u0902 \\\\\\u0905\\u092a\\u0928\\u0947 \\u0935\\u094d\\u092f\\u0935\\u0938\\u093e\\u092f\\u094b\\u0902 \\\\\\u0915\\u094b \\u0938\\u0936\\u0915\\u094d\\u0924 \\u092c\\u0928\\u093e\\u0928\\u093e\",\"sub_title\":\"<h4>\\u0939\\u092e\\u0947\\u0902 \\u091c\\u094b \\u0915\\u0930\\u0928\\u093e \\u092a\\u0938\\u0902\\u0926 \\u0939\\u0948<\\/h4><p>\\u0939\\u092e \\u090f\\u0915 \\u0930\\u091a\\u0928\\u093e\\u0924\\u094d\\u092e\\u0915 \\u090f\\u091c\\u0947\\u0902\\u0938\\u0940 \\u0939\\u0948\\u0902 \\u091c\\u094b \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921\\u094d\\u0938 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u092e\\u093f\\u0932\\u0915\\u0930 \\u0935\\u094d\\u092f\\u093e\\u0935\\u0939\\u093e\\u0930\\u093f\\u0915 \\u0930\\u0923\\u0928\\u0940\\u0924\\u093f \\u092c\\u0928\\u093e\\u0924\\u0940 \\u0939\\u0948, \\u0905\\u0926\\u094d\\u0935\\u093f\\u0924\\u0940\\u092f \\u0921\\u093f\\u091c\\u093c\\u093e\\u0907\\u0928 \\u092c\\u0928\\u093e\\u0924\\u0940 \\u0939\\u0948 \\u0914\\u0930 \\u092e\\u0942\\u0932\\u094d\\u092f \\u0924\\u0948\\u092f\\u093e\\u0930 \\u0915\\u0930\\u0924\\u0940 \\u0939\\u0948<\\/p><h4>\\u0939\\u092e\\u093e\\u0930\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u094d\\u092f\\u094b\\u0902 \\u0915\\u0930\\u0947\\u0902<\\/h4><p>\\u0905\\u0917\\u0930 \\u0906\\u092a \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0915\\u094d\\u0932\\u093e\\u0907\\u0902\\u091f \\u0938\\u0947 \\u092a\\u0942\\u091b\\u0947\\u0902 \\u0915\\u093f 36 \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0915\\u093e\\u092e \\u0915\\u0930\\u0928\\u093e \\u0915\\u0948\\u0938\\u093e \\u0932\\u0917\\u0924\\u093e \\u0939\\u0948, \\u0924\\u094b \\u0935\\u0947 \\u0907\\u0938 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u092c\\u093e\\u0924 \\u0915\\u0930\\u0947\\u0902\\u0917\\u0947 \\u0915\\u093f \\u0939\\u092e \\u0909\\u0928\\u0915\\u0940 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u0947 \\u092c\\u093e\\u0930\\u0947 \\u092e\\u0947\\u0902 \\u0915\\u093f\\u0924\\u0928\\u093e \\u0927\\u094d\\u092f\\u093e\\u0928 \\u0930\\u0916\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u093e\\u0930\\u0947 \\u0932\\u093f\\u090f, \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0938\\u0902\\u092c\\u0902\\u0927 \\u0935\\u093e\\u0938\\u094d\\u0924\\u0935\\u093f\\u0915 \\u0938\\u092b\\u0932\\u0924\\u093e \\u0915\\u094b \\u092c\\u0922\\u093c\\u093e\\u0935\\u093e \\u0926\\u0947\\u0924\\u0947 \\u0939\\u0948\\u0902\\u0964 \\u0939\\u092e\\u0947\\u0902 \\u092c\\u094d\\u0930\\u093e\\u0902\\u0921 \\u092c\\u0928\\u093e\\u0928\\u093e \\u092a\\u0938\\u0902\\u0926 \\u0939\\u0948<\\/p>\"}', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `seo_title` text NOT NULL,
  `seo_description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `page_name`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(1, 'home_page', 'Home || Global Kids Brand', 'Home || Global Kids Brand', '2025-05-04 09:05:04', '2025-11-23 06:22:21'),
(2, 'about_page', 'About || Kids Shop', 'About || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:04:10'),
(3, 'blog_page', 'Blog || Kids Shop', 'Blog || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:03:57'),
(4, 'portfolio_page', 'Portfolio || Kids Shop', 'Portfolio || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:04:22'),
(5, 'service_page', 'Service || Kids Shop', 'Service || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:04:32'),
(6, 'contact_page', 'Contact || Kids Shop', 'Contact || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:04:40'),
(7, 'team_page', 'Team || Kids Shop', 'Team || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:04:49'),
(8, 'faq_page', 'FAQ || Kids Shop', 'FAQ || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:05:02'),
(9, 'pricing_page', 'Pricing || Kids Shop', 'Pricing || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:05:14'),
(10, 'shop_page', 'Shop || Kids Shop', 'Shop || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:05:27'),
(11, 'cart_page', 'My Cart || Kids Shop', 'My Cart || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:05:39'),
(12, 'checkout_page', 'Checkout || Kids Shop', 'Checkout || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:05:48'),
(13, 'payment_page', 'Payment || Kids Shop', 'Payment || Kids Shop', '2025-05-04 09:05:04', '2025-05-05 07:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `line_color` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `slug`, `image`, `icon`, `is_popular`, `line_color`, `status`, `created_at`, `updated_at`) VALUES
(7, 'shadow-legion-order', 'uploads/custom-images/wsus-img-2025-10-08-05-20-29-8746.webp', 'uploads/custom-images/wsus-img-2025-09-19-04-43-43-6777.webp', 0, '#fa2f36', 1, '2025-05-05 08:50:49', '2025-10-08 05:20:29'),
(8, 'mystic-gadgets-and-relics', 'uploads/custom-images/wsus-img-2025-10-08-05-18-35-6600.webp', 'uploads/custom-images/wsus-img-2025-09-19-04-41-37-5652.webp', 0, '#24f2e8', 1, '2025-05-07 10:46:10', '2025-10-08 05:18:35'),
(9, 'fabworld-villagers', 'uploads/custom-images/wsus-img-2025-10-08-05-17-38-5789.webp', 'uploads/custom-images/wsus-img-2025-09-19-04-41-09-7614.webp', 0, '#f2ef24', 1, '2025-05-07 10:53:33', '2025-10-08 05:17:38'),
(10, 'fabland-world', 'uploads/custom-images/wsus-img-2025-10-08-05-15-53-5691.webp', 'uploads/custom-images/wsus-img-2025-09-19-04-39-59-7978.webp', 0, '#faa62f', 1, '2025-05-07 10:57:30', '2025-10-08 05:15:53'),
(11, 'fablepals-mystic-world', 'uploads/custom-images/wsus-img-2025-10-08-05-15-07-6629.webp', 'uploads/custom-images/wsus-img-2025-09-19-04-37-04-6456.webp', 0, '#58f224', 1, '2025-05-07 11:42:06', '2025-10-08 05:15:07'),
(12, 'fab-cinematic-universe', 'uploads/custom-images/wsus-img-2025-10-08-05-13-41-7449.webp', 'uploads/custom-images/wsus-img-2025-09-19-04-36-02-5006.webp', 0, '#f542f5', 1, '2025-09-17 07:28:15', '2025-10-08 05:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `service_translations`
--

CREATE TABLE `service_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `seo_title` text DEFAULT NULL,
  `btn_text` varchar(255) DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_translations`
--

INSERT INTO `service_translations` (`id`, `service_id`, `lang_code`, `title`, `short_description`, `description`, `seo_title`, `btn_text`, `seo_description`, `created_at`, `updated_at`) VALUES
(19, 7, 'en', 'Shadow Legion Order', '“Enter the dark force of the Shadow Legion—ruled by the Void Entity, led by Warlord Draxus, and enforced by ruthless commanders and armies.”', '<p><span style=\"font-size: 18pt;\">Coming Soon</span></p>', NULL, 'View More', NULL, '2025-05-05 08:50:49', '2025-10-08 05:20:29'),
(20, 7, 'hi', 'Earth Element', 'Earth element this and that', '<p>fdajkfadbbfjdkjbfad</p>', NULL, 'View More', NULL, '2025-05-05 08:50:49', '2025-05-05 08:50:49'),
(21, 8, 'en', 'Mystic Gadgets & Relics', '“Uncover ancient relics and Elementrix wrist gears—mystic creations of Primora, waiting for heroes to awaken their hidden powers.”', '<p><span style=\"font-size: 18pt;\">Coming Soon</span></p>', NULL, 'View More', NULL, '2025-05-07 10:46:10', '2025-10-08 05:18:35'),
(22, 8, 'hi', 'Mystic Planets', 'Origin of Elements', '<p>All 5 planets</p>', NULL, 'View More', NULL, '2025-05-07 10:46:10', '2025-05-07 10:46:10'),
(23, 9, 'en', 'Fabworld Villagers', '“Meet the colorful villagers of Fabville—friends, mentors, and quirky souls whose stories bring warmth and depth to the FablePals’ world.”', '<p><span style=\"font-size: 18pt;\">Coming Soon</span></p>', NULL, 'View More', NULL, '2025-05-07 10:53:33', '2025-10-08 05:17:38'),
(24, 9, 'hi', 'Mystic Guardians', 'Element Planets along with Elements were protected by Guardians in Ancient Time.', '<p>Element Planets along with Elements were protected by Guardians in Ancient Time.</p>\r\n<p>Earth Guardian</p>\r\n<p>Air Guardian</p>\r\n<p>Fire Guardian</p>\r\n<p>Water Guardian</p>\r\n<p>Time Guardian</p>\r\n<p>Shadow Guardian</p>\r\n<p>Light Guardian</p>', NULL, 'View More', NULL, '2025-05-07 10:53:33', '2025-05-07 10:53:33'),
(25, 10, 'en', 'Fabland World', '“Explore the heart of Fabland—its council, villages, guardians, and hidden orders—where harmony and adventure shape every story.”', '<p><span style=\"font-size: 18pt;\">Coming Soon</span></p>', NULL, 'View More', NULL, '2025-05-07 10:57:30', '2025-10-08 05:16:33'),
(26, 10, 'hi', 'Shadow Legion Order', 'An Evil force who wants to wipe out all element energy from the realm.', '<p>An Evil force who wants to wipe out all element energy from the realm.</p>\r\n<p>Hierarchy of Shadow legion order is<br><br>1. Supreme Void Entity - Draxus<br>2. Shadow Commanders<br>3. Shadow Army</p>', NULL, 'View More', NULL, '2025-05-07 10:57:30', '2025-05-07 10:57:30'),
(27, 11, 'en', 'Fab Mystic World', '“Step into the Fab Mystic World—where Primora split into Light, Shadow, and elemental realms, giving birth to the worlds of earth, air, water, fire, and time.”', '<p><span style=\"font-size: 18pt;\">Coming Soon</span></p>', NULL, 'View More', NULL, '2025-05-07 11:42:06', '2025-10-08 05:15:07'),
(28, 11, 'hi', 'Fabland', 'A world where all came together.', '<p>A world where all came together.<br><br>It comprises of Fab Army and Fab council and Fabvillagers along with our Fablepal Heroes.</p>', NULL, 'View More', NULL, '2025-05-07 11:42:06', '2025-05-07 11:42:06'),
(29, 12, 'en', 'Fab Cinematic Universe', '“Discover the epic FablePals cinematic universe—where elemental journeys, ancient lore, and heroic destinies unite against the Supreme Void Entity .”', '<p><span style=\"font-size: 18pt;\">Coming Soon</span></p>', NULL, 'View More', NULL, '2025-09-17 07:28:15', '2025-10-08 05:14:08'),
(30, 12, 'hi', 'Fab Cinematic Universe', 'qwer', '<p>qwer</p>', NULL, 'View More', NULL, '2025-09-17 07:28:15', '2025-09-17 07:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'Fable Pals', '2025-05-04 09:05:04', '2025-05-04 09:05:35'),
(2, 'version', '1.2.0', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(3, 'logo', 'uploads/custom-images/wsus-img-2025-10-13-03-19-09-6881.png', '2025-05-04 09:05:04', '2025-10-13 15:19:09'),
(4, 'logo_white', 'uploads/custom-images/wsus-img-2025-10-13-03-18-39-8697.png', '2025-05-04 09:05:04', '2025-10-13 15:18:39'),
(5, 'timezone', 'Asia/Dhaka', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(6, 'date_format', 'Y-m-d', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(7, 'time_format', 'h:i A', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(8, 'favicon', 'uploads/custom-images/wsus-img-2025-10-13-03-18-39-3969.png', '2025-05-04 09:05:04', '2025-10-13 15:18:39'),
(9, 'cookie_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(10, 'border', 'normal', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(11, 'corners', 'thin', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(12, 'background_color', '#E3FF04', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(13, 'text_color', '#0A0C00', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(14, 'border_color', '#E3FF33', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(15, 'btn_bg_color', '#0A0C00', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(16, 'btn_text_color', '#FFFFFF', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(17, 'link_text', 'Read Our Privacy Policy', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(18, 'btn_text', 'Yes', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(19, 'message', 'This website uses essential cookies to ensure its proper operation and tracking cookies to understand how you interact with it. The latter will be set only upon approval.', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(20, 'site_theme', 'two', '2025-05-04 09:05:04', '2025-05-04 09:08:05'),
(21, 'blog_layout', 'standard', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(22, 'primary_color', '#E3FF04', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(23, 'secondary_color', '#0A0C00', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(24, 'show_all_homepage', '0', '2025-05-04 09:05:04', '2025-05-04 11:00:45'),
(25, 'preloader_status', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(26, 'contact_team_member', 'active', '2025-05-04 09:05:04', '2025-11-04 06:34:49'),
(27, 'copyright_text', 'Copyright © 2026', '2025-05-04 09:05:04', '2026-02-19 09:30:42'),
(28, 'recaptcha_site_key', 'recaptcha_site_key', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(29, 'recaptcha_secret_key', 'recaptcha_secret_key', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(30, 'recaptcha_status', 'inactive', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(31, 'tawk_status', 'inactive', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(32, 'tawk_chat_link', 'tawk_chat_link', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(33, 'googel_tag_status', 'inactive', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(34, 'googel_tag_id', 'google_tag_id', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(35, 'google_analytic_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(36, 'google_analytic_id', 'google_analytic_id', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(37, 'pixel_status', 'inactive', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(38, 'pixel_app_id', 'pixel_app_id', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(39, 'google_login_status', 'inactive', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(40, 'gmail_client_id', 'google_client_id', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(41, 'gmail_secret_id', 'google_secret_id', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(42, 'default_avatar', 'uploads/website-images/default-avatar.png', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(43, 'breadcrumb_image', 'uploads/custom-images/wsus-img-2026-01-26-07-21-42-9225.webp', '2025-05-04 09:05:04', '2026-01-26 07:21:42'),
(44, 'contact_page_breadcrumb_image', 'uploads/website-images/breadcrumb-image.jpg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(45, 'team_page_breadcrumb_image', 'uploads/custom-images/team_breadcrumb_image.jpg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(46, 'about_page_breadcrumb_image', 'uploads/custom-images/about_breadcrumb_image.jpg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(47, 'faq_page_breadcrumb_image', 'uploads/custom-images/faq_breadcrumb_image.jpg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(48, 'pricing_page_breadcrumb_image', 'uploads/custom-images/pricing_breadcrumb_image.jpg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(49, 'blog_page_breadcrumb_image', 'uploads/custom-images/wsus-img-2025-09-21-11-25-52-2173.webp', '2025-05-04 09:05:04', '2025-09-21 11:25:52'),
(50, 'portfolio_page_breadcrumb_image', 'uploads/custom-images/portfolio_breadcrumb_image.jpg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(51, 'service_page_breadcrumb_image', 'uploads/custom-images/service_breadcrumb_image.jpg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(52, 'shop_page_breadcrumb_image', 'uploads/custom-images/wsus-img-2025-10-08-07-33-44-8876.webp', '2025-05-04 09:05:04', '2025-10-08 07:33:44'),
(53, 'cart_page_breadcrumb_image', 'uploads/custom-images/wsus-img-2026-01-23-08-53-28-4634.webp', '2025-05-04 09:05:04', '2026-01-23 08:53:28'),
(54, 'checkout_page_breadcrumb_image', 'uploads/custom-images/wsus-img-2026-01-23-08-53-28-8445.webp', '2025-05-04 09:05:04', '2026-01-23 08:53:28'),
(55, 'payment_page_breadcrumb_image', 'uploads/custom-images/payment_breadcrumb_image.jpg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(56, 'mail_host', 'sandbox.smtp.mailtrap.io', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(57, 'mail_sender_email', 'sender@gmail.com', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(58, 'mail_username', 'mail_username', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(59, 'mail_password', 'mail_password', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(60, 'mail_port', '2525', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(61, 'mail_encryption', 'ssl', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(62, 'mail_sender_name', 'WebSolutionUs', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(63, 'contact_message_receiver_mail', 'receiver@gmail.com', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(64, 'club_point_rate', '1', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(65, 'club_point_status', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(66, 'maintenance_mode', '0', '2025-05-04 09:05:04', '2025-08-22 09:41:00'),
(67, 'maintenance_image', 'uploads/website-images/maintenance.jpg', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(68, 'maintenance_title', 'Website Under maintenance', '2025-05-04 09:05:04', '2025-09-09 06:13:58'),
(69, 'maintenance_description', '<p>We are currently performing maintenance on our website to<br>improve your experience. Please check back later.</p>\r\n<p>Websolutions</p>', '2025-05-04 09:05:04', '2025-09-09 06:13:58'),
(70, 'last_update_date', '2025-04-08T15:57:17+10:00', '2025-05-04 09:05:04', '2025-05-04 09:05:35'),
(71, 'is_queable', 'inactive', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(72, 'comments_auto_approved', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(73, 'review_auto_approved', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(74, 'search_engine_indexing', 'active', '2025-05-04 09:05:04', '2025-05-04 09:05:04'),
(75, 'is_shop', '1', '2025-05-04 09:05:04', '2025-09-06 10:47:20'),
(76, 'is_delivery_charge', '0', '2025-05-04 09:05:04', '2025-09-06 10:47:20'),
(77, 'tax_rate', '0', '2025-05-04 09:05:04', '2025-09-06 10:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fee` double NOT NULL DEFAULT 0,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_order` double NOT NULL DEFAULT 0,
  `is_default` varchar(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `fee`, `is_free`, `minimum_order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 0, '1', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 50, 0, 0, '0', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_method_translations`
--

CREATE TABLE `shipping_method_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_method_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_method_translations`
--

INSERT INTO `shipping_method_translations` (`id`, `shipping_method_id`, `lang_code`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Standard', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'hi', 'Standard', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 2, 'en', 'Express', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 2, 'hi', 'Express', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `skills_sections`
--

CREATE TABLE `skills_sections` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(500) DEFAULT NULL,
  `skill_title_one` varchar(255) DEFAULT NULL,
  `skill_percentage_one` int(11) DEFAULT NULL CHECK (`skill_percentage_one` between 0 and 100),
  `skill_title_two` varchar(255) DEFAULT NULL,
  `skill_percentage_two` int(11) DEFAULT NULL CHECK (`skill_percentage_two` between 0 and 100),
  `skill_title_three` varchar(255) DEFAULT NULL,
  `skill_percentage_three` int(11) DEFAULT NULL CHECK (`skill_percentage_three` between 0 and 100),
  `skill_title_four` varchar(255) DEFAULT NULL,
  `skill_percentage_four` int(11) DEFAULT NULL CHECK (`skill_percentage_four` between 0 and 100),
  `image` varchar(500) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills_sections`
--

INSERT INTO `skills_sections` (`id`, `title`, `sub_title`, `skill_title_one`, `skill_percentage_one`, `skill_title_two`, `skill_percentage_two`, `skill_title_three`, `skill_percentage_three`, `skill_title_four`, `skill_percentage_four`, `image`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Tiggo - The Leader', 'Leader of the Fab Team and Wielder of Earth Element.', 'Battle Power', 95, 'Defense', 85, 'Reflexes', 75, 'Elemental Power', 97, '1759402554_Untitled design (10) (1).png', 'https://fablepals.kids/character/tiggo-the-leader', '2025-09-16 01:56:16', '2025-10-13 15:36:18'),
(3, 'Luna - The Speedster', 'She is Quick and her Mind is sharp. Watch out Kids !', 'Battle Power', 80, 'Defense', 75, 'Reflexes', 95, 'Elemental Power', 90, '1759402825_Untitled design (11).webp', 'https://fablepals.kids/character/luna-the-speedster', '2025-10-02 11:00:25', '2025-10-13 15:36:07'),
(4, 'Blaze - The Warrior', 'He is the fierce Warrior of Fab Team and Always Angry.', 'Battle Power', 90, 'Defense', 85, 'Reflexes', 80, 'Elemental Power', 95, '1759403187_Untitled design (12).webp', 'https://fablepals.kids/character/blaze-the-warrior', '2025-10-02 11:06:27', '2025-10-13 15:35:58'),
(5, 'Bolt - The Genius Mechanic', 'Bolt builds gadgets for our Heroes and He loves his job.', 'Battle Power', 85, 'Defense', 95, 'Reflexes', 75, 'Elemental Power', 80, '1759403501_Untitled design (13).webp', 'https://fablepals.kids/character/bolt-the-genius-mechanic', '2025-10-02 11:11:41', '2025-10-13 15:35:49'),
(6, 'Waver - The Playful Wielder', 'She is Heart of Fab Team. Always Humble and Helpful.', 'Battle Power', 95, 'Defense', 80, 'Reflexes', 90, 'Elemental Power', 97, '1759403804_Untitled design (14).webp', 'https://fablepals.kids/character/waver-the-oceans-heart', '2025-10-02 11:16:44', '2025-10-13 15:35:36'),
(7, 'Ollie - The Mastermind', 'He is Strategist of Team. Sharpest brain of Fab Team.', 'Battle Power', 70, 'Defense', 75, 'Reflexes', 80, 'Elemental Power', 85, '1759404171_Untitled design (15).webp', 'https://fablepals.kids/character/ollie-the-wise-', '2025-10-02 11:22:51', '2025-10-13 15:35:26'),
(8, 'Kane - The Prodigal Knight', 'He is a Mysterious Character. A lot of Suspense around him.', 'Battle Power', 98, 'Defense', 85, 'Reflexes', 90, 'Elemental Power', 95, '1759404487_Untitled design (16).webp', 'https://fablepals.kids/character/kane-the-prodigal-knight', '2025-10-02 11:28:07', '2025-10-13 15:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `socialite_credentials`
--

CREATE TABLE `socialite_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `link`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'https://www.facebook.com', 'frontend/images/facebook.png', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 'https://instagram.com/fablepals.kids', 'frontend/images/instagram.png', 1, '2025-05-04 09:05:05', '2025-07-19 12:56:48'),
(3, 'https://www.youtube.com/@FablePalsTV', 'uploads/custom-images/wsus-img-2025-09-21-09-20-06-8361.png', 1, '2025-05-04 09:05:05', '2025-09-21 09:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `playlist_id` int(11) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `artist` varchar(100) DEFAULT NULL,
  `minutes` varchar(50) DEFAULT NULL,
  `seconds` varchar(50) DEFAULT NULL,
  `file` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `playlist_id`, `artist_id`, `title`, `artist`, `minutes`, `seconds`, `file`, `updated_at`, `created_at`) VALUES
(11, 6, 2, 'Fablepals Concert Song', 'Fablepals', '2', '40', 'uploads/songs/song_1762343900.mp3', '2025-11-05 11:58:20', '2025-10-23 09:42:33'),
(12, 6, 2, 'Peekaboo Song', 'Fablepals', '1', '19', 'uploads/songs/song_1762344011.mp3', '2025-11-05 12:00:11', '2025-10-23 09:45:17'),
(13, 6, 2, 'Happy Birthday Song', 'Fablepals', '2', '11', 'uploads/songs/song_1762584712.mp3', '2025-11-08 06:51:52', '2025-10-23 09:51:20'),
(14, 6, 2, 'Gaaiya Meri Gaaiya Song', 'Fablepals', '3', '5', 'uploads/songs/song_1762584757.mp3', '2025-11-08 06:52:37', '2025-10-23 09:52:03'),
(15, 6, 2, 'Fablepals Party Song', 'Fablepals', '1', '53', 'uploads/songs/song_1762584776.mp3', '2025-11-08 06:52:56', '2025-10-23 09:54:34'),
(16, 6, 2, 'Ice cream Wala Song', 'Fablepals', '2', '52', 'uploads/songs/song_1762584929.mp3', '2025-11-08 06:55:29', '2025-10-23 09:55:49'),
(17, 7, 2, 'Shree krishna Govind Hare Murare Song', 'Fablepals', '3', '5', 'uploads/songs/song_1762585277.mp3', '2025-11-08 07:01:17', '2025-10-23 09:57:44'),
(18, 6, 2, 'Tamatar Bade Majedar Song', 'Fablepals', '1', '37', 'uploads/songs/song_1762584951.mp3', '2025-11-08 06:55:51', '2025-10-23 10:01:05'),
(19, 8, 2, 'Wheels on the ride Song', 'Fablepals', '1', '30', 'uploads/songs/song_1762585330.mp3', '2025-11-08 07:02:10', '2025-10-23 10:01:55'),
(20, 9, 2, 'Tiggo - Brave Leader Title Track', 'Fablepals', '2', '34', 'uploads/songs/song_1762596436.mp3', '2025-11-08 10:07:16', '2025-10-23 10:06:58'),
(21, 9, 2, 'Tiggo Warrior BGM', 'Fablepals', '1', '44', 'uploads/songs/song_1762596452.mp3', '2025-11-08 10:07:32', '2025-10-23 10:07:27'),
(22, 11, 2, 'Luna - The Speedster Title Track', 'Fablepals', '1', '39', 'uploads/songs/song_1762596515.mp3', '2025-11-08 10:08:35', '2025-10-23 10:10:20'),
(23, 11, 2, 'Luna Speedster BGM', 'Fablepals', '0', '42', 'uploads/songs/song_1762596529.mp3', '2025-11-08 10:08:49', '2025-10-23 10:37:47'),
(24, 12, 2, 'Blaze Warrior BGM', 'Fablepals', '1', '28', 'uploads/songs/song_1762596581.mp3', '2025-11-08 10:09:41', '2025-10-23 10:39:44'),
(25, 13, 2, 'Bolt - The Genius Mechanic BGM', 'Fablepals', '1', '19', 'uploads/songs/song_1762596602.mp3', '2025-11-08 10:10:02', '2025-10-23 10:41:08'),
(26, 7, 2, 'Ganpati Bappa Moriya Song', 'Fablepals', '2', '57', 'uploads/songs/song_1762596662.mp3', '2025-11-08 10:11:02', '2025-10-23 10:43:10'),
(27, 8, 2, 'Sparkle Sparkle Shiny Stars', NULL, '1', '29', 'uploads/songs/song_1762596750.mp3', '2025-11-08 10:12:30', '2025-11-08 10:12:30'),
(28, 14, 2, 'Waver\'s Dance', NULL, '3', '00', 'uploads/songs/song_1764327505.mp3', '2025-11-28 10:58:25', '2025-11-28 10:58:25'),
(29, 14, 2, 'Waver\'s BGM', NULL, '3', '18', 'uploads/songs/song_1764327571.mp3', '2025-11-28 10:59:31', '2025-11-28 10:59:31'),
(30, 14, 2, 'Waver\'s Title Track', NULL, '1', '52', 'uploads/songs/song_1764328557.mp3', '2025-11-28 11:15:57', '2025-11-28 11:15:57'),
(31, 6, 2, 'Jingle Bells Christmas Song', NULL, '1', '47', 'uploads/songs/song_1766382130.mp3', '2025-12-22 05:42:10', '2025-12-22 05:40:52'),
(32, 15, 2, 'Ollie BGM', NULL, '3', '27', 'uploads/songs/song_1770293787.mp3', '2026-02-05 12:16:27', '2026-02-05 12:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `song_artists`
--

CREATE TABLE `song_artists` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `song_artists`
--

INSERT INTO `song_artists` (`id`, `name`, `slug`, `file`, `count`, `is_deleted`, `updated_at`, `created_at`) VALUES
(2, 'Fablepals Music', 'fablepals-music', 'uploads/artist/song_1762584413.webp', 22, 0, '2026-02-18 10:43:45', '2025-11-05 11:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `song_playlists`
--

CREATE TABLE `song_playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `song_playlists`
--

INSERT INTO `song_playlists` (`id`, `name`, `slug`, `file`, `count`, `is_deleted`, `updated_at`, `created_at`) VALUES
(6, 'Dance Songs Playlist', 'dance-songs-playlist', 'uploads/playlist/song_1762584453.webp', 8, 0, '2025-12-22 05:42:10', '2025-11-05'),
(7, 'Devotional Songs Playlist', 'devotional-songs-playlist', 'uploads/playlist/song_1762584473.webp', 2, 0, '2025-11-19 08:37:45', '2025-11-08'),
(8, 'Nursery Songs Playlist', 'nursery-songs-playlist', 'uploads/playlist/song_1762584495.webp', 2, 0, '2025-11-19 08:37:48', '2025-11-08'),
(9, 'Tiggo Songs Playlist', 'tiggo-songs-playlist', 'uploads/playlist/song_1762584515.webp', 2, 0, '2025-11-19 08:37:50', '2025-11-08'),
(10, 'Tiggo Songs Playlist', NULL, 'uploads/playlist/song_1762584517.webp', 14, 1, '2025-11-08 06:48:42', '2025-11-08'),
(11, 'Luna Songs Playlist', 'luna-songs-playlist', 'uploads/playlist/song_1762588293.webp', 2, 0, '2025-11-19 08:37:53', '2025-11-08'),
(12, 'Blaze Songs Playlist', 'blaze-songs-playlist', 'uploads/playlist/song_1762584609.webp', 1, 0, '2025-11-19 08:37:56', '2025-11-08'),
(13, 'Bolt Songs Playlist', 'bolt-songs-playlist', 'uploads/playlist/song_1762584625.webp', 1, 0, '2025-11-19 08:37:58', '2025-11-08'),
(14, 'Waver Songs Playlist', 'waver-songs-playlist', 'uploads/playlist/song_1764327442.webp', 3, 0, '2025-11-28 11:15:57', '2025-11-28'),
(15, 'Ollie Songs Playlist', 'ollie-songs-playlist', 'uploads/playlist/song_1770293676.webp', 1, 0, '2026-02-05 12:16:27', '2026-02-05');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_price` decimal(8,2) NOT NULL,
  `expiration_date` varchar(255) NOT NULL,
  `button_url` varchar(255) DEFAULT NULL,
  `serial` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `plan_price`, `expiration_date`, `button_url`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 180.00, 'monthly', 'https://websolutionus.com', '1', 1, '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(2, 280.00, 'yearly', 'https://websolutionus.com', '2', 1, '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(3, 450.00, 'lifetime', 'https://websolutionus.com', '3', 1, '2025-05-04 09:05:06', '2025-05-04 09:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plan_translations`
--

CREATE TABLE `subscription_plan_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_plan_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_plan_translations`
--

INSERT INTO `subscription_plan_translations` (`id`, `subscription_plan_id`, `lang_code`, `plan_name`, `short_description`, `description`, `button_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Startup', 'We care about their success. For us real relationships fuel real', '<ul>\n                                                <li> Web & Mobile</li>\n                                                <li> Free Custom Domain</li>\n                                                <li> Best Hosting Ever</li>\n                                                <li> Outstanding Support</li>\n                                                <li> Web Design</li>\n                                                </ul>', 'Choose This Plan', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(2, 1, 'hi', 'चालू होना', 'हम उनकी सफलता की परवाह करते हैं। हमारे लिए सच्चे रिश्ते ही असली प्रेरणा देते हैं', '<ul>\n                                                <li> वेब और मोबाइल</li>\n                                                <li> निःशुल्क कस्टम डोमेन</li>\n                                                <li> अब तक की सर्वश्रेष्ठ होस्टिंग</li>\n                                                <li> उत्कृष्ट सहायता</li>\n                                                <li> वेब डिज़ाइन</li>\n                                                </ul>', 'यह योजना चुनें', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(4, 2, 'en', 'Yearly Plan', 'We care about their success. For us real relationships fuel real', '<ul>\n                                                <li> Web & Mobile</li>\n                                                <li> Free Custom Domain</li>\n                                                <li> Best Hosting Ever</li>\n                                                <li> Outstanding Support</li>\n                                                <li> Web Design</li>\n                                                </ul>', 'Choose This Plan', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(5, 2, 'hi', 'वार्षिक योजना', 'हम उनकी सफलता की परवाह करते हैं। हमारे लिए सच्चे रिश्ते ही असली प्रेरणा देते हैं', '<ul>\n                                                <li> वेब और मोबाइल</li>\n                                                <li> निःशुल्क कस्टम डोमेन</li>\n                                                <li> अब तक की सर्वश्रेष्ठ होस्टिंग</li>\n                                                <li> उत्कृष्ट सहायता</li>\n                                                <li> वेब डिज़ाइन</li>\n                                                </ul>', 'यह योजना चुनें', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(7, 3, 'en', 'Lifetime Plan', 'We care about their success. For us real relationships fuel real', '<ul>\n                                                <li> Web & Mobile</li>\n                                                <li> Free Custom Domain</li>\n                                                <li> Best Hosting Ever</li>\n                                                <li> Outstanding Support</li>\n                                                <li> Web Design</li>\n                                                </ul>', 'Choose This Plan', '2025-05-04 09:05:06', '2025-05-04 09:05:06'),
(8, 3, 'hi', 'आजीवन योजना', 'हम उनकी सफलता की परवाह करते हैं। हमारे लिए सच्चे रिश्ते ही असली प्रेरणा देते हैं', '<ul>\n                                                <li> वेब और मोबाइल</li>\n                                                <li> निःशुल्क कस्टम डोमेन</li>\n                                                <li> अब तक की सर्वश्रेष्ठ होस्टिंग</li>\n                                                <li> उत्कृष्ट सहायता</li>\n                                                <li> वेब डिज़ाइन</li>\n                                                </ul>', 'यह योजना चुनें', '2025-05-04 09:05:06', '2025-05-04 09:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `image`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 'uploads/custom-images/client-1.jpg', '1', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 'uploads/custom-images/client-2.jpg', '4', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 'uploads/custom-images/client-3.jpg', '3', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 'uploads/custom-images/client-4.jpg', '1', 1, '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_translations`
--

CREATE TABLE `testimonial_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `testimonial_id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonial_translations`
--

INSERT INTO `testimonial_translations` (`id`, `testimonial_id`, `lang_code`, `name`, `designation`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Eva', 'Travel Guide', 'It’s a pleasure working with Bunker. They understood our new brand positioning guidelines and translated them beautifully and consistently into our on-going marketing comms. The team is responsive, quick and always willing help winning partnership', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(2, 1, 'hi', 'Mireille', 'Diagnostic Medical Sonographer', 'बंकर के साथ काम करना खुशी की बात है। उन्होंने हमारे नए ब्रांड पोजिशनिंग दिशानिर्देशों को समझा और उन्हें खूबसूरती से और सुसंगत रूप से हमारी चल रही मार्केटिंग संचार में अनुवादित किया। टीम उत्तरदायी, तेज़ और हमेशा एक सफल साझेदारी में मदद करने के लिए तैयार रहती है।', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(4, 2, 'en', 'Bridie', 'Terrazzo Workes and Finisher', 'It’s a pleasure working with Bunker. They understood our new brand positioning guidelines and translated them beautifully and consistently into our on-going marketing comms. The team is responsive, quick and always willing help winning partnership', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(5, 2, 'hi', 'Felipa', 'Fitter', 'बंकर के साथ काम करना खुशी की बात है। उन्होंने हमारे नए ब्रांड पोजिशनिंग दिशानिर्देशों को समझा और उन्हें खूबसूरती से और सुसंगत रूप से हमारी चल रही मार्केटिंग संचार में अनुवादित किया। टीम उत्तरदायी, तेज़ और हमेशा एक सफल साझेदारी में मदद करने के लिए तैयार रहती है।', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(7, 3, 'en', 'Taya', 'Life Scientists', 'It’s a pleasure working with Bunker. They understood our new brand positioning guidelines and translated them beautifully and consistently into our on-going marketing comms. The team is responsive, quick and always willing help winning partnership', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(8, 3, 'hi', 'Marta', 'Mail Clerk', 'बंकर के साथ काम करना खुशी की बात है। उन्होंने हमारे नए ब्रांड पोजिशनिंग दिशानिर्देशों को समझा और उन्हें खूबसूरती से और सुसंगत रूप से हमारी चल रही मार्केटिंग संचार में अनुवादित किया। टीम उत्तरदायी, तेज़ और हमेशा एक सफल साझेदारी में मदद करने के लिए तैयार रहती है।', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(10, 4, 'en', 'Liliane', 'Stone Sawyer', 'It’s a pleasure working with Bunker. They understood our new brand positioning guidelines and translated them beautifully and consistently into our on-going marketing comms. The team is responsive, quick and always willing help winning partnership', '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(11, 4, 'hi', 'Zoe', 'Underground Mining', 'बंकर के साथ काम करना खुशी की बात है। उन्होंने हमारे नए ब्रांड पोजिशनिंग दिशानिर्देशों को समझा और उन्हें खूबसूरती से और सुसंगत रूप से हमारी चल रही मार्केटिंग संचार में अनुवादित किया। टीम उत्तरदायी, तेज़ और हमेशा एक सफल साझेदारी में मदद करने के लिए तैयार रहती है।', '2025-05-04 09:05:05', '2025-05-04 09:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `phone` varchar(220) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_banned` varchar(255) NOT NULL DEFAULT 'no',
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `verification_token` varchar(255) DEFAULT NULL,
  `forget_password_token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `country_id`, `province`, `city`, `zip_code`, `address`, `age`, `phone`, `mobile`, `image`, `is_banned`, `status`, `verification_token`, `forget_password_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Curtis Campher', 'user@gmail.com', '2025-05-04 09:05:05', '$2y$12$O0/0W9/67xTGAxUuf5l9U.u7qLcFKF8LqDPx4jd9oqWfH3i.MBUDq', 'Male', 184, 'Florida', 'Washington DC', '8834', '4A, Park Street', '45 Year', '2420', NULL, 'frontend/images/user.png', 'no', 'active', NULL, NULL, NULL, '2025-05-04 09:05:05', '2025-05-04 09:05:05'),
(3, 'User 7988370920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-13 08:06:52', '2026-01-13 08:06:52'),
(4, 'User 8375996566', 'rishikashyapp.10@gmail.com', NULL, NULL, 'male', 77, 'Delhi', 'DELHI', '110017', 'L BLOCK\r\n90 L SAKET', '25', '08375996566', NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-13 11:20:02', '2026-01-13 11:27:24'),
(5, 'User 8375996566', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-13 11:27:58', '2026-01-13 11:27:58'),
(6, 'User 7988370920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-14 07:13:47', '2026-01-14 07:13:47'),
(7, 'User 7405188056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-15 04:52:07', '2026-01-15 04:52:07'),
(8, 'User 7405188056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-17 06:33:16', '2026-01-17 06:33:16'),
(9, 'vaibhav satasiya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7405188056', NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-17 06:38:39', '2026-01-17 06:38:52'),
(10, 'Rishabh', 'rbh.sharmaa@gmail.com', NULL, NULL, 'male', 77, 'Dlehi', 'New Dlehi', '566555', '100', '54', '7988370920', NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-17 06:52:58', '2026-01-19 05:32:00'),
(11, 'rishi kashyap', 'rishi@gmail.com', NULL, NULL, NULL, 77, 'MH', 'mumbai', '251306', 'qwresres', NULL, '8375996566', NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-17 07:40:41', '2026-02-18 13:26:13'),
(12, 'RIshi Kashyap', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8375898789', NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-01-25 07:52:17', '2026-01-25 07:52:27'),
(13, 'anjali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9109710856', NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-02-10 07:07:59', '2026-02-10 07:08:12'),
(14, 'anjali', 'anjali92kumarisingh@gmail.com', NULL, NULL, NULL, 77, 'Uttar Pradesh', 'mji', '609876', 'ghj', NULL, '9911499148', NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-02-19 05:53:11', '2026-02-19 06:47:45'),
(15, 'User 9795204805', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9795204805', NULL, NULL, 'no', 'active', NULL, NULL, NULL, '2026-02-19 10:39:01', '2026-02-19 10:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `link`, `updated_at`, `created_at`) VALUES
(7, 'Animals Learning Video', 'https://www.youtube.com/watch?v=qxnxAiseLkY', '2025-11-07 11:27:05', '2025-10-22 12:16:17'),
(8, 'Most Viewed Video', 'https://www.youtube.com/watch?v=_XIrawnFjnc', '2025-11-07 11:27:24', '2025-10-22 12:17:26'),
(9, 'Kids Hindi Dance Song', 'https://www.youtube.com/watch?v=-dHp0ek73jw', '2025-11-07 11:27:51', '2025-10-22 12:18:26'),
(10, 'Kids lullaby Sleep Music', 'https://www.youtube.com/watch?v=1IF-oI264Ow', '2025-11-07 11:28:09', '2025-10-22 12:19:14'),
(11, 'Numbers learning Video', 'https://www.youtube.com/watch?v=JUREVVw73sc', '2025-11-07 11:29:16', '2025-11-07 11:28:40'),
(13, 'Shapes Learning Video', 'https://www.youtube.com/watch?v=VCsmPAOTaVg', '2025-11-07 11:31:52', '2025-11-07 11:31:52'),
(14, 'Happy Birthday Song', 'https://www.youtube.com/watch?v=dFGDGiG2LZA', '2025-11-07 11:32:50', '2025-11-07 11:32:50'),
(15, 'Peekaboo Video Song', 'https://www.youtube.com/watch?v=bWvNkvcbJhU', '2025-11-07 11:35:26', '2025-11-07 11:35:26'),
(16, 'Nursery Rhymes Song', 'https://www.youtube.com/watch?v=0B-w8zaphJQ', '2025-11-07 11:37:56', '2025-11-07 11:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `youtube_stats`
--

CREATE TABLE `youtube_stats` (
  `id` int(11) NOT NULL,
  `subscribers` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `youtube_stats`
--

INSERT INTO `youtube_stats` (`id`, `subscribers`, `views`, `updated_at`, `created_at`) VALUES
(1, 46000, 375000, '2026-02-18 10:46:56', '2025-11-18 12:02:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award_colors`
--
ALTER TABLE `award_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award_translations`
--
ALTER TABLE `award_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banned_histories`
--
ALTER TABLE `banned_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_payments`
--
ALTER TABLE `basic_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_category_translations_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_translations`
--
ALTER TABLE `blog_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_service_id_foreign` (`service_id`);

--
-- Indexes for table `character_gadgets`
--
ALTER TABLE `character_gadgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `character_galleries`
--
ALTER TABLE `character_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `character_mystic_forms`
--
ALTER TABLE `character_mystic_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `character_translations`
--
ALTER TABLE `character_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_sections`
--
ALTER TABLE `contact_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_histories`
--
ALTER TABLE `coupon_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customizable_page_translations`
--
ALTER TABLE `customizable_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customizable_page_translations_customizeable_page_id_index` (`customizeable_page_id`),
  ADD KEY `customizable_page_translations_lang_code_index` (`lang_code`);

--
-- Indexes for table `customizeable_pages`
--
ALTER TABLE `customizeable_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customizeable_pages_slug_unique` (`slug`);

--
-- Indexes for table `custom_addons`
--
ALTER TABLE `custom_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_addons_name_index` (`name`),
  ADD KEY `idx_custom_addons_status` (`status`);

--
-- Indexes for table `custom_codes`
--
ALTER TABLE `custom_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_paginations`
--
ALTER TABLE `custom_paginations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_addresses_user_id_foreign` (`user_id`),
  ADD KEY `delivery_addresses_country_id_foreign` (`country_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabworlds`
--
ALTER TABLE `fabworlds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabworld_categories`
--
ALTER TABLE `fabworld_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabworld_galleries`
--
ALTER TABLE `fabworld_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fabworld_slides`
--
ALTER TABLE `fabworld_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_product_user`
--
ALTER TABLE `favorite_product_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorite_product_user_product_id_foreign` (`product_id`);

--
-- Indexes for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homes`
--
ALTER TABLE `homes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `homes_slug_unique` (`slug`);

--
-- Indexes for table `home_banners`
--
ALTER TABLE `home_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_item_translations_menu_item_id_foreign` (`menu_item_id`);

--
-- Indexes for table `menu_translations`
--
ALTER TABLE `menu_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_translations_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `multi_currencies`
--
ALTER TABLE `multi_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_letters`
--
ALTER TABLE `news_letters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_tickers`
--
ALTER TABLE `news_tickers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_ticker_translations`
--
ALTER TABLE `news_ticker_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_addresses_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `our_teams`
--
ALTER TABLE `our_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_orders`
--
ALTER TABLE `payment_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_cashfree_order_id` (`cashfree_order_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_admin_id_foreign` (`admin_id`),
  ADD KEY `products_product_category_id_foreign` (`product_category_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category_translations`
--
ALTER TABLE `product_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_translations_product_category_id_foreign` (`product_category_id`);

--
-- Indexes for table `product_files`
--
ALTER TABLE `product_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_reviews_uuid_unique` (`uuid`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_translations_product_id_foreign` (`product_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_service_id_foreign` (`service_id`);

--
-- Indexes for table `project_galleries`
--
ALTER TABLE `project_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_images`
--
ALTER TABLE `project_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_images_project_id_foreign` (`project_id`);

--
-- Indexes for table `project_translations`
--
ALTER TABLE `project_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_home_id_foreign` (`home_id`);

--
-- Indexes for table `section_settings`
--
ALTER TABLE `section_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_translations`
--
ALTER TABLE `section_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_translations_section_id_foreign` (`section_id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_method_translations`
--
ALTER TABLE `shipping_method_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_method_translations_shipping_method_id_foreign` (`shipping_method_id`);

--
-- Indexes for table `skills_sections`
--
ALTER TABLE `skills_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialite_credentials`
--
ALTER TABLE `socialite_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `song_artists`
--
ALTER TABLE `song_artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `song_playlists`
--
ALTER TABLE `song_playlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plan_translations`
--
ALTER TABLE `subscription_plan_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_plan_translations_subscription_plan_id_foreign` (`subscription_plan_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonial_translations_lang_code_index` (`lang_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youtube_stats`
--
ALTER TABLE `youtube_stats`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `award_colors`
--
ALTER TABLE `award_colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `award_translations`
--
ALTER TABLE `award_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `banned_histories`
--
ALTER TABLE `banned_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basic_payments`
--
ALTER TABLE `basic_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `blog_translations`
--
ALTER TABLE `blog_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `character_gadgets`
--
ALTER TABLE `character_gadgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=804;

--
-- AUTO_INCREMENT for table `character_galleries`
--
ALTER TABLE `character_galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `character_mystic_forms`
--
ALTER TABLE `character_mystic_forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=703;

--
-- AUTO_INCREMENT for table `character_translations`
--
ALTER TABLE `character_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_sections`
--
ALTER TABLE `contact_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=580;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupon_histories`
--
ALTER TABLE `coupon_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customizable_page_translations`
--
ALTER TABLE `customizable_page_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customizeable_pages`
--
ALTER TABLE `customizeable_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `custom_addons`
--
ALTER TABLE `custom_addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_codes`
--
ALTER TABLE `custom_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_paginations`
--
ALTER TABLE `custom_paginations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `fabworlds`
--
ALTER TABLE `fabworlds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fabworld_categories`
--
ALTER TABLE `fabworld_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fabworld_galleries`
--
ALTER TABLE `fabworld_galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `fabworld_slides`
--
ALTER TABLE `fabworld_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faq_translations`
--
ALTER TABLE `faq_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `favorite_product_user`
--
ALTER TABLE `favorite_product_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `file_uploads`
--
ALTER TABLE `file_uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `homes`
--
ALTER TABLE `homes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `home_banners`
--
ALTER TABLE `home_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `menu_translations`
--
ALTER TABLE `menu_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `multi_currencies`
--
ALTER TABLE `multi_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news_letters`
--
ALTER TABLE `news_letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_tickers`
--
ALTER TABLE `news_tickers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `news_ticker_translations`
--
ALTER TABLE `news_ticker_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_addresses`
--
ALTER TABLE `order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `our_teams`
--
ALTER TABLE `our_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_orders`
--
ALTER TABLE `payment_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_category_translations`
--
ALTER TABLE `product_category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `product_files`
--
ALTER TABLE `product_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project_galleries`
--
ALTER TABLE `project_galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `project_images`
--
ALTER TABLE `project_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `project_translations`
--
ALTER TABLE `project_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `section_settings`
--
ALTER TABLE `section_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `section_translations`
--
ALTER TABLE `section_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_translations`
--
ALTER TABLE `service_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_method_translations`
--
ALTER TABLE `shipping_method_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `skills_sections`
--
ALTER TABLE `skills_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `socialite_credentials`
--
ALTER TABLE `socialite_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `song_artists`
--
ALTER TABLE `song_artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `song_playlists`
--
ALTER TABLE `song_playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscription_plan_translations`
--
ALTER TABLE `subscription_plan_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `youtube_stats`
--
ALTER TABLE `youtube_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  ADD CONSTRAINT `blog_category_translations_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`);

--
-- Constraints for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD CONSTRAINT `delivery_addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorite_product_user`
--
ALTER TABLE `favorite_product_user`
  ADD CONSTRAINT `favorite_product_user_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_translations`
--
ALTER TABLE `menu_translations`
  ADD CONSTRAINT `menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD CONSTRAINT `order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`);

--
-- Constraints for table `product_category_translations`
--
ALTER TABLE `product_category_translations`
  ADD CONSTRAINT `product_category_translations_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_images`
--
ALTER TABLE `project_images`
  ADD CONSTRAINT `project_images_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_home_id_foreign` FOREIGN KEY (`home_id`) REFERENCES `homes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `section_translations`
--
ALTER TABLE `section_translations`
  ADD CONSTRAINT `section_translations_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_method_translations`
--
ALTER TABLE `shipping_method_translations`
  ADD CONSTRAINT `shipping_method_translations_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscription_plan_translations`
--
ALTER TABLE `subscription_plan_translations`
  ADD CONSTRAINT `subscription_plan_translations_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
