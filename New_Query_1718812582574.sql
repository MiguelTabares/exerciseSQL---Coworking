-- Active: 1718811518291@@ep-solitary-wind-a4x2ouaq-pooler.us-east-1.aws.neon.tech@5432@coworking@public
/*
1. Creación de la base de datos, sus entidades y relaciones:
*/

CREATE DATABASE coworking;

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    company VARCHAR(50) NOT NULL,
    identification_number NUMERIC NOT NULL
);

DROP TABLE Users;

CREATE TABLE Rooms (
    room_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    total_workspaces INTEGER NOT NULL
);

DROP TABLE Rooms;

CREATE TABLE Workspaces (
    workspace_id SERIAL PRIMARY KEY,
    room_id INTEGER NOT NULL,
    rw INTEGER NOT NULL,
    clmn INTEGER NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    UNIQUE (room_id, rw, clmn)
);
DROP TABLE Workspaces;

CREATE TABLE Sessions (
    session_id SERIAL PRIMARY KEY,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    description VARCHAR(255) NOT NULL
);

DROP TABLE Sessions;

CREATE TABLE Reservations (
    reservation_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    workspace_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    reservation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (workspace_id) REFERENCES Workspaces(workspace_id),
    FOREIGN KEY (session_id) REFERENCES Sessions(session_id),
    UNIQUE (workspace_id, session_id)
);

DROP TABLE Reservations;

/*
2. Poblado de datos con mínimo 100 registros por entidad:
*/

