

-- 1. Foydalanuvchi profilini yangilash

UPDATE users
SET username = 'new_username', first_name = 'NewName', last_name = 'NewLastName', phone_number = '+998901234567'
WHERE user_id = 1;



-- 2. Xabarni o‘qilgan deb belgilash

UPDATE message_status
SET status = 'read'
WHERE message_id = 1234 AND user_id = 1;




-- 3. Bloklangan foydalanuvchini qo‘shish

INSERT INTO blocked_users (user_id, blocked_user_id)
VALUES (1, 2);




-- 4. Yangi xabar yuborish

INSERT INTO messages (chat_id, sender_id, content, message_type, timestamp)
VALUES (1, 1, 'Hello, how are you?', 'text', NOW());




-- 5. Chatga foydalanuvchi qo‘shish

INSERT INTO chat_members (chat_id, user_id, role)
VALUES (1, 2, 'member');  -- user_id=2 is added to chat_id=1 as a member



-- 6. Guruhni tark etish

DELETE FROM chat_members
WHERE chat_id = 1 AND user_id = 2;

-- 7. Foydalanuvchining o‘zaro reaktsiyasini saqlash

INSERT INTO message_reactions (message_id, user_id, reaction_type)
VALUES (1234, 1, 'like');  -- User 1 reacts with 'like' to message 1234




-- 8. Guruhni yaratish

INSERT INTO chats (chat_type, chat_name, owner_id, created_at)
VALUES ('group', 'Tech Enthusiasts', 1, NOW());





-- 9. Foydalanuvchi o‘zaro bildirishi: Foydalanuvchi uchun yangi bildirishnoma yaratish

INSERT INTO notifications (user_id, notification_type, content, read_status, created_at)
VALUES (1, 'message', 'You have a new message in the Tech Enthusiasts group', 'unread', NOW());






-- 10. Xabarni o‘chirish

DELETE FROM messages
WHERE message_id = 1234 AND sender_id = 1;






-- 11. Guruhga taklif yuborish

INSERT INTO chat_invites (chat_id, inviter_id, invitee_id)
VALUES (1, 1, 2);  -- user 1 invites user 2 to join the group with chat_id=1





-- 12. Ovozli va video qo‘ng‘iroq qilish

INSERT INTO calls (caller_id, receiver_id, call_type, status, start_time)
VALUES (1, 2, 'audio', 'in_progress', NOW());





-- 13. Foydalanuvchiga Premium xizmatlarini faollashtirish

INSERT INTO payments (user_id, payment_type, amount, payment_date)
VALUES (1, 'premium', 10, NOW());







-- 14. Foydalanuvchidan rasm yoki video yuborish

INSERT INTO messages (chat_id, sender_id, content, message_type, media_url, timestamp)
VALUES (1, 1, 'Check this out!', 'media', 'https://path_to_media.com/media.jpg', NOW());





-- 15. Guruhdagi foydalanuvchi huquqlarini o‘zgartirish

UPDATE chat_members
SET role = 'admin'
WHERE chat_id = 1 AND user_id = 2;
