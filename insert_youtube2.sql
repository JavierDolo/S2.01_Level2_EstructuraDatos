use database youtube2

-- insert users
INSERT INTO Users (Email, Password, Username, BirthDate, Gender, Country, PostalCode) VALUES 
('juan@example.com', 'hashed_password1', 'Juan', '1990-05-12', 'Male', 'Spain', '08001'),
('ana@example.com', 'hashed_password2', 'Ana', '1988-09-24', 'Female', 'Mexico', '11000'),
('maria@example.com', 'hashed_password3', 'Maria', '1995-03-17', 'Female', 'Argentina', 'C1000'),
('pedro@example.com', 'hashed_password4', 'Pedro', '1992-07-21', 'Male', 'Chile', '7500000'),
('laura@example.com', 'hashed_password5', 'Laura', '2000-11-30', 'Female', 'Spain', '28001'),
('carlos@example.com', 'hashed_password6', 'Carlos', '1985-02-14', 'Male', 'Colombia', '110231');

-- insert channels
INSERT INTO Channels (Name, Description, UserID) VALUES 
('TechReview', 'Channel about technology and gadgets', 1),
('CookingExpress', 'Quick and delicious recipes', 2),
('TravelWorld', 'Travel experiences around the world', 3),
('SportsToday', 'Sports news and analysis', 4),
('TopMusic', 'Top hits and new music discoveries', 5),
('MovieFan', 'Reviews and news about cinema', 6);

-- insert videos
INSERT INTO Videos (Title, Description, Size, FileName, Duration, Thumbnail, Status, UserID) VALUES 
('Review of the latest smartphone', 'We analyze the performance and features', 500, 'smartphone.mp4', 600, 'smartphone.jpg', 'Public', 1),
('How to make homemade pizza', 'Easy recipe with common ingredients', 700, 'pizza.mp4', 900, 'pizza.jpg', 'Public', 2),
('Visiting Paris', 'The best places to visit', 400, 'paris.mp4', 1200, 'paris.jpg', 'Public', 3),
('Champions League Summary', 'Analysis of the best matches', 650, 'champions.mp4', 800, 'champions.jpg', 'Public', 4),
('Discover new artists', 'Recommendations for emerging music', 550, 'music.mp4', 700, 'music.jpg', 'Public', 5),
('Movie premieres in 2025', 'The most anticipated movies of the year', 800, 'movies.mp4', 1000, 'movies.jpg', 'Public', 6),
('Programming Course', 'Introduction to Python for beginners', 750, 'python.mp4', 1500, 'python.jpg', 'Public', 1),
('Most anticipated video games', 'The most awaited releases of the year', 600, 'games.mp4', 1100, 'games.jpg', 'Public', 5);

-- insert tags
INSERT INTO Tags (Name) VALUES 
('Technology'), ('Cooking'), ('Travel'), ('Sports'), ('Music'), ('Cinema'), ('Education'), ('Games');

-- insert videos_tags
INSERT INTO Videos_Tags (VideoID, TagID) VALUES 
(1, 1), (1, 6), -- Video 1: Technology and Cinema
(2, 2), -- Video 2: Cooking
(3, 3), (3, 1), -- Video 3: Travel and Technology
(4, 4), (4, 6), -- Video 4: Sports and Cinema
(5, 5), (5, 7), -- Video 5: Music and Education
(6, 6), -- Video 6: Cinema
(7, 7), (7, 1), -- Video 7: Education and Technology
(8, 8), (8, 5); -- Video 8: Games and Music

-- insert subcriptions
INSERT INTO Subscriptions (UserID, ChannelID) VALUES 
(2, 1), (3, 2), (4, 3), (5, 4), (6, 5), (1, 6);

-- insert likes_dislikes_vidos
INSERT INTO Likes_Dislikes_Videos (UserID, VideoID, Type) VALUES 
(3, 1, 'Like'),
(1, 2, 'Dislike'),
(4, 3, 'Like'),
(5, 4, 'Like'),
(6, 5, 'Dislike'),
(2, 6, 'Like'),
(1, 7, 'Like'),
(3, 8, 'Like'),
(4, 8, 'Dislike');

-- insert playlist
INSERT INTO Playlists (Name, Status, UserID) VALUES 
('Technology Favorites', 'Public', 1),
('Delicious Recipes', 'Private', 2),
('Places to Travel', 'Public', 3),
('Best Goals', 'Public', 4),
('Top Hits 2025', 'Public', 5),
('Must-Watch Movies', 'Public', 6);

-- insert playlist_videos
INSERT INTO Playlists_Videos (PlaylistID, VideoID) VALUES 
(1, 1), (1, 3), -- Technology and Travel
(2, 2), -- Cooking
(3, 3), -- Travel
(4, 4), -- Sports
(5, 5), (5, 8), -- Music and Games
(6, 6), (6, 1), -- Cinema and Technology
(2, 7), (3, 7); -- Education in different categories

-- insert commets
INSERT INTO Comments (Text, UserID, VideoID) VALUES 
('Excellent review, very clear.', 3, 1),
('I’m going to try making this recipe.', 1, 2),
('I loved the places you visited.', 4, 3),
('Amazing game, great summary.', 5, 4),
('Great musical discovery.', 6, 5),
('I want to watch all these movies.', 2, 6),
('Python is awesome, great course.', 1, 7),
('Can’t wait to play these video games!', 3, 8);

-- insert likes_dislikes_comment
INSERT INTO Likes_Dislikes_Comments (UserID, CommentID, Type) VALUES 
(2, 1, 'Like'),
(3, 2, 'Like'),
(4, 3, 'Like'),
(5, 4, 'Like'),
(6, 5, 'Like'),
(1, 6, 'Like'),
(2, 7, 'Like'),
(3, 8, 'Like');

use youtube2;

-- Get videos tagged "cinema"
SELECT Videos.Title, Tags.Name 
FROM Videos 
JOIN Videos_Tags ON Videos.ID = Videos_Tags.VideoID 
JOIN Tags ON Videos_Tags.TagID = Tags.ID 
WHERE Tags.Name = 'Cinema';

-- Query: Users who have liked technology videos
SELECT DISTINCT Users.Username, Videos.Title 
FROM Likes_Dislikes_Videos 
JOIN Videos ON Likes_Dislikes_Videos.VideoID = Videos.ID 
JOIN Videos_Tags ON Videos.ID = Videos_Tags.VideoID 
JOIN Tags ON Videos_Tags.TagID = Tags.ID 
JOIN Users ON Likes_Dislikes_Videos.UserID = Users.ID 
WHERE Tags.Name = 'Technology' AND Likes_Dislikes_Videos.Type = 'Like';