INSERT INTO Users (username, email, company, identification_number) VALUES
('john_doe', 'john.doe@example.com', 'TechCorp', 1234567890),
('jane_smith', 'jane.smith@example.com', 'InnovateLLC', 2345678901),
('alice_jones', 'alice.jones@example.com', 'CreativeWorks', 3456789012),
('bob_brown', 'bob.brown@example.com', 'FutureTech', 4567890123),
('charlie_davis', 'charlie.davis@example.com', 'NextGen', 5678901234),
('diana_miller', 'diana.miller@example.com', 'Innovative Solutions', 6789012345),
('edward_moore', 'edward.moore@example.com', 'TechGuru', 7890123456),
('fiona_lee', 'fiona.lee@example.com', 'WebSolutions', 8901234567),
('george_clark', 'george.clark@example.com', 'Tech Innovators', 9012345678),
('hannah_wilson', 'hannah.wilson@example.com', 'Creative Minds', 1122334455),
('ian_thompson', 'ian.thompson@example.com', 'Innovative Ideas', 2233445566),
('julia_king', 'julia.king@example.com', 'ModernTech', 3344556677),
('kevin_moore', 'kevin.moore@example.com', 'TechWave', 4455667788),
('laura_harris', 'laura.harris@example.com', 'WebDesigns', 5566778899),
('mike_jones', 'mike.jones@example.com', 'FutureTech', 6677889900),
('nina_davis', 'nina.davis@example.com', 'InnovativeWorks', 7788990011),
('oliver_martin', 'oliver.martin@example.com', 'NextGen Solutions', 8899001122),
('patricia_white', 'patricia.white@example.com', 'CreativeTech', 9900112233),
('quinn_martinez', 'quinn.martinez@example.com', 'Web Innovations', 1011122334),
('ryan_lee', 'ryan.lee@example.com', 'Tech Design', 1122333444),
('sarah_thompson', 'sarah.thompson@example.com', 'Innovate Tech', 2233444555),
('timothy_garcia', 'timothy.garcia@example.com', 'Tech Startups', 3344555666),
('ursula_king', 'ursula.king@example.com', 'Web Innovators', 4455666777),
('victor_harris', 'victor.harris@example.com', 'CreativeWave', 5566777888),
('wendy_brown', 'wendy.brown@example.com', 'Future Solutions', 6677888999),
('xander_lee', 'xander.lee@example.com', 'NextWave', 7788990000),
('yvonne_martin', 'yvonne.martin@example.com', 'Tech Innovators', 8899001111),
('zachary_wilson', 'zachary.wilson@example.com', 'Innovative Minds', 9900112222),
('ava_thompson', 'ava.thompson@example.com', 'Web Solutions', 1011123444),
('benjamin_davis', 'benjamin.davis@example.com', 'CreativeWorks', 1122334555),
('clara_miller', 'clara.miller@example.com', 'Future Innovators', 2233445666),
('daniel_clark', 'daniel.clark@example.com', 'TechWave', 3344556777),
('emily_harris', 'emily.harris@example.com', 'Innovative Ideas', 4455667888),
('frank_jones', 'frank.jones@example.com', 'WebTech', 5566778999),
('grace_lee', 'grace.lee@example.com', 'Creative Design', 6677880000),
('harry_thompson', 'harry.thompson@example.com', 'NextGen Tech', 7788991111),
('isabella_garcia', 'isabella.garcia@example.com', 'Innovate Solutions', 8899002222),
('jack_martin', 'jack.martin@example.com', 'Future Innovations', 9900113333),
('karen_white', 'karen.white@example.com', 'Web Innovators', 1011124444),
('luke_king', 'luke.king@example.com', 'Tech Innovations', 1122334456),
('maria_wilson', 'maria.wilson@example.com', 'Future Technologies', 2233445567),
('nathan_martin', 'nathan.martin@example.com', 'Innovative Web', 3344556678),
('olivia_jones', 'olivia.jones@example.com', 'Creative Tech', 4455667789),
('paul_white', 'paul.white@example.com', 'NextGen Solutions', 5566778890),
('quincy_davis', 'quincy.davis@example.com', 'WebWave', 6677889901),
('rachel_harris', 'rachel.harris@example.com', 'TechWorks', 7788990012),
('samuel_lee', 'samuel.lee@example.com', 'Innovative Minds', 8899001123),
('tina_thompson', 'tina.thompson@example.com', 'Future Innovations', 9900112234),
('ursula_jones', 'ursula.jones@example.com', 'CreativeWave', 1011123345),
('victoria_moore', 'victoria.moore@example.com', 'Web Solutions', 1122334456),
('william_brown', 'william.brown@example.com', 'Innovative Ideas', 2233445567),
('xenia_clark', 'xenia.clark@example.com', 'Tech Innovators', 3344556678),
('yara_miller', 'yara.miller@example.com', 'NextGen Tech', 4455667789),
('zane_king', 'zane.king@example.com', 'Future Tech', 5566778890),
('andy_wilson', 'andy.wilson@example.com', 'Web Design', 6677889901),
('beth_davis', 'beth.davis@example.com', 'Tech Startups', 7788990012),
('carol_moore', 'carol.moore@example.com', 'Creative Solutions', 8899001123),
('danny_thompson', 'danny.thompson@example.com', 'Innovative Solutions', 9900112234),
('ella_jones', 'ella.jones@example.com', 'TechWave', 1011123345),
('frankie_harris', 'frankie.harris@example.com', 'Web Innovators', 1122334456),
('gina_lee', 'gina.lee@example.com', 'Future Solutions', 2233445567),
('harry_brown', 'harry.brown@example.com', 'NextGen Web', 3344556678),
('iris_white', 'iris.white@example.com', 'CreativeWorks', 4455667789),
('jackie_davis', 'jackie.davis@example.com', 'Innovative Tech', 5566778890),
('kyle_clark', 'kyle.clark@example.com', 'Web Innovations', 6677889901),
('lucas_martin', 'lucas.martin@example.com', 'Tech Solutions', 7788990012),
('margaret_king', 'margaret.king@example.com', 'Future Ideas', 8899001123),
('nina_wilson', 'nina.wilson@example.com', 'Innovate Tech', 9900112234),
('oscar_moore', 'oscar.moore@example.com', 'Tech Innovators', 1011123345),
('pamela_thompson', 'pamela.thompson@example.com', 'WebWorks', 1122334456),
('quinn_martinez', 'quinn.martinez@example.com', 'Creative Design', 2233445567),
('robert_jones', 'robert.jones@example.com', 'Future Tech', 3344556678),
('susan_harris', 'susan.harris@example.com', 'Innovative Solutions', 4455667789),
('timothy_davis', 'timothy.davis@example.com', 'Web Design', 5566778890),
('ursula_lee', 'ursula.lee@example.com', 'TechWave', 6677889901),
('victor_white', 'victor.white@example.com', 'NextGen Solutions', 7788990012),
('wendy_martin', 'wendy.martin@example.com', 'CreativeWorks', 8899001123),
('xander_brown', 'xander.brown@example.com', 'Innovative Ideas', 9900112234),
('yvonne_clark', 'yvonne.clark@example.com', 'Future Innovations', 1011123345),
('zachary_moore', 'zachary.moore@example.com', 'Tech Innovators', 1122334456),
('ava_thompson', 'ava.thompson@example.com', 'Web Solutions', 2233445567),
('benjamin_davis', 'benjamin.davis@example.com', 'CreativeWorks', 3344556678),
('clara_miller', 'clara.miller@example.com', 'Future Innovators', 4455667789),
('daniel_clark', 'daniel.clark@example.com', 'TechWave', 5566778890),
('emma_king', 'emma.king@example.com', 'Tech Solutions', 1122334456),
('francis_white', 'francis.white@example.com', 'Future Tech', 2233445567),
('gina_davis', 'gina.davis@example.com', 'Innovative Web', 3344556678),
('hannah_martin', 'hannah.martin@example.com', 'Creative Works', 4455667789),
('ian_thompson', 'ian.thompson@example.com', 'Web Innovators', 5566778890),
('jasmine_jones', 'jasmine.jones@example.com', 'TechWave', 6677889901),
('kevin_harris', 'kevin.harris@example.com', 'NextGen Solutions', 7788990012),
('lucy_lee', 'lucy.lee@example.com', 'Future Ideas', 8899001123),
('matthew_brown', 'matthew.brown@example.com', 'Innovative Solutions', 9900112234),
('natalie_clark', 'natalie.clark@example.com', 'WebWorks', 1011123345),
('oliver_moore', 'oliver.moore@example.com', 'Creative Design', 1122334456),
('patricia_white', 'patricia.white@example.com', 'Tech Innovators', 2233445567),
('quincy_wilson', 'quincy.wilson@example.com', 'Future Innovations', 3344556678),
('rebecca_davis', 'rebecca.davis@example.com', 'Innovate Tech', 4455667789),
('steven_thompson', 'steven.thompson@example.com', 'Web Solutions', 5566778890),
('tara_lee', 'tara.lee@example.com', 'Creative Works', 6677889901),
('victor_jones', 'victor.jones@example.com', 'TechWave', 7788990012);


