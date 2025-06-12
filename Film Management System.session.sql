-- nodependentní tabulky

CREATE TABLE Genres (
    Genre_ID SERIAL PRIMARY KEY,
    Genre_Name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Directors (
    Director_ID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,     
    Last_Name VARCHAR(50) NOT NULL,      
    Birthdate DATE
);


CREATE TABLE Actors (
    Actor_ID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,     
    Last_Name VARCHAR(50) NOT NULL,      
    Birthdate DATE
);


CREATE TABLE Users (
    User_ID SERIAL PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);


-- dependentní tabulky

CREATE TABLE Films (
    Film_ID SERIAL PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Release_Year INT NOT NULL,
    Genre_ID INT REFERENCES Genres(Genre_ID) ON DELETE SET NULL,
    Director_ID INT REFERENCES Directors(Director_ID) ON DELETE SET NULL,
    Duration INT CHECK (Duration > 0),
    Rating DECIMAL(3,1) CHECK (Rating BETWEEN 0 AND 10)
);


CREATE TABLE Film_Actors (
    Film_ID INT REFERENCES Films(Film_ID) ON DELETE CASCADE,
    Actor_ID INT REFERENCES Actors(Actor_ID) ON DELETE CASCADE,
    Role VARCHAR(100)
);


CREATE TABLE Reviews (
    Review_ID SERIAL PRIMARY KEY,
    Film_ID INT REFERENCES Films(Film_ID) ON DELETE CASCADE,
    User_ID INT REFERENCES Users(User_ID) ON DELETE CASCADE,
    Rating INT CHECK (Rating BETWEEN 1 AND 10),
    Comment TEXT,
    Review_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
