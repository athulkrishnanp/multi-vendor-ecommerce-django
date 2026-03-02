#  Multi-Vendor E-Commerce Platform

A full-stack e-commerce web application built using Django that supports multi-vendor architecture with customer, seller, admin, and delivery modules.

##  Features

###  Customer Module
- User registration & login
- Browse products by category
- Add to cart & checkout
- Coupon system
- Gift options
- Order tracking
- Multiple payment methods (Braintree / PayPal Sandbox)

###  Seller Module
- Seller registration & login
- Add / Update / Delete products
- Inventory management
- Pricing & tax configuration
- Product approval workflow

###  Admin Module
- Approve seller products
- Manage users
- Inventory monitoring
- Order management
- Revenue tracking

### Delivery Partner Module
- View assigned orders
- Update delivery status
- Order completion tracking

---

##  Tech Stack

- **Backend:** Django, Python
- **Database:** MySQL
- **Frontend:** HTML, CSS, Bootstrap
- **Payment Integration:** Braintree (Sandbox)
- **Authentication:** Session-based login system
- **Version Control:** Git & GitHub

---

##  Database Architecture

- Users
- Sellers
- Products
- Inventory
- Orders
- Payments
- Admin Approval
- Coupons

---

## ⚙️ Installation & Setup

### 1️⃣ Clone Repository
git clone https://github.com/athulkrishnanp/multi-vendor-ecommerce-django.git
cd multi-vendor-ecommerce-django

### 2️⃣ Create Virtual Environment
python -m venv venv
venv\Scripts\activate   # Windows

### 3️⃣ Install Dependencies
pip install -r requirements.txt

### 4️⃣ Configure Database
Update settings.py with your MySQL credentials.

### 5️⃣ Run Server
python manage.py runserver