INSERT INTO Rooms (name, total_workspaces) VALUES
('Conference Room A', 10),
('Conference Room B', 15),
('Meeting Room 1', 8),
('Meeting Room 2', 12),
('Workshop Room 1', 20),
('Workshop Room 2', 18),
('Training Room A', 22),
('Training Room B', 25),
('Office 1', 30),
('Office 2', 28),
('Office 3', 25),
('Office 4', 27),
('Office 5', 23),
('Office 6', 21),
('Office 7', 19),
('Office 8', 24),
('Office 9', 20),
('Office 10', 22),
('Lab A', 15),
('Lab B', 17),
('Lab C', 13),
('Lab D', 14),
('Studio A', 10),
('Studio B', 12),
('Studio C', 11),
('Studio D', 9),
('Room 101', 30),
('Room 102', 28),
('Room 103', 26),
('Room 104', 29),
('Room 105', 27),
('Room 106', 24),
('Room 107', 23),
('Room 108', 22),
('Room 109', 21),
('Room 110', 20),
('Room 111', 19),
('Room 112', 18),
('Room 113', 17),
('Room 114', 16),
('Room 115', 15),
('Room 116', 14),
('Room 117', 13),
('Room 118', 10),
('Room 119', 15),
('Room 120', 12),
('Room 121', 18),
('Room 122', 22),
('Room 123', 25),
('Room 124', 30),
('Room 125', 28),
('Room 126', 26),
('Room 127', 24),
('Room 128', 23),
('Room 129', 20),
('Room 130', 19),
('Room 131', 17),
('Room 132', 16),
('Room 133', 14),
('Room 134', 13),
('Room 135', 12),
('Room 136', 11),
('Room 137', 10),
('Room 138', 15),
('Room 139', 18),
('Room 140', 20),
('Room 141', 22),
('Room 142', 24),
('Room 143', 26),
('Room 144', 28),
('Room 145', 30),
('Room 146', 27),
('Room 147', 25),
('Room 148', 23),
('Room 149', 21),
('Room 150', 19),
('Room 151', 18),
('Room 152', 17),
('Room 153', 16),
('Room 154', 15),
('Room 155', 14),
('Room 156', 13),
('Room 157', 12),
('Room 158', 11),
('Room 159', 10),
('Room 160', 9),
('Room 161', 10),
('Room 162', 12),
('Room 163', 15),
('Room 164', 18),
('Room 165', 20),
('Room 166', 22),
('Room 167', 24),
('Room 168', 26),
('Room 169', 28),
('Room 170', 30),
('Room 171', 27),
('Room 172', 25),
('Room 173', 23),
('Room 174', 21),
('Room 175', 19);


