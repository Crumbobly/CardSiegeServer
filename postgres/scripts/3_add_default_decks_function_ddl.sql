create or replace function game.add_default_decks(v_login text)
returns void
as $$
BEGIN
	-- 1) Добавление колод игроку
	insert into game.deck (login, name)
	SELECT v_login, name
	FROM game.deck
	WHERE login = '#PUBLIC_DECKS#';

	-- 2) Добавление в колоды игрока карт
	insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name)
	SELECT fk__card, v_login, fk__deck_name
	FROM game.cards_decks
	WHERE fk__deck_login = '#PUBLIC_DECKS#';
	
END;
$$
language plpgsql;