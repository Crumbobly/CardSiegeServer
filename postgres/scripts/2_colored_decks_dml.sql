-- Эти транкейты почистят таблички, когда это будет необходимо. Пока что они закомменчены
-- truncate game.cards_decks cascade;
-- truncate game.card cascade;
-- truncate game.deck cascade;
-- truncate game."type" cascade;
-- truncate game.archetype cascade;



insert into game.archetype (name) values
('Test'),
('Spells');

insert into game."type" ("name", fk__archetype) values
('Test_type', 'Test'),
('OP Ultra-Spell', 'Spells');

-- Колоды, которые по умолчанию есть у всех (только для копирования)
insert into game.deck (login, "name") values
('#PUBLIC_DECKS#', 'Red Default Deck'),
('#PUBLIC_DECKS#', 'Green Default Deck'),
('#PUBLIC_DECKS#', 'Blue Default Deck'),
('#PUBLIC_DECKS#', 'Yellow Default Deck'),
('#PUBLIC_DECKS#', 'White Default Deck');

insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 6, 9, 8, 4, 3, 'Red1', 'Художественный текст.. Спиздили'),
('Test_type', 1, 1, 5, 1, 6, 'Red2', 'Художественный текст.. Спиздили'),
('Test_type', 3, 8, 2, 9, 6, 'Red3', 'Художественный текст.. Спиздили'),
('Test_type', 1, 5, 7, 9, 8, 'Red4', 'Художественный текст.. Спиздили'),
('Test_type', 4, 6, 1, 6, 2, 'Red5', 'Художественный текст.. Спиздили'),
('Test_type', 1, 3, 8, 7, 6, 'Red6', 'Художественный текст.. Спиздили'),
('Test_type', 2, 7, 9, 5, 5, 'Red7', 'Художественный текст.. Спиздили'),
('Test_type', 7, 6, 7, 3, 5, 'Red8', 'Художественный текст.. Спиздили'),
('Test_type', 7, 8, 7, 8, 5, 'Red9', 'Художественный текст.. Спиздили'),
('Test_type', 1, 3, 6, 5, 7, 'Red10', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 6, 4, 5, 5, 7, 'Red11', 'Художественный текст.. Спиздили'),
('Test_type', 9, 8, 5, 8, 8, 'Red12', 'Художественный текст.. Спиздили'),
('Test_type', 8, 8, 2, 8, 1, 'Red13', 'Художественный текст.. Спиздили'),
('Test_type', 7, 3, 2, 7, 3, 'Red14', 'Художественный текст.. Спиздили'),
('Test_type', 4, 3, 4, 7, 5, 'Red15', 'Художественный текст.. Спиздили'),
('Test_type', 8, 10, 7, 4, 2, 'Red16', 'Художественный текст.. Спиздили'),
('Test_type', 4, 2, 5, 8, 5, 'Red17', 'Художественный текст.. Спиздили'),
('Test_type', 7, 4, 8, 8, 6, 'Red18', 'Художественный текст.. Спиздили'),
('Test_type', 4, 5, 1, 8, 5, 'Red19', 'Художественный текст.. Спиздили'),
('Test_type', 3, 10, 5, 9, 9, 'Red20', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 4, 4, 2, 1, 8, 'Red21', 'Художественный текст.. Спиздили'),
('Test_type', 1, 4, 6, 5, 4, 'Red22', 'Художественный текст.. Спиздили'),
('Test_type', 4, 7, 2, 2, 5, 'Red23', 'Художественный текст.. Спиздили'),
('Test_type', 4, 7, 4, 10, 9, 'Red24', 'Художественный текст.. Спиздили'),
('Test_type', 8, 2, 3, 7, 2, 'Red25', 'Художественный текст.. Спиздили'),
('Test_type', 7, 10, 9, 1, 9, 'Red26', 'Художественный текст.. Спиздили'),
('Test_type', 10, 2, 9, 7, 7, 'Red27', 'Художественный текст.. Спиздили'),
('Test_type', 6, 2, 9, 3, 4, 'Red28', 'Художественный текст.. Спиздили'),
('Test_type', 10, 9, 1, 2, 9, 'Red29', 'Художественный текст.. Спиздили'),
('Test_type', 3, 9, 10, 6, 9, 'Red30', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 5, 3, 1, 9, 2, 'Red31', 'Художественный текст.. Спиздили'),
('Test_type', 4, 10, 8, 8, 1, 'Red32', 'Художественный текст.. Спиздили'),
('Test_type', 7, 1, 2, 10, 7, 'Red33', 'Художественный текст.. Спиздили'),
('Test_type', 3, 4, 9, 7, 5, 'Red34', 'Художественный текст.. Спиздили'),
('Test_type', 3, 2, 1, 2, 7, 'Red35', 'Художественный текст.. Спиздили'),
('Test_type', 8, 4, 10, 2, 9, 'Red36', 'Художественный текст.. Спиздили'),
('Test_type', 6, 8, 8, 7, 1, 'Red37', 'Художественный текст.. Спиздили'),
('Test_type', 10, 1, 1, 5, 1, 'Red38', 'Художественный текст.. Спиздили'),
('Test_type', 2, 6, 2, 2, 7, 'Red39', 'Художественный текст.. Спиздили'),
('Test_type', 1, 1, 7, 3, 7, 'Red40', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 4, 9, 4, 9, 5, 'Green1', 'Художественный текст.. Спиздили'),
('Test_type', 7, 5, 6, 9, 6, 'Green2', 'Художественный текст.. Спиздили'),
('Test_type', 5, 4, 6, 6, 2, 'Green3', 'Художественный текст.. Спиздили'),
('Test_type', 7, 3, 10, 7, 8, 'Green4', 'Художественный текст.. Спиздили'),
('Test_type', 6, 3, 2, 3, 4, 'Green5', 'Художественный текст.. Спиздили'),
('Test_type', 5, 4, 3, 9, 7, 'Green6', 'Художественный текст.. Спиздили'),
('Test_type', 1, 2, 5, 7, 8, 'Green7', 'Художественный текст.. Спиздили'),
('Test_type', 2, 10, 5, 3, 4, 'Green8', 'Художественный текст.. Спиздили'),
('Test_type', 1, 8, 9, 6, 10, 'Green9', 'Художественный текст.. Спиздили'),
('Test_type', 9, 7, 8, 7, 8, 'Green10', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 4, 3, 2, 9, 10, 'Green11', 'Художественный текст.. Спиздили'),
('Test_type', 2, 4, 3, 10, 1, 'Green12', 'Художественный текст.. Спиздили'),
('Test_type', 8, 1, 2, 3, 8, 'Green13', 'Художественный текст.. Спиздили'),
('Test_type', 3, 2, 1, 1, 2, 'Green14', 'Художественный текст.. Спиздили'),
('Test_type', 9, 7, 8, 2, 2, 'Green15', 'Художественный текст.. Спиздили'),
('Test_type', 6, 5, 3, 3, 2, 'Green16', 'Художественный текст.. Спиздили'),
('Test_type', 2, 2, 1, 3, 10, 'Green17', 'Художественный текст.. Спиздили'),
('Test_type', 5, 5, 10, 7, 2, 'Green18', 'Художественный текст.. Спиздили'),
('Test_type', 7, 3, 1, 8, 9, 'Green19', 'Художественный текст.. Спиздили'),
('Test_type', 9, 9, 5, 6, 6, 'Green20', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 9, 3, 6, 2, 5, 'Green21', 'Художественный текст.. Спиздили'),
('Test_type', 4, 8, 4, 9, 5, 'Green22', 'Художественный текст.. Спиздили'),
('Test_type', 10, 8, 5, 1, 7, 'Green23', 'Художественный текст.. Спиздили'),
('Test_type', 1, 6, 2, 4, 1, 'Green24', 'Художественный текст.. Спиздили'),
('Test_type', 6, 6, 9, 10, 6, 'Green25', 'Художественный текст.. Спиздили'),
('Test_type', 5, 6, 1, 7, 2, 'Green26', 'Художественный текст.. Спиздили'),
('Test_type', 6, 1, 10, 5, 4, 'Green27', 'Художественный текст.. Спиздили'),
('Test_type', 2, 8, 8, 1, 9, 'Green28', 'Художественный текст.. Спиздили'),
('Test_type', 6, 8, 5, 5, 6, 'Green29', 'Художественный текст.. Спиздили'),
('Test_type', 4, 8, 7, 7, 4, 'Green30', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 5, 2, 9, 5, 6, 'Green31', 'Художественный текст.. Спиздили'),
('Test_type', 3, 2, 2, 7, 7, 'Green32', 'Художественный текст.. Спиздили'),
('Test_type', 9, 8, 9, 3, 3, 'Green33', 'Художественный текст.. Спиздили'),
('Test_type', 6, 6, 9, 3, 8, 'Green34', 'Художественный текст.. Спиздили'),
('Test_type', 9, 1, 1, 6, 9, 'Green35', 'Художественный текст.. Спиздили'),
('Test_type', 4, 5, 2, 7, 8, 'Green36', 'Художественный текст.. Спиздили'),
('Test_type', 9, 3, 1, 7, 1, 'Green37', 'Художественный текст.. Спиздили'),
('Test_type', 2, 5, 6, 3, 1, 'Green38', 'Художественный текст.. Спиздили'),
('Test_type', 10, 5, 3, 5, 9, 'Green39', 'Художественный текст.. Спиздили'),
('Test_type', 10, 2, 9, 8, 10, 'Green40', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 2, 8, 9, 1, 10, 'Blue1', 'Художественный текст.. Спиздили'),
('Test_type', 10, 6, 1, 7, 8, 'Blue2', 'Художественный текст.. Спиздили'),
('Test_type', 4, 2, 6, 1, 8, 'Blue3', 'Художественный текст.. Спиздили'),
('Test_type', 5, 5, 6, 7, 8, 'Blue4', 'Художественный текст.. Спиздили'),
('Test_type', 7, 1, 3, 5, 10, 'Blue5', 'Художественный текст.. Спиздили'),
('Test_type', 10, 5, 6, 5, 3, 'Blue6', 'Художественный текст.. Спиздили'),
('Test_type', 9, 8, 1, 1, 5, 'Blue7', 'Художественный текст.. Спиздили'),
('Test_type', 10, 10, 10, 7, 7, 'Blue8', 'Художественный текст.. Спиздили'),
('Test_type', 10, 6, 1, 6, 7, 'Blue9', 'Художественный текст.. Спиздили'),
('Test_type', 4, 7, 8, 10, 5, 'Blue10', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 7, 6, 3, 7, 3, 'Blue11', 'Художественный текст.. Спиздили'),
('Test_type', 7, 10, 3, 7, 8, 'Blue12', 'Художественный текст.. Спиздили'),
('Test_type', 4, 2, 3, 8, 9, 'Blue13', 'Художественный текст.. Спиздили'),
('Test_type', 2, 5, 6, 6, 1, 'Blue14', 'Художественный текст.. Спиздили'),
('Test_type', 4, 1, 1, 3, 10, 'Blue15', 'Художественный текст.. Спиздили'),
('Test_type', 2, 9, 2, 4, 4, 'Blue16', 'Художественный текст.. Спиздили'),
('Test_type', 10, 5, 9, 6, 3, 'Blue17', 'Художественный текст.. Спиздили'),
('Test_type', 3, 2, 6, 10, 10, 'Blue18', 'Художественный текст.. Спиздили'),
('Test_type', 8, 4, 1, 9, 2, 'Blue19', 'Художественный текст.. Спиздили'),
('Test_type', 2, 10, 3, 2, 6, 'Blue20', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 5, 3, 6, 3, 7, 'Blue21', 'Художественный текст.. Спиздили'),
('Test_type', 5, 5, 8, 10, 3, 'Blue22', 'Художественный текст.. Спиздили'),
('Test_type', 1, 7, 4, 4, 3, 'Blue23', 'Художественный текст.. Спиздили'),
('Test_type', 1, 7, 7, 3, 10, 'Blue24', 'Художественный текст.. Спиздили'),
('Test_type', 8, 6, 7, 1, 10, 'Blue25', 'Художественный текст.. Спиздили'),
('Test_type', 8, 4, 6, 6, 9, 'Blue26', 'Художественный текст.. Спиздили'),
('Test_type', 4, 10, 4, 10, 9, 'Blue27', 'Художественный текст.. Спиздили'),
('Test_type', 1, 7, 8, 6, 4, 'Blue28', 'Художественный текст.. Спиздили'),
('Test_type', 9, 4, 5, 9, 8, 'Blue29', 'Художественный текст.. Спиздили'),
('Test_type', 5, 7, 9, 8, 6, 'Blue30', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 4, 8, 3, 4, 1, 'Blue31', 'Художественный текст.. Спиздили'),
('Test_type', 3, 4, 8, 2, 1, 'Blue32', 'Художественный текст.. Спиздили'),
('Test_type', 6, 7, 6, 5, 7, 'Blue33', 'Художественный текст.. Спиздили'),
('Test_type', 4, 3, 8, 8, 6, 'Blue34', 'Художественный текст.. Спиздили'),
('Test_type', 7, 3, 4, 3, 5, 'Blue35', 'Художественный текст.. Спиздили'),
('Test_type', 8, 5, 10, 2, 9, 'Blue36', 'Художественный текст.. Спиздили'),
('Test_type', 9, 6, 1, 2, 9, 'Blue37', 'Художественный текст.. Спиздили'),
('Test_type', 9, 10, 7, 6, 3, 'Blue38', 'Художественный текст.. Спиздили'),
('Test_type', 6, 9, 5, 6, 9, 'Blue39', 'Художественный текст.. Спиздили'),
('Test_type', 3, 2, 7, 10, 7, 'Blue40', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 4, 1, 5, 1, 2, 'Yellow1', 'Художественный текст.. Спиздили'),
('Test_type', 4, 1, 2, 4, 2, 'Yellow2', 'Художественный текст.. Спиздили'),
('Test_type', 10, 5, 6, 9, 9, 'Yellow3', 'Художественный текст.. Спиздили'),
('Test_type', 4, 6, 7, 1, 9, 'Yellow4', 'Художественный текст.. Спиздили'),
('Test_type', 10, 6, 1, 8, 6, 'Yellow5', 'Художественный текст.. Спиздили'),
('Test_type', 9, 7, 8, 5, 6, 'Yellow6', 'Художественный текст.. Спиздили'),
('Test_type', 4, 5, 9, 7, 7, 'Yellow7', 'Художественный текст.. Спиздили'),
('Test_type', 1, 1, 4, 7, 5, 'Yellow8', 'Художественный текст.. Спиздили'),
('Test_type', 2, 9, 5, 9, 2, 'Yellow9', 'Художественный текст.. Спиздили'),
('Test_type', 7, 1, 4, 7, 4, 'Yellow10', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 9, 7, 7, 7, 2, 'Yellow11', 'Художественный текст.. Спиздили'),
('Test_type', 2, 1, 2, 7, 8, 'Yellow12', 'Художественный текст.. Спиздили'),
('Test_type', 9, 9, 2, 5, 7, 'Yellow13', 'Художественный текст.. Спиздили'),
('Test_type', 5, 8, 5, 3, 10, 'Yellow14', 'Художественный текст.. Спиздили'),
('Test_type', 5, 7, 2, 4, 6, 'Yellow15', 'Художественный текст.. Спиздили'),
('Test_type', 6, 2, 5, 2, 7, 'Yellow16', 'Художественный текст.. Спиздили'),
('Test_type', 4, 9, 2, 9, 2, 'Yellow17', 'Художественный текст.. Спиздили'),
('Test_type', 10, 7, 1, 5, 8, 'Yellow18', 'Художественный текст.. Спиздили'),
('Test_type', 8, 4, 5, 9, 9, 'Yellow19', 'Художественный текст.. Спиздили'),
('Test_type', 4, 6, 1, 10, 7, 'Yellow20', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 4, 10, 9, 4, 3, 'Yellow21', 'Художественный текст.. Спиздили'),
('Test_type', 8, 3, 10, 1, 6, 'Yellow22', 'Художественный текст.. Спиздили'),
('Test_type', 2, 9, 5, 3, 6, 'Yellow23', 'Художественный текст.. Спиздили'),
('Test_type', 7, 1, 2, 10, 9, 'Yellow24', 'Художественный текст.. Спиздили'),
('Test_type', 8, 3, 9, 4, 7, 'Yellow25', 'Художественный текст.. Спиздили'),
('Test_type', 1, 10, 4, 7, 10, 'Yellow26', 'Художественный текст.. Спиздили'),
('Test_type', 3, 7, 6, 10, 6, 'Yellow27', 'Художественный текст.. Спиздили'),
('Test_type', 9, 7, 10, 2, 2, 'Yellow28', 'Художественный текст.. Спиздили'),
('Test_type', 2, 2, 10, 6, 9, 'Yellow29', 'Художественный текст.. Спиздили'),
('Test_type', 2, 5, 5, 1, 7, 'Yellow30', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 7, 5, 10, 9, 10, 'Yellow31', 'Художественный текст.. Спиздили'),
('Test_type', 4, 2, 7, 2, 1, 'Yellow32', 'Художественный текст.. Спиздили'),
('Test_type', 4, 9, 7, 3, 2, 'Yellow33', 'Художественный текст.. Спиздили'),
('Test_type', 10, 3, 4, 4, 8, 'Yellow34', 'Художественный текст.. Спиздили'),
('Test_type', 2, 3, 8, 3, 2, 'Yellow35', 'Художественный текст.. Спиздили'),
('Test_type', 6, 7, 9, 3, 5, 'Yellow36', 'Художественный текст.. Спиздили'),
('Test_type', 7, 3, 1, 7, 6, 'Yellow37', 'Художественный текст.. Спиздили'),
('Test_type', 8, 4, 7, 2, 1, 'Yellow38', 'Художественный текст.. Спиздили'),
('Test_type', 7, 8, 4, 2, 2, 'Yellow39', 'Художественный текст.. Спиздили'),
('Test_type', 1, 3, 10, 3, 5, 'Yellow40', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 7, 4, 3, 3, 7, 'White1', 'Художественный текст.. Спиздили'),
('Test_type', 1, 7, 6, 7, 9, 'White2', 'Художественный текст.. Спиздили'),
('Test_type', 6, 10, 6, 1, 8, 'White3', 'Художественный текст.. Спиздили'),
('Test_type', 2, 6, 1, 9, 3, 'White4', 'Художественный текст.. Спиздили'),
('Test_type', 8, 2, 4, 4, 10, 'White5', 'Художественный текст.. Спиздили'),
('Test_type', 8, 8, 3, 5, 5, 'White6', 'Художественный текст.. Спиздили'),
('Test_type', 3, 6, 9, 4, 3, 'White7', 'Художественный текст.. Спиздили'),
('Test_type', 10, 9, 9, 5, 4, 'White8', 'Художественный текст.. Спиздили'),
('Test_type', 8, 8, 4, 5, 1, 'White9', 'Художественный текст.. Спиздили'),
('Test_type', 5, 4, 2, 8, 3, 'White10', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 6, 9, 4, 7, 10, 'White11', 'Художественный текст.. Спиздили'),
('Test_type', 6, 4, 5, 7, 4, 'White12', 'Художественный текст.. Спиздили'),
('Test_type', 5, 10, 10, 2, 6, 'White13', 'Художественный текст.. Спиздили'),
('Test_type', 10, 3, 4, 4, 9, 'White14', 'Художественный текст.. Спиздили'),
('Test_type', 8, 1, 8, 8, 3, 'White15', 'Художественный текст.. Спиздили'),
('Test_type', 2, 8, 8, 9, 10, 'White16', 'Художественный текст.. Спиздили'),
('Test_type', 1, 4, 5, 8, 3, 'White17', 'Художественный текст.. Спиздили'),
('Test_type', 2, 9, 7, 5, 10, 'White18', 'Художественный текст.. Спиздили'),
('Test_type', 6, 3, 7, 8, 5, 'White19', 'Художественный текст.. Спиздили'),
('Test_type', 6, 5, 1, 5, 2, 'White20', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 4, 4, 9, 5, 4, 'White21', 'Художественный текст.. Спиздили'),
('Test_type', 1, 2, 7, 1, 10, 'White22', 'Художественный текст.. Спиздили'),
('Test_type', 3, 2, 8, 5, 5, 'White23', 'Художественный текст.. Спиздили'),
('Test_type', 3, 9, 6, 8, 10, 'White24', 'Художественный текст.. Спиздили'),
('Test_type', 8, 9, 1, 8, 9, 'White25', 'Художественный текст.. Спиздили'),
('Test_type', 3, 5, 1, 6, 2, 'White26', 'Художественный текст.. Спиздили'),
('Test_type', 5, 4, 9, 7, 4, 'White27', 'Художественный текст.. Спиздили'),
('Test_type', 6, 2, 6, 8, 10, 'White28', 'Художественный текст.. Спиздили'),
('Test_type', 8, 8, 9, 8, 1, 'White29', 'Художественный текст.. Спиздили'),
('Test_type', 5, 10, 10, 7, 10, 'White30', 'Художественный текст.. Спиздили')
;
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('Test_type', 10, 10, 3, 6, 5, 'White31', 'Художественный текст.. Спиздили'),
('Test_type', 10, 9, 1, 7, 6, 'White32', 'Художественный текст.. Спиздили'),
('Test_type', 9, 1, 10, 8, 3, 'White33', 'Художественный текст.. Спиздили'),
('Test_type', 10, 1, 2, 5, 4, 'White34', 'Художественный текст.. Спиздили'),
('Test_type', 3, 5, 7, 2, 7, 'White35', 'Художественный текст.. Спиздили'),
('Test_type', 8, 8, 2, 8, 2, 'White36', 'Художественный текст.. Спиздили'),
('Test_type', 6, 2, 5, 3, 2, 'White37', 'Художественный текст.. Спиздили'),
('Test_type', 6, 4, 1, 1, 5, 'White38', 'Художественный текст.. Спиздили'),
('Test_type', 10, 3, 3, 6, 9, 'White39', 'Художественный текст.. Спиздили'),
('Test_type', 8, 10, 9, 7, 4, 'White40', 'Художественный текст.. Спиздили')
;




insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Red1', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red2', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red3', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red4', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red5', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red6', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red7', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red8', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red9', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red10', '#PUBLIC_DECKS#', 'Red Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Red11', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red12', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red13', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red14', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red15', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red16', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red17', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red18', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red19', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red20', '#PUBLIC_DECKS#', 'Red Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Red21', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red22', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red23', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red24', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red25', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red26', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red27', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red28', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red29', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red30', '#PUBLIC_DECKS#', 'Red Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Red31', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red32', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red33', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red34', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red35', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red36', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red37', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red38', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red39', '#PUBLIC_DECKS#', 'Red Default Deck'),
('Red40', '#PUBLIC_DECKS#', 'Red Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Green1', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green2', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green3', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green4', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green5', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green6', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green7', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green8', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green9', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green10', '#PUBLIC_DECKS#', 'Green Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Green11', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green12', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green13', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green14', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green15', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green16', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green17', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green18', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green19', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green20', '#PUBLIC_DECKS#', 'Green Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Green21', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green22', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green23', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green24', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green25', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green26', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green27', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green28', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green29', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green30', '#PUBLIC_DECKS#', 'Green Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Green31', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green32', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green33', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green34', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green35', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green36', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green37', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green38', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green39', '#PUBLIC_DECKS#', 'Green Default Deck'),
('Green40', '#PUBLIC_DECKS#', 'Green Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Blue1', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue2', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue3', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue4', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue5', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue6', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue7', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue8', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue9', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue10', '#PUBLIC_DECKS#', 'Blue Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Blue11', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue12', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue13', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue14', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue15', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue16', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue17', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue18', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue19', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue20', '#PUBLIC_DECKS#', 'Blue Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Blue21', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue22', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue23', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue24', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue25', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue26', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue27', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue28', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue29', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue30', '#PUBLIC_DECKS#', 'Blue Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Blue31', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue32', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue33', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue34', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue35', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue36', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue37', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue38', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue39', '#PUBLIC_DECKS#', 'Blue Default Deck'),
('Blue40', '#PUBLIC_DECKS#', 'Blue Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Yellow1', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow2', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow3', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow4', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow5', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow6', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow7', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow8', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow9', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow10', '#PUBLIC_DECKS#', 'Yellow Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Yellow11', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow12', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow13', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow14', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow15', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow16', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow17', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow18', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow19', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow20', '#PUBLIC_DECKS#', 'Yellow Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Yellow21', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow22', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow23', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow24', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow25', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow26', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow27', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow28', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow29', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow30', '#PUBLIC_DECKS#', 'Yellow Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('Yellow31', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow32', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow33', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow34', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow35', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow36', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow37', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow38', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow39', '#PUBLIC_DECKS#', 'Yellow Default Deck'),
('Yellow40', '#PUBLIC_DECKS#', 'Yellow Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('White1', '#PUBLIC_DECKS#', 'White Default Deck'),
('White2', '#PUBLIC_DECKS#', 'White Default Deck'),
('White3', '#PUBLIC_DECKS#', 'White Default Deck'),
('White4', '#PUBLIC_DECKS#', 'White Default Deck'),
('White5', '#PUBLIC_DECKS#', 'White Default Deck'),
('White6', '#PUBLIC_DECKS#', 'White Default Deck'),
('White7', '#PUBLIC_DECKS#', 'White Default Deck'),
('White8', '#PUBLIC_DECKS#', 'White Default Deck'),
('White9', '#PUBLIC_DECKS#', 'White Default Deck'),
('White10', '#PUBLIC_DECKS#', 'White Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('White11', '#PUBLIC_DECKS#', 'White Default Deck'),
('White12', '#PUBLIC_DECKS#', 'White Default Deck'),
('White13', '#PUBLIC_DECKS#', 'White Default Deck'),
('White14', '#PUBLIC_DECKS#', 'White Default Deck'),
('White15', '#PUBLIC_DECKS#', 'White Default Deck'),
('White16', '#PUBLIC_DECKS#', 'White Default Deck'),
('White17', '#PUBLIC_DECKS#', 'White Default Deck'),
('White18', '#PUBLIC_DECKS#', 'White Default Deck'),
('White19', '#PUBLIC_DECKS#', 'White Default Deck'),
('White20', '#PUBLIC_DECKS#', 'White Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('White21', '#PUBLIC_DECKS#', 'White Default Deck'),
('White22', '#PUBLIC_DECKS#', 'White Default Deck'),
('White23', '#PUBLIC_DECKS#', 'White Default Deck'),
('White24', '#PUBLIC_DECKS#', 'White Default Deck'),
('White25', '#PUBLIC_DECKS#', 'White Default Deck'),
('White26', '#PUBLIC_DECKS#', 'White Default Deck'),
('White27', '#PUBLIC_DECKS#', 'White Default Deck'),
('White28', '#PUBLIC_DECKS#', 'White Default Deck'),
('White29', '#PUBLIC_DECKS#', 'White Default Deck'),
('White30', '#PUBLIC_DECKS#', 'White Default Deck')
;
insert into game.cards_decks (fk__card, fk__deck_login, fk__deck_name) values
('White31', '#PUBLIC_DECKS#', 'White Default Deck'),
('White32', '#PUBLIC_DECKS#', 'White Default Deck'),
('White33', '#PUBLIC_DECKS#', 'White Default Deck'),
('White34', '#PUBLIC_DECKS#', 'White Default Deck'),
('White35', '#PUBLIC_DECKS#', 'White Default Deck'),
('White36', '#PUBLIC_DECKS#', 'White Default Deck'),
('White37', '#PUBLIC_DECKS#', 'White Default Deck'),
('White38', '#PUBLIC_DECKS#', 'White Default Deck'),
('White39', '#PUBLIC_DECKS#', 'White Default Deck'),
('White40', '#PUBLIC_DECKS#', 'White Default Deck')
;


-- Карта, которой нет ни в одной колоде
insert into game.card(fk__type, cost_res1, cost_res2, cost_res3, power, stamina, "name", "text") values
('OP Ultra-Spell', 23, 10, 3, 1337, 9999, 'Реактивная залупа коня', 'Правая кнопка мыши отправит ее в нужное место, чтобы обеспечить наилучший сексуальный опыт как для танкистов, так и для стратегов. Как для стратистов, так и для танкегов. Какегов. Каво?');