INSERT INTO Sessions (start_time, end_time, description) VALUES
('2024-06-19 09:00:00', '2024-06-19 11:00:00', 'Morning Meeting'),
('2024-06-19 10:00:00', '2024-06-19 12:00:00', 'Project Discussion'),
('2024-06-19 11:00:00', '2024-06-19 13:00:00', 'Client Call'),
('2024-06-19 12:00:00', '2024-06-19 14:00:00', 'Lunch Break'),
('2024-06-19 13:00:00', '2024-06-19 15:00:00', 'Team Sync'),
('2024-06-19 14:00:00', '2024-06-19 16:00:00', 'Strategy Planning'),
('2024-06-19 15:00:00', '2024-06-19 17:00:00', 'Code Review'),
('2024-06-19 16:00:00', '2024-06-19 18:00:00', 'Design Meeting'),
('2024-06-19 17:00:00', '2024-06-19 19:00:00', 'Marketing Strategy'),
('2024-06-19 18:00:00', '2024-06-19 20:00:00', 'Financial Analysis'),
('2024-06-19 19:00:00', '2024-06-19 21:00:00', 'Product Launch'),
('2024-06-19 20:00:00', '2024-06-19 22:00:00', 'Investor Meeting'),
('2024-06-19 21:00:00', '2024-06-19 23:00:00', 'Feedback Session'),
('2024-06-19 22:00:00', '2024-06-19 24:00:00', 'Work Review'),
('2024-06-20 09:00:00', '2024-06-20 11:00:00', 'Project Kickoff'),
('2024-06-20 10:00:00', '2024-06-20 12:00:00', 'Brainstorming'),
('2024-06-20 11:00:00', '2024-06-20 13:00:00', 'Development'),
('2024-06-20 12:00:00', '2024-06-20 14:00:00', 'Testing'),
('2024-06-20 13:00:00', '2024-06-20 15:00:00', 'Quality Assurance'),
('2024-06-20 14:00:00', '2024-06-20 16:00:00', 'Client Review'),
('2024-06-20 15:00:00', '2024-06-20 17:00:00', 'Team Building'),
('2024-06-20 16:00:00', '2024-06-20 18:00:00', 'Workshop'),
('2024-06-20 17:00:00', '2024-06-20 19:00:00', 'Technical Support'),
('2024-06-20 18:00:00', '2024-06-20 20:00:00', 'Product Demo'),
('2024-06-20 19:00:00', '2024-06-20 21:00:00', 'Sales Pitch'),
('2024-06-20 20:00:00', '2024-06-20 22:00:00', 'Project Review'),
('2024-06-20 21:00:00', '2024-06-20 23:00:00', 'Deployment'),
('2024-06-20 22:00:00', '2024-06-20 24:00:00', 'End of Day Wrap-Up'),
('2024-06-21 09:00:00', '2024-06-21 11:00:00', 'Weekly Sync'),
('2024-06-21 10:00:00', '2024-06-21 12:00:00', 'Customer Support'),
('2024-06-21 11:00:00', '2024-06-21 13:00:00', 'Technical Training'),
('2024-06-21 12:00:00', '2024-06-21 14:00:00', 'Leadership Meeting'),
('2024-06-21 13:00:00', '2024-06-21 15:00:00', 'Strategy Session'),
('2024-06-21 14:00:00', '2024-06-21 16:00:00', 'Design Review'),
('2024-06-21 15:00:00', '2024-06-21 17:00:00', 'Customer Meeting'),
('2024-06-21 16:00:00', '2024-06-21 18:00:00', 'Product Roadmap'),
('2024-06-21 17:00:00', '2024-06-21 19:00:00', 'Marketing Campaign'),
('2024-06-21 18:00:00', '2024-06-21 20:00:00', 'Team Huddle'),
('2024-06-21 19:00:00', '2024-06-21 21:00:00', 'Product Feedback'),
('2024-06-21 20:00:00', '2024-06-21 22:00:00', 'Design Sprint'),
('2024-06-21 21:00:00', '2024-06-21 23:00:00', 'Budget Review'),
('2024-06-21 22:00:00', '2024-06-21 24:00:00', 'Project Planning'),
('2024-06-22 09:00:00', '2024-06-22 11:00:00', 'Code Review'),
('2024-06-22 10:00:00', '2024-06-22 12:00:00', 'Sales Training'),
('2024-06-22 11:00:00', '2024-06-22 13:00:00', 'User Testing'),
('2024-06-22 12:00:00', '2024-06-22 14:00:00', 'Support Session'),
('2024-06-22 13:00:00', '2024-06-22 15:00:00', 'Technical Workshop'),
('2024-06-22 14:00:00', '2024-06-22 16:00:00', 'Weekly Wrap-Up'),
('2024-06-22 15:00:00', '2024-06-22 17:00:00', 'Roadmap Discussion'),
('2024-06-22 16:00:00', '2024-06-22 18:00:00', 'Team Meeting'),
('2024-06-22 17:00:00', '2024-06-22 19:00:00', 'Product Strategy'),
('2024-06-22 18:00:00', '2024-06-22 20:00:00', 'Client Follow-Up'),
('2024-06-22 19:00:00', '2024-06-22 21:00:00', 'QA Testing'),
('2024-06-22 20:00:00', '2024-06-22 22:00:00', 'Client Presentation'),
('2024-06-22 21:00:00', '2024-06-22 23:00:00', 'Support Review'),
('2024-06-22 22:00:00', '2024-06-22 24:00:00', 'Performance Review'),
('2024-06-23 09:00:00', '2024-06-23 11:00:00', 'Feature Planning'),
('2024-06-23 10:00:00', '2024-06-23 12:00:00', 'User Feedback'),
('2024-06-23 11:00:00', '2024-06-23 13:00:00', 'Product Testing'),
('2024-06-23 12:00:00', '2024-06-23 14:00:00', 'Sales Call'),
('2024-06-23 13:00:00', '2024-06-23 15:00:00', 'Marketing Review'),
('2024-06-23 14:00:00', '2024-06-23 16:00:00', 'Development Huddle'),
('2024-06-23 15:00:00', '2024-06-23 17:00:00', 'Design Review'),
('2024-06-23 16:00:00', '2024-06-23 18:00:00', 'Technical Meeting'),
('2024-06-23 17:00:00', '2024-06-23 19:00:00', 'Client Workshop'),
('2024-06-23 18:00:00', '2024-06-23 20:00:00', 'Feature Review'),
('2024-06-23 19:00:00', '2024-06-23 21:00:00', 'Support Session'),
('2024-06-23 20:00:00', '2024-06-23 22:00:00', 'Internal Discussion'),
('2024-06-23 21:00:00', '2024-06-23 23:00:00', 'Feedback Collection'),
('2024-06-23 22:00:00', '2024-06-23 24:00:00', 'QA Review'),
('2024-06-24 09:00:00', '2024-06-24 11:00:00', 'Business Planning'),
('2024-06-24 10:00:00', '2024-06-24 12:00:00', 'Product Launch'),
('2024-06-24 11:00:00', '2024-06-24 13:00:00', 'Strategy Meeting'),
('2024-06-24 12:00:00', '2024-06-24 14:00:00', 'Client Discussion'),
('2024-06-24 13:00:00', '2024-06-24 15:00:00', 'Team Feedback'),
('2024-06-24 14:00:00', '2024-06-24 16:00:00', 'Technical Planning'),
('2024-06-24 15:00:00', '2024-06-24 17:00:00', 'Product Review'),
('2024-06-24 16:00:00', '2024-06-24 18:00:00', 'Client Strategy'),
('2024-06-24 17:00:00', '2024-06-24 19:00:00', 'Development Discussion'),
('2024-06-24 18:00:00', '2024-06-24 20:00:00', 'QA Planning'),
('2024-06-24 19:00:00', '2024-06-24 21:00:00', 'Team Building'),
('2024-06-24 20:00:00', '2024-06-24 22:00:00', 'Client Meeting'),
('2024-06-24 21:00:00', '2024-06-24 23:00:00', 'Performance Metrics'),
('2024-06-24 22:00:00', '2024-06-24 24:00:00', 'Technical Review'),
('2024-06-25 09:00:00', '2024-06-25 11:00:00', 'Design Planning'),
('2024-06-25 10:00:00', '2024-06-25 12:00:00', 'Feature Update'),
('2024-06-25 11:00:00', '2024-06-25 13:00:00', 'Budget Meeting'),
('2024-06-25 12:00:00', '2024-06-25 14:00:00', 'Development Review'),
('2024-06-25 13:00:00', '2024-06-25 15:00:00', 'Marketing Strategy'),
('2024-06-25 14:00:00', '2024-06-25 16:00:00', 'Customer Support'),
('2024-06-25 15:00:00', '2024-06-25 17:00:00', 'Sales Presentation'),
('2024-06-25 16:00:00', '2024-06-25 18:00:00', 'Product Planning'),
('2024-06-25 17:00:00', '2024-06-25 19:00:00', 'Team Review'),
('2024-06-25 18:00:00', '2024-06-25 20:00:00', 'Operational Meeting'),
('2024-06-25 19:00:00', '2024-06-25 21:00:00', 'Executive Briefing'),
('2024-06-25 20:00:00', '2024-06-25 22:00:00', 'Project Kickoff'),
('2024-06-25 21:00:00', '2024-06-25 23:00:00', 'Vendor Review'),
('2024-06-25 22:00:00', '2024-06-25 24:00:00', 'Risk Assessment'),
('2024-06-26 09:00:00', '2024-06-26 11:00:00', 'Sprint Planning'),
('2024-06-26 10:00:00', '2024-06-26 12:00:00', 'Code Review'),
('2024-06-26 11:00:00', '2024-06-26 13:00:00', 'Product Demo');


