
# What is PostgreSQL?
PostgreSQL একটি শক্তিশালী, ওপেন-সোর্স রিলেশনাল ডেটাবেজ ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি SQL (Structured Query Language) ব্যবহার করে ডেটা সংরক্ষণ, খোঁজার এবং ব্যবস্থাপনার জন্য ব্যবহৃত হয়।

উদাহরণ: আপনি যদি কোনো কোম্পানির কর্মীদের তথ্য রাখতে চান — তাদের নাম, ঠিকানা, বেতন ইত্যাদি — PostgreSQL দিয়ে টেবিল বানিয়ে সেগুলো সহজেই সংরক্ষণ ও বিশ্লেষণ করতে পারেন।

# What is the purpose of a database schema in PostgreSQL?
Schema হলো একটি ধরণের কনটেইনার বা গ্রুপ যেখানে টেবিল, ভিউ, ফাংশন, ইত্যাদি রাখা হয়। এটি একটি ডেটাবেজকে বিভিন্ন ভাগে বিভক্ত করতে সাহায্য করে যেন আলাদা অংশগুলোকে আলাদাভাবে ম্যানেজ করা যায়।

উদাহরণ: একটা বিশ্ববিদ্যালয় ডেটাবেজে আপনি "student", "teacher", "exam" নামে তিনটি স্কিমা রাখতে পারেন — যেন প্রতিটি ভাগ আলাদা থাকে।

# Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Primary Key:
প্রাইমারি কী হলো একটি টেবিলের এমন একটি কলাম (অথবা কলামের সমন্বয়) যা প্রতিটি রেকর্ডকে অনন্যভাবে চিহ্নিত করে। এটি NULL মান গ্রহণ করতে পারে না এবং প্রতিটি রেকর্ডের জন্য অবশ্যই ভিন্ন হতে হবে।

Foreign Key:
ফরেন কী হলো একটি টেবিলের একটি কলাম (অথবা কলামের সমন্বয়) যা অন্য একটি টেবিলের প্রাইমারি কীর সাথে সম্পর্কিত। এটি টেবিলগুলোর মধ্যে সম্পর্ক স্থাপন করতে ব্যবহৃত হয় এবং এটি NULL মান গ্রহণ করতে পারে।

উদাহরণ:
students টেবিলে student_id হতে পারে প্রাইমারি কি।
results টেবিলে student_id হতে পারে ফরেন কি যা students টেবিলের সাথে যুক্ত।

# What is the difference between the VARCHAR and CHAR data types?
CHAR(n): এটি একটি fixed-length ডেটা টাইপ। আপনি যদি CHAR(10) ব্যবহার করেন, তাহলে যদি ৫টি ক্যারেক্টার রাখেন বাকি ৫টা স্পেস দিয়ে পূরণ হবে।

VARCHAR(n): এটি একটি variable-length টাইপ। যদি VARCHAR(10) ব্যবহার করেন, তবে যতটুকু দরকার ততটুকু জায়গা নিবে, অতিরিক্ত স্পেস নষ্ট হবে না।

Note: VARCHAR বেশি ব্যবহৃত হয় কারণ এটি বেশি efficient।

# Explain the purpose of the WHERE clause in a SELECT statement.
WHERE ক্লজ ব্যবহার করা হয় ডেটা ফিল্টার করতে, অর্থাৎ আপনি কোন শর্ত অনুযায়ী কোন রেকর্ড দেখতে চান তা নির্ধারণ করতে।

উদাহরণ: SELECT * FROM students WHERE age > 18;

# What are the LIMIT and OFFSET clauses used for?
LIMIT: কতগুলো রেকর্ড দেখাবেন, সেটা নির্ধারণ করে।
OFFSET: কতগুলো রেকর্ড স্কিপ করবেন, সেটা বলে।

উদাহরণ: SELECT * FROM students LIMIT 5 OFFSET 5;

# How can you modify data using UPDATE statements?
UPDATE কমান্ড দিয়ে টেবিলের নির্দিষ্ট রেকর্ডগুলোর মান পরিবর্তন করা যায়।

উদাহরণ: UPDATE students SET age = 20 WHERE student_id = 1;


