# 🛍️ Fashion Store - Online Shopping Web Application

A full-stack fashion e-commerce web application built with **Java Servlets**, **Hibernate ORM**, **MySQL**, and **JSP** — featuring a modern purple-themed UI.

---

## 🎥 Demo Video

▶️ [Click here to watch the demo](https://1drv.ms/v/c/0b83e64e32724459/IQBYN1lkxfnkSLqq_8HCJydPASBUaEViQYkL7NshAvFKbRI?e=TOcvt5)

---

## ✨ Features

- 🔐 User Registration & Login
- 👤 User Profile Management
- 🛒 Shopping Cart (Add, Update, Remove)
- 📦 Order Placement & Order History
- 👗 Product Listing by Category
- 📱 Responsive UI with purple theme

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | JSP, HTML, CSS, JavaScript |
| Backend | Java Servlets (Jakarta EE) |
| ORM | Hibernate 6 |
| Database | MySQL |
| Server | Apache Tomcat 10 |
| Build Tool | Maven |

---

## 📁 Project Structure

```
store1/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/store1/
│       │       ├── controller/        # Servlets
│       │       │   ├── LoginServlet.java
│       │       │   ├── RegisterServlet.java
│       │       │   ├── UserServlet.java
│       │       │   ├── ProductServlet.java
│       │       │   ├── CartServlet.java
│       │       │   ├── OrderServlet.java
│       │       │   └── LogoutServlet.java
│       │       ├── model/
│       │       │   ├── entity/        # Hibernate Entities
│       │       │   │   ├── User.java
│       │       │   │   ├── Product.java
│       │       │   │   ├── Order.java
│       │       │   │   ├── OrderItem.java
│       │       │   │   └── CartItem.java
│       │       │   └── dao/           # Database Access
│       │       │       ├── UserDAO.java
│       │       │       ├── ProductDAO.java
│       │       │       └── OrderDAO.java
│       │       ├── service/           # Business Logic
│       │       │   ├── UserService.java
│       │       │   ├── ProductService.java
│       │       │   └── OrderService.java
│       │       └── util/
│       │           └── HibernateUtil.java
│       ├── webapp/
│       │   ├── WEB-INF/
│       │   │   └── web.xml
│       │   ├── index.jsp
│       │   ├── login.jsp
│       │   ├── register.jsp
│       │   ├── profile.jsp
│       │   ├── cart.jsp
│       │   └── ...
│       └── resources/
│           └── hibernate.cfg.xml
└── pom.xml
```

---

## 🗄️ Database Setup

Run this SQL to create the database and tables:

```sql
CREATE DATABASE fashionstore;
USE fashionstore;

CREATE TABLE users (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100),
    email        VARCHAR(100) UNIQUE,
    password     VARCHAR(255),
    phone        VARCHAR(15),
    address_line VARCHAR(255),
    city         VARCHAR(100),
    state        VARCHAR(100),
    pincode      VARCHAR(10)
);

CREATE TABLE products (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(200),
    description TEXT,
    price       DOUBLE,
    category    VARCHAR(100),
    image_url   VARCHAR(500),
    stock       INT
);

CREATE TABLE orders (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT,
    order_date DATETIME,
    total      DOUBLE,
    status     VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

---

## ⚙️ Configuration

Update `src/main/resources/hibernate.cfg.xml` with your MySQL credentials:

```xml
<property name="hibernate.connection.url">
    jdbc:mysql://localhost:3306/fashionstore
</property>
<property name="hibernate.connection.username">root</property>
<property name="hibernate.connection.password">your_password</property>
```

---

## 🚀 How to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/Nayana12330/Store_toshopthings27-.git
   ```

2. **Import into Eclipse**
   - File → Import → Maven → Existing Maven Projects
   - Browse to the cloned folder

3. **Setup MySQL**
   - Create database using the SQL above
   - Update `hibernate.cfg.xml` with your credentials

4. **Run on Tomcat**
   - Right click project → Run As → Run on Server
   - Select Apache Tomcat 10

5. **Open in browser**
   ```
   http://localhost:8080/store1/
   ```

---

## 📸 Screenshots

> UI follows a clean white layout with **purple (#5b21b6)** accent color and left sidebar navigation.

| Page | Description |
|------|-------------|
| Home | Hero banner with New Collection |
| Profile | User details, stats, order history |
| Cart | Add/remove/update items |
| Orders | Order tracking |

---

## 👩‍💻 Developer

**Nayana A**
- GitHub: [@Nayana12330](https://github.com/Nayana12330)

---

## 📄 License

This project is for educational purposes.
