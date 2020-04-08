-- Create database TarotInfo
CREATE DATABASE tarottest;
USE tarottest;

-- Create table DeckType
CREATE TABLE IF NOT EXISTS DeckType
(
deck_type_id varchar(5) not null,
deck_type_name varchar(45),
deck_type_desc text,
card_id varchar(5),
constraint pk_DeckType primary key (deck_type_id)
);

-- Create table Deck
CREATE TABLE IF NOT EXISTS Deck
(
deck_id varchar(5) not null,
deck_name varchar(45),
deck_desc text,
deck_type_id varchar(5),
suit_id varchar(5),
constraint pk_deck primary key (deck_id),
constraint fk_deck_type_id foreign key (deck_type_id) references decktype(deck_type_id)
);



-- Create Table Suit

CREATE TABLE IF NOT EXISTS Suit 
(
suit_id varchar(5) not null,
suit_name varchar(45),
suit_desc text,
deck_id varchar(5) not null,
constraint pk_suit primary key (suit_id),
constraint fk_deck_id foreign key (deck_id) references deck(deck_id)
);

-- Create table Card

CREATE TABLE IF NOT EXISTS Card
(
card_id varchar(5) not null,
card_name varchar(45),
card_desc text,
arcana ENUM ('Major', 'Minor') NOT NULL,
picture blob,
suit_id varchar(5),
constraint pk_card primary key (card_id),
constraint fk_suit_id foreign key (suit_id) references suit(suit_id)
);