INSERT INTO Workspaces (room_id, rw, clmn) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 2, 1),
(1, 2, 2),
(1, 2, 3),
(1, 3, 1),
(1, 3, 2),
(1, 3, 3),
(2, 1, 1),
(2, 1, 2),
(2, 1, 3),
(2, 2, 1),
(2, 2, 2),
(2, 2, 3),
(2, 3, 1),
(2, 3, 2),
(2, 3, 3),
(3, 1, 1),
(3, 1, 2),
(3, 1, 3),
(3, 2, 1),
(3, 2, 2),
(3, 2, 3),
(3, 3, 1),
(3, 3, 2),
(3, 3, 3),
(4, 1, 1),
(4, 1, 2),
(4, 1, 3),
(4, 2, 1),
(4, 2, 2),
(4, 2, 3),
(4, 3, 1),
(4, 3, 2),
(4, 3, 3),
(5, 1, 1),
(5, 1, 2),
(5, 1, 3),
(5, 2, 1),
(5, 2, 2),
(5, 2, 3),
(5, 3, 1),
(5, 3, 2),
(5, 3, 3),
(1, 4, 1),
(1, 4, 2),
(1, 4, 3),
(1, 5, 1),
(1, 5, 2),
(1, 5, 3),
(2, 4, 1),
(2, 4, 2),
(2, 4, 3),
(2, 5, 1),
(2, 5, 2),
(2, 5, 3),
(3, 4, 1),
(3, 4, 2),
(3, 4, 3),
(3, 5, 1),
(3, 5, 2),
(3, 5, 3),
(4, 4, 1),
(4, 4, 2),
(4, 4, 3),
(4, 5, 1),
(4, 5, 2),
(4, 5, 3),
(5, 4, 1),
(5, 4, 2),
(5, 4, 3),
(5, 5, 1),
(5, 5, 2),
(5, 5, 3),
(6, 1, 1),
(6, 1, 2),
(6, 1, 3),
(6, 2, 1),
(6, 2, 2),
(6, 2, 3),
(6, 3, 1),
(6, 3, 2),
(6, 3, 3),
(6, 4, 1),
(6, 4, 2),
(6, 4, 3),
(7, 1, 1),
(7, 1, 2),
(7, 1, 3),
(7, 2, 1),
(7, 2, 2),
(7, 2, 3),
(7, 3, 1),
(7, 3, 2),
(7, 3, 3),
(7, 4, 1),
(7, 4, 2),
(7, 4, 3),
(8, 1, 1),
(8, 1, 2);


