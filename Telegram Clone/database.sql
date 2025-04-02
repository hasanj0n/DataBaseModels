


-- 📌 Jadval bog‘lanishlari haqida
-- users asosiy jadval bo‘lib, barcha bog‘lanishlar shu jadval bilan bog‘langan.

-- chats jadvali suhbatlar, guruhlar va kanallarni saqlaydi.

-- messages har bir chatdagi xabarlarni saqlaydi.

-- message_status har bir foydalanuvchi uchun xabar holatini (o‘qilgan, o‘qilmagan) kuzatadi.

-- message_reactions foydalanuvchilarning xabarlarga bergan reaksiyalarini saqlaydi.

-- contacts foydalanuvchilarning o‘zaro kontaktlarini boshqaradi.

-- blocked_users foydalanuvchilar tomonidan bloklangan odamlarni saqlaydi.

-- notifications foydalanuvchilarga turli bildirishnomalarni yuborish uchun ishlatiladi.

-- chat_invites guruhlarga qo‘shilish takliflarini boshqaradi.

-- calls ovozli va video qo‘ng‘iroqlarni saqlaydi.

-- permissions foydalanuvchilarning guruh va kanallardagi huquqlarini boshqaradi.

-- payments Telegram premium xizmatlari uchun to‘lovlarni saqlaydi.

CREATE DATABASE IF NOT EXISTS telegram_db;

USE telegram_db;

-- Foydalanuvchilar jadvali
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    password_hash TEXT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    bio TEXT,
    profile_picture TEXT,
    is_online BOOLEAN DEFAULT FALSE,
    last_seen DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Chatlar (shaxsiy suhbat, guruhlar, kanallar)
CREATE TABLE chats (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    chat_type ENUM('private', 'group', 'channel') NOT NULL,
    chat_name VARCHAR(255),
    owner_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Chat ishtirokchilari (foydalanuvchi va chat o‘rtasidagi bog‘lanish)
CREATE TABLE chat_members (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    chat_id BIGINT,
    role ENUM('admin', 'member', 'owner') DEFAULT 'member',
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE
);

-- Xabarlar (messages)
CREATE TABLE messages (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    chat_id BIGINT,
    sender_id BIGINT,
    content TEXT NOT NULL,
    message_type ENUM('text', 'image', 'video', 'audio', 'file'),
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Xabar o‘qilganligi holati
CREATE TABLE message_status (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    message_id BIGINT,
    user_id BIGINT,
    status ENUM('sent', 'delivered', 'read'),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (message_id) REFERENCES messages(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Xabar reaksiyalari (emoji)
CREATE TABLE message_reactions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    message_id BIGINT,
    user_id BIGINT,
    reaction ENUM('like', 'love', 'laugh', 'sad', 'angry', 'wow'),
    reacted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (message_id) REFERENCES messages(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Foydalanuvchi kontaktlari
CREATE TABLE contacts (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    contact_id BIGINT,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (contact_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE(user_id, contact_id)
);

-- Bloklangan foydalanuvchilar
CREATE TABLE blocked_users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    blocked_user_id BIGINT,
    blocked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (blocked_user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Bildirishnomalar
CREATE TABLE notifications (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    message VARCHAR(255) NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Guruhga takliflar
CREATE TABLE chat_invites (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    chat_id BIGINT,
    invited_by BIGINT,
    invitee_id BIGINT,
    status ENUM('pending', 'accepted', 'declined') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE,
    FOREIGN KEY (invited_by) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (invitee_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Foydalanuvchi sozlamalari
CREATE TABLE user_settings (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    theme ENUM('light', 'dark') DEFAULT 'light',
    notifications_enabled BOOLEAN DEFAULT TRUE,
    privacy ENUM('everyone', 'contacts', 'nobody') DEFAULT 'everyone',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Storylar
CREATE TABLE stories (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    media_url TEXT NOT NULL,
    caption TEXT,
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Audio/Video qo‘ng‘iroqlar
CREATE TABLE calls (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    caller_id BIGINT,
    receiver_id BIGINT,
    call_type ENUM('audio', 'video') NOT NULL,
    call_status ENUM('missed', 'completed', 'rejected') NOT NULL,
    duration INT DEFAULT 0, -- seconds
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (caller_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Guruh va kanallardagi ruxsatlar
CREATE TABLE permissions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    chat_id BIGINT,
    can_send_messages BOOLEAN DEFAULT TRUE,
    can_send_media BOOLEAN DEFAULT TRUE,
    can_add_members BOOLEAN DEFAULT TRUE,
    can_pin_messages BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE
);

-- To‘lovlar (premium xizmatlar)
CREATE TABLE payments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    amount DECIMAL(10,2) NOT NULL,
    currency VARCHAR(10) DEFAULT 'USD',
    payment_method ENUM('card', 'paypal', 'crypto') NOT NULL,
    status ENUM('pending', 'completed', 'failed') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
