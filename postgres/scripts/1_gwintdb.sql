
CREATE ROLE gwint_admin LOGIN;
CREATE ROLE auth_user LOGIN;
CREATE ROLE game_user LOGIN;
--CREATE DATABASE gwintdb;

-- Создание схемы auth, где будут храниться параметры учетных записей


CREATE SCHEMA auth AUTHORIZATION gwint_admin;
GRANT USAGE ON SCHEMA auth TO auth_user;

CREATE TABLE gwintdb.auth.user_accounts (
    login varchar(64) NOT NULL,
    password text NOT NULL,

    CONSTRAINT auth_users__pk PRIMARY KEY (login)
);
COMMENT ON TABLE gwintdb.auth.user_accounts IS 'Данные учетных записей для входа';
COMMENT ON COLUMN gwintdb.auth.user_accounts.login IS 'Логин пользователя';
COMMENT ON COLUMN gwintdb.auth.user_accounts.password IS 'Зашифрованный пароль пользователя';
GRANT SELECT, INSERT ON gwintdb.auth.user_accounts TO auth_user;


-- Создание схемы game, где будут храниться колоды и карты

CREATE SCHEMA game AUTHORIZATION gwint_admin;
GRANT USAGE ON SCHEMA game TO game_user;

CREATE TABLE gwintdb.game.deck (
    login varchar(64) NOT NULL, -- Нет ключевания с gwintdb.auth.user_accounts в целях безопасности
    name varchar(64) NOT NULL,

    CONSTRAINT game_deck__pk PRIMARY KEY (login, name)
);
CREATE INDEX game_deck__name_idx ON gwintdb.game.deck (name);
CREATE INDEX game_deck__login_idx ON gwintdb.game.deck (login); -- т.к. часто придется обращаться к таблице с целью взять все колоды пользователя через WHERE login = ...
COMMENT ON TABLE gwintdb.game.deck IS 'Колода';
COMMENT ON COLUMN gwintdb.game.deck.login IS 'Логин владельца колоды';
COMMENT ON COLUMN gwintdb.game.deck.name IS 'Имя колоды';
GRANT SELECT, INSERT ON gwintdb.game.deck TO game_user;

CREATE TABLE gwintdb.game.archetype (
    name varchar(64) NOT null,
	-- может, у архитипов есть какой-то смысол, который можно будет отражать тут
    CONSTRAINT game_archetype__pk PRIMARY KEY (name)
);
COMMENT ON TABLE gwintdb.game.archetype IS 'Архетип';
COMMENT ON COLUMN gwintdb.game.archetype.name IS 'Имя архетипа';
GRANT SELECT, INSERT ON gwintdb.game.archetype TO game_user;

CREATE TABLE gwintdb.game.type (
    fk__archetype varchar(64) NOT NULL,
    name varchar(64) NOT NULL,

    CONSTRAINT game_type__pk PRIMARY KEY (name),
    CONSTRAINT game_type__fk_archetype FOREIGN KEY (fk__archetype) REFERENCES gwintdb.game.archetype (name) ON DELETE SET NULL
);
COMMENT ON TABLE gwintdb.game.type IS 'Тип карты';
COMMENT ON COLUMN gwintdb.game.type.fk__archetype IS 'Архетип (ссылка на gwintdb.game.archetype)';
COMMENT ON COLUMN gwintdb.game.type.name IS 'Имя типа';
GRANT SELECT, INSERT ON gwintdb.game.type TO game_user;