/*
3. Inserciones y/o actualizaciones para:
*/

/* ■ Un Usuario pueda reservar un espacio de trabajo en una sesión x: */

INSERT INTO Reservations (user_id, workspace_id, session_id, reservation_time) VALUES
(1, 1, 1, '2024-06-19 10:00:00'),
(2, 2, 2, '2024-06-19 11:00:00'),
(3, 3, 3, '2024-06-19 12:00:00'),
(4, 4, 4, '2024-06-19 13:00:00'),
(5, 5, 5, '2024-06-19 14:00:00'),
(6, 6, 6, '2024-06-19 15:00:00'),
(7, 7, 7, '2024-06-19 16:00:00'),
(8, 8, 8, '2024-06-19 17:00:00'),
(9, 9, 9, '2024-06-19 18:00:00'),
(10, 10, 10, '2024-06-19 19:00:00'),
(11, 1, 2, '2024-06-19 20:00:00'),
(12, 2, 3, '2024-06-19 21:00:00'),
(13, 3, 4, '2024-06-19 22:00:00'),
(14, 4, 5, '2024-06-19 23:00:00'),
(15, 5, 6, '2024-06-20 00:00:00'),
(16, 6, 7, '2024-06-20 01:00:00'),
(17, 7, 8, '2024-06-20 02:00:00'),
(18, 8, 9, '2024-06-20 03:00:00'),
(19, 9, 10, '2024-06-20 04:00:00'),
(20, 1, 3, '2024-06-20 05:00:00'),
(21, 2, 4, '2024-06-20 06:00:00'),
(22, 3, 5, '2024-06-20 07:00:00'),
(23, 4, 6, '2024-06-20 08:00:00'),
(24, 5, 7, '2024-06-20 09:00:00'),
(25, 6, 8, '2024-06-20 10:00:00'),
(26, 7, 9, '2024-06-20 11:00:00'),
(27, 8, 10, '2024-06-20 12:00:00'),
(28, 9, 1, '2024-06-20 13:00:00'),
(29, 10, 2, '2024-06-20 14:00:00'),
(30, 1, 4, '2024-06-20 15:00:00'),
(31, 2, 5, '2024-06-20 16:00:00'),
(32, 3, 6, '2024-06-20 17:00:00'),
(33, 4, 7, '2024-06-20 18:00:00'),
(34, 5, 8, '2024-06-20 19:00:00'),
(35, 6, 9, '2024-06-20 20:00:00'),
(36, 7, 10, '2024-06-20 21:00:00'),
(37, 8, 1, '2024-06-20 22:00:00'),
(38, 9, 2, '2024-06-20 23:00:00'),
(39, 10, 3, '2024-06-21 00:00:00'),
(40, 1, 5, '2024-06-21 01:00:00'),
(41, 11, 11, '2024-06-21 02:00:00'),
(42, 12, 12, '2024-06-21 03:00:00'),
(43, 13, 13, '2024-06-21 04:00:00'),
(44, 14, 14, '2024-06-21 05:00:00'),
(45, 15, 15, '2024-06-21 06:00:00'),
(46, 16, 16, '2024-06-21 07:00:00'),
(47, 17, 17, '2024-06-21 08:00:00'),
(48, 18, 18, '2024-06-21 09:00:00'),
(49, 19, 19, '2024-06-21 10:00:00'),
(50, 20, 20, '2024-06-21 11:00:00'),
(51, 11, 12, '2024-06-21 12:00:00'),
(52, 12, 13, '2024-06-21 13:00:00'),
(53, 13, 14, '2024-06-21 14:00:00'),
(54, 14, 15, '2024-06-21 15:00:00'),
(55, 15, 16, '2024-06-21 16:00:00'),
(56, 16, 17, '2024-06-21 17:00:00'),
(57, 17, 18, '2024-06-21 18:00:00'),
(58, 18, 19, '2024-06-21 19:00:00'),
(59, 19, 20, '2024-06-21 20:00:00'),
(60, 20, 11, '2024-06-21 21:00:00'),
(61, 11, 13, '2024-06-21 22:00:00'),
(62, 12, 14, '2024-06-21 23:00:00'),
(63, 13, 15, '2024-06-22 00:00:00'),
(64, 14, 16, '2024-06-22 01:00:00'),
(65, 15, 17, '2024-06-22 02:00:00'),
(66, 16, 18, '2024-06-22 03:00:00'),
(67, 17, 19, '2024-06-22 04:00:00'),
(68, 18, 20, '2024-06-22 05:00:00'),
(69, 19, 11, '2024-06-22 06:00:00'),
(70, 20, 12, '2024-06-22 07:00:00'),
(71, 11, 14, '2024-06-22 08:00:00'),
(72, 12, 15, '2024-06-22 09:00:00'),
(73, 13, 16, '2024-06-22 10:00:00'),
(74, 14, 17, '2024-06-22 11:00:00'),
(75, 15, 18, '2024-06-22 12:00:00'),
(76, 16, 19, '2024-06-22 13:00:00'),
(77, 17, 20, '2024-06-22 14:00:00'),
(78, 18, 11, '2024-06-22 15:00:00'),
(79, 19, 12, '2024-06-22 16:00:00'),
(80, 20, 13, '2024-06-22 17:00:00'),
(81, 21, 21, '2024-06-22 18:00:00'),
(82, 22, 22, '2024-06-22 19:00:00'),
(83, 23, 23, '2024-06-22 20:00:00'),
(84, 24, 24, '2024-06-22 21:00:00'),
(85, 25, 25, '2024-06-22 22:00:00'),
(86, 26, 26, '2024-06-22 23:00:00'),
(87, 27, 27, '2024-06-23 00:00:00'),
(88, 28, 28, '2024-06-23 01:00:00'),
(89, 29, 29, '2024-06-23 02:00:00'),
(90, 30, 30, '2024-06-23 03:00:00'),
(91, 21, 22, '2024-06-23 04:00:00'),
(92, 22, 23, '2024-06-23 05:00:00'),
(93, 23, 24, '2024-06-23 06:00:00'),
(94, 24, 25, '2024-06-23 07:00:00'),
(95, 25, 26, '2024-06-23 08:00:00'),
(96, 26, 27, '2024-06-23 09:00:00'),
(97, 27, 28, '2024-06-23 10:00:00'),
(98, 28, 29, '2024-06-23 11:00:00'),
(99, 29, 30, '2024-06-23 12:00:00'),
(100, 30, 21, '2024-06-23 13:00:00'),
(101, 31, 20, '2024-06-23 14:00:00');


