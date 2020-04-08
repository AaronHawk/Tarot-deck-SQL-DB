-- Create database TarotInfo
CREATE DATABASE tarot;
USE tarot;

-- Create table DeckType
CREATE TABLE IF NOT EXISTS DeckType
(
deck_type_id varchar(5) not null,
deck_type_name varchar(45),
deck_type_desc text,
constraint pk_DeckType primary key (deck_type_id)
);

-- Create table Deck
CREATE TABLE IF NOT EXISTS Deck
(
deck_id varchar(5) not null,
deck_name varchar(45),
deck_desc text,
deck_type_id varchar(5),
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


-- Insert into DeckType table

insert into decktype
(deck_type_id, deck_type_name, deck_type_desc)
values
('DT1', 'Rider-Waite Style', 'The classic deck designed by mystic A.E Waite and illustrator Pamela Colman Smith. There are many decks styled similarly, and they have 78 cards.'),
('DT2', 'Thoth Style', 'A deck designed by Aleister Crowley, published posthumously in 1969. There are many decks styled similarly, and they have 80 cards.');

select * from decktype;

-- Insert into Deck table

insert into deck
(deck_id, deck_name, deck_desc)
values
('D1', 'Colman-Smith Tarot ', 'A classic deck in the Rider-Waite style, using the original Rider-Waite drawings but enhanced with a psychedelic colour scheme.'),
('D2', 'Thoth', 'The original Thoth style deck with 80 cards, as designed by Crowley and illustrated by Harris.');

select * from deck;
-- insert into suit 
insert into suit
(suit_id, suit_name, suit_desc, deck_id)
values
('S0', 'MAJOR', 'Major arcana cards are suitless and stand alone.', 'D1'),
('S1', 'Swords', 'The suit of Swords is associated with action, change, force, power, oppression, ambition, courage and conflict.', 'D1'),
('S2', 'Wands', 'The suit of wands is associated with energy, spirituality, inspiration, determination, strength, intuition, creativity, ambition and expansion.', 'D2'),
('S3', 'Pentacles', 'The suit of wands is associated with material aspects of life including work, business, trade, property, money and other material possessions.', 'D1'),
('S4', 'Cups', 'The suit of cups is associated withn the emotional level of consciousness and are associated with love, feelings, relationships and connections.', 'D2');

select * from suit; 
-- insert into card
insert into card
(card_id, card_name, card_desc, arcana, picture, suit_id)
VALUES
('C0', 'The Fool', 'Upright: Beginnings, innocence, spontaneity, a free spirit / Reversed: Naivety, foolishness, recklessness, risk-taking', 'Major', NULL, null),
('C1', 'The World', 'Upright: Completion, integration, accomplishment, travel / Reversed: Lack of completion, lack of closure', 'Major', null, null);

select * from card; 