CREATE TABLE gwintdb.game.card (
    fk__type varchar(64) NOT NULL,
    cost_res1 int2, -- в целом, есть вариант реализовать поле "стоимость" как XXYYZZ и хранить его в int4
    cost_res2 int2, -- тогда res1 = cost%100; res2 = div(cost, 100)%100; res3 = div(cost, 10000)
    cost_res3 int2, -- но, как по мне, это колхоз
    power int2,
    stamina int2,
    name varchar(64) NOT NULL,
    art_filepath text,
    text text,

    CONSTRAINT game_card__pk PRIMARY KEY (name),
    CONSTRAINT game_card__fk_type FOREIGN KEY (fk__type) REFERENCES gwintdb.game.type (name) ON DELETE SET NULL
);
CREATE INDEX game_card__name_idx ON gwintdb.game.card (name);
COMMENT ON TABLE gwintdb.game.card IS 'Карта';
COMMENT ON COLUMN gwintdb.game.card.fk__type IS 'Тип карты (ссылка на gwintdb.game.type)';
COMMENT ON COLUMN gwintdb.game.card.cost_res1 IS 'Стоимость карты в ресурсе 1';
COMMENT ON COLUMN gwintdb.game.card.cost_res2 IS 'Стоимость карты в ресурсе 2';
COMMENT ON COLUMN gwintdb.game.card.cost_res3 IS 'Стоимость карты в ресурсе 3';
COMMENT ON COLUMN gwintdb.game.card.power IS 'Сила';
COMMENT ON COLUMN gwintdb.game.card.stamina IS 'Выносливость';
COMMENT ON COLUMN gwintdb.game.card.name IS 'Имя карты';
COMMENT ON COLUMN gwintdb.game.card.art_filepath IS 'Путь к арту карты';
COMMENT ON COLUMN gwintdb.game.card.text IS 'Художественный текст';
GRANT SELECT, INSERT ON gwintdb.game.card TO game_user;



CREATE TABLE gwintdb.game.property (
    name varchar(64) NOT NULL,
    description text,

    CONSTRAINT game_property__pk PRIMARY KEY (name)
);
COMMENT ON TABLE gwintdb.game.property IS 'Свойство карты';
COMMENT ON COLUMN gwintdb.game.property.name IS 'Имя свойства';
COMMENT ON COLUMN gwintdb.game.property.description IS 'Описание';
GRANT SELECT, INSERT ON gwintdb.game.property TO game_user;

-- Таблицы M:N для схемы game

CREATE TABLE gwintdb.game.cards_properties (
    fk__card varchar(64) NOT NULL,
    fk__property varchar(64) NOT NULL,

    CONSTRAINT game_cards_properties__pk PRIMARY KEY (fk__card, fk__property),
    CONSTRAINT game_cards_properties__fk_card FOREIGN KEY (fk__card) REFERENCES gwintdb.game.card (name) ON DELETE SET NULL,
    CONSTRAINT game_cards_properties__fk_property FOREIGN KEY (fk__property) REFERENCES gwintdb.game.property (name) ON DELETE SET NULL
);
COMMENT ON TABLE gwintdb.game.cards_properties IS 'M:N - Карты и их свойства';
COMMENT ON COLUMN gwintdb.game.cards_properties.fk__card IS 'Карта (ссылка на gwintdb.game.card)';
COMMENT ON COLUMN gwintdb.game.cards_properties.fk__property IS 'Свойство (ссылка на gwintdb.game.property)';
GRANT SELECT, INSERT ON gwintdb.game.cards_properties TO game_user;

CREATE TABLE gwintdb.game.cards_decks (
    fk__card varchar(64) NOT NULL,
    fk__deck_login varchar(64) NOT NULL,
    fk__deck_name varchar(64) not null,
    CONSTRAINT game_cards_decks__pk PRIMARY KEY (fk__card, fk__deck_login, fk__deck_name),
    CONSTRAINT game_cards_decks__fk_card FOREIGN KEY (fk__card) REFERENCES gwintdb.game.card (name) ON DELETE SET null,
    CONSTRAINT game_cards_decks__fk_deck_name FOREIGN KEY (fk__deck_name, fk__deck_login) 
    	REFERENCES gwintdb.game.deck (name, login) ON DELETE SET null
);
COMMENT ON TABLE gwintdb.game.cards_decks IS 'M:N - Карты и колоды';
COMMENT ON COLUMN gwintdb.game.cards_decks.fk__card IS 'Карта (ссылка на gwintdb.game.card)';
COMMENT ON COLUMN gwintdb.game.cards_decks.fk__deck_login IS 'Игрок-владелец колоды (ссылка на gwintdb.game.deck.login)';
COMMENT ON COLUMN gwintdb.game.cards_decks.fk__deck_name IS 'Имя колоды (ссылка на gwintdb.game.deck.name)';
GRANT SELECT, INSERT ON gwintdb.game.cards_decks TO game_user; 