/* ■ Un usuario pueda cancelar una reserva: */
DELETE FROM Reservations
WHERE user_id = 1 AND workspace_id = 1 AND session_id = 1;

DELETE FROM Reservations
WHERE user_id = 2 AND workspace_id = 2 AND session_id = 2;

DELETE FROM Reservations
WHERE user_id = 3 AND workspace_id = 3 AND session_id = 3;

DELETE FROM Reservations
WHERE user_id = 4 AND workspace_id = 4 AND session_id = 4;

DELETE FROM Reservations
WHERE user_id = 5 AND workspace_id = 5 AND session_id = 5;

/*
4. Consultas para:
*/

/* ■ Ver la lista de espacios de trabajo disponibles de una sala en una sesión x: */
SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
LEFT JOIN Reservations r ON w.workspace_id = r.workspace_id AND r.session_id = 1
WHERE r.workspace_id IS NULL AND w.room_id = 1;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
LEFT JOIN Reservations r ON w.workspace_id = r.workspace_id AND r.session_id = 2
WHERE r.workspace_id IS NULL AND w.room_id = 2;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
LEFT JOIN Reservations r ON w.workspace_id = r.workspace_id AND r.session_id = 3
WHERE r.workspace_id IS NULL AND w.room_id = 3;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
LEFT JOIN Reservations r ON w.workspace_id = r.workspace_id AND r.session_id = 4
WHERE r.workspace_id IS NULL AND w.room_id = 4;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
LEFT JOIN Reservations r ON w.workspace_id = r.workspace_id AND r.session_id = 5
WHERE r.workspace_id IS NULL AND w.room_id = 5;


