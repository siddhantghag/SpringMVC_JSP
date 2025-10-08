# SpringMVC_JSP

# 🛒 Order Management System (Spring MVC + Hibernate + Security)

A full-stack **Java web application** built using **Spring MVC (non-Boot)**, **Hibernate/JPA**, **Spring Security**, **JSP/JSTL**, **Bootstrap 5**, and **MySQL**.  
This project demonstrates a production-style layered architecture with **Admin** and **Customer** roles, cart/checkout flow, and clean UI using Bootstrap.

---

## ✨ Features

### 👤 Authentication & Roles
- User registration & login (Spring Security)
- Roles: **ADMIN** and **CUSTOMER**
- Role-based access to pages (e.g., Admin dashboard vs Customer cart)

### 🛍 Customer Features
- Browse products by category
- View product details
- Add/update/remove items in cart (session-based)
- Checkout and place orders
- View own past orders

### 🛠 Admin Features
- Manage **categories** (CRUD)
- Manage **products** (CRUD with images)
- View all **customers** and their orders
- Role-aware navbar and pages

### 💻 UI
- Responsive, modern design using **Bootstrap 5**
- Flash messages with Bootstrap alerts
- Placeholder/product images via CDN or assets

---

## ⚙️ Tech Stack

- **Java 8**  
- **Spring Framework 5.3.x** (MVC, Security, ORM, TX)  
- **Hibernate 5.6.x** (JPA implementation)  
- **MySQL 8.x**  
- **JSP / JSTL** for views  
- **Bootstrap 5.3 + Bootstrap Icons**  
- **Maven 3.8+** for build  
- **Tomcat 9** for deployment  

## 🏗 Project Structure

OrderManagementSystem/ 
├── src/ 
│ ├── main/ 
│ │ ├── java/ 
│ │ │ └── com/oms/ 
│ │ │ ├── controller/ # Spring MVC Controllers 
│ │ │ ├── dao/ # Data Access Objects 
│ │ │ ├── model/ # Entity classes 
│ │ │ ├── service/ # Business logic 
│ │ │ └── config/ # Spring Security & Hibernate config 
│ │ └── resources/ 
│ │ └── application.properties 
│ └── webapp/ 
│ ├── WEB-INF/ 
│ │ └── views/ # JSP pages 
│ └── assets/ # CSS, JS, images 
├── pom.xml # Maven build file └── README.md # Project documentation

## 🛡 Security

- Basic authentication using **Spring Security**
- Role-based access control for Admin and Customer
- Session management and protected endpoints

---

## 📋 Logging

- Integrated **Logger** for tracking:
  - Authentication events
  - CRUD operations
  - Order status updates
  - User activity

---

## 🚀 How to Run

1. Clone the repository
2. Set up MySQL and create the required schema
3. Update DB credentials in `application.properties`
4. Build using Maven: `mvn clean install`
5. Deploy on Tomcat 9
6. Access via browser:
   - Admin: `/admin`
   - Customer: `/customer`

---

## 📌 Future Enhancements

- Payment gateway integration
- Email notifications
- REST API support
- Enhanced dashboard analytics

---

## 🧑‍💻 Author

Developed by [Siddhant Ghag]
