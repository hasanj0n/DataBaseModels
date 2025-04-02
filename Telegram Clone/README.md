# 📲 Telegram Clone Database Model (MySQL)

## 🚀 About the Project

**Telegram Clone Database** is a project designed to create a database model for the popular Telegram messenger. This model is built on **MySQL**, featuring **15 tables** and **full relationships** (Foreign Key Constraints) for a robust structure.

This project provides the **database architecture for a real-world** Telegram clone. Using this database, you can develop a **personal messenger, chat applications, or a business messaging system**.

---

## 🎯 Business Problems

Today, there is a high demand for **secure and fast messengers**.

✅ **Problem #1**: A reliable and scalable **database** is needed for chat applications.

✅ **Problem #2**: Many projects use **unclear and disorganized database designs** for chat applications.

✅ **Problem #3**: Proper management of **user privacy and security** is essential.

✅ **Problem #4**: Features like groups, channels, media messages, and reactions must be fully supported.

---

## 💡 Solutions

🔹 **Well-structured and powerful database model** - Data is properly **normalized** and optimized.

🔹 **15+ tables with full relationships** - Reduces errors and allows **fast data processing**.

🔹 **Chats, messages, groups, channels** - A fully prepared architecture for messenger functionality.

🔹 **Voice and video calls** - Users can make calls to each other.

🔹 **Read and unread messages** - Message status is accurately tracked.

🔹 **Blocking and notifications** - Ensures privacy and keeps users informed.

🔹 **Premium services and payments** - Monetization options within the messenger.

---

## 🏗 Database Architecture

Our project consists of the following key modules:

📌 **users** - Stores user data.

📌 **chats** - Groups, channels, and private chats.

📌 **messages** - Stores messages.

📌 **message_status** - Indicates whether a message is read or unread.

📌 **message_reactions** - Manages emoji reactions.

📌 **contacts** - Manages user contacts.

📌 **blocked_users** - List of blocked users.

📌 **notifications** - User notifications.

📌 **chat_invites** - Invitations to groups and channels.

📌 **user_settings** - Privacy and notification settings.

📌 **stories** - Supports the Telegram Stories feature.

📌 **calls** - Manages voice and video calls.

📌 **permissions** - User roles in groups and channels.

📌 **payments** - Payments for premium subscriptions.

---


## 📌 Usage

1️⃣ **Add a user:**

```sql
INSERT INTO users (username, phone_number, password_hash, first_name)
VALUES ('testuser', '+998901234567', 'hashed_password', 'John');
```

2️⃣ **Create a chat:**

```sql
INSERT INTO chats (chat_type, chat_name, owner_id)
VALUES ('group', 'Developers Chat', 1);
```

3️⃣ **Send a message:**

```sql
INSERT INTO messages (chat_id, sender_id, content, message_type)
VALUES (1, 1, 'Hello, world!', 'text');
```

---

## 🌟 Conclusion

If you want to **build a messenger like Telegram**, this **MySQL database model** is a **ready-made solution** for you! 🚀

This project is **powerful and scalable**, capable of handling a large number of users.

If you need additional help or guidance on integrating with a **backend** (Django, FastAPI, Node.js), feel free to ask! 😎🔥

---

### 🛠 Author

📌 **Author:** Hasan Omonov\
📌 **GitHub:** https://github.com/hasanj0n/ \
📌 **Star ⭐️ and fork this project!**