/* ■ Ver la lista de espacios de trabajo ocupados de una sala en una sesión x: */
SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 2 AND w.room_id = 2;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 11 AND w.room_id = 3;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 15 AND w.room_id = 2;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 10 AND w.room_id = 1;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 3 AND w.room_id = 2;

/* ■ Ver las sesiones con orden por las más ocupadas: */
SELECT s.session_id, COUNT(r.reservation_id) AS reservations_count
FROM Sessions s
LEFT JOIN Reservations r ON s.session_id = r.session_id
GROUP BY s.session_id
ORDER BY reservations_count DESC;

/* ■ Ver las sesiones con orden por las más disponibles. */
SELECT s.session_id, COUNT(r.reservation_id) AS reservations_count
FROM Sessions s
LEFT JOIN Reservations r ON s.session_id = r.session_id
GROUP BY s.session_id
ORDER BY reservations_count ASC;

/* ■ Ver la lista de espacios de trabajo asignados a un usuario. */
SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.user_id = 3;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.user_id = 10;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.user_id = 15;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.user_id = 20;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.user_id = 25;

/* ■ Ver la lista de espacios de trabajo asignados a una sesión. */ 
SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 4;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 8;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 10;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 14;

SELECT w.workspace_id, w.room_id, w.rw, w.clmn
FROM Workspaces w
JOIN Reservations r ON w.workspace_id = r.workspace_id
WHERE r.session_id = 30;
























