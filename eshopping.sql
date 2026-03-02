-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2026 at 04:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `user_id`, `name`, `phone`, `address`, `city`, `state`, `pincode`, `country`, `is_default`, `created_at`, `latitude`, `longitude`) VALUES
(100, 103, 'user3', '1010101010', 'user home,user panchayath, user street,user state, pin 343434', 'city', 'state', '121212', 'india', 1, '2026-01-21 22:22:13', 10.8621540, 76.3912580),
(101, 103, 'user 32', '09876123456', 'Taj Mahal, Delhi, New Delhi ,India', 'Delhi', 'New Delhi', '678613', 'India', 0, '2026-02-02 18:46:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `name`, `created_at`) VALUES
(1, 'admin', 'admin123', 'Super Admin', '2026-02-01 20:08:50'),
(2, 'ops_admin', 'ops123', 'Operations Admin', '2026-02-01 20:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `admin_approval`
--

CREATE TABLE `admin_approval` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `tax_percentage` decimal(5,2) DEFAULT 0.00,
  `discount_percentage` decimal(5,2) DEFAULT 0.00,
  `initial_stock` int(11) NOT NULL,
  `reorder_level` int(11) DEFAULT 0,
  `manufactured_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `delivery_type` enum('NORMAL','EXPRESS','BOTH') DEFAULT 'NORMAL',
  `section` varchar(50) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `approval_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `approved_at` timestamp NULL DEFAULT NULL,
  `admin_remark` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_approval`
--

INSERT INTO `admin_approval` (`id`, `product_id`, `seller_id`, `product_name`, `sku`, `brand`, `description`, `cost_price`, `tax_percentage`, `discount_percentage`, `initial_stock`, `reorder_level`, `manufactured_date`, `expiry_date`, `delivery_type`, `section`, `category_id`, `image`, `approval_status`, `approved_at`, `admin_remark`, `created_at`) VALUES
(6, 18, 100, 'Formal Shirt', NULL, NULL, 'Cotton slim fit shirt', 1289.00, 0.00, 0.00, 0, 0, NULL, NULL, '', 'Men', 2, 'shirt.jpg', 'approved', '2026-02-09 05:54:01', '', '2026-02-09 05:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `added_at` datetime DEFAULT current_timestamp(),
  `delivery_type` enum('NORMAL','EXPRESS') DEFAULT 'NORMAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `quantity`, `added_at`, `delivery_type`) VALUES
(1, NULL, 16, 1, '2026-01-17 09:44:29', 'NORMAL'),
(10, 101, 7, 1, '2026-01-18 21:51:42', 'NORMAL'),
(11, 101, 8, 1, '2026-01-19 10:48:59', 'NORMAL'),
(46, 103, 9, 1, '2026-02-03 23:32:49', 'NORMAL'),
(47, 103, 18, 1, '2026-02-03 23:32:52', 'NORMAL');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Electronics', 'Electronic gadgets'),
(2, 'Fashion', 'Clothing and accessories'),
(3, 'Home Appliances', 'home'),
(4, 'Groceries', 'Home usage items'),
(5, 'Books', 'books');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `min_order_amount` decimal(10,2) DEFAULT 0.00,
  `max_discount` decimal(10,2) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `max_uses` int(11) DEFAULT 1,
  `used_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `code`, `discount`, `min_order_amount`, `max_discount`, `expiry_date`, `is_active`, `created_at`, `max_uses`, `used_count`) VALUES
(1, 'WELCOME50', 50.00, 299.00, 50.00, '2026-12-31', 1, '2026-02-03 22:46:32', 1, 0),
(2, 'SAVE100', 100.00, 699.00, 100.00, '2026-10-31', 1, '2026-02-03 22:46:32', 1, 0),
(3, 'FESTIVE150', 150.00, 999.00, 150.00, '2026-11-15', 1, '2026-02-03 22:46:32', 1, 0),
(4, 'MEGA200', 200.00, 1499.00, 200.00, '2026-09-30', 1, '2026-02-03 22:46:32', 1, 0),
(5, 'SUPER300', 300.00, 2499.00, 300.00, '2026-12-01', 1, '2026-02-03 22:46:32', 1, 0),
(6, 'FLASH75', 75.00, 399.00, 75.00, '2026-08-31', 1, '2026-02-03 22:46:32', 1, 0),
(7, 'NEWUSER100', 100.00, 499.00, 100.00, '2027-01-01', 1, '2026-02-03 22:46:32', 1, 0),
(8, 'DIWALI250', 250.00, 1999.00, 250.00, '2026-11-05', 1, '2026-02-03 22:46:32', 1, 0),
(9, 'CLEARANCE50', 50.00, 199.00, 50.00, '2026-07-31', 1, '2026-02-03 22:46:32', 1, 0),
(10, 'BIGSALE500', 500.00, 4999.00, 500.00, '2026-12-31', 1, '2026-02-03 22:46:32', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usage`
--

CREATE TABLE `coupon_usage` (
  `usage_id` int(11) NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `used_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `usage_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `used_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupon_usages`
--

INSERT INTO `coupon_usages` (`usage_id`, `coupon_id`, `user_id`, `order_id`, `used_at`) VALUES
(1, 1, 103, 90, '2026-02-04 21:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `delivery_status` enum('ASSIGNED','PICKED_UP','OUT_FOR_DELIVERY','DELIVERED','FAILED') DEFAULT NULL,
  `pickup_time` datetime DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_partners`
--

CREATE TABLE `delivery_partners` (
  `partner_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `current_order_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `approval_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `approved_at` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `total_orders_delivered` int(11) DEFAULT 0,
  `rating` decimal(2,1) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_location_update` datetime DEFAULT NULL,
  `total_earnings` decimal(10,2) DEFAULT 0.00,
  `wallet_balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_partners`
--

INSERT INTO `delivery_partners` (`partner_id`, `name`, `phone`, `latitude`, `longitude`, `is_available`, `current_order_id`, `created_at`, `approval_status`, `approved_at`, `email`, `password_hash`, `total_orders_delivered`, `rating`, `vehicle_type`, `last_login`, `last_location_update`, `total_earnings`, `wallet_balance`) VALUES
(1, 'Express Partner 1', '9876543210', 10.8630000, 76.3920000, 0, 83, '2026-01-29 17:39:10', 'approved', '2026-02-02 23:28:34', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0.00, 0.00),
(2, 'Express Partner 2', '9876543211', 10.8615000, 76.3905000, 1, NULL, '2026-01-29 17:39:10', 'approved', '2026-02-02 23:28:37', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0.00, 0.00),
(3, 'Quick Delivery 1', '9876543212', 10.8655000, 76.3910000, 0, 84, '2026-01-29 17:39:10', 'approved', '2026-02-02 23:28:39', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0.00, 0.00),
(4, 'Quick Delivery 2', '9876543213', 10.8640000, 76.3895000, 1, 70, '2026-01-29 17:39:10', 'approved', NULL, NULL, NULL, 2, NULL, NULL, '2026-02-16 11:46:07', NULL, 0.00, 0.00),
(5, 'Far Delivery', '9876543214', 11.2010000, 76.9010000, 1, NULL, '2026-01-29 17:39:10', 'approved', '2026-02-02 23:28:40', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0.00, 0.00),
(6, 'Slow Partner', '9876543215', 11.2500000, 76.9500000, 1, NULL, '2026-01-29 17:39:10', 'approved', '2026-02-02 23:28:43', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_partner_earnings`
--

CREATE TABLE `delivery_partner_earnings` (
  `earning_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `base_amount` decimal(10,2) DEFAULT NULL,
  `distance_km` decimal(5,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT 0.00,
  `penalty` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_partner_earnings`
--

INSERT INTO `delivery_partner_earnings` (`earning_id`, `partner_id`, `item_id`, `base_amount`, `distance_km`, `bonus`, `penalty`, `total_amount`, `created_at`) VALUES
(1, 4, 52, 40.00, 5.00, 20.00, 0.00, 110.00, '2026-02-01 15:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'eapp', 'category'),
(8, 'eapp', 'product'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-01-17 02:41:11.058831'),
(2, 'auth', '0001_initial', '2026-01-17 02:41:11.222300'),
(3, 'admin', '0001_initial', '2026-01-17 02:41:11.684467'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-01-17 02:41:11.826178'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-01-17 02:41:11.836011'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-01-17 02:41:11.906527'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-01-17 02:41:11.965621'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-01-17 02:41:11.989141'),
(9, 'auth', '0004_alter_user_username_opts', '2026-01-17 02:41:12.008458'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-01-17 02:41:12.059326'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-01-17 02:41:12.059326'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-01-17 02:41:12.059326'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-01-17 02:41:12.089070'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-01-17 02:41:12.104760'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-01-17 02:41:12.121055'),
(16, 'auth', '0011_update_proxy_permissions', '2026-01-17 02:41:12.139464'),
(17, 'eapp', '0001_initial', '2026-01-17 02:41:12.174836'),
(18, 'eapp', '0002_auto_20260114_1227', '2026-01-17 02:41:12.276383'),
(19, 'sessions', '0001_initial', '2026-01-17 02:41:12.281584');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('du2s8245u4w1rkl38i4upbuykdjsgcb7', 'NDcwM2UwNWM3ZTQwMzI0ZDlhZDlhMDk3NThmNGNkMWU3ZGZmMDNkYjp7InVzZXJfaWQiOjEwM30=', '2026-03-02 06:24:50.745480'),
('n731vtlfpk9nbmdqzc0d4jthrn5f6c7l', 'YmJhM2IwZDI3MTAyZDdhZjQwMDBiYmUxNjQ1NDM3ODljMTA3ODI4MTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwic2VsbGVyX2lkIjoxMDAsInNlbGxlcl9uYW1lIjoic2VsbGVyMSJ9', '2026-02-01 16:37:47.703584');

-- --------------------------------------------------------

--
-- Table structure for table `eapp_category`
--

CREATE TABLE `eapp_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eapp_product`
--

CREATE TABLE `eapp_product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `cost_price` decimal(10,2) NOT NULL COMMENT 'CP – purchase cost',
  `selling_price` decimal(10,2) NOT NULL COMMENT 'SP – actual selling price',
  `mrp` decimal(10,2) NOT NULL COMMENT 'MRP – max retail price',
  `tax_percentage` decimal(5,2) DEFAULT 0.00,
  `discount_percentage` decimal(5,2) DEFAULT 0.00,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `reserved_quantity` int(11) NOT NULL DEFAULT 0,
  `available_quantity` int(11) NOT NULL DEFAULT 0,
  `reorder_level` int(11) DEFAULT 5,
  `manufactured_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `stock_status` enum('in_stock','low_stock','out_of_stock','expired') DEFAULT 'in_stock',
  `is_active` tinyint(1) DEFAULT 1,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delivery_type` enum('standard','express','both') NOT NULL DEFAULT 'standard',
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `express_enabled` tinyint(1) DEFAULT 0,
  `section` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `product_name`, `description`, `image_url`, `seller_id`, `sku`, `cost_price`, `selling_price`, `mrp`, `tax_percentage`, `discount_percentage`, `stock_quantity`, `reserved_quantity`, `available_quantity`, `reorder_level`, `manufactured_date`, `expiry_date`, `stock_status`, `is_active`, `added_date`, `last_updated`, `delivery_type`, `latitude`, `longitude`, `express_enabled`, `section`, `category_id`) VALUES
(301, 201, '', NULL, NULL, 0, NULL, 1.00, 1.00, 1.00, 0.00, 0.00, 0, 0, 50, 5, NULL, NULL, 'in_stock', 1, '2026-01-28 11:16:09', '2026-02-04 17:02:15', 'express', NULL, NULL, 0, NULL, NULL),
(302, 202, '', NULL, NULL, 0, NULL, 1.00, 1.00, 1.00, 0.00, 0.00, 0, 0, 40, 5, NULL, NULL, 'in_stock', 1, '2026-01-28 11:16:09', '2026-02-04 17:02:15', 'express', NULL, NULL, 0, NULL, NULL),
(303, 203, '', NULL, NULL, 0, NULL, 1.00, 1.00, 1.00, 0.00, 0.00, 0, 0, 30, 5, NULL, NULL, 'in_stock', 1, '2026-01-28 11:16:09', '2026-02-04 17:02:15', 'express', NULL, NULL, 0, NULL, NULL),
(304, 204, '', NULL, NULL, 0, NULL, 1.00, 1.00, 1.00, 0.00, 0.00, 0, 0, 100, 5, NULL, NULL, 'in_stock', 1, '2026-01-28 11:16:42', '2026-02-04 17:02:15', 'express', NULL, NULL, 0, NULL, NULL),
(306, 5, 'Mouse', 'computer mouse ', '8f9e19e7-da85-4405-9a0b-be5bf12e9fa3.png', 100, NULL, 0.00, 30.00, 0.00, 0.12, 0.00, 10, 0, 10, 5, NULL, NULL, '', 1, '2026-02-04 18:21:38', '2026-02-08 12:00:33', '', NULL, NULL, 0, 'Men', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `log_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `previous_stock` int(11) DEFAULT NULL,
  `updated_stock` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `order_status` enum('Pending','Confirmed','Shipped','Delivered','Cancelled') DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `delivery_type` enum('NORMAL','EXPRESS') DEFAULT 'NORMAL',
  `delivered_at` datetime DEFAULT NULL,
  `gift_wrap` tinyint(1) DEFAULT 0,
  `gift_message` varchar(255) DEFAULT NULL,
  `gift_wrap_fee` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `created_at`, `updated_at`, `user_id`, `total_amount`, `discount_amount`, `tax_amount`, `shipping_fee`, `coupon_code`, `payment_mode`, `payment_status`, `transaction_id`, `payment_date`, `order_status`, `shipping_address_id`, `billing_address_id`, `shipped_at`, `delivery_type`, `delivered_at`, `gift_wrap`, `gift_message`, `gift_wrap_fee`) VALUES
(2, '2026-01-21 11:55:56', '2026-01-22 20:22:59', 103, 1000.00, 0.00, 0.00, 0.00, NULL, 'COD', 'Pending', NULL, NULL, '', 1, 1, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(8, '2026-01-22 10:47:33', '2026-01-22 10:47:33', 103, 888.95, 0.00, 39.95, 50.00, NULL, 'cod', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(9, '2026-01-22 12:45:06', '2026-01-22 12:45:06', 103, 888.95, 0.00, 39.95, 50.00, NULL, 'cod', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(10, '2026-01-22 12:45:10', '2026-01-22 12:45:10', 103, 888.95, 0.00, 39.95, 50.00, NULL, 'cod', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(11, '2026-01-22 12:46:29', '2026-01-22 12:46:29', 103, 888.95, 0.00, 39.95, 50.00, NULL, 'cod', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(12, '2026-01-22 12:55:55', '2026-01-22 12:55:55', 103, 3723.95, 0.00, 174.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(13, '2026-01-22 13:05:05', '2026-01-22 13:05:05', 103, 45198.95, 0.00, 2149.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(14, '2026-01-22 13:07:03', '2026-01-22 13:07:03', 103, 15798.95, 0.00, 749.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(15, '2026-01-22 13:10:48', '2026-01-22 13:10:48', 103, 2148.95, 0.00, 99.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(16, '2026-01-22 13:14:53', '2026-01-22 13:14:53', 103, 1413.95, 0.00, 64.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(17, '2026-01-22 13:17:39', '2026-01-22 13:17:39', 103, 3723.95, 0.00, 174.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(18, '2026-01-22 13:41:17', '2026-01-22 19:11:19', 103, 16848.95, 0.00, 799.95, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(24, '2026-01-24 06:05:37', '2026-01-24 06:05:37', 103, 32597.90, 0.00, 1549.90, 50.00, NULL, 'cod', 'Pending', NULL, NULL, '', NULL, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(25, '2026-01-24 06:06:39', '2026-01-24 06:06:39', 103, 32597.90, 0.00, 1549.90, 50.00, NULL, 'cod', 'Pending', NULL, NULL, '', NULL, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(26, '2026-01-24 06:14:19', '2026-01-24 06:14:19', 103, 2462.90, 0.00, 114.90, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', NULL, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(32, '2026-01-25 16:13:46', '2026-01-25 16:13:46', 103, 888.95, 0.00, 39.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(33, '2026-01-25 16:39:41', '2026-01-25 16:39:41', 103, 678.95, 0.00, 29.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(34, '2026-01-25 16:49:14', '2026-01-25 16:49:14', 103, 1728.95, 0.00, 79.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(35, '2026-01-25 17:16:17', '2026-01-25 17:16:17', 103, 2148.95, 0.00, 99.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(36, '2026-01-25 18:47:04', '2026-01-25 18:47:04', 103, 4562.90, 0.00, 214.90, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(37, '2026-01-25 18:50:45', '2026-01-25 18:50:45', 103, 9182.90, 0.00, 434.90, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(38, '2026-01-25 18:52:13', '2026-01-25 18:52:13', 103, 1938.95, 0.00, 89.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(39, '2026-01-26 05:11:07', '2026-01-26 05:11:07', 103, 3198.95, 0.00, 149.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(40, '2026-01-26 05:20:35', '2026-01-26 05:20:35', 103, 888.95, 0.00, 39.95, 50.00, NULL, 'cod', 'COD', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(43, '2026-01-26 11:17:04', '2026-01-26 11:17:54', 103, 2499.00, NULL, NULL, NULL, NULL, 'COD', 'Paid', NULL, NULL, '', NULL, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(44, '2026-01-27 06:14:13', '2026-01-27 06:14:13', 103, 1413.95, 0.00, 64.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(45, '2026-01-29 11:37:46', '2026-01-29 11:37:46', 103, 86.75, 0.00, 1.75, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, '', NULL, 0, NULL, 0.00),
(46, '2026-01-29 11:52:35', '2026-01-29 11:52:35', 103, 86.75, 0.00, 1.75, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, '', NULL, 0, NULL, 0.00),
(47, '2026-01-29 12:09:16', '2026-01-29 12:09:16', 103, 86.75, 0.00, 1.75, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, '', NULL, 0, NULL, 0.00),
(48, '2026-01-29 12:15:48', '2026-01-29 12:15:48', 103, 86.75, 0.00, 1.75, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, '', NULL, 0, NULL, 0.00),
(49, '2026-01-29 12:22:36', '2026-01-29 12:22:36', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'EXPRESS', '2026-01-29 12:52:36', 0, NULL, 0.00),
(50, '2026-01-31 17:48:09', '2026-01-31 17:48:09', 103, 97.25, 0.00, 2.25, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, '', NULL, 0, NULL, 0.00),
(51, '2026-01-31 17:48:59', '2026-01-31 17:48:59', 103, 197.25, 0.00, 2.25, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'EXPRESS', NULL, 0, NULL, 0.00),
(52, '2026-02-02 21:02:22', '2026-02-02 21:02:22', 103, 1099.02, 0.00, 160.02, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(53, '2026-02-02 21:02:39', '2026-02-02 21:02:39', 103, 1099.02, 0.00, 160.02, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(54, '2026-02-02 21:05:26', '2026-02-02 21:05:26', 103, 1099.02, 0.00, 160.02, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(55, '2026-02-02 21:07:57', '2026-02-02 21:07:57', 103, 1099.02, 0.00, 160.02, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(56, '2026-02-02 21:26:48', '2026-02-02 21:26:48', 103, 2625.64, 0.00, 377.64, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(57, '2026-02-02 21:32:11', '2026-02-02 21:32:11', 103, 19031.92, 0.00, 2887.92, 100.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(58, '2026-02-02 21:39:38', '2026-02-02 21:39:38', 103, 0.00, 0.00, 0.00, 0.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(59, '2026-02-02 21:40:52', '2026-02-02 21:40:52', 103, 0.00, 0.00, 0.00, 0.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(60, '2026-02-02 21:41:51', '2026-02-02 21:41:51', 103, 19020.12, 0.00, 2886.12, 100.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(61, '2026-02-02 22:17:34', '2026-02-02 22:17:34', 103, 0.00, 0.00, 0.00, 0.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(62, '2026-02-02 22:17:37', '2026-02-02 22:17:37', 103, 0.00, 0.00, 0.00, 0.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(65, '2026-02-02 23:01:58', '2026-02-02 23:01:58', 103, 888.95, 0.00, 39.95, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(66, '2026-02-02 23:07:17', '2026-02-02 23:07:17', 103, 966.12, 0.00, 132.12, 100.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(67, '2026-02-02 23:10:07', '2026-02-02 23:10:07', 103, 144.50, 0.00, 4.50, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(68, '2026-02-02 23:25:48', '2026-02-02 23:25:49', 103, 459.30, 0.00, 24.30, 300.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(69, '2026-02-02 23:27:00', '2026-02-02 23:27:00', 103, 86.75, 0.00, 1.75, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(70, '2026-02-02 23:47:49', '2026-02-02 23:47:49', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(71, '2026-02-03 10:38:21', '2026-02-03 10:38:21', 103, 144.50, 0.00, 4.50, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(72, '2026-02-03 11:32:33', '2026-02-03 11:32:33', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(73, '2026-02-03 11:37:21', '2026-02-03 11:37:21', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'EXPRESS', NULL, 0, NULL, 0.00),
(74, '2026-02-03 11:42:18', '2026-02-03 11:42:18', 103, 97.25, 0.00, 2.25, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(75, '2026-02-03 11:44:46', '2026-02-03 11:44:46', 103, 86.75, 0.00, 1.75, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(76, '2026-02-03 11:46:53', '2026-02-03 11:46:53', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(77, '2026-02-03 11:48:40', '2026-02-03 11:48:40', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(78, '2026-02-03 11:50:19', '2026-02-03 11:50:19', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(79, '2026-02-03 11:53:31', '2026-02-03 11:53:31', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(80, '2026-02-03 11:59:11', '2026-02-03 11:59:11', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(81, '2026-02-03 12:06:37', '2026-02-03 12:06:37', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(82, '2026-02-03 12:28:09', '2026-02-03 12:28:09', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(83, '2026-02-03 12:36:51', '2026-02-03 12:36:51', 103, 186.75, 0.00, 1.75, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(84, '2026-02-03 12:37:54', '2026-02-03 12:37:54', 103, 197.25, 0.00, 2.25, 150.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(85, '2026-02-03 22:07:27', '2026-02-03 22:07:27', 103, 2847.92, 0.00, 403.92, 200.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(86, '2026-02-03 22:16:12', '2026-02-03 22:16:12', 103, 0.00, 0.00, 0.00, 0.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(87, '2026-02-03 22:18:35', '2026-02-03 22:18:35', 103, 0.00, 0.00, 0.00, 0.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(88, '2026-02-03 22:19:34', '2026-02-03 22:19:34', 103, 1785.92, 0.00, 241.92, 200.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(89, '2026-02-03 22:27:49', '2026-02-03 22:27:49', 103, 19131.92, 0.00, 2887.92, 200.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(90, '2026-02-04 21:34:06', '2026-02-04 21:34:12', 103, 942.82, 50.00, 143.82, 50.00, NULL, 'upi', 'PAID', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(91, '2026-02-04 21:58:15', '2026-02-04 21:58:19', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(92, '2026-02-04 21:59:30', '2026-02-04 21:59:30', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(93, '2026-02-04 22:01:34', '2026-02-04 22:01:35', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(94, '2026-02-04 22:03:13', '2026-02-04 22:03:14', 103, 756.82, 0.00, 107.82, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(95, '2026-02-04 22:06:46', '2026-02-04 22:06:47', 103, 2998.82, 0.00, 449.82, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(96, '2026-02-04 22:13:41', '2026-02-04 22:13:42', 103, 1228.82, 0.00, 179.82, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(97, '2026-02-04 22:16:47', '2026-02-04 22:16:48', 103, 1936.82, 0.00, 287.82, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(98, '2026-02-04 22:21:57', '2026-02-04 22:21:59', 103, 638.82, 0.00, 89.82, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(99, '2026-02-08 20:10:41', '2026-02-08 20:10:41', 103, 17748.82, 0.00, 2699.82, 50.00, NULL, 'cod', 'COD', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(100, '2026-02-10 20:35:17', '2026-02-10 20:35:17', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(101, '2026-02-10 20:35:48', '2026-02-10 20:35:48', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'card', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(102, '2026-02-10 20:45:26', '2026-02-10 20:45:26', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(103, '2026-02-10 20:47:10', '2026-02-10 20:47:10', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(104, '2026-02-10 20:49:59', '2026-02-10 20:49:59', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(105, '2026-02-10 20:58:09', '2026-02-10 20:58:09', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(106, '2026-02-10 21:11:47', '2026-02-10 21:11:47', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(107, '2026-02-10 21:14:18', '2026-02-10 21:18:14', 103, 1582.82, 0.00, 233.82, 50.00, NULL, 'upi', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(108, '2026-02-10 21:36:02', '2026-02-10 21:36:02', 103, 520.82, 0.00, 71.82, 50.00, NULL, 'card', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(109, '2026-02-10 21:43:43', '2026-02-10 21:45:48', 103, 520.82, 0.00, 71.82, 50.00, NULL, 'card', 'Paid', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00),
(110, '2026-02-16 11:57:05', '2026-02-16 11:57:05', 103, 156.20, 0.00, 16.20, 50.00, NULL, 'card', 'Pending', NULL, NULL, '', 100, NULL, NULL, 'NORMAL', NULL, 0, NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `order_status` varchar(20) DEFAULT 'Pending',
  `delivery_status` varchar(20) NOT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `delivery_partner_id` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `assigned_at` datetime DEFAULT NULL,
  `last_status_update` datetime DEFAULT NULL,
  `reassigned_count` int(11) DEFAULT 0,
  `delivery_type` enum('standard','express') NOT NULL,
  `delivery_fee` decimal(10,2) NOT NULL,
  `estimated_delivery_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `quantity`, `price`, `order_status`, `delivery_status`, `tracking_number`, `shipped_at`, `delivery_partner_id`, `delivery_date`, `assigned_at`, `last_status_update`, `reassigned_count`, `delivery_type`, `delivery_fee`, `estimated_delivery_days`) VALUES
(31, 32, 9, 1, 799.00, 'Placed', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(32, 33, 22, 1, 599.00, 'Placed', 'Pending Assignment', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(33, 34, 28, 1, 1599.00, 'Placed', 'Pending Assignment', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(34, 35, 15, 1, 1999.00, 'Placed', 'Pending Assignment', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(37, 37, 30, 1, 6499.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(38, 37, 29, 1, 2199.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(39, 38, 20, 1, 1799.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(40, 39, 8, 1, 2999.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(41, 40, 9, 1, 799.00, 'Shipped', 'Processing', 'TRK61302682', '2026-01-26 16:33:54', NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(45, 44, 32, 1, 1299.00, 'Shipped', 'Processing', 'TRK5B9F3636', '2026-01-29 23:10:35', NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(50, 49, 217, 1, 35.00, 'Delivered', 'Delivered', NULL, '2026-01-29 12:22:36', 4, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(52, 51, 218, 1, 45.00, 'Placed', 'Delivered', NULL, '2026-01-31 17:48:59', 4, '2026-02-01', NULL, '2026-02-01 15:28:22', 0, 'standard', 0.00, 0),
(53, 55, 9, 1, 799.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(54, 55, 219, 1, 90.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(55, 56, 9, 1, 799.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(56, 56, 10, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(57, 57, 7, 1, 15999.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(58, 57, 218, 1, 45.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(59, 60, 7, 1, 15999.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(60, 60, 217, 1, 35.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 0.00, 0),
(61, 65, 9, 1, 799.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-02 17:31:58', 0, 'standard', 50.00, 3),
(62, 66, 217, 1, 35.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 50.00, 3),
(63, 66, 23, 1, 699.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 50.00, 3),
(64, 67, 219, 1, 90.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-02 17:40:07', 0, 'standard', 50.00, 3),
(65, 68, 219, 1, 90.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'express', 150.00, 3),
(68, 70, 217, 1, 35.00, 'Placed', 'Processing', NULL, '2026-02-02 18:17:49', 4, '2026-02-02', '2026-02-02 18:17:49', '2026-02-02 18:17:49', 0, 'express', 150.00, 0),
(81, 83, 217, 1, 35.00, 'Placed', 'Processing', NULL, NULL, 1, '2026-02-03', '2026-02-03 07:06:51', '2026-02-03 07:06:51', 0, 'express', 150.00, 0),
(82, 84, 218, 1, 45.00, 'Placed', 'Processing', NULL, NULL, 3, '2026-02-03', '2026-02-03 07:07:54', '2026-02-03 07:07:54', 0, 'express', 150.00, 0),
(87, 88, 218, 1, 45.00, 'Placed', 'Processing', NULL, NULL, 2, NULL, '2026-02-03 22:19:34', NULL, 0, 'express', 150.00, 3),
(88, 88, 32, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'standard', 50.00, 3),
(89, 89, 7, 1, 15999.00, 'Placed', 'Processing', NULL, NULL, NULL, '2026-02-06', NULL, '2026-02-03 22:27:49', 0, 'standard', 50.00, 3),
(90, 89, 218, 1, 45.00, 'Placed', 'Processing', NULL, NULL, 6, '2026-02-04', '2026-02-03 22:27:49', '2026-02-03 22:27:49', 0, 'express', 150.00, 1),
(91, 90, 9, 1, 799.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-04 21:34:06', 0, 'standard', 50.00, 3),
(92, 91, 10, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-04 21:58:15', 0, 'standard', 50.00, 3),
(93, 92, 10, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-04 21:59:30', 0, 'standard', 50.00, 3),
(94, 93, 10, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-04 22:01:34', 0, 'standard', 50.00, 3),
(95, 94, 22, 1, 599.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-04 22:03:13', 0, 'standard', 50.00, 3),
(96, 95, 21, 1, 2499.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-04 22:06:46', 0, 'standard', 50.00, 3),
(97, 96, 19, 1, 999.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-04 22:13:41', 0, 'standard', 50.00, 3),
(98, 97, 28, 1, 1599.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-04 22:16:47', 0, 'standard', 50.00, 3),
(99, 98, 24, 1, 499.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-04 22:21:57', 0, 'standard', 50.00, 3),
(100, 99, 13, 1, 14999.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-08 20:10:41', 0, 'standard', 50.00, 3),
(101, 100, 18, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-10 20:35:17', 0, 'standard', 50.00, 3),
(102, 101, 18, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-10 20:35:48', 0, 'standard', 50.00, 3),
(103, 102, 18, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-10 20:45:26', 0, 'standard', 50.00, 3),
(104, 103, 18, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-10 20:47:10', 0, 'standard', 50.00, 3),
(105, 104, 18, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-10 20:49:59', 0, 'standard', 50.00, 3),
(106, 105, 18, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-10 20:58:10', 0, 'standard', 50.00, 3),
(107, 106, 18, 1, 1299.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-10 21:11:47', 0, 'standard', 50.00, 3),
(108, 107, 18, 1, 1299.00, 'Shipped', 'Processing', 'TRK-SC6EH30C9S', '2026-02-10 19:24:00', NULL, NULL, NULL, '2026-02-10 21:14:18', 0, 'standard', 50.00, 3),
(109, 108, 27, 1, 399.00, 'Shipped', 'Processing', 'TRK-9UNC0QIO33', '2026-02-10 19:14:23', NULL, NULL, NULL, '2026-02-10 21:36:02', 0, 'standard', 50.00, 3),
(110, 109, 27, 1, 399.00, 'Shipped', 'Processing', 'TRK45697194', '2026-02-10 18:01:20', NULL, NULL, NULL, '2026-02-10 21:43:43', 0, 'standard', 50.00, 3),
(111, 110, 219, 1, 90.00, 'Placed', 'Processing', NULL, NULL, NULL, NULL, NULL, '2026-02-16 11:57:05', 0, 'standard', 50.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` enum('Paid','Pending','Failed') DEFAULT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `transaction_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_status`, `payment_date`, `transaction_id`) VALUES
(1, 90, 'upi', 'Paid', '2026-02-04 16:04:12', 'TXN-6EB41C6028'),
(2, 91, 'upi', 'Paid', '2026-02-04 21:58:18', 'TXN-238B8641EF'),
(3, 92, 'upi', 'Paid', '2026-02-04 21:59:30', 'TXN-68AECD22E3'),
(4, 93, 'upi', 'Paid', '2026-02-04 16:31:35', 'TXN-4A23AA51E9'),
(5, 94, 'upi', 'Paid', '2026-02-04 16:33:14', 'TXN-19FCAD953D'),
(6, 95, 'upi', 'Paid', '2026-02-04 16:36:47', 'TXN-4376C486C1'),
(7, 96, 'upi', 'Paid', '2026-02-04 16:43:42', 'TXN-7880F54D6B'),
(8, 97, 'upi', 'Paid', '2026-02-04 16:46:48', 'TXN-5CEB608361'),
(9, 98, 'upi', 'Paid', '2026-02-04 16:51:59', 'TXN-07616CFC23'),
(10, 99, 'cod', 'Paid', '2026-02-08 14:40:41', 'COD-99'),
(19, 108, 'card', 'Pending', NULL, NULL),
(20, 109, 'card', 'Paid', '2026-02-10 16:15:48', 'eb4y2jhy'),
(21, 110, 'card', 'Pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `section` varchar(20) NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `added_date` datetime DEFAULT current_timestamp(),
  `seller_id` int(11) DEFAULT NULL,
  `view_count` int(11) DEFAULT 0,
  `delivery_type` enum('standard','express','both') NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `seller_status` enum('ACTIVE','PAUSED','STOPPED') DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `section`, `product_name`, `description`, `price`, `stock_quantity`, `image_url`, `added_date`, `seller_id`, `view_count`, `delivery_type`, `is_active`, `seller_status`) VALUES
(5, 1, 'Men', 'Mouse', 'computer mouse ', 30.00, 10, '8f9e19e7-da85-4405-9a0b-be5bf12e9fa3.png', '2026-02-08 17:30:33', 100, 0, 'standard', 0, 'ACTIVE'),
(7, 1, 'NULL', 'Smartphone', 'Android 5G smartphone with 128GB storage', 15999.00, 39, 'mobile.jpg', '2026-01-16 16:48:28', 100, 26, 'standard', 1, 'ACTIVE'),
(8, 1, 'NULL', 'Bluetooth Headphones', 'Wireless noise cancelling headphones', 2999.00, 79, 'headphone.jpg', '2026-01-16 16:48:28', 100, 26, 'standard', 1, 'ACTIVE'),
(9, 2, 'Men', 'Men T-Shirt', 'Cotton slim fit t-shirt', 799.00, 106, 'tshirt.jpg', '2026-01-16 16:48:28', 100, 35, 'standard', 1, 'ACTIVE'),
(10, 2, 'Women', 'Women Jeans', 'High waist blue jeans', 1299.00, 86, 'jeans.jpg', '2026-01-16 16:48:28', 100, 37, 'standard', 1, 'ACTIVE'),
(12, 3, 'NULL', 'Mixer Grinder', '750W kitchen mixer grinder', 3499.00, 38, 'mixer.jpg', '2026-01-16 16:48:28', 100, 26, 'standard', 1, 'ACTIVE'),
(13, 1, 'NULL', 'Samsung Galaxy A15', '5G Android smartphone', 14999.00, 38, 'mobile1.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(14, 1, 'NULL', 'iPhone 13', 'Apple smartphone 128GB', 55999.00, 25, 'iphone.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(15, 1, 'NULL', 'Bluetooth Speaker', 'Portable wireless speaker', 1999.00, 58, 'speaker.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(16, 1, 'Unisex', 'Smart Watch', 'Fitness tracking smartwatch', 3499.00, 49, 'watch.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(17, 1, 'NULL', 'Laptop', '14 inch Intel laptop', 42999.00, 19, 'laptop.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(18, 2, 'Men', 'Formal Shirt', 'Cotton slim fit shirt', 1299.00, 61, 'shirt.jpg', '2026-01-16 16:59:58', 100, 36, 'standard', 1, 'ACTIVE'),
(19, 1, 'Women', 'Kurti', 'Printed cotton kurti', 899.00, 78, 'kurti.jpg', '2026-01-16 16:59:58', 100, 36, 'standard', 1, 'ACTIVE'),
(20, 2, 'Men', 'Jeans Pant', 'Blue denim jeans', 1799.00, 59, 'jeans.jpg', '2026-01-16 16:59:58', 100, 36, 'standard', 1, 'ACTIVE'),
(21, 2, 'Women', 'Handbag', 'Leather shoulder bag', 2499.00, 34, 'bag.jpg', '2026-01-16 16:59:58', 100, 37, 'standard', 1, 'ACTIVE'),
(22, 2, 'Kids', 'Kids T-Shirt', 'Cartoon print t-shirt', 599.00, 88, 'kidstshirt.jpg', '2026-01-16 16:59:58', 100, 35, 'standard', 1, 'ACTIVE'),
(23, 5, 'NULL', 'Java Programming Book', 'Java complete guide', 699.00, 49, 'javabook.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(24, 5, 'NULL', 'Cooking Recipe Book', 'Indian recipe collection', 499.00, 39, 'cookbook.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(25, 5, 'Kids', 'Coloring Book', 'Kids drawing book', 299.00, 70, 'colorbook.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(26, 5, 'NULL', 'AI Book', 'Artificial Intelligence basics', 899.00, 30, 'aibook.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(27, 5, 'NULL', 'Story Novel', 'Romantic fiction novel', 399.00, 43, 'novel.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(28, 3, 'NULL', 'Electric Iron', 'Steam press iron', 1599.00, 23, 'iron.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(29, 3, 'NULL', 'Hair Dryer', 'Professional hair dryer', 2199.00, 27, 'hairdryer.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(30, 3, 'NULL', 'Water Heater', 'Instant geyser', 6499.00, 14, 'geyser.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(31, 3, 'NULL', 'Vacuum Cleaner', 'Portable vacuum cleaner', 4599.00, 19, 'vacuum.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(32, 3, 'NULL', 'Table Fan', 'Mini table fan', 1299.00, 38, 'fan.jpg', '2026-01-16 16:59:58', 100, 26, 'standard', 1, 'ACTIVE'),
(217, 4, 'NULL', 'Fresh Milk 500ml', 'Farm fresh milk', 35.00, 0, 'milk.jpg', '2026-01-28 16:57:07', 101, 9, 'express', 1, 'ACTIVE'),
(218, 4, 'NULL', 'Brown Bread', 'Soft whole wheat bread', 45.00, 9, 'bread.jpg', '2026-01-28 16:57:07', 101, 9, 'express', 1, 'ACTIVE'),
(219, 4, 'NULL', 'Eggs (12 pack)', 'Organic farm eggs', 90.00, 15, 'eggs.jpg', '2026-01-28 16:57:07', 101, 9, 'both', 1, 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `image_url`) VALUES
(1, 217, 'milk1.png'),
(2, 217, 'milk2.png\r\n'),
(3, 217, 'milk3.png');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('requested','approved','pickup_scheduled','received','refunded','rejected') DEFAULT 'requested',
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`return_id`, `order_id`, `user_id`, `product_id`, `quantity`, `reason`, `status`, `requested_at`, `updated_at`) VALUES
(2, 49, 103, 217, 0, 'asas', 'approved', '2026-02-08 19:24:25', '2026-02-08 19:36:57');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `review` text DEFAULT NULL,
  `is_verified_purchase` tinyint(1) DEFAULT 0,
  `likes` int(11) DEFAULT 0,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `product_id`, `title`, `rating`, `review`, `is_verified_purchase`, `likes`, `status`, `created_at`, `updated_at`) VALUES
(1, 101, 7, 'Good Performance', 5, 'it was a good experience', 0, 0, 'pending', '2026-01-19 10:39:42', '2026-01-19 10:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `seller_address` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `service_radius_km` decimal(5,2) DEFAULT 3.00,
  `supports_express` tinyint(1) DEFAULT 0,
  `packing_time_minutes` int(11) DEFAULT 10,
  `approval_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `approved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `name`, `email`, `password`, `phone`, `seller_address`, `created_at`, `latitude`, `longitude`, `service_radius_km`, `supports_express`, `packing_time_minutes`, `approval_status`, `approved_at`) VALUES
(100, 'seller1', 'seller@gmail.com', 'pbkdf2_sha256$150000$ukLR9XTSPYUt$BMKTon3MkRKzFZhFu50JaTrLqCtagLALyJvstHlrKns=', '1010101010', '', '2026-01-17 15:03:53', 10.8621570, 76.3912580, 3.00, 0, 10, 'approved', '2026-02-04 22:25:18'),
(101, 'QuickMart', 'quickmart@test.com', NULL, '9999999999', 'QuickMark , oppo SellMart\r\nmumbai city\r\nMaharasthra', '2026-01-28 11:15:28', 10.8650000, 76.3900000, 8.00, 1, 10, 'approved', '2026-02-04 22:25:16'),
(102, 'FarAway Store', 'far@test.com', NULL, '8888888888', '', '2026-01-28 11:16:21', 11.2000000, 76.9000000, 5.00, 1, 10, 'approved', '2026-02-04 22:25:13');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_details`
--

CREATE TABLE `shipping_details` (
  `shipping_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `delivery_status` enum('Pending','Out for Delivery','Delivered') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `phone`, `created_at`) VALUES
(101, 'user', 'user@gmail.com', 'user123', '1231231231', '2026-01-17 07:35:27'),
(102, 'user2', 'asd@gmail.com', 'asd123', '1010101010', '2026-01-18 20:53:25'),
(103, 'user3', 'user3@gmail.com', 'pbkdf2_sha256$150000$GuKFYOW15AcU$M6ImhB1+cyBweyIhkdqYBuRUaAjp5oWecSxI4mHfDl4=', '1111111111', '2026-01-19 13:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `product_id`, `created_at`) VALUES
(13, 101, 15, '2026-01-18 20:49:34'),
(16, 103, 7, '2026-01-20 21:28:52'),
(17, 103, 13, '2026-01-21 12:13:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `admin_approval`
--
ALTER TABLE `admin_approval`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `coupon_usage`
--
ALTER TABLE `coupon_usage`
  ADD PRIMARY KEY (`usage_id`),
  ADD UNIQUE KEY `coupon_id` (`coupon_id`,`user_id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`usage_id`),
  ADD UNIQUE KEY `coupon_id` (`coupon_id`,`user_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `delivery_partners`
--
ALTER TABLE `delivery_partners`
  ADD PRIMARY KEY (`partner_id`);

--
-- Indexes for table `delivery_partner_earnings`
--
ALTER TABLE `delivery_partner_earnings`
  ADD PRIMARY KEY (`earning_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `eapp_category`
--
ALTER TABLE `eapp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eapp_product`
--
ALTER TABLE `eapp_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `shipping_details`
--
ALTER TABLE `shipping_details`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_approval`
--
ALTER TABLE `admin_approval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `coupon_usage`
--
ALTER TABLE `coupon_usage`
  MODIFY `usage_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `usage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_partners`
--
ALTER TABLE `delivery_partners`
  MODIFY `partner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery_partner_earnings`
--
ALTER TABLE `delivery_partner_earnings`
  MODIFY `earning_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `eapp_category`
--
ALTER TABLE `eapp_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eapp_product`
--
ALTER TABLE `eapp_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `shipping_details`
--
ALTER TABLE `shipping_details`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD CONSTRAINT `inventory_logs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `shipping_details`
--
ALTER TABLE `shipping_details`
  ADD CONSTRAINT `shipping_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
