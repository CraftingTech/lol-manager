-- First 2014 slice. Primary keys are UUIDs. Unknown sheets stay empty.
-- Champions: https://ddragon.leagueoflegends.com/cdn/4.21.5/data/en_US/champion.json
-- Champion portraits: https://ddragon.leagueoflegends.com/cdn/4.21.5/img/champion/{id}.png
-- League, team, organisation and player pictures are the main image of the Leaguepedia page.
-- EU LCS: https://lol.fandom.com/wiki/EU_LCS/2014_Season
-- NA LCS: https://lol.fandom.com/wiki/NA_LCS/2014_Season
-- Fnatic: https://lol.fandom.com/wiki/Fnatic
-- Cloud 9: https://lol.fandom.com/wiki/Cloud9
-- Cloud 9 logo: https://lol.fandom.com/wiki/File:Cloud9logo_profile.png
-- Edward Gaming: https://lol.fandom.com/wiki/EDward_Gaming
-- Edward Gaming region CN is the Region line of that page.
-- SK Telecom T1 K: https://lol.fandom.com/wiki/SK_Telecom_T1_K
-- SK Telecom T1 K region KR is the Region line of that page.
-- SK Telecom T1 K logo: https://lol.fandom.com/wiki/File:SK_Telecom_T1_Klogo_square.png
-- Players: the page reached from the gol.gg name (sOAZ, xPeke, Koro1, ClearLove, U, NaMei, FZZF).
-- Nationality is that page's Country of Birth: China CN, United States US.
-- Birth date is that page's Birthday line. Age is the completed years at the career date.
-- sOAZ 1994-01-09 19, Cyanide 1994-11-15 19, xPeke 1992-04-24 21, Rekkles 1996-09-20 17,
-- YellOwStaR 1992-02-15 21, Balls 1994-06-22 19, Meteos 1993-06-13 20, Hai 1992-09-20 21,
-- Sneaky 1994-03-19 19, LemonNation 1989-06-15 24, Koro1 1994-05-02 19, ClearLove 1993-07-25 20,
-- U 1993-09-04 20, NaMei 1993-05-04 20, FZZF 1991-07-24 22, Impact 1995-03-07 18,
-- bengi 1993-11-21 20, Faker 1996-05-07 17, Piglet 1994-02-04 19, PoohManDu 1991-01-29 22.
-- EU teams: https://gol.gg/tournament/tournament-ranking/EU%20LCS%20Spring%202014/
-- NA teams: https://gol.gg/tournament/tournament-ranking/NA%20LCS%20Spring%202014/
-- Fnatic: https://gol.gg/teams/team-stats/3/split-ALL/tournament-EU%20LCS%20Spring%202014/
-- Cloud 9: https://gol.gg/teams/team-stats/25/split-ALL/tournament-NA%20LCS%20Spring%202014/
-- Edward Gaming, season 4 page, no league named: https://gol.gg/teams/team-stats/35/split-ALL/tournament-ALL/
-- SK Telecom T1 K, season 4 page, no league named: https://gol.gg/teams/team-stats/76/split-ALL/tournament-ALL/
INSERT INTO champions (id, name, portrait) VALUES
    ('d89bfbb7-eb25-4fd3-ab8b-e176cc30be42', 'Aatrox', 'portraits/champions/Aatrox.png'),
    ('68e280ca-8f05-49eb-8a98-066123a29821', 'Ahri', 'portraits/champions/Ahri.png'),
    ('10fea07f-03df-4826-bfa8-eec6c9c6b05a', 'Akali', 'portraits/champions/Akali.png'),
    ('68ea5540-fd6a-401a-9623-2154cf7d03ff', 'Alistar', 'portraits/champions/Alistar.png'),
    ('7f3299e7-6e72-463b-8185-161bf42dfa84', 'Amumu', 'portraits/champions/Amumu.png'),
    ('b3a7dbfa-2152-4ccd-9552-30596a3dc1e6', 'Anivia', 'portraits/champions/Anivia.png'),
    ('199ac5f8-802e-44ae-927a-b7c433d64e63', 'Annie', 'portraits/champions/Annie.png'),
    ('07dec20b-4af8-4758-aa3a-31998ec76694', 'Ashe', 'portraits/champions/Ashe.png'),
    ('73fde893-608b-4dd0-b342-caa2f68ab186', 'Azir', 'portraits/champions/Azir.png'),
    ('6f037ea0-8806-472b-ae88-bc3936242eaa', 'Blitzcrank', 'portraits/champions/Blitzcrank.png'),
    ('a26b8cd9-4451-4f11-b7dd-a3903c9ea82e', 'Brand', 'portraits/champions/Brand.png'),
    ('a240b025-2fa8-491d-a8cf-be340c741ff3', 'Braum', 'portraits/champions/Braum.png'),
    ('084f50ff-af35-4d03-b462-d13780d85e57', 'Caitlyn', 'portraits/champions/Caitlyn.png'),
    ('91df1d59-1003-42eb-ae3e-4d52d1089dfc', 'Cassiopeia', 'portraits/champions/Cassiopeia.png'),
    ('dcd7977b-d073-441d-b190-e45238242914', 'Cho''Gath', 'portraits/champions/Chogath.png'),
    ('9c054d4f-a3d3-4ae3-b129-9fa3ffa7ef5c', 'Corki', 'portraits/champions/Corki.png'),
    ('fe5bfc95-ff56-43c9-94a0-6f44d57af423', 'Darius', 'portraits/champions/Darius.png'),
    ('eaf78467-61fa-4d9a-9db0-cdc2059324d1', 'Diana', 'portraits/champions/Diana.png'),
    ('814e65df-1aff-498f-be15-b7ca3d62b3a7', 'Dr. Mundo', 'portraits/champions/DrMundo.png'),
    ('0ddb8144-5f0c-43b9-b654-4ce538f72222', 'Draven', 'portraits/champions/Draven.png'),
    ('b3b63b7c-a1b1-44de-8d71-30f305c3c52b', 'Elise', 'portraits/champions/Elise.png'),
    ('3f67e790-02fd-4e82-8113-d7e69674d331', 'Evelynn', 'portraits/champions/Evelynn.png'),
    ('15415cb9-4d77-4b3c-9c2c-c89e8edcd4ae', 'Ezreal', 'portraits/champions/Ezreal.png'),
    ('7b8b5d19-db32-4961-b768-3ae49f232e81', 'Fiddlesticks', 'portraits/champions/FiddleSticks.png'),
    ('e5f238cb-6a1a-4c84-ba2c-052bc2eb464a', 'Fiora', 'portraits/champions/Fiora.png'),
    ('4f58fd8f-1693-4635-8469-be20f39440a9', 'Fizz', 'portraits/champions/Fizz.png'),
    ('48697cac-1fe4-4843-a8e8-d53d8f46e99d', 'Galio', 'portraits/champions/Galio.png'),
    ('0456e0c4-eae4-422d-91ba-67fdd689ba4f', 'Gangplank', 'portraits/champions/Gangplank.png'),
    ('745dd278-4983-4ab8-af1c-c07e1953a6a1', 'Garen', 'portraits/champions/Garen.png'),
    ('8a604e8c-9966-4250-846d-9867505d7abb', 'Gnar', 'portraits/champions/Gnar.png'),
    ('64e03657-1f0e-49df-901c-2bdf761d3e1b', 'Gragas', 'portraits/champions/Gragas.png'),
    ('45fc15f9-7c91-42f5-b4ce-d3d00f310684', 'Graves', 'portraits/champions/Graves.png'),
    ('6e6c290d-0bfa-43fd-bfb4-c574eaa9699e', 'Hecarim', 'portraits/champions/Hecarim.png'),
    ('bcf990c7-eb01-40a6-ad47-df17d66d37b4', 'Heimerdinger', 'portraits/champions/Heimerdinger.png'),
    ('d9e7e609-550c-4343-826a-3e39537463aa', 'Irelia', 'portraits/champions/Irelia.png'),
    ('8a5f4594-d03c-4c4b-b98c-8a55d0a9dc76', 'Janna', 'portraits/champions/Janna.png'),
    ('52a636ea-fb57-4a66-8036-0342a546cbb4', 'Jarvan IV', 'portraits/champions/JarvanIV.png'),
    ('287355c2-7225-4d7b-8807-b336769c8639', 'Jax', 'portraits/champions/Jax.png'),
    ('77e5037c-0080-4270-b18a-39a5bec66ec4', 'Jayce', 'portraits/champions/Jayce.png'),
    ('a697be0d-58de-4ca9-97d2-feb55e734f16', 'Jinx', 'portraits/champions/Jinx.png'),
    ('3a6b4ddd-43b0-4198-8e62-71d456dd333e', 'Kalista', 'portraits/champions/Kalista.png'),
    ('4f89cbd5-f1ae-44c0-897a-3915b887d2bc', 'Karma', 'portraits/champions/Karma.png'),
    ('9508d9bf-3475-4854-8b28-5fa97601000f', 'Karthus', 'portraits/champions/Karthus.png'),
    ('ed6b0205-30c6-4819-9e71-d7cd6d08194d', 'Kassadin', 'portraits/champions/Kassadin.png'),
    ('c8a9a7d4-a91c-48df-81f9-02fcce78322e', 'Katarina', 'portraits/champions/Katarina.png'),
    ('7b4e443a-f193-48c3-94d8-ee7462a7efc8', 'Kayle', 'portraits/champions/Kayle.png'),
    ('ab487087-4da8-434f-8180-a40804694ce3', 'Kennen', 'portraits/champions/Kennen.png'),
    ('68ea3c95-dddb-49f9-ac5a-8dc0882cc4aa', 'Kha''Zix', 'portraits/champions/Khazix.png'),
    ('79375a5b-503b-44d7-bcf4-ee05b7b73c2c', 'Kog''Maw', 'portraits/champions/KogMaw.png'),
    ('4b48397f-5490-470c-8d28-53e014be2adf', 'LeBlanc', 'portraits/champions/Leblanc.png'),
    ('3259920c-e3c3-4056-8ab6-b38ef16b4a9f', 'Lee Sin', 'portraits/champions/LeeSin.png'),
    ('8c7defc0-0821-416e-844f-4c6ec9d3a7e9', 'Leona', 'portraits/champions/Leona.png'),
    ('a7dec2b4-9dcb-4717-9882-d2ad5ef94e95', 'Lissandra', 'portraits/champions/Lissandra.png'),
    ('5e508f80-3fec-4481-b90e-d1e15247d00b', 'Lucian', 'portraits/champions/Lucian.png'),
    ('3bdb304d-66fe-4bd5-96ab-253af3a4ec09', 'Lulu', 'portraits/champions/Lulu.png'),
    ('e225ee78-a390-4d7b-9a15-79520123181e', 'Lux', 'portraits/champions/Lux.png'),
    ('29dc65dc-cddd-4473-b42a-4c1e4ee85e4e', 'Malphite', 'portraits/champions/Malphite.png'),
    ('38ba7e82-6204-46a0-90d9-cd4ac8d240ab', 'Malzahar', 'portraits/champions/Malzahar.png'),
    ('5ec65536-30e4-450f-a93e-79d5b9b93a48', 'Maokai', 'portraits/champions/Maokai.png'),
    ('b38b5077-5357-43ac-ab59-367d3c30decb', 'Master Yi', 'portraits/champions/MasterYi.png'),
    ('79d0806e-be52-4756-9a39-75279ac31c7c', 'Miss Fortune', 'portraits/champions/MissFortune.png'),
    ('2b89a621-3927-44a0-8cfc-2099ffd6700a', 'Mordekaiser', 'portraits/champions/Mordekaiser.png'),
    ('4faa04f7-1535-4475-b70f-46618f567963', 'Morgana', 'portraits/champions/Morgana.png'),
    ('a60323cd-4840-488e-83e6-42ff75ae082e', 'Nami', 'portraits/champions/Nami.png'),
    ('76f893fd-858a-4eea-a58a-650afe8bf0c8', 'Nasus', 'portraits/champions/Nasus.png'),
    ('d64246cc-e83f-4c71-8b48-2040eb7c9228', 'Nautilus', 'portraits/champions/Nautilus.png'),
    ('bb0b2636-bc1b-4e72-b4a0-40c8176eec31', 'Nidalee', 'portraits/champions/Nidalee.png'),
    ('de4709be-2530-42a2-afe0-cc05fb2427c5', 'Nocturne', 'portraits/champions/Nocturne.png'),
    ('c53fddb5-ba04-4d79-8ab9-dcea56fa3b94', 'Nunu', 'portraits/champions/Nunu.png'),
    ('d5f69b2b-eb68-4fa9-bc7f-0bb60e999544', 'Olaf', 'portraits/champions/Olaf.png'),
    ('c792ee42-7365-40f7-9b84-38abf11c8066', 'Orianna', 'portraits/champions/Orianna.png'),
    ('e91eaad1-0b7d-4381-a27c-10892ee734e5', 'Pantheon', 'portraits/champions/Pantheon.png'),
    ('6e339c36-5c75-480d-8981-f99ce3ce057b', 'Poppy', 'portraits/champions/Poppy.png'),
    ('895b2f8a-e1c6-47d5-8480-3f7ad4c96a00', 'Quinn', 'portraits/champions/Quinn.png'),
    ('cf370fcb-721a-4dd5-910f-bb70f235a681', 'Rammus', 'portraits/champions/Rammus.png'),
    ('02a03c5c-f268-43db-9d8b-c472827df01e', 'Rek''Sai', 'portraits/champions/RekSai.png'),
    ('8f270bc3-f396-4294-933c-8f8d04cfa0c3', 'Renekton', 'portraits/champions/Renekton.png'),
    ('3f91b4b5-2c23-4455-bf9a-eeaf11fa4f87', 'Rengar', 'portraits/champions/Rengar.png'),
    ('ae6093a5-d1ce-4f55-9d8e-30e84cdda42b', 'Riven', 'portraits/champions/Riven.png'),
    ('3681f673-9841-42cf-8de7-ec27ed36c5d1', 'Rumble', 'portraits/champions/Rumble.png'),
    ('a413940b-6ac1-4ecb-affe-6e9dcb05f1fc', 'Ryze', 'portraits/champions/Ryze.png'),
    ('f746f4e8-504d-47a5-8408-7db08c3d1d32', 'Sejuani', 'portraits/champions/Sejuani.png'),
    ('2668a215-26d1-4999-bcd9-d42557889728', 'Shaco', 'portraits/champions/Shaco.png'),
    ('6eecaf3d-11e5-456a-940f-cca84249cc71', 'Shen', 'portraits/champions/Shen.png'),
    ('8560586d-7c56-4dea-be43-faa4f421a144', 'Shyvana', 'portraits/champions/Shyvana.png'),
    ('42157d15-d43b-4ffc-8a89-727524501513', 'Singed', 'portraits/champions/Singed.png'),
    ('a782ed58-a379-4634-9c0c-67a0d63461e2', 'Sion', 'portraits/champions/Sion.png'),
    ('9c7bb335-071a-401a-824b-10d73828beaf', 'Sivir', 'portraits/champions/Sivir.png'),
    ('b9a777a1-7098-4c04-842b-430c7c8f6575', 'Skarner', 'portraits/champions/Skarner.png'),
    ('501b7db3-5484-4111-a837-c58dde0369c9', 'Sona', 'portraits/champions/Sona.png'),
    ('b38615f7-fbd4-4051-a387-96f78c5467cc', 'Soraka', 'portraits/champions/Soraka.png'),
    ('d693b11d-ad7a-4333-9c39-fa460489122e', 'Swain', 'portraits/champions/Swain.png'),
    ('4a4087b7-5cf5-4cbd-a618-611b150c0bee', 'Syndra', 'portraits/champions/Syndra.png'),
    ('454ad2a8-6092-4d1d-91ec-95307df7db2f', 'Talon', 'portraits/champions/Talon.png'),
    ('5e074bca-20ff-420f-a12a-7daedc077ea2', 'Taric', 'portraits/champions/Taric.png'),
    ('f9da5e07-3529-4aad-ae2c-18ce46f8ab20', 'Teemo', 'portraits/champions/Teemo.png'),
    ('d8a58eb9-4644-420b-b4d2-e533eea1354d', 'Thresh', 'portraits/champions/Thresh.png'),
    ('125f81dc-9df4-4bc9-9099-4314b9268e24', 'Tristana', 'portraits/champions/Tristana.png'),
    ('85e1e7e8-0de2-4067-bf28-bc1dc5fb1f9c', 'Trundle', 'portraits/champions/Trundle.png'),
    ('9c271974-cb2e-49c9-8ee4-32ebdc32b082', 'Tryndamere', 'portraits/champions/Tryndamere.png'),
    ('62b17cae-ffbf-420d-8724-d6bb35402451', 'Twisted Fate', 'portraits/champions/TwistedFate.png'),
    ('8fb6b19c-9409-4d59-98b8-a0ab45335636', 'Twitch', 'portraits/champions/Twitch.png'),
    ('073fb99f-bbec-44c4-959e-025908009d8c', 'Udyr', 'portraits/champions/Udyr.png'),
    ('db0b48f3-fd36-463d-91a6-d9b84cb30313', 'Urgot', 'portraits/champions/Urgot.png'),
    ('8affb299-5cdd-47f1-a503-9f85ed3ee07b', 'Varus', 'portraits/champions/Varus.png'),
    ('3000e454-a040-4a28-93b0-cf46b87a23ea', 'Vayne', 'portraits/champions/Vayne.png'),
    ('702da639-e67d-48c7-b9b3-dd47eb26679a', 'Veigar', 'portraits/champions/Veigar.png'),
    ('2c2bb2ee-c368-4c6f-bd6f-60b3fb0ab5c6', 'Vel''Koz', 'portraits/champions/Velkoz.png'),
    ('50308dda-f8f2-44ce-93b4-9992a7f35184', 'Vi', 'portraits/champions/Vi.png'),
    ('33df5a07-88b2-41c1-998e-c6ed6c02acd6', 'Viktor', 'portraits/champions/Viktor.png'),
    ('14d93d48-1fd0-4af8-89f6-63a56842f1f5', 'Vladimir', 'portraits/champions/Vladimir.png'),
    ('15276914-d288-4401-a1a2-dd692e4df293', 'Volibear', 'portraits/champions/Volibear.png'),
    ('81fe2ede-801f-4834-9d49-cedcfcc9cd16', 'Warwick', 'portraits/champions/Warwick.png'),
    ('219e892e-6798-487a-b147-acf3a7453708', 'Wukong', 'portraits/champions/MonkeyKing.png'),
    ('a70eebd0-92b8-420d-bc50-344dc7484e2f', 'Xerath', 'portraits/champions/Xerath.png'),
    ('27583a70-86bd-4f27-8631-3c3758d27c7a', 'Xin Zhao', 'portraits/champions/XinZhao.png'),
    ('536453fe-f33b-4ca5-b9d2-9755298f301c', 'Yasuo', 'portraits/champions/Yasuo.png'),
    ('d3ea71a6-e3d2-47e0-9db6-f0774f170efb', 'Yorick', 'portraits/champions/Yorick.png'),
    ('19dc7ba6-31dc-4f21-9f8e-769345d75eec', 'Zac', 'portraits/champions/Zac.png'),
    ('6d6a36f4-15f2-401b-92cf-c904d9d47b66', 'Zed', 'portraits/champions/Zed.png'),
    ('64b685cf-b5ea-4313-8590-34f829c2e963', 'Ziggs', 'portraits/champions/Ziggs.png'),
    ('728c7122-7b0f-4291-ae85-53481c19e327', 'Zilean', 'portraits/champions/Zilean.png'),
    ('28e8f91c-4063-4dae-a307-ba1696e4f048', 'Zyra', 'portraits/champions/Zyra.png');

INSERT INTO leagues (id, name, region, tier, presence, portrait) VALUES
    ('166cd91e-7856-4cf3-abcc-64aee51f8623', 'EU LCS', 'EU', 'primary', 'playable', 'portraits/wiki/LCS_Europe_Logo.png'),
    ('9c6da7b4-c421-47ba-8b2c-34910daecfb9', 'NA LCS', 'NA', 'primary', 'playable', 'portraits/wiki/LCSlogo.png');

INSERT INTO league_seasons (league_id, year, team_count, msi_slots, worlds_slots, salary_cap_kind, salary_cap_amount) VALUES
    ('166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, 8, 0, 3, NULL, NULL),
    ('9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, 8, 0, 3, NULL, NULL);

INSERT INTO organisations (
    id, name, region, history, staff_seats, scrim_room, gaming_house, chef, jersey_name,
    budget, wage_bill, fan_count, fan_mood, portrait
) VALUES

    ('6e0ea7d8-ef5d-4d81-b09d-89980927de2c', 'Fnatic', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'portraits/wiki/Fnatic_original_logo.png'),
    ('ad454f44-1f27-4ec0-95b9-c0aad2d216f0', 'Cloud 9', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'portraits/wiki/Cloud9logo_profile.png'),
    ('604397e2-8ec2-417a-8a28-f4a4f69850f8', 'Edward Gaming', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'portraits/wiki/Edward_Gaming_Old_Logo.png'),
    ('7cb5104e-5d3e-48a4-98ef-e7ee5153791d', 'SK Telecom T1 K', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'portraits/wiki/SK_Telecom_T1_Klogo_square.png');
INSERT INTO teams (id, name, organisation_id, league_id, season_year, portrait) VALUES
    ('76548df6-d6fe-4ec3-9d37-49f2541b74e3', 'Fnatic', '6e0ea7d8-ef5d-4d81-b09d-89980927de2c', '166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, 'portraits/wiki/Fnatic_original_logo.png'),
    ('fe3cb9f6-caaf-490b-9890-f6bdcd176de1', 'Cloud 9', 'ad454f44-1f27-4ec0-95b9-c0aad2d216f0', '9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, 'portraits/wiki/Cloud9logo_profile.png'),
    ('eb75c86e-b74a-4fc5-987b-55320acecbbf', 'Edward Gaming', '604397e2-8ec2-417a-8a28-f4a4f69850f8', NULL, NULL, 'portraits/wiki/Edward_Gaming_Old_Logo.png'),
    ('ef47ab32-23cd-43ca-abc6-770b9b04369c', 'SK Telecom T1 K', '7cb5104e-5d3e-48a4-98ef-e7ee5153791d', NULL, NULL, 'portraits/wiki/SK_Telecom_T1_Klogo_square.png');
INSERT INTO organisation_teams (organisation_id, position, team_id) VALUES
    ('6e0ea7d8-ef5d-4d81-b09d-89980927de2c', 0, '76548df6-d6fe-4ec3-9d37-49f2541b74e3'),
    ('ad454f44-1f27-4ec0-95b9-c0aad2d216f0', 0, 'fe3cb9f6-caaf-490b-9890-f6bdcd176de1'),
    ('604397e2-8ec2-417a-8a28-f4a4f69850f8', 0, 'eb75c86e-b74a-4fc5-987b-55320acecbbf'),
    ('7cb5104e-5d3e-48a4-98ef-e7ee5153791d', 0, 'ef47ab32-23cd-43ca-abc6-770b9b04369c');
INSERT INTO players (id, name, portrait, role, nationality, birth_date, mechanics, teamfight, map_awareness, objectives, tempo, mental, itemisation, phase_early, phase_mid, phase_late, shotcalling, role_skill_kind, role_skill_score, form, fatigue) VALUES
    ('ffda5f7f-4160-4ee4-b140-5e733f2c77c5', 'sOAZ', 'portraits/wiki/FNC_sOAZ_2013_Spring.png', 'top', 'FR', '1994-01-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e8d68755-139e-44f1-a864-30420f93cf44', 'Cyanide', 'portraits/wiki/FNC_Cyanide_2013_Spring.png', 'jungle', 'FI', '1994-11-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e1ab93a4-2aca-4f6e-8bb4-b0ca79326f22', 'xPeke', 'portraits/wiki/FNC_xPeke_2013_Spring.png', 'mid', 'ES', '1992-04-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bc27b59a-6dbd-4290-aa1d-2d34af6c920d', 'Rekkles', 'portraits/wiki/RekklesFNC2014.png', 'adc', 'SE', '1996-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('90b5e1c5-9e9b-4d45-8bde-a534673c7d03', 'YellOwStaR', 'portraits/wiki/FNC_YellOwStaR_2013_Summer.png', 'support', 'FR', '1992-02-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('31d0bc9b-a27e-4ad6-b250-16c8b297d55b', 'Balls', 'portraits/wiki/S3_c9balls.jpg', 'top', 'US', '1994-06-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a3494c64-b626-427e-89ed-2b135249059a', 'Meteos', 'portraits/wiki/C9_Meteos.jpg', 'jungle', 'US', '1993-06-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d985251e-d636-4297-bf79-b8bac1330514', 'Hai', 'portraits/wiki/S3_c9hai.jpg', 'mid', 'US', '1992-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1e6ec8e7-b3fe-4a1f-a3d1-a703d25c6670', 'Sneaky', 'portraits/wiki/S3_c9sneaky.jpg', 'adc', 'US', '1994-03-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0dc63c85-bc1c-4e2b-8627-f1dad0fa5384', 'LemonNation', 'portraits/wiki/S3_c9lemon.jpg', 'support', 'US', '1989-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9a509253-093d-408b-bd3a-48cce29793b2', 'Koro1', 'portraits/wiki/EDG_Koro1Summer2014.jpg', 'top', 'CN', '1994-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d2fa65bd-d26e-4e41-84da-36626fbd20fe', 'ClearLove', 'portraits/wiki/EDG_ClearLove_2015.jpg', 'jungle', 'CN', '1993-07-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bd1af20f-6c8b-4298-9751-01a13f5e2c98', 'U', 'portraits/wiki/EDG_U_Summer2014.jpg', 'mid', 'CN', '1993-09-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ac886e86-a2c1-42df-ad18-77a130145496', 'NaMei', 'portraits/wiki/EDG_Namei_Summer2014.jpg', 'adc', 'CN', '1993-05-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f3c10e19-6771-47eb-93d9-9af46b4ca6a9', 'FZZF', 'portraits/wiki/Fzzf.jpg', 'support', 'CN', '1991-07-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5ed292ce-c2b8-49cb-8b69-02c7cd2bdd99', 'Impact', 'portraits/wiki/Xenicsimpact.jpeg', 'top', 'KR', '1995-03-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e2094712-71e4-4523-85c9-021166cc57eb', 'bengi', 'portraits/wiki/SKT_Bengi_2013_WCS.png', 'jungle', 'KR', '1993-11-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ada1f053-6b15-4376-8923-0bfcead961c1', 'Faker', 'portraits/wiki/Faker2014.jpg', 'mid', 'KR', '1996-05-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e1480cfa-c69b-41af-baf0-e33a598ba60e', 'Piglet', 'portraits/wiki/SKT_Piglet_2013_WCS.png', 'adc', 'KR', '1994-02-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d7b8b673-25e6-4db8-af3a-787b3d1a0492', 'PoohManDu', 'portraits/wiki/SKTPoohManDu.png', 'support', 'KR', '1991-01-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO player_teams (player_id, position, team_id) VALUES
    ('ffda5f7f-4160-4ee4-b140-5e733f2c77c5', 0, '76548df6-d6fe-4ec3-9d37-49f2541b74e3'),
    ('e8d68755-139e-44f1-a864-30420f93cf44', 0, '76548df6-d6fe-4ec3-9d37-49f2541b74e3'),
    ('e1ab93a4-2aca-4f6e-8bb4-b0ca79326f22', 0, '76548df6-d6fe-4ec3-9d37-49f2541b74e3'),
    ('bc27b59a-6dbd-4290-aa1d-2d34af6c920d', 0, '76548df6-d6fe-4ec3-9d37-49f2541b74e3'),
    ('90b5e1c5-9e9b-4d45-8bde-a534673c7d03', 0, '76548df6-d6fe-4ec3-9d37-49f2541b74e3'),
    ('31d0bc9b-a27e-4ad6-b250-16c8b297d55b', 0, 'fe3cb9f6-caaf-490b-9890-f6bdcd176de1'),
    ('a3494c64-b626-427e-89ed-2b135249059a', 0, 'fe3cb9f6-caaf-490b-9890-f6bdcd176de1'),
    ('d985251e-d636-4297-bf79-b8bac1330514', 0, 'fe3cb9f6-caaf-490b-9890-f6bdcd176de1'),
    ('1e6ec8e7-b3fe-4a1f-a3d1-a703d25c6670', 0, 'fe3cb9f6-caaf-490b-9890-f6bdcd176de1'),
    ('0dc63c85-bc1c-4e2b-8627-f1dad0fa5384', 0, 'fe3cb9f6-caaf-490b-9890-f6bdcd176de1'),
    ('9a509253-093d-408b-bd3a-48cce29793b2', 0, 'eb75c86e-b74a-4fc5-987b-55320acecbbf'),
    ('d2fa65bd-d26e-4e41-84da-36626fbd20fe', 0, 'eb75c86e-b74a-4fc5-987b-55320acecbbf'),
    ('bd1af20f-6c8b-4298-9751-01a13f5e2c98', 0, 'eb75c86e-b74a-4fc5-987b-55320acecbbf'),
    ('ac886e86-a2c1-42df-ad18-77a130145496', 0, 'eb75c86e-b74a-4fc5-987b-55320acecbbf'),
    ('f3c10e19-6771-47eb-93d9-9af46b4ca6a9', 0, 'eb75c86e-b74a-4fc5-987b-55320acecbbf'),
    ('5ed292ce-c2b8-49cb-8b69-02c7cd2bdd99', 0, 'ef47ab32-23cd-43ca-abc6-770b9b04369c'),
    ('e2094712-71e4-4523-85c9-021166cc57eb', 0, 'ef47ab32-23cd-43ca-abc6-770b9b04369c'),
    ('ada1f053-6b15-4376-8923-0bfcead961c1', 0, 'ef47ab32-23cd-43ca-abc6-770b9b04369c'),
    ('e1480cfa-c69b-41af-baf0-e33a598ba60e', 0, 'ef47ab32-23cd-43ca-abc6-770b9b04369c'),
    ('d7b8b673-25e6-4db8-af3a-787b3d1a0492', 0, 'ef47ab32-23cd-43ca-abc6-770b9b04369c');

-- Spring 2014 participants from the Leaguepedia roster blocks.
-- EU LCS: https://lol.fandom.com/wiki/EU_LCS/2014_Season/Spring_Season
-- NA LCS: https://lol.fandom.com/wiki/NA_LCS/2014_Season/Spring_Season
-- LPL: https://lol.fandom.com/wiki/2014_LPL_Spring/Regular_Season
-- Champions: https://lol.fandom.com/wiki/HOT6iX_Champions_Spring_2014
-- Coaches listed on those rosters are not players. Nationality is Country of Birth when the page has it, otherwise the roster flag.
-- Birth date is the page Birthday. A missing birthday stays empty. Age is calculated at the career date.
INSERT INTO leagues (id, name, region, tier, presence, portrait) VALUES
    ('23c166ad-27a9-4513-9f8a-82372a0e5d8e', 'LPL', 'CN', 'primary', 'playable', NULL),
    ('c21fe305-6283-46f8-b9d5-4d479c5a2f00', 'Champions', 'KR', 'primary', 'playable', NULL);
INSERT INTO league_seasons (league_id, year, team_count, msi_slots, worlds_slots, salary_cap_kind, salary_cap_amount) VALUES
    ('23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, 8, 0, 3, NULL, NULL),
    ('c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, 16, 0, 3, NULL, NULL);
UPDATE teams SET league_id = '23c166ad-27a9-4513-9f8a-82372a0e5d8e', season_year = 2014 WHERE id = 'eb75c86e-b74a-4fc5-987b-55320acecbbf';
UPDATE teams SET league_id = 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', season_year = 2014 WHERE id = 'ef47ab32-23cd-43ca-abc6-770b9b04369c';
INSERT INTO organisations (id, name, region, history, staff_seats, scrim_room, gaming_house, chef, jersey_name, budget, wage_bill, fan_count, fan_mood, portrait) VALUES
    ('d3db1f03-5fd1-4c04-939d-db320a38335b', 'Alliance', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('40ddadc5-1d66-4ac8-a2a0-78676c41cf9c', 'Copenhagen Wolves', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1c5bedfa-da0a-436b-a92a-291b4aa938c7', 'Gambit Gaming', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('03e92d75-e4ef-4989-85cb-15fa933dbda0', 'Millenium', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c7c9da3b-df86-4a21-800f-aa4f443cf7fb', 'SK Gaming', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4687877e-98d8-4e93-aee9-bcee1faa9254', 'SUPA HOT CREW', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('44d57b69-e761-463b-b884-9601cd7c7448', 'Team ROCCAT', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('561ae13f-1c36-4de6-a110-5b6a7052e868', 'CLG', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cdd26ac4-dd70-47a0-b9ce-937954f83b1f', 'Evil Geniuses', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('58aea862-9ba7-448d-b833-10a16430e63d', 'Team Coast', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1eea6004-f34d-4a7d-9bd4-75ba37de969e', 'Team Curse', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5798d821-f117-446e-a17f-8e55ee9d7046', 'Dignitas', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8e6d7b54-278c-4ff9-9b12-637600f047e5', 'TSM', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c18a1efc-573b-4a56-80cb-9ee7db7126b3', 'XDG Gaming', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0222172a-612d-49c0-8288-15faf3a4a261', 'Energy Pacemaker.HK', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8111445b-d8fd-4551-afd1-7e7c5f0bb992', 'Invictus Gaming', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5d09308a-f95a-470e-ac40-9072bc9659b4', 'LGD Gaming', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c33d9f98-0ae8-4ba3-bb1d-eb96c3f3253d', 'Oh My God', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6faa2f63-a5ba-496e-9730-d06b24dde536', 'Positive Energy', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ec28f8a8-ce9f-4783-ae7e-f56a8175f91a', 'Royal Club', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('72601830-eb3d-4197-a755-14f5edbcca10', 'Team WE', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5845ee40-86ee-49b1-a544-d9d8ef73f3f3', 'CJ Entus Blaze', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e520f0be-8464-4289-a1de-a7fcf312ec0a', 'CJ Entus Frost', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b7d44ef6-8fa4-46b3-a73a-b5bc019533b5', 'KT Rolster Bullets', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3aeec981-ef9b-4443-a759-09b2bf832e57', 'NaJin White Shield', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2e4e2201-d7d0-47df-b5b5-1925f24ceccf', 'Samsung Blue', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ce6b8700-fbb4-432f-8b11-18a5c26223a1', 'Samsung Ozone', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ea2ca861-aa2e-4d33-a4ce-7ea59a82d526', 'SK Telecom T1 S', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7ff371b5-578a-494a-b199-eae8c0f4e48f', 'Midas FIO', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3bc6c56c-6374-4247-8e2a-db970161e35a', 'NaJin Black Sword', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5317d52a-8d36-4c64-8494-dc944c069500', 'Incredible Miracle 1', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f0d4dd7b-9652-4231-b042-5fd25325231d', 'Prime Optimus', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9848029c-b3bf-44a9-b90a-96431e8f6e6a', 'KT Rolster Arrows', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('887f1559-8087-4715-9ee2-3db45385d9c5', 'Jin Air Falcons', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a09b43f0-2330-4988-a292-8c3efe8f4f56', 'Incredible Miracle 2', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('127cbf49-55c2-4adb-9250-820d408bf2fc', 'Xenics Storm', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO teams (id, name, organisation_id, league_id, season_year, portrait) VALUES
    ('078a00f3-74cb-471b-b31e-5085c13192ad', 'Alliance', 'd3db1f03-5fd1-4c04-939d-db320a38335b', '166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, NULL),
    ('fbbf34bd-018d-4c79-94a4-589034a062b1', 'Copenhagen Wolves', '40ddadc5-1d66-4ac8-a2a0-78676c41cf9c', '166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, NULL),
    ('0284c17a-823f-4f73-a1d9-1f73e45bf290', 'Gambit Gaming', '1c5bedfa-da0a-436b-a92a-291b4aa938c7', '166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, NULL),
    ('3e1f8381-fcb7-4356-87dc-71dc9ac598f7', 'Millenium', '03e92d75-e4ef-4989-85cb-15fa933dbda0', '166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, NULL),
    ('3e3c2f1a-c424-411f-af1e-f74832810a40', 'SK Gaming', 'c7c9da3b-df86-4a21-800f-aa4f443cf7fb', '166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, NULL),
    ('333e225a-e8b6-473b-9afc-d574d4d1f332', 'SUPA HOT CREW', '4687877e-98d8-4e93-aee9-bcee1faa9254', '166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, NULL),
    ('805f241d-ff2e-435a-a46b-da6af1a1e9a2', 'Team ROCCAT', '44d57b69-e761-463b-b884-9601cd7c7448', '166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, NULL),
    ('70149843-6597-49e3-8540-a4ff6fd66999', 'CLG', '561ae13f-1c36-4de6-a110-5b6a7052e868', '9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, NULL),
    ('455452b0-a54d-4bed-b05d-ee4e9fb6cb7b', 'Evil Geniuses', 'cdd26ac4-dd70-47a0-b9ce-937954f83b1f', '9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, NULL),
    ('05545e0c-6aed-4fb3-a19a-1481701f80e6', 'Team Coast', '58aea862-9ba7-448d-b833-10a16430e63d', '9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, NULL),
    ('68582452-5bcc-4233-b613-86a2da75ce22', 'Team Curse', '1eea6004-f34d-4a7d-9bd4-75ba37de969e', '9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, NULL),
    ('c8f814d4-85d4-43ed-9f16-c45a9a5458bc', 'Dignitas', '5798d821-f117-446e-a17f-8e55ee9d7046', '9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, NULL),
    ('67804fca-bf60-4de6-8e28-1d1911bccbcd', 'TSM', '8e6d7b54-278c-4ff9-9b12-637600f047e5', '9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, NULL),
    ('9b0ba8c9-a849-4e90-8332-5be515911957', 'XDG Gaming', 'c18a1efc-573b-4a56-80cb-9ee7db7126b3', '9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, NULL),
    ('5bd7a866-505c-4dda-924d-cb97126df450', 'Energy Pacemaker.HK', '0222172a-612d-49c0-8288-15faf3a4a261', '23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, NULL),
    ('961e9400-1df5-4ca3-b0f4-f651ee17e171', 'Invictus Gaming', '8111445b-d8fd-4551-afd1-7e7c5f0bb992', '23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, NULL),
    ('9d786b2c-ca11-4b18-ae2e-cd87e3d7869c', 'LGD Gaming', '5d09308a-f95a-470e-ac40-9072bc9659b4', '23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, NULL),
    ('4b0d4a88-c92f-4c77-88b4-3dd3cf660a62', 'Oh My God', 'c33d9f98-0ae8-4ba3-bb1d-eb96c3f3253d', '23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, NULL),
    ('05f881e9-45b7-4c0d-8265-e7098457b334', 'Positive Energy', '6faa2f63-a5ba-496e-9730-d06b24dde536', '23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, NULL),
    ('9e240f1d-e020-4752-8567-1825c1d47f6c', 'Royal Club', 'ec28f8a8-ce9f-4783-ae7e-f56a8175f91a', '23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, NULL),
    ('3c838f63-65bc-47c7-8157-9d5f4b240dd7', 'Team WE', '72601830-eb3d-4197-a755-14f5edbcca10', '23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, NULL),
    ('dcb050b1-992d-4535-8218-3752340c77c0', 'CJ Entus Blaze', '5845ee40-86ee-49b1-a544-d9d8ef73f3f3', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('ab864fae-262f-40b7-8a13-2202df7437eb', 'CJ Entus Frost', 'e520f0be-8464-4289-a1de-a7fcf312ec0a', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('d01c8443-2a77-4589-821c-c6c055ecfd24', 'KT Rolster Bullets', 'b7d44ef6-8fa4-46b3-a73a-b5bc019533b5', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('52d4b112-4a87-4b0e-92e2-eef44bfd26cd', 'NaJin White Shield', '3aeec981-ef9b-4443-a759-09b2bf832e57', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('e11b8a4e-9ed5-43a2-a953-89c06856e802', 'Samsung Blue', '2e4e2201-d7d0-47df-b5b5-1925f24ceccf', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('acacb87f-4aec-4565-9e4d-a5da31336753', 'Samsung Ozone', 'ce6b8700-fbb4-432f-8b11-18a5c26223a1', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('9039941a-1b1d-4d6b-95a8-10d9d0f67644', 'SK Telecom T1 S', 'ea2ca861-aa2e-4d33-a4ce-7ea59a82d526', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('ee4e66dd-d330-40b1-825a-a3eeb787d6fc', 'Midas FIO', '7ff371b5-578a-494a-b199-eae8c0f4e48f', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('bbf8c69f-289d-4508-a57b-50124c029cab', 'NaJin Black Sword', '3bc6c56c-6374-4247-8e2a-db970161e35a', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('c82ba779-7a5c-4794-9d85-dd2a3e1f99fd', 'Incredible Miracle 1', '5317d52a-8d36-4c64-8494-dc944c069500', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('a920960c-d5e6-4f9b-a553-4df97c58dfe6', 'Prime Optimus', 'f0d4dd7b-9652-4231-b042-5fd25325231d', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('b47ea394-bfc7-463f-ba50-2735b5c1b8f2', 'KT Rolster Arrows', '9848029c-b3bf-44a9-b90a-96431e8f6e6a', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('9b7261b5-e183-4666-aa78-0c313a71d0f6', 'Jin Air Falcons', '887f1559-8087-4715-9ee2-3db45385d9c5', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('17c7d024-6d05-41f2-b6bc-9e143ae18427', 'Incredible Miracle 2', 'a09b43f0-2330-4988-a292-8c3efe8f4f56', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL),
    ('dfd43fc8-ecda-4f17-a9e0-341a94686e97', 'Xenics Storm', '127cbf49-55c2-4adb-9250-820d408bf2fc', 'c21fe305-6283-46f8-b9d5-4d479c5a2f00', 2014, NULL);
INSERT INTO organisation_teams (organisation_id, position, team_id) VALUES
    ('d3db1f03-5fd1-4c04-939d-db320a38335b', 0, '078a00f3-74cb-471b-b31e-5085c13192ad'),
    ('40ddadc5-1d66-4ac8-a2a0-78676c41cf9c', 0, 'fbbf34bd-018d-4c79-94a4-589034a062b1'),
    ('1c5bedfa-da0a-436b-a92a-291b4aa938c7', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('03e92d75-e4ef-4989-85cb-15fa933dbda0', 0, '3e1f8381-fcb7-4356-87dc-71dc9ac598f7'),
    ('c7c9da3b-df86-4a21-800f-aa4f443cf7fb', 0, '3e3c2f1a-c424-411f-af1e-f74832810a40'),
    ('4687877e-98d8-4e93-aee9-bcee1faa9254', 0, '333e225a-e8b6-473b-9afc-d574d4d1f332'),
    ('44d57b69-e761-463b-b884-9601cd7c7448', 0, '805f241d-ff2e-435a-a46b-da6af1a1e9a2'),
    ('561ae13f-1c36-4de6-a110-5b6a7052e868', 0, '70149843-6597-49e3-8540-a4ff6fd66999'),
    ('cdd26ac4-dd70-47a0-b9ce-937954f83b1f', 0, '455452b0-a54d-4bed-b05d-ee4e9fb6cb7b'),
    ('58aea862-9ba7-448d-b833-10a16430e63d', 0, '05545e0c-6aed-4fb3-a19a-1481701f80e6'),
    ('1eea6004-f34d-4a7d-9bd4-75ba37de969e', 0, '68582452-5bcc-4233-b613-86a2da75ce22'),
    ('5798d821-f117-446e-a17f-8e55ee9d7046', 0, 'c8f814d4-85d4-43ed-9f16-c45a9a5458bc'),
    ('8e6d7b54-278c-4ff9-9b12-637600f047e5', 0, '67804fca-bf60-4de6-8e28-1d1911bccbcd'),
    ('c18a1efc-573b-4a56-80cb-9ee7db7126b3', 0, '9b0ba8c9-a849-4e90-8332-5be515911957'),
    ('0222172a-612d-49c0-8288-15faf3a4a261', 0, '5bd7a866-505c-4dda-924d-cb97126df450'),
    ('8111445b-d8fd-4551-afd1-7e7c5f0bb992', 0, '961e9400-1df5-4ca3-b0f4-f651ee17e171'),
    ('5d09308a-f95a-470e-ac40-9072bc9659b4', 0, '9d786b2c-ca11-4b18-ae2e-cd87e3d7869c'),
    ('c33d9f98-0ae8-4ba3-bb1d-eb96c3f3253d', 0, '4b0d4a88-c92f-4c77-88b4-3dd3cf660a62'),
    ('6faa2f63-a5ba-496e-9730-d06b24dde536', 0, '05f881e9-45b7-4c0d-8265-e7098457b334'),
    ('ec28f8a8-ce9f-4783-ae7e-f56a8175f91a', 0, '9e240f1d-e020-4752-8567-1825c1d47f6c'),
    ('72601830-eb3d-4197-a755-14f5edbcca10', 0, '3c838f63-65bc-47c7-8157-9d5f4b240dd7'),
    ('5845ee40-86ee-49b1-a544-d9d8ef73f3f3', 0, 'dcb050b1-992d-4535-8218-3752340c77c0'),
    ('e520f0be-8464-4289-a1de-a7fcf312ec0a', 0, 'ab864fae-262f-40b7-8a13-2202df7437eb'),
    ('b7d44ef6-8fa4-46b3-a73a-b5bc019533b5', 0, 'd01c8443-2a77-4589-821c-c6c055ecfd24'),
    ('3aeec981-ef9b-4443-a759-09b2bf832e57', 0, '52d4b112-4a87-4b0e-92e2-eef44bfd26cd'),
    ('2e4e2201-d7d0-47df-b5b5-1925f24ceccf', 0, 'e11b8a4e-9ed5-43a2-a953-89c06856e802'),
    ('ce6b8700-fbb4-432f-8b11-18a5c26223a1', 0, 'acacb87f-4aec-4565-9e4d-a5da31336753'),
    ('ea2ca861-aa2e-4d33-a4ce-7ea59a82d526', 0, '9039941a-1b1d-4d6b-95a8-10d9d0f67644'),
    ('7ff371b5-578a-494a-b199-eae8c0f4e48f', 0, 'ee4e66dd-d330-40b1-825a-a3eeb787d6fc'),
    ('3bc6c56c-6374-4247-8e2a-db970161e35a', 0, 'bbf8c69f-289d-4508-a57b-50124c029cab'),
    ('5317d52a-8d36-4c64-8494-dc944c069500', 0, 'c82ba779-7a5c-4794-9d85-dd2a3e1f99fd'),
    ('f0d4dd7b-9652-4231-b042-5fd25325231d', 0, 'a920960c-d5e6-4f9b-a553-4df97c58dfe6'),
    ('9848029c-b3bf-44a9-b90a-96431e8f6e6a', 0, 'b47ea394-bfc7-463f-ba50-2735b5c1b8f2'),
    ('887f1559-8087-4715-9ee2-3db45385d9c5', 0, '9b7261b5-e183-4666-aa78-0c313a71d0f6'),
    ('a09b43f0-2330-4988-a292-8c3efe8f4f56', 0, '17c7d024-6d05-41f2-b6bc-9e143ae18427'),
    ('127cbf49-55c2-4adb-9250-820d408bf2fc', 0, 'dfd43fc8-ecda-4f17-a9e0-341a94686e97');
INSERT INTO players (id, name, portrait, role, nationality, birth_date, mechanics, teamfight, map_awareness, objectives, tempo, mental, itemisation, phase_early, phase_mid, phase_late, shotcalling, role_skill_kind, role_skill_score, form, fatigue) VALUES
    ('cc67cd07-8880-4db9-9a1e-d5c9753a0796', 'Wickd', NULL, 'top', 'DK', '1994-04-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('73aedb8c-1dac-45a0-a8dd-38871785ee91', 'Shook', NULL, 'jungle', 'NL', '1994-11-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7da2e821-8058-4780-8ad3-e61092d9f7b1', 'Froggen', NULL, 'mid', 'DK', '1994-02-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('141acdb9-de5f-48f2-a25c-8569bfbd6709', 'Tabzz', NULL, 'adc', 'NL', '1994-03-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('811abd74-4094-4666-b51f-8b45dcb48b04', 'Nyph', NULL, 'support', 'DE', '1990-03-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a2dc5a20-049f-41d3-b3ed-7c681b0efa23', 'YoungBuck', NULL, 'top', 'NL', '1991-07-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e54e057e-f711-4ec8-8262-e393d1d00ea6', 'Amazing', NULL, 'jungle', 'DE', '1994-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('553bec35-374c-43c0-af02-b878f5bdfe22', 'cowTard', NULL, 'mid', 'SE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4cc36075-ed94-440f-b699-7ab341c66482', 'FORG1VEN', NULL, 'adc', 'GR', '1992-07-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('341565bb-b9c7-4491-9b52-b923b4f7c7ea', 'Unlimited', NULL, 'support', 'BG', '1990-06-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7fa0f783-87c6-4b3d-a358-d78dc8ca3e33', 'Darien', NULL, 'top', 'RU', '1991-03-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('795fbf31-99d9-4f73-a047-4c95e2a3b8d9', 'Zorozero', NULL, 'top', 'DK', '1995-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0fae6a27-2fe1-425e-86aa-aea4312b278a', 'Diamond', NULL, 'jungle', 'RU', '1992-12-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('db1431d9-d16b-4abe-ae7d-e9239ba6487e', 'Hulberto', NULL, 'jungle', 'SE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bed485e9-d903-4728-9dbe-1452279a5d2c', 'Alex Ich', NULL, 'mid', 'RU', '1992-01-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cac85be0-7fe9-4352-96d9-98a2e1bf99ad', 'nukeduck', NULL, 'mid', 'NO', '1996-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('52b34ea7-471f-46dc-9fc1-e50a79ce5c5c', 'Genja', NULL, 'adc', 'RU', '1988-09-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('126ab609-90e8-427b-abd8-2703ede76781', 'Fury', NULL, 'adc', 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ec730d86-cc89-41c3-b803-1b9ede5cf7d2', 'EDward', NULL, 'support', 'AM', '1994-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d1c0fd1c-95a9-4b27-9b94-426d2464979a', 'kev1n', NULL, 'top', 'DE', '1993-01-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7118edcb-2bc6-4478-bf2c-aac4f439aec6', 'Araneae', NULL, 'jungle', 'ES', '1989-05-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b7e19302-ab12-4544-a47a-dd426b8593da', 'Kottenx', NULL, 'jungle', 'SE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bf28d2e6-0078-4ec2-ae00-fd8962abbb0e', 'Kerp', NULL, 'mid', 'DE', '1993-03-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('18f60ec1-8f28-4540-aaba-19ad98c27b43', 'Creaton', NULL, 'adc', 'PL', '1994-03-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8c396684-8a7c-450b-a92e-80bc5d78632b', 'Jree', NULL, 'support', 'SE', '1993-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a7c8b765-1d29-4aca-8fa6-4e1ea6c99557', 'fredy122', NULL, 'top', 'GB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6af478c4-f71a-426c-876d-6c188f796ea6', 'Svenskeren', NULL, 'jungle', 'DK', '1996-01-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4ba52737-d1c5-4ae4-9997-3be0a1e3c284', 'Jesiz', NULL, 'mid', 'DK', '1996-06-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5966f889-9ef1-4ff9-8f48-70f112101ac7', 'CandyPanda', NULL, 'adc', 'DE', '1993-06-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1cfd6836-1e47-4981-af37-fea9cd80c0bd', 'nRated', NULL, 'support', 'DE', '1991-07-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f06d17e1-ab95-47f6-a299-5de337d7f000', 'Mimer', NULL, 'top', 'SE', '1994-03-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('21345c4a-b3cd-4559-818b-f117095fd401', 'Impaler', NULL, 'jungle', 'GB', '1996-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bbcbfd56-761c-4cf9-8e89-992ae3050069', 'Moopz', NULL, 'mid', 'BE', '1992-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('413f7991-8d03-4a06-a69f-874f9cbda999', 'SELFIE', NULL, 'mid', 'PL', '1997-02-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3b2f5b97-76da-4af0-9383-880b2926cea8', 'MrRalleZ', NULL, 'adc', 'DK', '1996-10-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8a32ede8-025d-46fd-ae9c-400a350ba087', 'Migxa', NULL, 'support', 'FR', '1995-04-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('99c3e97e-4b33-41d3-8d73-03036d13a9bd', 'Xaxus', NULL, 'top', 'PL', '1994-02-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cde50786-5936-45ba-81a6-90dfa9ae7b7a', 'Jankos', NULL, 'jungle', 'PL', '1995-07-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3c25ce12-11c0-4a54-9214-87774051a8d2', 'Overpow', NULL, 'mid', 'PL', '1991-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9f47a4f8-cd7d-4d55-91e4-3ed312fdaa83', 'Celaver', NULL, 'adc', 'PL', '1993-10-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('953160ca-495a-49c4-b24b-b9bfe401b417', 'VandeR', NULL, 'support', 'PL', '1994-04-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d6bc8714-a346-416e-8612-9935e85659dd', 'Nien', NULL, 'top', 'US', '1994-07-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('31264529-7365-444d-a5fd-ad3722d2113e', 'dexter', NULL, 'jungle', 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('197e42c6-b4b3-4a49-9080-88bced5b7c25', 'Link', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c791c3e2-751a-4395-87a7-30890ac6e225', 'HotshotGG', NULL, 'mid', 'CA', '1990-06-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8ae8669f-f315-4920-9221-fe94ec21cd43', 'Chauster', NULL, 'mid', 'US', '1989-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('06a260a3-04c4-4e96-90a1-4d93513eec5b', 'Doublelift', NULL, 'adc', 'US', '1993-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('420cf100-7d32-40c7-bbe1-448d99377831', 'aphromoo', NULL, 'support', 'US', '1992-09-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('27ca2b63-8bdf-41dc-a156-bdb0deaf7133', 'InnoX', NULL, 'top', 'CA', '1995-07-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('77f18de9-d8ec-498c-9cf6-2d25fa9dd71c', 'Snoopeh', NULL, 'jungle', 'GB', '1991-09-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2eda08fb-96d3-4423-8e5b-0b0f9ceb308a', 'Thinkcard', NULL, 'jungle', 'US', '1992-10-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d2bce849-f5fe-4150-8ba0-c7c8f6e8b2bc', 'Pobelter', NULL, 'mid', 'US', '1996-10-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0ecb7b1a-f206-4946-aebe-f52db171b920', 'Yellowpete', NULL, 'adc', 'DE', '1989-10-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6d442179-e489-45da-942e-e36f102418a4', 'ROBERTxLEE', NULL, 'adc', 'US', '1992-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d66d10fa-3868-42dd-b6ac-34154121c1ca', 'Krepo', NULL, 'support', 'BE', '1990-05-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('08d04e51-6eac-45cc-a40a-d162ad7d6192', 'Ken', NULL, 'support', 'US', '1994-11-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f75a9a83-81cc-4298-8f96-b773918ba272', 'ZionSpartan', NULL, 'top', 'CA', '1994-11-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('054dd4e2-c4b4-4a33-b21a-d0e038adcac4', 'NintendudeX', NULL, 'jungle', 'US', '1995-07-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bdbd10ba-19a1-480e-9e90-3943c873febe', 'Shiphtur', NULL, 'mid', 'CA', '1993-01-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('941e889c-50ea-4195-9511-b0fe82a88ce7', 'WizFujiiN', NULL, 'adc', 'US', '1994-08-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d2662356-fe32-4da4-b93b-87cc05127c9b', 'Daydreamin', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('36d2b05d-84ee-47fb-ad7f-19067a69d07b', 'Quas', NULL, 'top', 'VE', '1991-11-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ba3e391c-13d0-4cc8-a6fe-e094c59c53b4', 'IWDominate', NULL, 'jungle', 'US', '1990-08-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9ba33ff8-b8a1-4762-86e7-3ba991a38610', 'Voyboy', NULL, 'mid', 'US', '1994-12-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e832ce02-8128-4426-858b-e50e4df76031', 'Cop', NULL, 'adc', 'US', '1992-06-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d8a8cd43-9af8-41ce-a1a8-6a82b6a923a1', 'Zekent', NULL, 'support', 'US', '1989-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('70a457fe-ddad-4368-83cd-787ce79c7548', 'Saintvicious', NULL, 'support', 'US', '1987-05-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('51be46b7-167b-4f76-be91-aac3ffce042c', 'BunnyFuFuu', NULL, 'support', 'US', '1996-08-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6b3190f4-917e-404c-9305-62427f7db73b', 'Cruzer', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('896a7e58-4f81-4c56-aca1-3a844aee80e2', 'Crumbzz', NULL, 'jungle', 'VE', '1993-02-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('36aa54b6-a338-40a4-9e9c-d896c164756c', 'Scarra', NULL, 'mid', 'US', '1989-11-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9c5c49b8-c257-44e4-888a-9b06bdb9b444', 'goldenglue', NULL, 'mid', 'US', '1996-11-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4b92da81-ec64-4bd3-b5ee-b35d3c18ff28', 'Imaqtpie', NULL, 'adc', 'US', '1992-02-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4dc0aba8-9c63-49ae-87e7-3f4e3f4fb700', 'KiWiKiD', NULL, 'support', 'US', '1993-11-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b3aa1423-02a2-4b2f-b81d-4813836dc5dd', 'Dyrus', NULL, 'top', 'US', '1992-03-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('136b7e95-942c-4c30-94ce-f87022a8c785', 'TheOddOne', NULL, 'jungle', 'CA', '1988-11-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ed7a6cc5-3e22-479f-935c-1a854c7a877f', 'Bjergsen', NULL, 'mid', 'DK', '1996-02-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('86624b65-34a8-4897-81ac-575c0784cfe8', 'Reginald', NULL, 'mid', 'US', '1992-04-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e2f0130d-f7db-43cd-8bc1-df20e59cee98', 'WildTurtle', NULL, 'adc', 'CA', '1995-02-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('27e943d1-241c-4f79-a31c-32054a3c8044', 'Xpecial', NULL, 'support', 'US', '1992-08-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('928f7f1c-3fb9-4785-b9bd-b706aa3b59aa', 'Benny', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('01329de1-9c28-4bf5-ae2f-e42075665b77', 'Zuna', NULL, 'jungle', 'US', '1990-12-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6b5876b4-7972-4539-b553-4b5ce217aec7', 'Nickwu', NULL, 'jungle', 'US', '1992-07-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('db846dbe-de78-4ba5-86ea-e5dc966b1153', 'Mancloud', NULL, 'mid', 'US', '1991-07-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cce6c41e-1db3-40df-a462-4db993c2cccc', 'Xmithie', NULL, 'adc', 'PH', '1991-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5f3d2e89-2ebf-497c-87cc-8ffabfc4e949', 'BloodWater', NULL, 'support', 'BG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c0ce6e1b-69e1-4fb5-804d-a386812f46f8', 'Sheep', NULL, 'support', 'CA', '1992-06-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('888223c8-0fc3-43d9-8fab-f963320dd3f7', 'Fireloli', NULL, 'top', 'CN', '1996-05-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('61362929-e2f2-4590-9700-4a6f5661bd46', 'NaMe1', NULL, 'adc', 'CN', '1993-05-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('691bb5a2-dee1-4811-bd8a-0c43b46e0be7', 'AmazingJ', NULL, 'top', 'HK', '1997-11-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1a0e0e2e-e158-4333-864a-720f2ff27bbc', 'BuPingZ', NULL, 'jungle', 'HK', '1988-02-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('215739f8-112c-4711-99bb-6f78c2eba570', 'SuperC4t', NULL, 'mid', 'HK', '1993-08-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('45360528-56b7-464a-9205-13e2512a4af0', 'k4ne', NULL, 'adc', 'HK', '1994-07-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0d9b09a4-2626-4863-a761-3130312f9fbc', 'DomhoXz', NULL, 'support', 'HK', '1991-10-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('23444241-5ac7-4fe6-ad2f-7935871eb7fa', 'PDD520', NULL, 'top', 'CN', '1991-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('277ff1d3-2956-431f-adfb-ddd3feb77978', 'illuSioN', NULL, 'jungle', 'CN', '1990-08-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4399b914-4e43-44ff-90b9-1e1387ddb136', 'Zz1tai', NULL, 'mid', 'CN', '1997-08-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7348c384-3aa4-441a-b859-7db244edae39', 'Kid', NULL, 'adc', 'CN', '1997-08-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6d4fc59e-5694-4c8d-bce7-4f24a60501b6', 'Kitties', NULL, 'support', 'CN', '1992-09-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('19e9b570-768c-4978-9152-79c3c37f10e8', 'Star', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5b04520e-772a-4ec3-8ae1-500ca1587502', 'Quan', NULL, 'jungle', 'CN', '1996-08-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e6412a0f-808d-480f-a739-765c84742517', 'Rena', NULL, 'mid', 'HK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2fab2469-1760-49a2-a890-c25802b2683a', 'Styz', NULL, 'adc', 'CN', '1995-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6a4e21f7-fd1c-4000-ae70-d3f9c119db3b', 'Pyl', NULL, 'support', 'CN', '1994-11-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('89842d15-018e-46b6-83d6-b3b486f6378d', 'GGoing', NULL, 'top', 'CN', '1991-10-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6c37f12b-8150-4c75-a38b-eeb185bc3a5c', 'pomelo', NULL, 'jungle', 'CN', '1992-10-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d5a728cf-ebe8-43c1-b49c-310f1ac21bdf', 'xiyang', NULL, 'mid', 'CN', '1994-05-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0d1e3f1d-0e5c-4cc2-bda3-30032b3415bc', 'Cool', NULL, 'mid', 'CN', '1994-08-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3c5e4974-73cb-4357-8c88-3d81ae4b1762', 'San', NULL, 'adc', 'CN', '1993-01-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2b645317-514a-4620-a9c6-56069f8f5a24', 'Allen', NULL, 'support', 'CN', '1993-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a39ca492-703c-4e1c-b24d-56b3ca55e906', 'Aluk0', NULL, 'top', 'CN', '1995-02-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('38572911-e501-4701-93eb-aa42226b0ee1', 'JOJO', NULL, 'jungle', 'HK', '1999-11-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f935cb55-b839-4822-acb9-40d2677b7e14', 'Crazy', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8dde68dd-cf03-47d6-a589-a94f561972f4', 'Face', NULL, 'mid', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('70f0ac89-90cf-4f56-b8ae-843990b697a2', 'Ycc', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ccae4891-5dd1-41c3-8fae-e66b9583a3a8', 'Summer', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c5d3636d-3e4f-4352-834f-44419eee6c99', 'lovC', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1b477dac-3f65-4656-a762-337008e1e94b', 'DaDa7', NULL, 'support', 'CN', '1989-07-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7e942aa0-0488-4a72-8756-555bc569d720', 'Nct', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a382207a-723b-4fa0-8194-866e5c21dba4', 'Yao', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c761356a-c39b-4832-9536-b10e2422650c', 'Kmi', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bbbc0897-fb65-4587-9d9d-b9f2b8396747', 'Uzi', NULL, 'mid', 'CN', '1997-04-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('86253f21-7078-4d00-a2bd-70bacc31d1df', 'LeY', NULL, 'adc', 'CN', '1997-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a1d37848-cb0e-43d4-ae68-6c9f7b9faaa0', 'Rui', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3e583d84-1064-4433-a11c-f1901c21ed44', 'XJJ', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('464d379b-bed7-4141-abbc-636c3fb8e3df', 'Bao', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9225200c-07b1-49a2-8739-e6b40ad26d1d', 'CaoMei', NULL, 'top', 'CN', '1991-12-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0c28a60a-9a6e-4fd6-8c3e-9d0eeb631c52', 'Ruo', NULL, 'jungle', 'CN', '1993-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('503960a7-1da8-4828-89d8-518480832da8', 'suk1M', NULL, 'mid', 'CN', '1996-09-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2b3d374b-e909-4153-b02e-86d3d28138a8', 'Wx', NULL, 'adc', 'CN', '1992-06-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b3425467-454e-4392-8db1-55090100d9dd', 'Conan', NULL, 'support', 'CN', '1993-12-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('10069018-ab5e-4339-b11c-d9ca47530d48', 'Flame', NULL, 'top', 'KR', '1992-08-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4836e9a6-f3f4-4b8f-ac25-2d4a2551dedd', 'DayDream', NULL, 'jungle', 'KR', '1995-06-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1497b8a0-8f8a-41d0-9279-99419eae774c', 'Ambition', NULL, 'mid', 'KR', '1992-10-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d80876db-7e31-42cf-b513-78dffda06d12', 'Emperor', NULL, 'adc', 'KR', '1993-06-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0d4855e3-66a2-400a-abfd-1b7a8e9f9ce5', 'Lustboy', NULL, 'support', 'KR', '1994-02-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('343f4a24-886b-49e9-a0f0-0dac03d78224', 'Shy', NULL, 'top', 'KR', '1991-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a96eab77-9a64-4e7a-bd65-6925f7c77602', 'Swift', NULL, 'jungle', 'KR', '1996-05-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ee5c4c82-cf6d-47b5-8498-838662edd8db', 'Coco', NULL, 'mid', 'KR', '1994-03-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6d500f1a-5ab1-4e1f-ab97-43e866ad497b', 'Space', NULL, 'adc', 'KR', '1993-09-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ee4b58d9-d481-4126-a5ea-f37e12af57aa', 'MadLife', NULL, 'support', 'KR', '1992-10-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e0e33189-b83d-439a-bec0-6a66ede78862', 'Leopard', NULL, 'top', 'KR', '1994-12-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('26c08ac1-c8d5-45f4-b91a-87c27cdaba94', 'inSec', NULL, 'jungle', 'KR', '1993-06-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('22cefffc-0e2b-4b79-bdd7-7354432bb5e4', 'Ryu', NULL, 'mid', 'KR', '1994-01-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0e303750-8635-4986-866e-d44223194180', 'Score', NULL, 'adc', 'KR', '1992-07-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5c94922b-b90a-4f72-8332-324b184b1579', 'Mafa', NULL, 'support', 'KR', '1992-10-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3c2d0a2b-35d0-4490-bc8b-e56550ba5bdb', 'Zero', NULL, 'support', 'KR', '1994-07-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('97d9af3c-eb0a-4ef1-9d0d-aced4b19617a', 'Save', NULL, 'top', 'KR', '1993-07-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('28959d5c-39db-488e-9552-d1cfe7794335', 'Watch', NULL, 'jungle', 'KR', '1992-01-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2c627a1c-2166-4f0d-8565-36f96e33aec8', 'Ggoong', NULL, 'mid', 'KR', '1993-06-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('37fc7bcd-46c6-486d-a302-3a6527edacd9', 'Zefa', NULL, 'adc', 'KR', '1988-02-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('07d4880e-18ba-43cf-b5e8-601b5d26d5a3', 'GorillA', NULL, 'support', 'KR', '1994-11-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0200b48f-14fd-4134-aa28-06760cd10bab', 'Acorn', NULL, 'top', 'KR', '1990-07-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('90c059c7-86fe-4ac5-a7a1-2a38f9157e54', 'Spirit', NULL, 'jungle', 'KR', '1996-07-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1b547686-f68e-4d21-bdb5-15b1c6e2877d', 'DADE', NULL, 'mid', 'KR', '1994-11-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b524ec6f-2bdd-437a-8a57-ae71f9bf55a3', 'Deft', NULL, 'adc', 'KR', '1996-10-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3000071a-1e1e-43a7-b2a1-c6278e7fd752', 'Heart', NULL, 'support', 'KR', '1988-12-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('63df759b-6f44-454f-b9ee-af82c6ac6748', 'Looper', NULL, 'top', 'KR', '1993-02-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('80c0ac00-90e4-4b3f-b9d0-40bde16f1ddf', 'DanDy', NULL, 'jungle', 'KR', '1994-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('51c0a1fa-497b-4f5f-b549-34c21d64deba', 'PawN', NULL, 'mid', 'KR', '1997-01-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('65c2d9a5-33ed-464d-a9cc-5d157ea91668', 'imp', NULL, 'adc', 'KR', '1995-06-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('58957376-e6f3-48b3-ae8a-11655523c623', 'Mata', NULL, 'support', 'KR', '1994-02-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('48726068-42a2-4b3f-aed5-25864c3d0043', 'Casper', NULL, 'support', 'KR', '1995-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1f32fd6c-b96a-4ff3-9e4d-ad381e2b253d', 'MaRin', NULL, 'top', 'KR', '1991-02-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('47be47b2-a78f-4968-ad70-309ca93573ea', 'H0R0', NULL, 'jungle', 'KR', '1996-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('62283f58-0084-4839-b20c-1223d47b7c5d', 'Easyhoon', NULL, 'mid', 'KR', '1992-11-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('34df4a13-17dd-4c43-8504-e2c68f577312', 'Bang', NULL, 'adc', 'KR', '1996-05-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('71943a8b-2682-416a-94f7-913fdad80b3c', 'Wolf', NULL, 'support', 'KR', '1996-09-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('439cdf6d-72c7-4084-b188-4cfc8d268957', 'Expect', NULL, 'top', 'KR', '1996-07-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('521834f3-c84a-4d03-acda-372510946597', 'SSUN', NULL, 'jungle', 'KR', '1994-07-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('65839552-0e59-4238-876e-18cf2ba377e5', 'Nexus', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6b6d99d5-3692-4079-9fd0-9ed9e4a4a308', 'Lactea', NULL, 'adc', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('196ada06-7a74-451f-b952-cbbe77888fe1', 'ANNA', NULL, 'support', 'KR', '1994-11-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a39435be-2db8-4179-b0cc-0b4de5fed906', 'Limit', NULL, 'top', 'KR', '1993-05-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6c01ca70-0132-4d10-9ad9-91f07258fb33', 'Helios', NULL, 'jungle', 'KR', '1993-06-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('45ef7295-8302-46d4-b2e9-a7bd9c85b1a6', 'Nagne', NULL, 'mid', 'KR', '1994-09-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('816376f7-8fb9-4bae-bea2-42d7cef06c6d', 'PraY', NULL, 'adc', 'KR', '1994-01-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('11c28124-9b13-4e86-b679-72ee0d3813fc', 'Cain', NULL, 'support', 'KR', '1987-02-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1454af3d-298d-4f4f-a069-206dd058fff0', 'Smeb', NULL, 'top', 'KR', '1995-06-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('27343f08-ddb9-4422-bd31-24cb252372ec', 'Lil4c', NULL, 'jungle', 'KR', '1992-02-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e0be5491-692c-42c3-af17-5727a105458b', 'Midking', NULL, 'mid', 'KR', '1992-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('22215b93-2aa9-4b3a-bd55-641382a45615', 'Violet', NULL, 'adc', 'KR', '1993-10-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('eecb05d3-ae4a-4ee7-a1b1-5e6e0336c291', 'Bbuing', NULL, 'support', 'KR', '1995-05-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('55be5a51-3e8b-48d7-93b9-8852baab2830', 'Hanlabong', NULL, 'top', 'KR', '1995-12-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f63c5294-d6de-4811-9fd0-28f736d78ce9', 'Old B', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('62b4549e-ad28-4500-accf-26302f303925', 'Ninja', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('228a564f-d158-4821-8e16-33a598cb46f0', 'ZetNjin', NULL, 'adc', 'KR', '1995-11-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f47760df-87af-4764-9d5c-62ad27842bfa', 'Kkyul', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3d3b187f-a05e-4200-b62d-23361fb5c8bf', 'Ssumday', NULL, 'top', 'KR', '1996-07-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('aa0a12d1-d88a-4a3c-8303-6876cd946d02', 'KaKAO', NULL, 'jungle', 'KR', '1995-12-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3aafef52-a41d-47da-8583-41b77d4f5564', 'RooKie', NULL, 'mid', 'KR', '1997-03-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('30ddb20d-ef77-44a7-9c0d-25471efd80cd', 'Arrow', NULL, 'adc', 'KR', '1994-07-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4393b602-c0ac-4edc-8f0c-0398c4772c3c', 'Hachani', NULL, 'support', 'KR', '1994-12-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8193d81f-bafc-412a-b24c-f759a026e761', 'MisSo', NULL, 'top', 'KR', '1995-12-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d09ae188-8281-43ee-95fc-2a756a79ff22', 'RealFoxy', NULL, 'jungle', 'KR', '1995-08-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3789f478-3eae-4034-9fef-f8bace9d1424', 'GBM', NULL, 'mid', 'KR', '1994-06-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('aa06539a-936f-4483-be8f-f16f6bc3ef8b', 'Mystic', NULL, 'adc', 'KR', '1995-01-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ae45b3b8-c8bd-4008-98ec-cd102f3a30a9', 'Kish', NULL, 'support', 'KR', '1991-08-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c1f3efcd-e712-4bb1-a0d5-f9e18e269e35', 'Apple', NULL, 'top', 'KR', '1993-09-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bcd3805c-f96b-44da-abe3-769c2ab7fd0a', 'Reign over', NULL, 'jungle', 'KR', '1995-07-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('db5d6e69-2db5-420d-aeab-5b9cabbed26d', 'Kuro', NULL, 'mid', 'KR', '1994-01-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f8031363-703d-479d-a336-6b0908bea373', 'BetKyo', NULL, 'adc', 'KR', '1996-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5f448280-5aec-409e-842c-8a2f013a2628', 'Paragon', NULL, 'adc', 'KR', '1995-07-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('149c4c05-e43c-4bbf-943e-006243f5a944', 'Lasha', NULL, 'support', 'KR', '1994-03-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0abc031d-d268-4f10-8c9a-998db0d8ea0e', 'Ren', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('847b2ed2-d896-49f9-8415-38834de6d37a', 'Vin', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('026314e5-2e67-46f8-a921-5f7337e7baac', 'Alvingo', NULL, 'mid', 'KR', '1992-06-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c96ae17a-ac7c-4672-9ea4-204f423ecddd', 'Ohq', NULL, 'adc', 'KR', '1996-09-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ad5f0e29-0368-4a70-aeb1-8a97ba9763ec', 'ink', NULL, 'support', 'KR', '1996-06-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO player_teams (player_id, position, team_id) VALUES
    ('cc67cd07-8880-4db9-9a1e-d5c9753a0796', 0, '078a00f3-74cb-471b-b31e-5085c13192ad'),
    ('73aedb8c-1dac-45a0-a8dd-38871785ee91', 0, '078a00f3-74cb-471b-b31e-5085c13192ad'),
    ('7da2e821-8058-4780-8ad3-e61092d9f7b1', 0, '078a00f3-74cb-471b-b31e-5085c13192ad'),
    ('141acdb9-de5f-48f2-a25c-8569bfbd6709', 0, '078a00f3-74cb-471b-b31e-5085c13192ad'),
    ('811abd74-4094-4666-b51f-8b45dcb48b04', 0, '078a00f3-74cb-471b-b31e-5085c13192ad'),
    ('a2dc5a20-049f-41d3-b3ed-7c681b0efa23', 0, 'fbbf34bd-018d-4c79-94a4-589034a062b1'),
    ('e54e057e-f711-4ec8-8262-e393d1d00ea6', 0, 'fbbf34bd-018d-4c79-94a4-589034a062b1'),
    ('553bec35-374c-43c0-af02-b878f5bdfe22', 0, 'fbbf34bd-018d-4c79-94a4-589034a062b1'),
    ('4cc36075-ed94-440f-b699-7ab341c66482', 0, 'fbbf34bd-018d-4c79-94a4-589034a062b1'),
    ('341565bb-b9c7-4491-9b52-b923b4f7c7ea', 0, 'fbbf34bd-018d-4c79-94a4-589034a062b1'),
    ('7fa0f783-87c6-4b3d-a358-d78dc8ca3e33', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('795fbf31-99d9-4f73-a047-4c95e2a3b8d9', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('0fae6a27-2fe1-425e-86aa-aea4312b278a', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('db1431d9-d16b-4abe-ae7d-e9239ba6487e', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('bed485e9-d903-4728-9dbe-1452279a5d2c', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('cac85be0-7fe9-4352-96d9-98a2e1bf99ad', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('52b34ea7-471f-46dc-9fc1-e50a79ce5c5c', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('126ab609-90e8-427b-abd8-2703ede76781', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('ec730d86-cc89-41c3-b803-1b9ede5cf7d2', 0, '0284c17a-823f-4f73-a1d9-1f73e45bf290'),
    ('d1c0fd1c-95a9-4b27-9b94-426d2464979a', 0, '3e1f8381-fcb7-4356-87dc-71dc9ac598f7'),
    ('7118edcb-2bc6-4478-bf2c-aac4f439aec6', 0, '3e1f8381-fcb7-4356-87dc-71dc9ac598f7'),
    ('b7e19302-ab12-4544-a47a-dd426b8593da', 0, '3e1f8381-fcb7-4356-87dc-71dc9ac598f7'),
    ('bf28d2e6-0078-4ec2-ae00-fd8962abbb0e', 0, '3e1f8381-fcb7-4356-87dc-71dc9ac598f7'),
    ('18f60ec1-8f28-4540-aaba-19ad98c27b43', 0, '3e1f8381-fcb7-4356-87dc-71dc9ac598f7'),
    ('8c396684-8a7c-450b-a92e-80bc5d78632b', 0, '3e1f8381-fcb7-4356-87dc-71dc9ac598f7'),
    ('a7c8b765-1d29-4aca-8fa6-4e1ea6c99557', 0, '3e3c2f1a-c424-411f-af1e-f74832810a40'),
    ('6af478c4-f71a-426c-876d-6c188f796ea6', 0, '3e3c2f1a-c424-411f-af1e-f74832810a40'),
    ('4ba52737-d1c5-4ae4-9997-3be0a1e3c284', 0, '3e3c2f1a-c424-411f-af1e-f74832810a40'),
    ('5966f889-9ef1-4ff9-8f48-70f112101ac7', 0, '3e3c2f1a-c424-411f-af1e-f74832810a40'),
    ('1cfd6836-1e47-4981-af37-fea9cd80c0bd', 0, '3e3c2f1a-c424-411f-af1e-f74832810a40'),
    ('f06d17e1-ab95-47f6-a299-5de337d7f000', 0, '333e225a-e8b6-473b-9afc-d574d4d1f332'),
    ('21345c4a-b3cd-4559-818b-f117095fd401', 0, '333e225a-e8b6-473b-9afc-d574d4d1f332'),
    ('bbcbfd56-761c-4cf9-8e89-992ae3050069', 0, '333e225a-e8b6-473b-9afc-d574d4d1f332'),
    ('413f7991-8d03-4a06-a69f-874f9cbda999', 0, '333e225a-e8b6-473b-9afc-d574d4d1f332'),
    ('3b2f5b97-76da-4af0-9383-880b2926cea8', 0, '333e225a-e8b6-473b-9afc-d574d4d1f332'),
    ('8a32ede8-025d-46fd-ae9c-400a350ba087', 0, '333e225a-e8b6-473b-9afc-d574d4d1f332'),
    ('99c3e97e-4b33-41d3-8d73-03036d13a9bd', 0, '805f241d-ff2e-435a-a46b-da6af1a1e9a2'),
    ('cde50786-5936-45ba-81a6-90dfa9ae7b7a', 0, '805f241d-ff2e-435a-a46b-da6af1a1e9a2'),
    ('3c25ce12-11c0-4a54-9214-87774051a8d2', 0, '805f241d-ff2e-435a-a46b-da6af1a1e9a2'),
    ('9f47a4f8-cd7d-4d55-91e4-3ed312fdaa83', 0, '805f241d-ff2e-435a-a46b-da6af1a1e9a2'),
    ('953160ca-495a-49c4-b24b-b9bfe401b417', 0, '805f241d-ff2e-435a-a46b-da6af1a1e9a2'),
    ('d6bc8714-a346-416e-8612-9935e85659dd', 0, '70149843-6597-49e3-8540-a4ff6fd66999'),
    ('31264529-7365-444d-a5fd-ad3722d2113e', 0, '70149843-6597-49e3-8540-a4ff6fd66999'),
    ('197e42c6-b4b3-4a49-9080-88bced5b7c25', 0, '70149843-6597-49e3-8540-a4ff6fd66999'),
    ('c791c3e2-751a-4395-87a7-30890ac6e225', 0, '70149843-6597-49e3-8540-a4ff6fd66999'),
    ('8ae8669f-f315-4920-9221-fe94ec21cd43', 0, '70149843-6597-49e3-8540-a4ff6fd66999'),
    ('06a260a3-04c4-4e96-90a1-4d93513eec5b', 0, '70149843-6597-49e3-8540-a4ff6fd66999'),
    ('420cf100-7d32-40c7-bbe1-448d99377831', 0, '70149843-6597-49e3-8540-a4ff6fd66999'),
    ('27ca2b63-8bdf-41dc-a156-bdb0deaf7133', 0, '455452b0-a54d-4bed-b05d-ee4e9fb6cb7b'),
    ('77f18de9-d8ec-498c-9cf6-2d25fa9dd71c', 0, '455452b0-a54d-4bed-b05d-ee4e9fb6cb7b'),
    ('2eda08fb-96d3-4423-8e5b-0b0f9ceb308a', 0, '455452b0-a54d-4bed-b05d-ee4e9fb6cb7b'),
    ('d2bce849-f5fe-4150-8ba0-c7c8f6e8b2bc', 0, '455452b0-a54d-4bed-b05d-ee4e9fb6cb7b'),
    ('0ecb7b1a-f206-4946-aebe-f52db171b920', 0, '455452b0-a54d-4bed-b05d-ee4e9fb6cb7b'),
    ('6d442179-e489-45da-942e-e36f102418a4', 0, '455452b0-a54d-4bed-b05d-ee4e9fb6cb7b'),
    ('d66d10fa-3868-42dd-b6ac-34154121c1ca', 0, '455452b0-a54d-4bed-b05d-ee4e9fb6cb7b'),
    ('08d04e51-6eac-45cc-a40a-d162ad7d6192', 0, '455452b0-a54d-4bed-b05d-ee4e9fb6cb7b'),
    ('f75a9a83-81cc-4298-8f96-b773918ba272', 0, '05545e0c-6aed-4fb3-a19a-1481701f80e6'),
    ('054dd4e2-c4b4-4a33-b21a-d0e038adcac4', 0, '05545e0c-6aed-4fb3-a19a-1481701f80e6'),
    ('bdbd10ba-19a1-480e-9e90-3943c873febe', 0, '05545e0c-6aed-4fb3-a19a-1481701f80e6'),
    ('941e889c-50ea-4195-9511-b0fe82a88ce7', 0, '05545e0c-6aed-4fb3-a19a-1481701f80e6'),
    ('d2662356-fe32-4da4-b93b-87cc05127c9b', 0, '05545e0c-6aed-4fb3-a19a-1481701f80e6'),
    ('36d2b05d-84ee-47fb-ad7f-19067a69d07b', 0, '68582452-5bcc-4233-b613-86a2da75ce22'),
    ('ba3e391c-13d0-4cc8-a6fe-e094c59c53b4', 0, '68582452-5bcc-4233-b613-86a2da75ce22'),
    ('9ba33ff8-b8a1-4762-86e7-3ba991a38610', 0, '68582452-5bcc-4233-b613-86a2da75ce22'),
    ('e832ce02-8128-4426-858b-e50e4df76031', 0, '68582452-5bcc-4233-b613-86a2da75ce22'),
    ('d8a8cd43-9af8-41ce-a1a8-6a82b6a923a1', 0, '68582452-5bcc-4233-b613-86a2da75ce22'),
    ('70a457fe-ddad-4368-83cd-787ce79c7548', 0, '68582452-5bcc-4233-b613-86a2da75ce22'),
    ('51be46b7-167b-4f76-be91-aac3ffce042c', 0, '68582452-5bcc-4233-b613-86a2da75ce22'),
    ('6b3190f4-917e-404c-9305-62427f7db73b', 0, 'c8f814d4-85d4-43ed-9f16-c45a9a5458bc'),
    ('896a7e58-4f81-4c56-aca1-3a844aee80e2', 0, 'c8f814d4-85d4-43ed-9f16-c45a9a5458bc'),
    ('36aa54b6-a338-40a4-9e9c-d896c164756c', 0, 'c8f814d4-85d4-43ed-9f16-c45a9a5458bc'),
    ('9c5c49b8-c257-44e4-888a-9b06bdb9b444', 0, 'c8f814d4-85d4-43ed-9f16-c45a9a5458bc'),
    ('4b92da81-ec64-4bd3-b5ee-b35d3c18ff28', 0, 'c8f814d4-85d4-43ed-9f16-c45a9a5458bc'),
    ('4dc0aba8-9c63-49ae-87e7-3f4e3f4fb700', 0, 'c8f814d4-85d4-43ed-9f16-c45a9a5458bc'),
    ('b3aa1423-02a2-4b2f-b81d-4813836dc5dd', 0, '67804fca-bf60-4de6-8e28-1d1911bccbcd'),
    ('136b7e95-942c-4c30-94ce-f87022a8c785', 0, '67804fca-bf60-4de6-8e28-1d1911bccbcd'),
    ('ed7a6cc5-3e22-479f-935c-1a854c7a877f', 0, '67804fca-bf60-4de6-8e28-1d1911bccbcd'),
    ('86624b65-34a8-4897-81ac-575c0784cfe8', 0, '67804fca-bf60-4de6-8e28-1d1911bccbcd'),
    ('e2f0130d-f7db-43cd-8bc1-df20e59cee98', 0, '67804fca-bf60-4de6-8e28-1d1911bccbcd'),
    ('27e943d1-241c-4f79-a31c-32054a3c8044', 0, '67804fca-bf60-4de6-8e28-1d1911bccbcd'),
    ('928f7f1c-3fb9-4785-b9bd-b706aa3b59aa', 0, '9b0ba8c9-a849-4e90-8332-5be515911957'),
    ('01329de1-9c28-4bf5-ae2f-e42075665b77', 0, '9b0ba8c9-a849-4e90-8332-5be515911957'),
    ('6b5876b4-7972-4539-b553-4b5ce217aec7', 0, '9b0ba8c9-a849-4e90-8332-5be515911957'),
    ('db846dbe-de78-4ba5-86ea-e5dc966b1153', 0, '9b0ba8c9-a849-4e90-8332-5be515911957'),
    ('cce6c41e-1db3-40df-a462-4db993c2cccc', 0, '9b0ba8c9-a849-4e90-8332-5be515911957'),
    ('5f3d2e89-2ebf-497c-87cc-8ffabfc4e949', 0, '9b0ba8c9-a849-4e90-8332-5be515911957'),
    ('c0ce6e1b-69e1-4fb5-804d-a386812f46f8', 0, '9b0ba8c9-a849-4e90-8332-5be515911957'),
    ('888223c8-0fc3-43d9-8fab-f963320dd3f7', 0, 'eb75c86e-b74a-4fc5-987b-55320acecbbf'),
    ('61362929-e2f2-4590-9700-4a6f5661bd46', 0, 'eb75c86e-b74a-4fc5-987b-55320acecbbf'),
    ('691bb5a2-dee1-4811-bd8a-0c43b46e0be7', 0, '5bd7a866-505c-4dda-924d-cb97126df450'),
    ('1a0e0e2e-e158-4333-864a-720f2ff27bbc', 0, '5bd7a866-505c-4dda-924d-cb97126df450'),
    ('215739f8-112c-4711-99bb-6f78c2eba570', 0, '5bd7a866-505c-4dda-924d-cb97126df450'),
    ('45360528-56b7-464a-9205-13e2512a4af0', 0, '5bd7a866-505c-4dda-924d-cb97126df450'),
    ('0d9b09a4-2626-4863-a761-3130312f9fbc', 0, '5bd7a866-505c-4dda-924d-cb97126df450'),
    ('23444241-5ac7-4fe6-ad2f-7935871eb7fa', 0, '961e9400-1df5-4ca3-b0f4-f651ee17e171'),
    ('277ff1d3-2956-431f-adfb-ddd3feb77978', 0, '961e9400-1df5-4ca3-b0f4-f651ee17e171'),
    ('4399b914-4e43-44ff-90b9-1e1387ddb136', 0, '961e9400-1df5-4ca3-b0f4-f651ee17e171'),
    ('7348c384-3aa4-441a-b859-7db244edae39', 0, '961e9400-1df5-4ca3-b0f4-f651ee17e171'),
    ('6d4fc59e-5694-4c8d-bce7-4f24a60501b6', 0, '961e9400-1df5-4ca3-b0f4-f651ee17e171'),
    ('19e9b570-768c-4978-9152-79c3c37f10e8', 0, '9d786b2c-ca11-4b18-ae2e-cd87e3d7869c'),
    ('5b04520e-772a-4ec3-8ae1-500ca1587502', 0, '9d786b2c-ca11-4b18-ae2e-cd87e3d7869c'),
    ('e6412a0f-808d-480f-a739-765c84742517', 0, '9d786b2c-ca11-4b18-ae2e-cd87e3d7869c'),
    ('2fab2469-1760-49a2-a890-c25802b2683a', 0, '9d786b2c-ca11-4b18-ae2e-cd87e3d7869c'),
    ('6a4e21f7-fd1c-4000-ae70-d3f9c119db3b', 0, '9d786b2c-ca11-4b18-ae2e-cd87e3d7869c'),
    ('89842d15-018e-46b6-83d6-b3b486f6378d', 0, '4b0d4a88-c92f-4c77-88b4-3dd3cf660a62'),
    ('6c37f12b-8150-4c75-a38b-eeb185bc3a5c', 0, '4b0d4a88-c92f-4c77-88b4-3dd3cf660a62'),
    ('d5a728cf-ebe8-43c1-b49c-310f1ac21bdf', 0, '4b0d4a88-c92f-4c77-88b4-3dd3cf660a62'),
    ('0d1e3f1d-0e5c-4cc2-bda3-30032b3415bc', 0, '4b0d4a88-c92f-4c77-88b4-3dd3cf660a62'),
    ('3c5e4974-73cb-4357-8c88-3d81ae4b1762', 0, '4b0d4a88-c92f-4c77-88b4-3dd3cf660a62'),
    ('2b645317-514a-4620-a9c6-56069f8f5a24', 0, '4b0d4a88-c92f-4c77-88b4-3dd3cf660a62'),
    ('a39ca492-703c-4e1c-b24d-56b3ca55e906', 0, '05f881e9-45b7-4c0d-8265-e7098457b334'),
    ('38572911-e501-4701-93eb-aa42226b0ee1', 0, '05f881e9-45b7-4c0d-8265-e7098457b334'),
    ('f935cb55-b839-4822-acb9-40d2677b7e14', 0, '05f881e9-45b7-4c0d-8265-e7098457b334'),
    ('8dde68dd-cf03-47d6-a589-a94f561972f4', 0, '05f881e9-45b7-4c0d-8265-e7098457b334'),
    ('70f0ac89-90cf-4f56-b8ae-843990b697a2', 0, '05f881e9-45b7-4c0d-8265-e7098457b334'),
    ('ccae4891-5dd1-41c3-8fae-e66b9583a3a8', 0, '05f881e9-45b7-4c0d-8265-e7098457b334'),
    ('c5d3636d-3e4f-4352-834f-44419eee6c99', 0, '05f881e9-45b7-4c0d-8265-e7098457b334'),
    ('1b477dac-3f65-4656-a762-337008e1e94b', 0, '05f881e9-45b7-4c0d-8265-e7098457b334'),
    ('7e942aa0-0488-4a72-8756-555bc569d720', 0, '9e240f1d-e020-4752-8567-1825c1d47f6c'),
    ('a382207a-723b-4fa0-8194-866e5c21dba4', 0, '9e240f1d-e020-4752-8567-1825c1d47f6c'),
    ('c761356a-c39b-4832-9536-b10e2422650c', 0, '9e240f1d-e020-4752-8567-1825c1d47f6c'),
    ('bbbc0897-fb65-4587-9d9d-b9f2b8396747', 0, '9e240f1d-e020-4752-8567-1825c1d47f6c'),
    ('86253f21-7078-4d00-a2bd-70bacc31d1df', 0, '9e240f1d-e020-4752-8567-1825c1d47f6c'),
    ('a1d37848-cb0e-43d4-ae68-6c9f7b9faaa0', 0, '9e240f1d-e020-4752-8567-1825c1d47f6c'),
    ('3e583d84-1064-4433-a11c-f1901c21ed44', 0, '9e240f1d-e020-4752-8567-1825c1d47f6c'),
    ('464d379b-bed7-4141-abbc-636c3fb8e3df', 0, '9e240f1d-e020-4752-8567-1825c1d47f6c'),
    ('9225200c-07b1-49a2-8739-e6b40ad26d1d', 0, '3c838f63-65bc-47c7-8157-9d5f4b240dd7'),
    ('0c28a60a-9a6e-4fd6-8c3e-9d0eeb631c52', 0, '3c838f63-65bc-47c7-8157-9d5f4b240dd7'),
    ('503960a7-1da8-4828-89d8-518480832da8', 0, '3c838f63-65bc-47c7-8157-9d5f4b240dd7'),
    ('2b3d374b-e909-4153-b02e-86d3d28138a8', 0, '3c838f63-65bc-47c7-8157-9d5f4b240dd7'),
    ('b3425467-454e-4392-8db1-55090100d9dd', 0, '3c838f63-65bc-47c7-8157-9d5f4b240dd7'),
    ('10069018-ab5e-4339-b11c-d9ca47530d48', 0, 'dcb050b1-992d-4535-8218-3752340c77c0'),
    ('4836e9a6-f3f4-4b8f-ac25-2d4a2551dedd', 0, 'dcb050b1-992d-4535-8218-3752340c77c0'),
    ('1497b8a0-8f8a-41d0-9279-99419eae774c', 0, 'dcb050b1-992d-4535-8218-3752340c77c0'),
    ('d80876db-7e31-42cf-b513-78dffda06d12', 0, 'dcb050b1-992d-4535-8218-3752340c77c0'),
    ('0d4855e3-66a2-400a-abfd-1b7a8e9f9ce5', 0, 'dcb050b1-992d-4535-8218-3752340c77c0'),
    ('343f4a24-886b-49e9-a0f0-0dac03d78224', 0, 'ab864fae-262f-40b7-8a13-2202df7437eb'),
    ('a96eab77-9a64-4e7a-bd65-6925f7c77602', 0, 'ab864fae-262f-40b7-8a13-2202df7437eb'),
    ('ee5c4c82-cf6d-47b5-8498-838662edd8db', 0, 'ab864fae-262f-40b7-8a13-2202df7437eb'),
    ('6d500f1a-5ab1-4e1f-ab97-43e866ad497b', 0, 'ab864fae-262f-40b7-8a13-2202df7437eb'),
    ('ee4b58d9-d481-4126-a5ea-f37e12af57aa', 0, 'ab864fae-262f-40b7-8a13-2202df7437eb'),
    ('e0e33189-b83d-439a-bec0-6a66ede78862', 0, 'd01c8443-2a77-4589-821c-c6c055ecfd24'),
    ('26c08ac1-c8d5-45f4-b91a-87c27cdaba94', 0, 'd01c8443-2a77-4589-821c-c6c055ecfd24'),
    ('22cefffc-0e2b-4b79-bdd7-7354432bb5e4', 0, 'd01c8443-2a77-4589-821c-c6c055ecfd24'),
    ('0e303750-8635-4986-866e-d44223194180', 0, 'd01c8443-2a77-4589-821c-c6c055ecfd24'),
    ('5c94922b-b90a-4f72-8332-324b184b1579', 0, 'd01c8443-2a77-4589-821c-c6c055ecfd24'),
    ('3c2d0a2b-35d0-4490-bc8b-e56550ba5bdb', 0, 'd01c8443-2a77-4589-821c-c6c055ecfd24'),
    ('97d9af3c-eb0a-4ef1-9d0d-aced4b19617a', 0, '52d4b112-4a87-4b0e-92e2-eef44bfd26cd'),
    ('28959d5c-39db-488e-9552-d1cfe7794335', 0, '52d4b112-4a87-4b0e-92e2-eef44bfd26cd'),
    ('2c627a1c-2166-4f0d-8565-36f96e33aec8', 0, '52d4b112-4a87-4b0e-92e2-eef44bfd26cd'),
    ('37fc7bcd-46c6-486d-a302-3a6527edacd9', 0, '52d4b112-4a87-4b0e-92e2-eef44bfd26cd'),
    ('07d4880e-18ba-43cf-b5e8-601b5d26d5a3', 0, '52d4b112-4a87-4b0e-92e2-eef44bfd26cd'),
    ('0200b48f-14fd-4134-aa28-06760cd10bab', 0, 'e11b8a4e-9ed5-43a2-a953-89c06856e802'),
    ('90c059c7-86fe-4ac5-a7a1-2a38f9157e54', 0, 'e11b8a4e-9ed5-43a2-a953-89c06856e802'),
    ('1b547686-f68e-4d21-bdb5-15b1c6e2877d', 0, 'e11b8a4e-9ed5-43a2-a953-89c06856e802'),
    ('b524ec6f-2bdd-437a-8a57-ae71f9bf55a3', 0, 'e11b8a4e-9ed5-43a2-a953-89c06856e802'),
    ('3000071a-1e1e-43a7-b2a1-c6278e7fd752', 0, 'e11b8a4e-9ed5-43a2-a953-89c06856e802'),
    ('63df759b-6f44-454f-b9ee-af82c6ac6748', 0, 'acacb87f-4aec-4565-9e4d-a5da31336753'),
    ('80c0ac00-90e4-4b3f-b9d0-40bde16f1ddf', 0, 'acacb87f-4aec-4565-9e4d-a5da31336753'),
    ('51c0a1fa-497b-4f5f-b549-34c21d64deba', 0, 'acacb87f-4aec-4565-9e4d-a5da31336753'),
    ('65c2d9a5-33ed-464d-a9cc-5d157ea91668', 0, 'acacb87f-4aec-4565-9e4d-a5da31336753'),
    ('58957376-e6f3-48b3-ae8a-11655523c623', 0, 'acacb87f-4aec-4565-9e4d-a5da31336753'),
    ('48726068-42a2-4b3f-aed5-25864c3d0043', 0, 'ef47ab32-23cd-43ca-abc6-770b9b04369c'),
    ('1f32fd6c-b96a-4ff3-9e4d-ad381e2b253d', 0, '9039941a-1b1d-4d6b-95a8-10d9d0f67644'),
    ('47be47b2-a78f-4968-ad70-309ca93573ea', 0, '9039941a-1b1d-4d6b-95a8-10d9d0f67644'),
    ('62283f58-0084-4839-b20c-1223d47b7c5d', 0, '9039941a-1b1d-4d6b-95a8-10d9d0f67644'),
    ('34df4a13-17dd-4c43-8504-e2c68f577312', 0, '9039941a-1b1d-4d6b-95a8-10d9d0f67644'),
    ('71943a8b-2682-416a-94f7-913fdad80b3c', 0, '9039941a-1b1d-4d6b-95a8-10d9d0f67644'),
    ('439cdf6d-72c7-4084-b188-4cfc8d268957', 0, 'ee4e66dd-d330-40b1-825a-a3eeb787d6fc'),
    ('521834f3-c84a-4d03-acda-372510946597', 0, 'ee4e66dd-d330-40b1-825a-a3eeb787d6fc'),
    ('65839552-0e59-4238-876e-18cf2ba377e5', 0, 'ee4e66dd-d330-40b1-825a-a3eeb787d6fc'),
    ('6b6d99d5-3692-4079-9fd0-9ed9e4a4a308', 0, 'ee4e66dd-d330-40b1-825a-a3eeb787d6fc'),
    ('196ada06-7a74-451f-b952-cbbe77888fe1', 0, 'ee4e66dd-d330-40b1-825a-a3eeb787d6fc'),
    ('a39435be-2db8-4179-b0cc-0b4de5fed906', 0, 'bbf8c69f-289d-4508-a57b-50124c029cab'),
    ('6c01ca70-0132-4d10-9ad9-91f07258fb33', 0, 'bbf8c69f-289d-4508-a57b-50124c029cab'),
    ('45ef7295-8302-46d4-b2e9-a7bd9c85b1a6', 0, 'bbf8c69f-289d-4508-a57b-50124c029cab'),
    ('816376f7-8fb9-4bae-bea2-42d7cef06c6d', 0, 'bbf8c69f-289d-4508-a57b-50124c029cab'),
    ('11c28124-9b13-4e86-b679-72ee0d3813fc', 0, 'bbf8c69f-289d-4508-a57b-50124c029cab'),
    ('1454af3d-298d-4f4f-a069-206dd058fff0', 0, 'c82ba779-7a5c-4794-9d85-dd2a3e1f99fd'),
    ('27343f08-ddb9-4422-bd31-24cb252372ec', 0, 'c82ba779-7a5c-4794-9d85-dd2a3e1f99fd'),
    ('e0be5491-692c-42c3-af17-5727a105458b', 0, 'c82ba779-7a5c-4794-9d85-dd2a3e1f99fd'),
    ('22215b93-2aa9-4b3a-bd55-641382a45615', 0, 'c82ba779-7a5c-4794-9d85-dd2a3e1f99fd'),
    ('eecb05d3-ae4a-4ee7-a1b1-5e6e0336c291', 0, 'c82ba779-7a5c-4794-9d85-dd2a3e1f99fd'),
    ('55be5a51-3e8b-48d7-93b9-8852baab2830', 0, 'a920960c-d5e6-4f9b-a553-4df97c58dfe6'),
    ('f63c5294-d6de-4811-9fd0-28f736d78ce9', 0, 'a920960c-d5e6-4f9b-a553-4df97c58dfe6'),
    ('62b4549e-ad28-4500-accf-26302f303925', 0, 'a920960c-d5e6-4f9b-a553-4df97c58dfe6'),
    ('228a564f-d158-4821-8e16-33a598cb46f0', 0, 'a920960c-d5e6-4f9b-a553-4df97c58dfe6'),
    ('f47760df-87af-4764-9d5c-62ad27842bfa', 0, 'a920960c-d5e6-4f9b-a553-4df97c58dfe6'),
    ('3d3b187f-a05e-4200-b62d-23361fb5c8bf', 0, 'b47ea394-bfc7-463f-ba50-2735b5c1b8f2'),
    ('aa0a12d1-d88a-4a3c-8303-6876cd946d02', 0, 'b47ea394-bfc7-463f-ba50-2735b5c1b8f2'),
    ('3aafef52-a41d-47da-8583-41b77d4f5564', 0, 'b47ea394-bfc7-463f-ba50-2735b5c1b8f2'),
    ('30ddb20d-ef77-44a7-9c0d-25471efd80cd', 0, 'b47ea394-bfc7-463f-ba50-2735b5c1b8f2'),
    ('4393b602-c0ac-4edc-8f0c-0398c4772c3c', 0, 'b47ea394-bfc7-463f-ba50-2735b5c1b8f2'),
    ('8193d81f-bafc-412a-b24c-f759a026e761', 0, '9b7261b5-e183-4666-aa78-0c313a71d0f6'),
    ('d09ae188-8281-43ee-95fc-2a756a79ff22', 0, '9b7261b5-e183-4666-aa78-0c313a71d0f6'),
    ('3789f478-3eae-4034-9fef-f8bace9d1424', 0, '9b7261b5-e183-4666-aa78-0c313a71d0f6'),
    ('aa06539a-936f-4483-be8f-f16f6bc3ef8b', 0, '9b7261b5-e183-4666-aa78-0c313a71d0f6'),
    ('ae45b3b8-c8bd-4008-98ec-cd102f3a30a9', 0, '9b7261b5-e183-4666-aa78-0c313a71d0f6'),
    ('c1f3efcd-e712-4bb1-a0d5-f9e18e269e35', 0, '17c7d024-6d05-41f2-b6bc-9e143ae18427'),
    ('bcd3805c-f96b-44da-abe3-769c2ab7fd0a', 0, '17c7d024-6d05-41f2-b6bc-9e143ae18427'),
    ('db5d6e69-2db5-420d-aeab-5b9cabbed26d', 0, '17c7d024-6d05-41f2-b6bc-9e143ae18427'),
    ('f8031363-703d-479d-a336-6b0908bea373', 0, '17c7d024-6d05-41f2-b6bc-9e143ae18427'),
    ('5f448280-5aec-409e-842c-8a2f013a2628', 0, '17c7d024-6d05-41f2-b6bc-9e143ae18427'),
    ('149c4c05-e43c-4bbf-943e-006243f5a944', 0, '17c7d024-6d05-41f2-b6bc-9e143ae18427'),
    ('0abc031d-d268-4f10-8c9a-998db0d8ea0e', 0, 'dfd43fc8-ecda-4f17-a9e0-341a94686e97'),
    ('847b2ed2-d896-49f9-8415-38834de6d37a', 0, 'dfd43fc8-ecda-4f17-a9e0-341a94686e97'),
    ('026314e5-2e67-46f8-a921-5f7337e7baac', 0, 'dfd43fc8-ecda-4f17-a9e0-341a94686e97'),
    ('c96ae17a-ac7c-4672-9ea4-204f423ecddd', 0, 'dfd43fc8-ecda-4f17-a9e0-341a94686e97'),
    ('ad5f0e29-0368-4a70-aeb1-8a97ba9763ec', 0, 'dfd43fc8-ecda-4f17-a9e0-341a94686e97');

-- Main image of each Leaguepedia page, stored locally under data/portraits/wiki/.
-- LPL: https://lol.fandom.com/wiki/LPL/2014_Season/Spring_Season
-- Champions: https://lol.fandom.com/wiki/Champions/2014_Season/Spring_Season
-- Team logos and player portraits are the page image of the roster link.
-- A page with no image stays empty.
UPDATE leagues SET portrait = 'portraits/wiki/LPL.jpg' WHERE name = 'LPL';
UPDATE leagues SET portrait = 'portraits/wiki/OGN_The_Champions.jpg' WHERE name = 'Champions';
UPDATE organisations SET portrait = 'portraits/wiki/AllianceOldlogo_square.png' WHERE name = 'Alliance';
UPDATE teams SET portrait = 'portraits/wiki/AllianceOldlogo_square.png' WHERE name = 'Alliance';
UPDATE organisations SET portrait = 'portraits/wiki/Copenhagenwolves.jpg' WHERE name = 'Copenhagen Wolves';
UPDATE teams SET portrait = 'portraits/wiki/Copenhagenwolves.jpg' WHERE name = 'Copenhagen Wolves';
UPDATE organisations SET portrait = 'portraits/wiki/Gambit20152.jpg' WHERE name = 'Gambit Gaming';
UPDATE teams SET portrait = 'portraits/wiki/Gambit20152.jpg' WHERE name = 'Gambit Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Millenium_S4_LCS_Spring.jpg' WHERE name = 'Millenium';
UPDATE teams SET portrait = 'portraits/wiki/Millenium_S4_LCS_Spring.jpg' WHERE name = 'Millenium';
UPDATE organisations SET portrait = 'portraits/wiki/SK_Gaminglogo_Since_1997.png' WHERE name = 'SK Gaming';
UPDATE teams SET portrait = 'portraits/wiki/SK_Gaminglogo_Since_1997.png' WHERE name = 'SK Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/SUPA_HOT_CREWlogo_square.png' WHERE name = 'SUPA HOT CREW';
UPDATE teams SET portrait = 'portraits/wiki/SUPA_HOT_CREWlogo_square.png' WHERE name = 'SUPA HOT CREW';
UPDATE organisations SET portrait = 'portraits/wiki/Team_ROCCAT_S4_LCS_Spring.jpg' WHERE name = 'Team ROCCAT';
UPDATE teams SET portrait = 'portraits/wiki/Team_ROCCAT_S4_LCS_Spring.jpg' WHERE name = 'Team ROCCAT';
UPDATE organisations SET portrait = 'portraits/wiki/Counter_Logic_Gaming_S3_LCS_Spring.jpg' WHERE name = 'CLG';
UPDATE teams SET portrait = 'portraits/wiki/Counter_Logic_Gaming_S3_LCS_Spring.jpg' WHERE name = 'CLG';
UPDATE organisations SET portrait = 'portraits/wiki/Evil_Geniuseslogo_square.png' WHERE name = 'Evil Geniuses';
UPDATE teams SET portrait = 'portraits/wiki/Evil_Geniuseslogo_square.png' WHERE name = 'Evil Geniuses';
UPDATE organisations SET portrait = 'portraits/wiki/Good_Game_UniversityOldlogo_square.png' WHERE name = 'Team Coast';
UPDATE teams SET portrait = 'portraits/wiki/Good_Game_UniversityOldlogo_square.png' WHERE name = 'Team Coast';
UPDATE organisations SET portrait = 'portraits/wiki/Curse_Gaminglogo_square.png' WHERE name = 'Team Curse';
UPDATE teams SET portrait = 'portraits/wiki/Curse_Gaminglogo_square.png' WHERE name = 'Team Curse';
UPDATE organisations SET portrait = 'portraits/wiki/Team_DignitasOldlogo_square.png' WHERE name = 'Dignitas';
UPDATE teams SET portrait = 'portraits/wiki/Team_DignitasOldlogo_square.png' WHERE name = 'Dignitas';
UPDATE organisations SET portrait = 'portraits/wiki/TSM_2013.jpg' WHERE name = 'TSM';
UPDATE teams SET portrait = 'portraits/wiki/TSM_2013.jpg' WHERE name = 'TSM';
UPDATE organisations SET portrait = 'portraits/wiki/XDGG.jpg' WHERE name = 'XDG Gaming';
UPDATE teams SET portrait = 'portraits/wiki/XDGG.jpg' WHERE name = 'XDG Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/EP_Team_Photo.jpg' WHERE name = 'Energy Pacemaker.HK';
UPDATE teams SET portrait = 'portraits/wiki/EP_Team_Photo.jpg' WHERE name = 'Energy Pacemaker.HK';
UPDATE organisations SET portrait = 'portraits/wiki/Invictus_Gaming_2012_Worlds.jpeg' WHERE name = 'Invictus Gaming';
UPDATE teams SET portrait = 'portraits/wiki/Invictus_Gaming_2012_Worlds.jpeg' WHERE name = 'Invictus Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/LGD_Gaming_logo_old.png' WHERE name = 'LGD Gaming';
UPDATE teams SET portrait = 'portraits/wiki/LGD_Gaming_logo_old.png' WHERE name = 'LGD Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Oh_My_God_Oldlogo_square.png' WHERE name = 'Oh My God';
UPDATE teams SET portrait = 'portraits/wiki/Oh_My_God_Oldlogo_square.png' WHERE name = 'Oh My God';
UPDATE organisations SET portrait = 'portraits/wiki/Positivenergy.jpg' WHERE name = 'Positive Energy';
UPDATE teams SET portrait = 'portraits/wiki/Positivenergy.jpg' WHERE name = 'Positive Energy';
UPDATE organisations SET portrait = 'portraits/wiki/SHR_2015_LPL_Spring.jpg' WHERE name = 'Royal Club';
UPDATE teams SET portrait = 'portraits/wiki/SHR_2015_LPL_Spring.jpg' WHERE name = 'Royal Club';
UPDATE organisations SET portrait = 'portraits/wiki/WE.png' WHERE name = 'Team WE';
UPDATE teams SET portrait = 'portraits/wiki/WE.png' WHERE name = 'Team WE';
UPDATE organisations SET portrait = 'portraits/wiki/Cjb.jpg' WHERE name = 'CJ Entus Blaze';
UPDATE teams SET portrait = 'portraits/wiki/Cjb.jpg' WHERE name = 'CJ Entus Blaze';
UPDATE organisations SET portrait = 'portraits/wiki/FrostLegacy.png' WHERE name = 'CJ Entus Frost';
UPDATE teams SET portrait = 'portraits/wiki/FrostLegacy.png' WHERE name = 'CJ Entus Frost';
UPDATE organisations SET portrait = 'portraits/wiki/KT_Rolster_Bulletslogo_square.png' WHERE name = 'KT Rolster Bullets';
UPDATE teams SET portrait = 'portraits/wiki/KT_Rolster_Bulletslogo_square.png' WHERE name = 'KT Rolster Bullets';
UPDATE organisations SET portrait = 'portraits/wiki/NJWS_OGN_Spring_2014.jpg' WHERE name = 'NaJin White Shield';
UPDATE teams SET portrait = 'portraits/wiki/NJWS_OGN_Spring_2014.jpg' WHERE name = 'NaJin White Shield';
UPDATE organisations SET portrait = 'portraits/wiki/SG_Blue_OGN_Spring_2014.jpg' WHERE name = 'Samsung Blue';
UPDATE teams SET portrait = 'portraits/wiki/SG_Blue_OGN_Spring_2014.jpg' WHERE name = 'Samsung Blue';
UPDATE organisations SET portrait = 'portraits/wiki/Samsung_Galaxy_Ozone_Logo.png' WHERE name = 'Samsung Ozone';
UPDATE teams SET portrait = 'portraits/wiki/Samsung_Galaxy_Ozone_Logo.png' WHERE name = 'Samsung Ozone';
UPDATE organisations SET portrait = 'portraits/wiki/SK_Telecom_T1_Slogo_square.png' WHERE name = 'SK Telecom T1 S';
UPDATE teams SET portrait = 'portraits/wiki/SK_Telecom_T1_Slogo_square.png' WHERE name = 'SK Telecom T1 S';
UPDATE organisations SET portrait = 'portraits/wiki/Midas_FIOlogo_square.png' WHERE name = 'Midas FIO';
UPDATE teams SET portrait = 'portraits/wiki/Midas_FIOlogo_square.png' WHERE name = 'Midas FIO';
UPDATE organisations SET portrait = 'portraits/wiki/NaJin_e-mFire_Sword.jpg' WHERE name = 'NaJin Black Sword';
UPDATE teams SET portrait = 'portraits/wiki/NaJin_e-mFire_Sword.jpg' WHERE name = 'NaJin Black Sword';
UPDATE organisations SET portrait = 'portraits/wiki/IM_logo.png' WHERE name = 'Incredible Miracle 1';
UPDATE teams SET portrait = 'portraits/wiki/IM_logo.png' WHERE name = 'Incredible Miracle 1';
UPDATE organisations SET portrait = 'portraits/wiki/Prime_Clanlogo_square.png' WHERE name = 'Prime Optimus';
UPDATE teams SET portrait = 'portraits/wiki/Prime_Clanlogo_square.png' WHERE name = 'Prime Optimus';
UPDATE organisations SET portrait = 'portraits/wiki/KT_Rolster_Arrowslogo_square.png' WHERE name = 'KT Rolster Arrows';
UPDATE teams SET portrait = 'portraits/wiki/KT_Rolster_Arrowslogo_square.png' WHERE name = 'KT Rolster Arrows';
UPDATE organisations SET portrait = 'portraits/wiki/Jin_Air_Green_Wings_Falconslogo_square.png' WHERE name = 'Jin Air Falcons';
UPDATE teams SET portrait = 'portraits/wiki/Jin_Air_Green_Wings_Falconslogo_square.png' WHERE name = 'Jin Air Falcons';
UPDATE organisations SET portrait = 'portraits/wiki/Incredible_Miracle_2logo_square.png' WHERE name = 'Incredible Miracle 2';
UPDATE teams SET portrait = 'portraits/wiki/Incredible_Miracle_2logo_square.png' WHERE name = 'Incredible Miracle 2';
UPDATE organisations SET portrait = 'portraits/wiki/Xenicslogo.png' WHERE name = 'Xenics Storm';
UPDATE teams SET portrait = 'portraits/wiki/Xenicslogo.png' WHERE name = 'Xenics Storm';
UPDATE players SET portrait = 'portraits/wiki/EG_Wickd_2013_Summer.png' WHERE name = 'Wickd';
UPDATE players SET portrait = 'portraits/wiki/ShookALL2014.png' WHERE name = 'Shook';
UPDATE players SET portrait = 'portraits/wiki/FroggenALL2014.png' WHERE name = 'Froggen';
UPDATE players SET portrait = 'portraits/wiki/S3_Tabzz.jpg' WHERE name = 'Tabzz';
UPDATE players SET portrait = 'portraits/wiki/SK_Nyph_2013_Summer.png' WHERE name = 'Nyph';
UPDATE players SET portrait = 'portraits/wiki/YoungBuckCW2014.png' WHERE name = 'YoungBuck';
UPDATE players SET portrait = 'portraits/wiki/CW_Amazing.jpg' WHERE name = 'Amazing';
UPDATE players SET portrait = 'portraits/wiki/Wolves_CowTard.jpg' WHERE name = 'cowTard';
UPDATE players SET portrait = 'portraits/wiki/CW_FORG1VEN.jpg' WHERE name = 'FORG1VEN';
UPDATE players SET portrait = 'portraits/wiki/UnlimitedCW2014.png' WHERE name = 'Unlimited';
UPDATE players SET portrait = 'portraits/wiki/GMB_Darien_2013_Summer.png' WHERE name = 'Darien';
UPDATE players SET portrait = 'portraits/wiki/S3_Zorozero.jpg' WHERE name = 'Zorozero';
UPDATE players SET portrait = 'portraits/wiki/GMB_Diamond_2013_Summer.png' WHERE name = 'Diamond';
UPDATE players SET portrait = 'portraits/wiki/S3_Alex_Ich.jpg' WHERE name = 'Alex Ich';
UPDATE players SET portrait = 'portraits/wiki/S3_Nukeduck.jpg' WHERE name = 'nukeduck';
UPDATE players SET portrait = 'portraits/wiki/GMB_Genja_2013_Summer.png' WHERE name = 'Genja';
UPDATE players SET portrait = 'portraits/wiki/CRS_EDward_2013_Summer.png' WHERE name = 'EDward';
UPDATE players SET portrait = 'portraits/wiki/SK_Kev1n_2013_Summer.png' WHERE name = 'kev1n';
UPDATE players SET portrait = 'portraits/wiki/LCS_Atn_araneae.png' WHERE name = 'Araneae';
UPDATE players SET portrait = 'portraits/wiki/MIL_Kottenx_2014_Summer.png' WHERE name = 'Kottenx';
UPDATE players SET portrait = 'portraits/wiki/LCS_Atn_kerp.png' WHERE name = 'Kerp';
UPDATE players SET portrait = 'portraits/wiki/LCS_Atn_creaton.png' WHERE name = 'Creaton';
UPDATE players SET portrait = 'portraits/wiki/LCS_Atn_jree.png' WHERE name = 'Jree';
UPDATE players SET portrait = 'portraits/wiki/Fredy.jpg' WHERE name = 'fredy122';
UPDATE players SET portrait = 'portraits/wiki/CW_Svenskeren_2013_Spring.png' WHERE name = 'Svenskeren';
UPDATE players SET portrait = 'portraits/wiki/JesizSK2014.png' WHERE name = 'Jesiz';
UPDATE players SET portrait = 'portraits/wiki/SK_CandyPanda_2013_Summer.png' WHERE name = 'CandyPanda';
UPDATE players SET portrait = 'portraits/wiki/NRatedSK2014.png' WHERE name = 'nRated';
UPDATE players SET portrait = 'portraits/wiki/NiPMimerS3Summer.jpg' WHERE name = 'Mimer';
UPDATE players SET portrait = 'portraits/wiki/SHCImpaler.jpg' WHERE name = 'Impaler';
UPDATE players SET portrait = 'portraits/wiki/SHCMoopz.jpg' WHERE name = 'Moopz';
UPDATE players SET portrait = 'portraits/wiki/SELFIESHC2014.png' WHERE name = 'SELFIE';
UPDATE players SET portrait = 'portraits/wiki/MrRallezSHC2014.png' WHERE name = 'MrRalleZ';
UPDATE players SET portrait = 'portraits/wiki/SHCMigxa2014Spring.jpg' WHERE name = 'Migxa';
UPDATE players SET portrait = 'portraits/wiki/XaxusROC2014.png' WHERE name = 'Xaxus';
UPDATE players SET portrait = 'portraits/wiki/JankosROC2014.png' WHERE name = 'Jankos';
UPDATE players SET portrait = 'portraits/wiki/OverpowROC2014.png' WHERE name = 'Overpow';
UPDATE players SET portrait = 'portraits/wiki/CelaverROC2014.png' WHERE name = 'Celaver';
UPDATE players SET portrait = 'portraits/wiki/VanderROC2014.png' WHERE name = 'VandeR';
UPDATE players SET portrait = 'portraits/wiki/Nientonsoh_-_Profile_Pic.jpg' WHERE name = 'Nien';
UPDATE players SET portrait = 'portraits/wiki/S3_dexter.jpg' WHERE name = 'dexter';
UPDATE players SET portrait = 'portraits/wiki/S3_clglink.jpg' WHERE name = 'Link';
UPDATE players SET portrait = 'portraits/wiki/CLG_HotshotGG.png' WHERE name = 'HotshotGG';
UPDATE players SET portrait = 'portraits/wiki/CLG_Chauster.png' WHERE name = 'Chauster';
UPDATE players SET portrait = 'portraits/wiki/CLG_Doublelift.png' WHERE name = 'Doublelift';
UPDATE players SET portrait = 'portraits/wiki/CLGAphromoo.jpg' WHERE name = 'aphromoo';
UPDATE players SET portrait = 'portraits/wiki/EG_InnoX_2014_Spring.jpg' WHERE name = 'InnoX';
UPDATE players SET portrait = 'portraits/wiki/EG_Snoopeh_2013_Summer.png' WHERE name = 'Snoopeh';
UPDATE players SET portrait = 'portraits/wiki/CLG_Thinkcard_2015.png' WHERE name = 'Thinkcard';
UPDATE players SET portrait = 'portraits/wiki/PobelterEG2014.png' WHERE name = 'Pobelter';
UPDATE players SET portrait = 'portraits/wiki/EG_yellowpete_2013_Summer.png' WHERE name = 'Yellowpete';
UPDATE players SET portrait = 'portraits/wiki/ROBERTxLEECOL2014.png' WHERE name = 'ROBERTxLEE';
UPDATE players SET portrait = 'portraits/wiki/EG_Krepo_2013_Summer.png' WHERE name = 'Krepo';
UPDATE players SET portrait = 'portraits/wiki/WFX-Ken-2015nacs.png' WHERE name = 'Ken';
UPDATE players SET portrait = 'portraits/wiki/Ggu_zionspartan_lcs.png' WHERE name = 'ZionSpartan';
UPDATE players SET portrait = 'portraits/wiki/Josh_Atkins.jpg' WHERE name = 'NintendudeX';
UPDATE players SET portrait = 'portraits/wiki/GGU_Shiphtur_2013_Spring.jpeg' WHERE name = 'Shiphtur';
UPDATE players SET portrait = 'portraits/wiki/Coast_wizfujin.png' WHERE name = 'WizFujiiN';
UPDATE players SET portrait = 'portraits/wiki/S3_cstdaydreamin_2.jpg' WHERE name = 'Daydreamin';
UPDATE players SET portrait = 'portraits/wiki/QuasCRS2014.png' WHERE name = 'Quas';
UPDATE players SET portrait = 'portraits/wiki/Diwilldominate.jpeg' WHERE name = 'IWDominate';
UPDATE players SET portrait = 'portraits/wiki/Clgnavoyboy.jpg' WHERE name = 'Voyboy';
UPDATE players SET portrait = 'portraits/wiki/Crs_cop_lcs.png' WHERE name = 'Cop';
UPDATE players SET portrait = 'portraits/wiki/Crs_zekent.png' WHERE name = 'Zekent';
UPDATE players SET portrait = 'portraits/wiki/CLG_saintvicious.png' WHERE name = 'Saintvicious';
UPDATE players SET portrait = 'portraits/wiki/CRS_BunnyFuFuu_2014_Spring.png' WHERE name = 'BunnyFuFuu';
UPDATE players SET portrait = 'portraits/wiki/Dig_cruzer.png' WHERE name = 'Cruzer';
UPDATE players SET portrait = 'portraits/wiki/Dcrumbzz.jpg' WHERE name = 'Crumbzz';
UPDATE players SET portrait = 'portraits/wiki/S3_digscarra.jpg' WHERE name = 'Scarra';
UPDATE players SET portrait = 'portraits/wiki/T8_Goldenglue_2015_Summer.png' WHERE name = 'goldenglue';
UPDATE players SET portrait = 'portraits/wiki/Dimaqtpie.jpg' WHERE name = 'Imaqtpie';
UPDATE players SET portrait = 'portraits/wiki/Dignitas-kiwikid.jpg' WHERE name = 'KiWiKiD';
UPDATE players SET portrait = 'portraits/wiki/ESPORTS_PLYRPROFILE_TSM_DYRUS_.jpg' WHERE name = 'Dyrus';
UPDATE players SET portrait = 'portraits/wiki/TSM_TheOddOne_2013_Spring.jpg' WHERE name = 'TheOddOne';
UPDATE players SET portrait = 'portraits/wiki/NiP_Bjergsen.jpg' WHERE name = 'Bjergsen';
UPDATE players SET portrait = 'portraits/wiki/ESPORTS_PLYRPROFILE_TSM_REGINALD.jpg' WHERE name = 'Reginald';
UPDATE players SET portrait = 'portraits/wiki/TurtleSF.jpg' WHERE name = 'WildTurtle';
UPDATE players SET portrait = 'portraits/wiki/ESPORTS_PLYRPROFILE_TSM_XPECIAL.jpg' WHERE name = 'Xpecial';
UPDATE players SET portrait = 'portraits/wiki/S3_vulsychosid.jpg' WHERE name = 'Benny';
UPDATE players SET portrait = 'portraits/wiki/S3_vulzuna.jpg' WHERE name = 'Zuna';
UPDATE players SET portrait = 'portraits/wiki/COL_Nickwu_2013_Spring.png' WHERE name = 'Nickwu';
UPDATE players SET portrait = 'portraits/wiki/S3_vulmancloud.jpg' WHERE name = 'Mancloud';
UPDATE players SET portrait = 'portraits/wiki/Xmisf.jpg' WHERE name = 'Xmithie';
UPDATE players SET portrait = 'portraits/wiki/S3_vulbloodwater.jpg' WHERE name = 'BloodWater';
UPDATE players SET portrait = 'portraits/wiki/XDG_Sheep_2014_Spring.png' WHERE name = 'Sheep';
UPDATE players SET portrait = 'portraits/wiki/EDG_Fireloli.jpg' WHERE name = 'Fireloli';
UPDATE players SET portrait = 'portraits/wiki/EDG_Namei_Summer2014.jpg' WHERE name = 'NaMe1';
UPDATE players SET portrait = 'portraits/wiki/YCSM_GodJ.jpg' WHERE name = 'AmazingJ';
UPDATE players SET portrait = 'portraits/wiki/EP.HK_BuPing.png' WHERE name = 'BuPingZ';
UPDATE players SET portrait = 'portraits/wiki/EP.HK_SuperCat.png' WHERE name = 'SuperC4t';
UPDATE players SET portrait = 'portraits/wiki/WY_kane_2016_Spring.jpg' WHERE name = 'k4ne';
UPDATE players SET portrait = 'portraits/wiki/EP.HK_DomhoX.png' WHERE name = 'DomhoXz';
UPDATE players SET portrait = 'portraits/wiki/Igpdd.png' WHERE name = 'PDD520';
UPDATE players SET portrait = 'portraits/wiki/IGillusion.jpg' WHERE name = 'illuSioN';
UPDATE players SET portrait = 'portraits/wiki/IG-Zitai-2015lpl.jpg' WHERE name = 'Zz1tai';
UPDATE players SET portrait = 'portraits/wiki/IGkid.jpg' WHERE name = 'Kid';
UPDATE players SET portrait = 'portraits/wiki/IG_Kitties_2015_Spring.jpg' WHERE name = 'Kitties';
UPDATE players SET portrait = 'portraits/wiki/EPA_Star_2016_Spring.png' WHERE name = 'Star';
UPDATE players SET portrait = 'portraits/wiki/LGD_TBQ_2015_Summer.png' WHERE name = 'Quan';
UPDATE players SET portrait = 'portraits/wiki/LuciferYYY.jpg' WHERE name = 'Rena';
UPDATE players SET portrait = 'portraits/wiki/WE_Styz.jpg' WHERE name = 'Styz';
UPDATE players SET portrait = 'portraits/wiki/LGD_Pyl2014Summer.png' WHERE name = 'Pyl';
UPDATE players SET portrait = 'portraits/wiki/OMG_Gogoin.jpg' WHERE name = 'GGoing';
UPDATE players SET portrait = 'portraits/wiki/PHX_Pomelo.jpg' WHERE name = 'pomelo';
UPDATE players SET portrait = 'portraits/wiki/OMG-xiyang-2015lpl.jpg' WHERE name = 'xiyang';
UPDATE players SET portrait = 'portraits/wiki/PHX_Santa.jpg' WHERE name = 'Cool';
UPDATE players SET portrait = 'portraits/wiki/OMG_San.jpg' WHERE name = 'San';
UPDATE players SET portrait = 'portraits/wiki/OMG_Lovelin.jpg' WHERE name = 'Allen';
UPDATE players SET portrait = 'portraits/wiki/Canines2.jpg' WHERE name = 'Aluk0';
UPDATE players SET portrait = 'portraits/wiki/PE_JoJo_2015.jpg' WHERE name = 'JOJO';
UPDATE players SET portrait = 'portraits/wiki/LZQ_Glutton_2018_Spring.png' WHERE name = 'Face';
UPDATE players SET portrait = 'portraits/wiki/OMG_Dada777_2014_WCS.jpg' WHERE name = 'DaDa7';
UPDATE players SET portrait = 'portraits/wiki/LM_Dreams.jpg' WHERE name = 'Yao';
UPDATE players SET portrait = 'portraits/wiki/S3_Royal_Uzi.png' WHERE name = 'Uzi';
UPDATE players SET portrait = 'portraits/wiki/King_Leym_2015.jpg' WHERE name = 'LeY';
UPDATE players SET portrait = 'portraits/wiki/Royal_Rui.jpg' WHERE name = 'Rui';
UPDATE players SET portrait = 'portraits/wiki/Pandab.jpg' WHERE name = 'Bao';
UPDATE players SET portrait = 'portraits/wiki/WE_Caomei.jpg' WHERE name = 'CaoMei';
UPDATE players SET portrait = 'portraits/wiki/WE_Ruo.jpg' WHERE name = 'Ruo';
UPDATE players SET portrait = 'portraits/wiki/WE_mrsj_2016_Spring.png' WHERE name = 'suk1M';
UPDATE players SET portrait = 'portraits/wiki/Wx.jpg' WHERE name = 'Wx';
UPDATE players SET portrait = 'portraits/wiki/WE_Canon_2015.jpg' WHERE name = 'Conan';
UPDATE players SET portrait = 'portraits/wiki/FlameCJB2014.png' WHERE name = 'Flame';
UPDATE players SET portrait = 'portraits/wiki/DayDreamCJB2014.png' WHERE name = 'DayDream';
UPDATE players SET portrait = 'portraits/wiki/MiG_Ambition.png' WHERE name = 'Ambition';
UPDATE players SET portrait = 'portraits/wiki/Cjbemperor.png' WHERE name = 'Emperor';
UPDATE players SET portrait = 'portraits/wiki/MiG_Lustboy.png' WHERE name = 'Lustboy';
UPDATE players SET portrait = 'portraits/wiki/Azubufshy.jpg' WHERE name = 'Shy';
UPDATE players SET portrait = 'portraits/wiki/QG-Swift-2015lpl.jpg' WHERE name = 'Swift';
UPDATE players SET portrait = 'portraits/wiki/CoCoCJF2014.png' WHERE name = 'Coco';
UPDATE players SET portrait = 'portraits/wiki/NEB_Badagaje.png' WHERE name = 'Space';
UPDATE players SET portrait = 'portraits/wiki/MiG_MadLife.png' WHERE name = 'MadLife';
UPDATE players SET portrait = 'portraits/wiki/NJBS_Duke.jpg' WHERE name = 'Leopard';
UPDATE players SET portrait = 'portraits/wiki/SHR_inSec_2014_WCS.jpg' WHERE name = 'inSec';
UPDATE players SET portrait = 'portraits/wiki/ST_Ryu.png' WHERE name = 'Ryu';
UPDATE players SET portrait = 'portraits/wiki/ST_Joker.png' WHERE name = 'Score';
UPDATE players SET portrait = 'portraits/wiki/ST_MaFa.png' WHERE name = 'Mafa';
UPDATE players SET portrait = 'portraits/wiki/SHR_Zero_2014_WCS.jpg' WHERE name = 'Zero';
UPDATE players SET portrait = 'portraits/wiki/NJWS_Save.jpg' WHERE name = 'Save';
UPDATE players SET portrait = 'portraits/wiki/Najinswwatch.jpeg' WHERE name = 'Watch';
UPDATE players SET portrait = 'portraits/wiki/NJWS_Ggoong_2.jpg' WHERE name = 'Ggoong';
UPDATE players SET portrait = 'portraits/wiki/NJWS_Zefa_2.jpg' WHERE name = 'Zefa';
UPDATE players SET portrait = 'portraits/wiki/NJWS_GorillA_2.jpg' WHERE name = 'GorillA';
UPDATE players SET portrait = 'portraits/wiki/SG_Blue_Acorn.png' WHERE name = 'Acorn';
UPDATE players SET portrait = 'portraits/wiki/SG_Blue_Spirit.png' WHERE name = 'Spirit';
UPDATE players SET portrait = 'portraits/wiki/MVPOzoneDade.jpg' WHERE name = 'DADE';
UPDATE players SET portrait = 'portraits/wiki/SG_Blue_Deft.png' WHERE name = 'Deft';
UPDATE players SET portrait = 'portraits/wiki/SG_Blue_Heart.png' WHERE name = 'Heart';
UPDATE players SET portrait = 'portraits/wiki/S3_Looper.jpg' WHERE name = 'Looper';
UPDATE players SET portrait = 'portraits/wiki/SS_YaNgSin.jpg' WHERE name = 'DanDy';
UPDATE players SET portrait = 'portraits/wiki/SSW_PawN_2014_WCS.png' WHERE name = 'PawN';
UPDATE players SET portrait = 'portraits/wiki/Sgo_imp.jpg' WHERE name = 'imp';
UPDATE players SET portrait = 'portraits/wiki/Sgo_mata.jpg' WHERE name = 'Mata';
UPDATE players SET portrait = 'portraits/wiki/IceBear.jpg' WHERE name = 'Casper';
UPDATE players SET portrait = 'portraits/wiki/SKT_T1_S_MaRin.jpg' WHERE name = 'MaRin';
UPDATE players SET portrait = 'portraits/wiki/SKT_T1_S_H0R0.jpg' WHERE name = 'H0R0';
UPDATE players SET portrait = 'portraits/wiki/SKT_T1_S_Easyhoon.jpg' WHERE name = 'Easyhoon';
UPDATE players SET portrait = 'portraits/wiki/SKT_T1_S_Bang.jpg' WHERE name = 'Bang';
UPDATE players SET portrait = 'portraits/wiki/Wolf.jpg' WHERE name = 'Wolf';
UPDATE players SET portrait = 'portraits/wiki/G2_Expect_2016_Summer.png' WHERE name = 'Expect';
UPDATE players SET portrait = 'portraits/wiki/PaiN_Lactea.png' WHERE name = 'Lactea';
UPDATE players SET portrait = 'portraits/wiki/HKE_Olleh_2016_Spring.png' WHERE name = 'ANNA';
UPDATE players SET portrait = 'portraits/wiki/NJBS_Limit.jpg' WHERE name = 'Limit';
UPDATE players SET portrait = 'portraits/wiki/MiG_Helios.png' WHERE name = 'Helios';
UPDATE players SET portrait = 'portraits/wiki/NJBS_Nagne_2013_WCS.png' WHERE name = 'Nagne';
UPDATE players SET portrait = 'portraits/wiki/Najinswprav.jpg' WHERE name = 'PraY';
UPDATE players SET portrait = 'portraits/wiki/Najinswcain.jpg' WHERE name = 'Cain';
UPDATE players SET portrait = 'portraits/wiki/SmebIM12014.png' WHERE name = 'Smeb';
UPDATE players SET portrait = 'portraits/wiki/OP_Lilac.png' WHERE name = 'Lil4c';
UPDATE players SET portrait = 'portraits/wiki/LGmidking.jpg' WHERE name = 'Midking';
UPDATE players SET portrait = 'portraits/wiki/MKZ_Violet.png' WHERE name = 'Violet';
UPDATE players SET portrait = 'portraits/wiki/BBuingIM12014.png' WHERE name = 'Bbuing';
UPDATE players SET portrait = 'portraits/wiki/NBY_Khan_2016_Summer.png' WHERE name = 'Hanlabong';
UPDATE players SET portrait = 'portraits/wiki/EEW_OldB_2017_Spring.png' WHERE name = 'Old B';
UPDATE players SET portrait = 'portraits/wiki/WE_Ninja_2015.jpg' WHERE name = 'Ninja';
UPDATE players SET portrait = 'portraits/wiki/SamsungFury2015.jpg' WHERE name = 'ZetNjin';
UPDATE players SET portrait = 'portraits/wiki/EEW_Kkyul_2017_Spring.png' WHERE name = 'Kkyul';
UPDATE players SET portrait = 'portraits/wiki/KT_Arrows_ssumday.jpg' WHERE name = 'Ssumday';
UPDATE players SET portrait = 'portraits/wiki/KT_Arrows_KaKAO.jpg' WHERE name = 'KaKAO';
UPDATE players SET portrait = 'portraits/wiki/KT_Arrows_Rookie.jpg' WHERE name = 'RooKie';
UPDATE players SET portrait = 'portraits/wiki/KT_Arrows_Arrow.jpg' WHERE name = 'Arrow';
UPDATE players SET portrait = 'portraits/wiki/KT_Arrows_Hachani_2.jpg' WHERE name = 'Hachani';
UPDATE players SET portrait = 'portraits/wiki/Tl-fenix-2015spring.jpg' WHERE name = 'MisSo';
UPDATE players SET portrait = 'portraits/wiki/ChaserJAS2014.png' WHERE name = 'RealFoxy';
UPDATE players SET portrait = 'portraits/wiki/JAG_GBM_2015_Split_1.png' WHERE name = 'GBM';
UPDATE players SET portrait = 'portraits/wiki/WE_Mystic_2015_Summer.png' WHERE name = 'Mystic';
UPDATE players SET portrait = 'portraits/wiki/CJkkinsh.jpg' WHERE name = 'Kish';
UPDATE players SET portrait = 'portraits/wiki/IM_Apple_2015_Summer.png' WHERE name = 'Apple';
UPDATE players SET portrait = 'portraits/wiki/Fnatic-reignover-2015spring.jpg' WHERE name = 'Reign over';
UPDATE players SET portrait = 'portraits/wiki/NJB_KurO_2014_Summer.jpg' WHERE name = 'Kuro';
UPDATE players SET portrait = 'portraits/wiki/MKZ_Betkyo.png' WHERE name = 'BetKyo';
UPDATE players SET portrait = 'portraits/wiki/OP_Paragon.png' WHERE name = 'Paragon';
UPDATE players SET portrait = 'portraits/wiki/Falcons_Vin.jpg' WHERE name = 'Vin';
UPDATE players SET portrait = 'portraits/wiki/IMT_7h_Alvingo1.jpg' WHERE name = 'Alvingo';
UPDATE players SET portrait = 'portraits/wiki/NJBS_Ohq.jpg' WHERE name = 'Ohq';
UPDATE players SET portrait = 'portraits/wiki/CheiJAS2014.png' WHERE name = 'ink';

-- Other 2014 leagues are in the world. A career does not start there.
-- EU Challenger Series: https://lol.fandom.com/wiki/EU_Challenger_Series/2014_Season
-- NA Challenger Series: https://lol.fandom.com/wiki/NA_Challenger_Series/2014_Season
-- LSPL: https://lol.fandom.com/wiki/LSPL/2014_Season/Spring (region line China, server CN)
-- NLB: https://lol.fandom.com/wiki/NLB/2014_Season/Spring_Season (region KR)
-- GPL: https://lol.fandom.com/wiki/2014_GPL (12 teams, two Worlds spots: summer winner and circuit points)
-- CBLOL: https://lol.fandom.com/wiki/CBLOL/2014_Season/Champions_Series (six teams in the group)
-- Latin America Cup: https://lol.fandom.com/wiki/Latin_America_Cup_2014 (region LAT)
-- TCL: https://lol.fandom.com/wiki/TCL/2014_Season (region TR)
-- Oceanic Regional Tournament: https://lol.fandom.com/wiki/2014_Oceanic_Regional_Tournament/Autumn (region Oceania)
-- Worlds slots for EU LCS, NA LCS, LPL and Champions are the three seeds on https://lol.fandom.com/wiki/2014_Season_World_Championship
-- MSI does not exist in 2014. A league without a direct Worlds seed keeps that number empty.
-- SLTV StarSeries is listed under CIS on the 2014 cycle page, and its own region line says Europe, so it is not stored as a CIS league.
INSERT INTO leagues (id, name, region, tier, presence, portrait) VALUES
    ('e7d3865c-b54b-465c-8206-40eeb8b9ba60', 'EU Challenger Series', 'EU', 'secondary', 'in_world', NULL),
    ('6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 'NA Challenger Series', 'NA', 'secondary', 'in_world', NULL),
    ('bb744890-8f94-42d0-bca4-8cfa772784ca', 'LSPL', 'CN', 'secondary', 'in_world', NULL),
    ('d1d82d6b-b5cf-429d-b225-34cd7080b89a', 'NLB', 'KR', 'secondary', 'in_world', NULL),
    ('2b171fa1-5597-43b0-9a32-fafcb2ec6915', 'GPL', 'SEA', 'primary', 'in_world', NULL),
    ('da95c98d-435f-4771-9d8e-0f09b18860db', 'CBLOL', 'BR', 'primary', 'in_world', NULL),
    ('e289a5db-db2a-43ce-ba5a-2db886cd742d', 'Latin America Cup', 'LAT', 'primary', 'in_world', NULL),
    ('2cf54a7e-c0f9-4886-ba60-6f7d1cc3efea', 'TCL', 'TR', 'primary', 'in_world', NULL),
    ('60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 'Oceanic Regional Tournament', 'Oceania', 'primary', 'in_world', NULL);
INSERT INTO league_seasons (league_id, year, team_count, msi_slots, worlds_slots, salary_cap_kind, salary_cap_amount) VALUES
    ('e7d3865c-b54b-465c-8206-40eeb8b9ba60', 2014, NULL, 0, NULL, NULL, NULL),
    ('6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL, 0, NULL, NULL, NULL),
    ('bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL, 0, NULL, NULL, NULL),
    ('d1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL, 0, NULL, NULL, NULL),
    ('2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, 12, 0, 2, NULL, NULL),
    ('da95c98d-435f-4771-9d8e-0f09b18860db', 2014, 6, 0, NULL, NULL, NULL),
    ('e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL, 0, NULL, NULL, NULL),
    ('2cf54a7e-c0f9-4886-ba60-6f7d1cc3efea', 2014, NULL, 0, NULL, NULL, NULL),
    ('60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 2014, NULL, 0, NULL, NULL, NULL);

-- Opening 2014 rosters of the leagues that stay in the world. Coaches are left out. A player already on a team stays there.
-- EU Challenger Series/2014 Season/Spring Series 1/Team Rosters: https://lol.fandom.com/wiki/EU_Challenger_Series/2014_Season/Spring_Series_1/Team_Rosters
-- NA Challenger Series/2014 Season/Spring Series 1: https://lol.fandom.com/wiki/NA_Challenger_Series/2014_Season/Spring_Series_1
-- LSPL/2014 Season/Spring/Team Rosters: https://lol.fandom.com/wiki/LSPL/2014_Season/Spring/Team_Rosters
-- NLB/2014 Season/Spring Season: https://lol.fandom.com/wiki/NLB/2014_Season/Spring_Season
-- 2014 GPL Spring/Team Rosters: https://lol.fandom.com/wiki/2014_GPL_Spring/Team_Rosters
-- CBLOL/2014 Season/Champions Series/Team Rosters: https://lol.fandom.com/wiki/CBLOL/2014_Season/Champions_Series/Team_Rosters
-- Riot Latin America Cup 2014/Chile: https://lol.fandom.com/wiki/Riot_Latin_America_Cup_2014/Chile
-- Riot Latin America Cup 2014/Argentina/Team Rosters: https://lol.fandom.com/wiki/Riot_Latin_America_Cup_2014/Argentina/Team_Rosters
-- Riot Latin America Cup 2014/Colombia/Team Rosters: https://lol.fandom.com/wiki/Riot_Latin_America_Cup_2014/Colombia/Team_Rosters
-- Mexico National League 2014/Season 1: https://lol.fandom.com/wiki/Mexico_National_League_2014/Season_1
-- TCL/2014 Season/Winter/Regular Season/Team Rosters: https://lol.fandom.com/wiki/TCL/2014_Season/Winter/Regular_Season/Team_Rosters
-- 2014 Oceanic Regional Tournament/Autumn/Team Rosters: https://lol.fandom.com/wiki/2014_Oceanic_Regional_Tournament/Autumn/Team_Rosters
INSERT INTO organisations (id, name, region, history, staff_seats, scrim_room, gaming_house, chef, jersey_name, budget, wage_bill, fan_count, fan_mood, portrait) VALUES
    ('684ca8ca-9e9b-4ce2-b0bc-3e8013c44b2f', 'Cloud9 Eclipse', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b9429c55-7efb-4b89-89f5-3d579c075288', 'EYES ON U', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c318de6c-d078-4145-8cc6-9a469d3c2675', 'MeetYourMakers', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9e13a007-f77f-4c57-b4ee-0873420db581', 'Ninjas in Pyjamas', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5142bf7b-d0f1-40cb-be73-79673936df22', 'Pulse Esports', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('986c7ce8-45d1-4c23-b987-cd6ed3da796d', 'SK Gaming Prime', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ecfd861c-ac77-4253-9509-6f185ac1f31a', 'Storm Games Clan', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ba088a5f-efca-4a9f-a436-11347a3af709', 'Tick Trick and Duck', 'EU', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('02a29549-3683-4a61-b616-9754f4e54ae7', 'Cloud9 Tempest', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9980cf8e-b89a-4f04-902f-7e54ac3ab710', 'COGnitive Gaming', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d8b474db-808d-4b7d-a0e6-c519c64f1a33', 'compLexity Gaming', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('70b16f22-2473-4394-b09e-c4b558429b52', 'Curse Academy', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('eb331307-2a92-4bfa-8666-a694bb003592', 'LMQ', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2d0301de-410a-4188-bd0b-1f2e12ba114a', 'vVv Gaming', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0e799ef7-a77e-471a-9e89-1b9f9b6b286b', 'y so E-Sports', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('128520c2-5158-44f8-827d-4da2e6633018', 'Challenger8', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3340c980-18c6-4a65-846b-6f8d2fdcd33e', 'COGnitive Gaming Forge', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('48bcaecd-5710-4a99-98ca-854f571698b8', 'Crossover eSports', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e82572d1-6e7d-4f9d-87ea-fb422a1a47e7', 'Girlfriends', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2eac2aab-5223-426f-99c2-ebff28c3db33', 'Jet Fuel', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('60ff402a-1dd2-4a8b-aa2c-f90a53cb7252', 'kimchi 2 spicy', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8bdfa0ee-c55a-4a5b-9304-5947a98d4750', 'No Big Deal', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0008e43d-a87d-4ba0-a974-5e94ad9d1bdf', 'Pink Pwnys', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a05e388c-07ba-4c0f-b6e2-53757cbe9a27', 'Team Green Forest', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('73e7b621-94cb-4dab-aef7-55298bf97e98', 'Team LoLPro', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('637f33ec-6c8e-4b0b-b744-2ee8e3df68d6', 'Team Tempest', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1fb3f89b-1799-495f-9ecd-5fcd9c9d6ba4', 'TINT Gaming', 'NA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0b07755d-1ef5-467e-9c9f-220fbb7ec00c', 'AcFun e-Sports Club', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3306d116-1516-4f47-aa75-e19de6edf06c', 'EP.The One', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('08d4d9af-4fbb-4e59-9381-a881de3a5c3c', 'Gamefy', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1b27b9ef-eca8-4046-8e53-315028c58373', 'Kx.Cash', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f025fe62-d9b3-456e-98f1-8b651e6ecae8', 'Kx.Happy', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7db46e95-15e2-4bf9-867b-f0dba9fba42d', 'Titan Catipay', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4d142b45-2741-471a-a6bf-855c634ff3b9', 'Team DK', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('96311494-dca2-48b4-b8e4-cfeb77563751', 'Vici Esports', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fbce19fd-2edf-4a77-a316-48652443d1cf', 'Vici Gaming', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0f5af3ab-978c-4818-a309-5be460960c3b', 'Wings of Aurora', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('86378884-7341-4fbb-853e-6006d292605a', 'Young Glory', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('11d4138c-a373-4d14-a743-7f3d22bbfe37', 'Alienware Arena', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d01ba16e-4ea8-4f29-a3c1-67936f1f0bca', 'Alienware TOP', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1ac2b860-f884-474c-b587-008e4ba8f562', 'Athene Skype', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('07c66d93-2ac8-4bf6-acbb-0b098d35d787', 'Bigfile Amor', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bdd255cd-b7de-427f-a497-a3ae9003919d', 'Bigfile Miracle', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c6d153d8-88d1-4b3e-b4bb-0ab1078b8887', 'God-sin', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ad2b1bfd-6ae7-4a07-bc5c-b6ed530bd3d7', 'Invengers', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('869b37e8-f538-47a6-8435-d47f5023ddf7', 'Jin Air Stealths', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3dfb215a-f777-42a2-9695-d9db17587499', 'Let it go', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c863b4df-34c6-4db0-8a5a-473461231173', 'Mook Comet', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('015ad4bb-99fc-4673-8dba-d23aa690b3fd', 'Mook Secret', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('32c08031-a617-4a3c-912b-96450740e7ec', 'OX', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('deada94c-f103-405c-a007-9ed7215a68f0', 'Pyeongchon High School', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1603c897-af5f-4b9f-93d6-4770bf8fc7d3', 'Rascal Jester', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d073f36c-d66c-4e52-906b-67aaf98488f3', 'Team OLYMPUS', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('96da50a5-a264-42fc-b967-6c840dfe87a4', 'VTG 2', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('da16729d-77ef-46b0-b47b-c6ecca643f17', 'ahq eSports Club', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('21946b17-6b0b-439e-9df4-f42ad3e43184', 'Bangkok Titans', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('086f44b0-08ca-46ae-8ad1-4fb17f18f6c6', 'Imperium Pro Team', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a06c617e-bb76-4b05-9dc8-9dec860d7ff4', 'Insidious Gaming', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8ce70c0a-8289-4f8b-83a8-aa08f41a3abc', 'Saigon Jokers', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6dab4e31-6900-433f-9622-7ec1a1d826e3', 'Taipei Snipers', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('183fd46c-e7e7-44e4-b1ae-5e6a2244b904', 'Manila Eagles', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e84840e0-515d-4fc5-9d70-157cea9eb71d', 'Saigon Fantastic Five', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('87a621a6-e3dc-4e6a-a06e-a5b793bd3401', 'Singapore Sentinels', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7f5a2f13-7247-42c1-b9cd-efa01e47fbe8', 'Taipei Assassins', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('64b82267-e5d1-474e-9651-8ed574608e81', 'yoe Flash Wolves', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a69f5df4-c7e9-44e4-9a7e-a38a5726bee8', 'CNB e-Sports Club', 'BR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('53e9b580-dac8-4298-a4d2-f5b95f914d80', 'KaBuM! Esports', 'BR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a509c789-44a2-49d0-8aaf-3edad207b536', 'Keyd Stars', 'BR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('50219b75-6b05-4904-ab6f-a21b9ab3b745', 'paiN Gaming', 'BR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('527afc75-60db-43d9-9072-1a3e972927ca', 'Team awp', 'BR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('888ec148-19a9-40e2-bd25-05cdb230f19d', 'Team United', 'BR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0c6c9ffd-629f-4ff7-92ec-c3462ce24489', 'Furious Gaming', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e7a3b7a3-b675-4b45-8735-0fb7dbfea21e', 'Kaos Latin Gamers', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1360f389-ca50-472b-98e6-b2fa1bc1a54f', 'Pineapple Express', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e7f2c66c-6293-41ba-9cdb-190068857221', 'Red Arrows Team', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b2673fd6-526c-4f19-96b0-bdba501a272a', 'Seven Wars Lyon', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('22a45e0d-7c04-477e-9b44-71c3fc4c02bc', 'Team Quetzal', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d308dd07-7505-47c1-aa4f-9e7bd13e7a05', 'Dash9 Gaming', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('78d3f023-e0ea-42d9-bc63-f8833eb5906f', 'Tesla Gaming', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bfb6fbbe-4bec-449c-a0db-649103ad34d3', 'Lyon Gaming', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7fb71e50-e0a9-4eb0-a53e-1da6958944eb', 'Isurus', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d45d3a43-cbcd-44d6-a7ec-6b154566ca7c', 'Renegades of Hell', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b967f858-0f8b-446b-959b-bfa298eda8ee', 'Bencheados de KLG', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('37dd44d6-eb7c-45c8-af13-ce612e1b46b5', 'BrawL eSports', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1312155b-89a5-4c30-9276-b1db884e77de', 'Satori', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('43e55eac-a075-40c1-b762-aed671ea9093', 'Borrowed Time', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b4d926f8-3660-4f44-9cf9-cef0316d33ae', 'Destroy Gaming', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('524feff0-4e3f-47bf-a8ed-2a8c3a55e5a7', 'RAWR', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('82e7cbff-e94c-45ac-8fb2-7c9cf014b720', 'The Last Resistance', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6ac2f007-441c-4b35-ad2d-4ec06af773f9', 'Yisus traia GA', 'LAT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('418977e0-2155-4adf-bf22-a406b8b8b91f', 'HWA Gaming', 'TR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('54119fcc-469b-49f7-a80e-2aea4824e971', 'ATLAS eSports Team', 'TR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('98a5178f-62a0-43a9-a9d7-d8c6bd0e3675', 'Dark Passage', 'TR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('847c2c67-8c7b-4fda-810d-d0199c46357f', 'ANT Gaming', 'TR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6d7f0368-e53f-4c80-b52e-c6f45b88098b', 'Team Turquality', 'TR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b894c988-3ff1-4c9d-9fab-11674c0def33', 'Big Plays Incorporated', 'TR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a6869cc7-1c20-47f3-94cd-5bf20be8705a', 'Always With Honor', 'TR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0c019588-ad9a-4469-9153-b02ef7505c33', 'Team Immunity', 'Oceania', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c1c24098-f62a-4b99-8456-668fc530fe95', 'Optic Snipers', 'Oceania', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9e38ee90-e850-499f-9eb5-9bfdcf352ac3', 'Little Wraith', 'Oceania', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6ee0b8ae-8ad2-4e2a-b782-eaccb8fbc4f1', 'Avant Garde Ascension', 'Oceania', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b27afee6-cd81-434c-8b17-f87357b626ac', 'Frenetic Array', 'Oceania', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3ba69797-73cc-4502-9a88-cbc458efddd9', 'Your Soul Shall Chuffer', 'Oceania', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6377f725-1a54-402a-ad3c-6075a1412c05', 'Team Nv', 'Oceania', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('98430641-bd86-47af-90bb-7b759e1a0d5f', 'Eviscerate', 'Oceania', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO teams (id, name, organisation_id, league_id, season_year, portrait) VALUES
    ('180ca826-9041-4f53-8edb-bbb1c69f0755', 'Cloud9 Eclipse', '684ca8ca-9e9b-4ce2-b0bc-3e8013c44b2f', 'e7d3865c-b54b-465c-8206-40eeb8b9ba60', 2014, NULL),
    ('b2f1cb10-48ab-406d-a435-60bfcfb13e6d', 'EYES ON U', 'b9429c55-7efb-4b89-89f5-3d579c075288', 'e7d3865c-b54b-465c-8206-40eeb8b9ba60', 2014, NULL),
    ('553bc53d-fa85-4925-8a32-49b73570a98c', 'MeetYourMakers', 'c318de6c-d078-4145-8cc6-9a469d3c2675', 'e7d3865c-b54b-465c-8206-40eeb8b9ba60', 2014, NULL),
    ('07ebcbcc-43a1-467f-a02e-e311dd728acb', 'Ninjas in Pyjamas', '9e13a007-f77f-4c57-b4ee-0873420db581', 'e7d3865c-b54b-465c-8206-40eeb8b9ba60', 2014, NULL),
    ('a77584a8-5c69-45e0-8509-77bc2a83105b', 'Pulse Esports', '5142bf7b-d0f1-40cb-be73-79673936df22', 'e7d3865c-b54b-465c-8206-40eeb8b9ba60', 2014, NULL),
    ('a927109d-e5d4-4e3c-89d4-1261332e4ee2', 'SK Gaming Prime', '986c7ce8-45d1-4c23-b987-cd6ed3da796d', 'e7d3865c-b54b-465c-8206-40eeb8b9ba60', 2014, NULL),
    ('d0064273-bcdb-40ca-8dd5-c46807053bc3', 'Storm Games Clan', 'ecfd861c-ac77-4253-9509-6f185ac1f31a', 'e7d3865c-b54b-465c-8206-40eeb8b9ba60', 2014, NULL),
    ('7a49f0a2-22fd-4b58-96b9-543355abd4e9', 'Tick Trick and Duck', 'ba088a5f-efca-4a9f-a436-11347a3af709', 'e7d3865c-b54b-465c-8206-40eeb8b9ba60', 2014, NULL),
    ('c9652800-4bdf-4d32-a133-a4b116ac31d1', 'Cloud9 Tempest', '02a29549-3683-4a61-b616-9754f4e54ae7', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('77f27be0-86f4-4094-bd07-b87841f007e5', 'COGnitive Gaming', '9980cf8e-b89a-4f04-902f-7e54ac3ab710', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('847311ca-a6c0-4f79-a717-f77fc7e0b1db', 'compLexity.Black', 'd8b474db-808d-4b7d-a0e6-c519c64f1a33', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('eff22c5a-fa9e-4e93-ad1f-520c8ea88eae', 'compLexity.Red', 'd8b474db-808d-4b7d-a0e6-c519c64f1a33', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('3a46ce7d-5032-4455-885f-105355777a58', 'Curse Academy', '70b16f22-2473-4394-b09e-c4b558429b52', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('bd913d3d-806f-4500-8c0e-60f57a065fd7', 'LMQ', 'eb331307-2a92-4bfa-8666-a694bb003592', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('ffcc2752-c61f-431e-8e25-bb4a73433b6b', 'vVv Gaming White', '2d0301de-410a-4188-bd0b-1f2e12ba114a', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('c0ae4083-77c9-404b-aea4-2988fb9443c5', 'y so E-Sports', '0e799ef7-a77e-471a-9e89-1b9f9b6b286b', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('b152ab80-622e-4167-9abe-897f2b9a8e5c', 'Challenger8', '128520c2-5158-44f8-827d-4da2e6633018', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('87e646e9-2408-4224-8a24-6a6770c51bf8', 'COGnitive Gaming Forge', '3340c980-18c6-4a65-846b-6f8d2fdcd33e', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('d572ef5d-18b6-446d-a29c-e385f2dcc86d', 'compLexity Academy', 'd8b474db-808d-4b7d-a0e6-c519c64f1a33', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('3f2a69f1-6510-4e51-be50-f7f616e4e2e1', 'Crossover eSports', '48bcaecd-5710-4a99-98ca-854f571698b8', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('058cb905-3ee3-4c23-97ab-7eeb4ffc7783', 'Girlfriends', 'e82572d1-6e7d-4f9d-87ea-fb422a1a47e7', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('e59a1de0-8100-4d9f-a803-6981da957be4', 'Jet Fuel', '2eac2aab-5223-426f-99c2-ebff28c3db33', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('8a6220a4-4e35-41b0-922a-8df981262634', 'kimchi 2 spicy', '60ff402a-1dd2-4a8b-aa2c-f90a53cb7252', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('d99eb69f-7091-45d8-8a33-50d75e5e0347', 'No Big Deal', '8bdfa0ee-c55a-4a5b-9304-5947a98d4750', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('11d46a75-f62c-4e70-a0be-ea38400572f1', 'Pink Pwnys', '0008e43d-a87d-4ba0-a974-5e94ad9d1bdf', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('6a19be8b-969f-4867-b75d-9be1d11a6da0', 'Team Green Forest', 'a05e388c-07ba-4c0f-b6e2-53757cbe9a27', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('0322e9f4-52ed-4388-91d1-105030e5e287', 'Team LoLPro', '73e7b621-94cb-4dab-aef7-55298bf97e98', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('846207e6-3c39-47d8-bc1d-c50d5296c010', 'Team Tempest', '637f33ec-6c8e-4b0b-b744-2ee8e3df68d6', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('9797d2e6-4d12-4d1d-872d-a9eb5a332357', 'TINT Gaming', '1fb3f89b-1799-495f-9ecd-5fcd9c9d6ba4', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('003475ee-3175-4af6-9a8b-bc954662e074', 'vVv Gaming Red', '2d0301de-410a-4188-bd0b-1f2e12ba114a', '6cd490ac-10bd-4dbb-9d3f-0ad55277b71d', 2014, NULL),
    ('467c6a53-a751-4429-8ebc-7e2833670986', 'AcFun e-Sports Club', '0b07755d-1ef5-467e-9c9f-220fbb7ec00c', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('94ddd53a-08b3-42bf-b88a-3d7c7c8f1afb', 'EP.The One', '3306d116-1516-4f47-aa75-e19de6edf06c', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('f4c1dd56-199f-41aa-8e5e-7f3046f3787d', 'Gamefy', '08d4d9af-4fbb-4e59-9381-a881de3a5c3c', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('d4497457-5af7-4678-bc66-50ad29adc696', 'Kx.Cash', '1b27b9ef-eca8-4046-8e53-315028c58373', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('ba4009ed-b0c1-4c42-bd77-290635d22c5a', 'Kx.Happy', 'f025fe62-d9b3-456e-98f1-8b651e6ecae8', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('b61e025e-bc5c-4ec0-a258-3444b03a830d', 'Titan Catipay', '7db46e95-15e2-4bf9-867b-f0dba9fba42d', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('dfa6bdeb-4041-4af7-a0c9-9d29394807f4', 'Team DK', '4d142b45-2741-471a-a6bf-855c634ff3b9', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('9f513f87-e8e7-4533-82c2-34f5daaf7788', 'Vici Esports', '96311494-dca2-48b4-b8e4-cfeb77563751', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('df5e485f-5136-494d-bfd6-3a7dd4ceab70', 'Vici Gaming', 'fbce19fd-2edf-4a77-a316-48652443d1cf', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('d72d39fa-8895-4b04-9a54-1c0f308545e5', 'Wings of Aurora', '0f5af3ab-978c-4818-a309-5be460960c3b', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('c7fc6f36-a10f-47b9-9c0e-eb1a393a2133', 'Young Glory', '86378884-7341-4fbb-853e-6006d292605a', 'bb744890-8f94-42d0-bca4-8cfa772784ca', 2014, NULL),
    ('dc647927-8541-4129-9ff9-8cbae0ff997b', 'Alienware Arena', '11d4138c-a373-4d14-a743-7f3d22bbfe37', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('6578c1ec-881b-4836-90b4-5c6972e16fb3', 'Alienware TOP', 'd01ba16e-4ea8-4f29-a3c1-67936f1f0bca', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('81937ca3-b070-4645-a780-0191197d6a37', 'Athene Skype', '1ac2b860-f884-474c-b587-008e4ba8f562', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('29fa1a87-774f-4d16-90f9-289a7d496452', 'Bigfile Amor', '07c66d93-2ac8-4bf6-acbb-0b098d35d787', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('6dc21f2f-3c6e-46b0-bdec-dfdfbb397277', 'Bigfile Miracle', 'bdd255cd-b7de-427f-a497-a3ae9003919d', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('79a55eee-84a8-46ec-8082-fb3a77d22ac7', 'God-sin', 'c6d153d8-88d1-4b3e-b4bb-0ab1078b8887', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('f1a25f34-788a-4bca-8fd8-75312169a66e', 'Invengers', 'ad2b1bfd-6ae7-4a07-bc5c-b6ed530bd3d7', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('620e3a7c-5f5f-4de4-a633-1770ef4a5bba', 'Jin Air Stealths', '869b37e8-f538-47a6-8435-d47f5023ddf7', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('437dce60-08d4-4ab7-b925-694a4b0c029e', 'Let it go', '3dfb215a-f777-42a2-9695-d9db17587499', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('3ba15f05-d443-49e3-be14-048092f5323c', 'Mook Comet', 'c863b4df-34c6-4db0-8a5a-473461231173', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('7ab469d7-6953-47a6-9d89-86f21e3da711', 'Mook Secret', '015ad4bb-99fc-4673-8dba-d23aa690b3fd', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('9cafc5a1-84a0-4bca-a38f-dd2d61210a18', 'OX', '32c08031-a617-4a3c-912b-96450740e7ec', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('67c9e62c-7197-4e88-ad80-f4bf6bd97bc1', 'Pyeongchon High School', 'deada94c-f103-405c-a007-9ed7215a68f0', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('1bf15560-d2fe-4b23-a584-a21edb703ab1', 'Rascal Jester', '1603c897-af5f-4b9f-93d6-4770bf8fc7d3', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('694b6e68-b1e3-4158-97da-eb208b5f949c', 'Team OLYMPUS', 'd073f36c-d66c-4e52-906b-67aaf98488f3', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('65df7c8a-a9c5-44b5-9526-a0aaf6a44392', 'VTG 2', '96da50a5-a264-42fc-b967-6c840dfe87a4', 'd1d82d6b-b5cf-429d-b225-34cd7080b89a', 2014, NULL),
    ('772b83e7-506d-4d7c-a0e8-ce908009b94f', 'ahq eSports Club', 'da16729d-77ef-46b0-b47b-c6ecca643f17', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('f3be8875-305b-477a-b1b4-7b5a0402e6ab', 'Bangkok Titans', '21946b17-6b0b-439e-9df4-f42ad3e43184', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('03fba709-2391-4e93-9fc2-528dd0243e37', 'Imperium Pro Team', '086f44b0-08ca-46ae-8ad1-4fb17f18f6c6', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('22097e5a-4fec-409f-a735-6489ef1bf8a2', 'Insidious Gaming', 'a06c617e-bb76-4b05-9dc8-9dec860d7ff4', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('00262321-b949-41df-8d6d-454b62f33ebf', 'Saigon Jokers', '8ce70c0a-8289-4f8b-83a8-aa08f41a3abc', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('120e8397-e2d5-4d51-b688-7c0a1425006f', 'Taipei Snipers', '6dab4e31-6900-433f-9622-7ec1a1d826e3', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('3ef9d373-a6ca-4519-acec-37fc07accbbb', 'Manila Eagles', '183fd46c-e7e7-44e4-b1ae-5e6a2244b904', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('b5229bb8-a0d0-460e-9afe-1ae3bf830be0', 'Saigon Fantastic Five', 'e84840e0-515d-4fc5-9d70-157cea9eb71d', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('4e5fa6ed-27db-40f3-b286-9f48d5511f93', 'Singapore Sentinels', '87a621a6-e3dc-4e6a-a06e-a5b793bd3401', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('fa43b53a-ec22-4222-a4d8-adb3b388d37a', 'Taipei Assassins', '7f5a2f13-7247-42c1-b9cd-efa01e47fbe8', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('0efb8078-2108-4217-97c4-a60497b5e7b3', 'yoe Flash Wolves', '64b82267-e5d1-474e-9651-8ed574608e81', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL),
    ('c1be1ef9-c210-45cd-b5f7-98405e927142', 'CNB e-Sports Club', 'a69f5df4-c7e9-44e4-9a7e-a38a5726bee8', 'da95c98d-435f-4771-9d8e-0f09b18860db', 2014, NULL),
    ('f8399689-59d6-4b3a-9048-7be73d7a8972', 'KaBuM! Esports', '53e9b580-dac8-4298-a4d2-f5b95f914d80', 'da95c98d-435f-4771-9d8e-0f09b18860db', 2014, NULL),
    ('8168317a-5e0c-4b56-b76f-536e4d77ec26', 'Keyd Stars', 'a509c789-44a2-49d0-8aaf-3edad207b536', 'da95c98d-435f-4771-9d8e-0f09b18860db', 2014, NULL),
    ('8e21b79e-7dc6-4685-afa8-c63aa42a8404', 'paiN Gaming', '50219b75-6b05-4904-ab6f-a21b9ab3b745', 'da95c98d-435f-4771-9d8e-0f09b18860db', 2014, NULL),
    ('137b3573-0bac-4c2c-b272-a84524e66650', 'Team awp', '527afc75-60db-43d9-9072-1a3e972927ca', 'da95c98d-435f-4771-9d8e-0f09b18860db', 2014, NULL),
    ('2ce03fb1-117c-45f3-96dc-1269a5b0af98', 'Team United', '888ec148-19a9-40e2-bd25-05cdb230f19d', 'da95c98d-435f-4771-9d8e-0f09b18860db', 2014, NULL),
    ('5efc7978-2b10-4242-b61b-f3525b0f9d6b', 'Furious Gaming', '0c6c9ffd-629f-4ff7-92ec-c3462ce24489', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('c1bd87aa-9659-4511-b328-2a41bc64376b', 'Kaos Latin Gamers', 'e7a3b7a3-b675-4b45-8735-0fb7dbfea21e', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('c7b86906-8b88-48bc-b526-6661379553cc', 'Pineapple Express', '1360f389-ca50-472b-98e6-b2fa1bc1a54f', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('a389ce55-33f6-4eef-9cbd-de979facf485', 'Red Arrows Team', 'e7f2c66c-6293-41ba-9cdb-190068857221', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('f7b6fa6c-addc-4fcc-884a-bbc80b18f246', 'Seven Wars Lyon', 'b2673fd6-526c-4f19-96b0-bdba501a272a', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('c16757c0-1aae-49bd-b874-81acb73ef2f0', 'Team Quetzal', '22a45e0d-7c04-477e-9b44-71c3fc4c02bc', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('f479e115-137c-4a1c-a451-f039da55ff23', 'Dash9 Gaming', 'd308dd07-7505-47c1-aa4f-9e7bd13e7a05', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('dc362476-afdc-4771-8816-afc79bd0ecc6', 'Tesla Gaming', '78d3f023-e0ea-42d9-bc63-f8833eb5906f', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('85b09923-7805-42dc-a241-d175a09729e7', 'Lyon Gaming', 'bfb6fbbe-4bec-449c-a0db-649103ad34d3', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('b43f21db-401d-442e-9cb8-9d7903705249', 'Isurus', '7fb71e50-e0a9-4eb0-a53e-1da6958944eb', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('974ed496-c4a8-4758-97e6-63a6f1153d27', 'Renegades of Hell', 'd45d3a43-cbcd-44d6-a7ec-6b154566ca7c', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('24b9c7ec-9d98-4967-8711-419338f7d020', 'Bencheados de KLG', 'b967f858-0f8b-446b-959b-bfa298eda8ee', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('4acbad7f-01d2-4801-aa77-02f41b748196', 'BrawL eSports', '37dd44d6-eb7c-45c8-af13-ce612e1b46b5', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('8120a9f5-0324-4dbc-bf68-31fff4d41148', 'Satori', '1312155b-89a5-4c30-9276-b1db884e77de', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('b6556dce-d5de-487c-9fb4-619b859fac39', 'Borrowed Time', '43e55eac-a075-40c1-b762-aed671ea9093', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('9be714fe-edbd-44a1-80ee-db544e54bc6f', 'Destroy Gaming', 'b4d926f8-3660-4f44-9cf9-cef0316d33ae', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('d725049d-10a8-4828-8afe-090efa21a137', 'RAWR', '524feff0-4e3f-47bf-a8ed-2a8c3a55e5a7', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('aeaa6b6c-9cbb-46d3-a818-2cee77377dd9', 'The Last Resistance', '82e7cbff-e94c-45ac-8fb2-7c9cf014b720', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('219fb6b1-dbf2-4e2d-9fbf-32ad566bf8d1', 'Yisus traia GA', '6ac2f007-441c-4b35-ad2d-4ec06af773f9', 'e289a5db-db2a-43ce-ba5a-2db886cd742d', 2014, NULL),
    ('8bd768e9-3223-4d61-81ba-c8e086e290de', 'HWA Gaming', '418977e0-2155-4adf-bf22-a406b8b8b91f', '2cf54a7e-c0f9-4886-ba60-6f7d1cc3efea', 2014, NULL),
    ('0b5af084-875f-472c-b972-591fcc6f2e85', 'ATLAS eSports Team', '54119fcc-469b-49f7-a80e-2aea4824e971', '2cf54a7e-c0f9-4886-ba60-6f7d1cc3efea', 2014, NULL),
    ('f192f408-1366-4599-a489-bf1fada760ec', 'Dark Passage', '98a5178f-62a0-43a9-a9d7-d8c6bd0e3675', '2cf54a7e-c0f9-4886-ba60-6f7d1cc3efea', 2014, NULL),
    ('d6305cb8-8ef4-418c-9785-75120a52c07e', 'ANT Gaming', '847c2c67-8c7b-4fda-810d-d0199c46357f', '2cf54a7e-c0f9-4886-ba60-6f7d1cc3efea', 2014, NULL),
    ('621287fc-beb6-411b-b9f6-c492820dda2d', 'Team Turquality', '6d7f0368-e53f-4c80-b52e-c6f45b88098b', '2cf54a7e-c0f9-4886-ba60-6f7d1cc3efea', 2014, NULL),
    ('ff622a1d-1d26-49bb-a64c-27db9b51e9a3', 'Big Plays Incorporated', 'b894c988-3ff1-4c9d-9fab-11674c0def33', '2cf54a7e-c0f9-4886-ba60-6f7d1cc3efea', 2014, NULL),
    ('b31d59d9-607a-408d-8d76-4031e40f8521', 'Always With Honor', 'a6869cc7-1c20-47f3-94cd-5bf20be8705a', '2cf54a7e-c0f9-4886-ba60-6f7d1cc3efea', 2014, NULL),
    ('e77aa5ae-bb80-4ca2-9dbe-d1c59ce9ef33', 'Team Immunity', '0c019588-ad9a-4469-9153-b02ef7505c33', '60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 2014, NULL),
    ('cf14b8ae-bae8-4747-a53a-67d0ffa99c61', 'Optic Snipers', 'c1c24098-f62a-4b99-8456-668fc530fe95', '60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 2014, NULL),
    ('ae1a4acc-c071-4bda-a89f-4807da507dc8', 'Little Wraith', '9e38ee90-e850-499f-9eb5-9bfdcf352ac3', '60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 2014, NULL),
    ('2e9ce1cb-3f52-4594-9faa-0c39ee13a486', 'Avant Garde Ascension', '6ee0b8ae-8ad2-4e2a-b782-eaccb8fbc4f1', '60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 2014, NULL),
    ('7e99fe17-6a5a-481e-913a-f1bb32a08803', 'Frenetic Array', 'b27afee6-cd81-434c-8b17-f87357b626ac', '60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 2014, NULL),
    ('c7f44f7c-d4dc-4fef-a97d-cee3089b74d3', 'Your Soul Shall Chuffer', '3ba69797-73cc-4502-9a88-cbc458efddd9', '60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 2014, NULL),
    ('d02a9bec-7dfa-401e-826f-a33e4a91602f', 'Team Nv', '6377f725-1a54-402a-ad3c-6075a1412c05', '60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 2014, NULL),
    ('5cea6f2f-0694-4126-97d9-2ab1f935b59d', 'Eviscerate', '98430641-bd86-47af-90bb-7b759e1a0d5f', '60ca61a7-e62c-4f33-b6a2-b9b7fc4a6c78', 2014, NULL);
INSERT INTO organisation_teams (organisation_id, position, team_id) VALUES
    ('684ca8ca-9e9b-4ce2-b0bc-3e8013c44b2f', 0, '180ca826-9041-4f53-8edb-bbb1c69f0755'),
    ('b9429c55-7efb-4b89-89f5-3d579c075288', 0, 'b2f1cb10-48ab-406d-a435-60bfcfb13e6d'),
    ('c318de6c-d078-4145-8cc6-9a469d3c2675', 0, '553bc53d-fa85-4925-8a32-49b73570a98c'),
    ('9e13a007-f77f-4c57-b4ee-0873420db581', 0, '07ebcbcc-43a1-467f-a02e-e311dd728acb'),
    ('5142bf7b-d0f1-40cb-be73-79673936df22', 0, 'a77584a8-5c69-45e0-8509-77bc2a83105b'),
    ('986c7ce8-45d1-4c23-b987-cd6ed3da796d', 0, 'a927109d-e5d4-4e3c-89d4-1261332e4ee2'),
    ('ecfd861c-ac77-4253-9509-6f185ac1f31a', 0, 'd0064273-bcdb-40ca-8dd5-c46807053bc3'),
    ('ba088a5f-efca-4a9f-a436-11347a3af709', 0, '7a49f0a2-22fd-4b58-96b9-543355abd4e9'),
    ('02a29549-3683-4a61-b616-9754f4e54ae7', 0, 'c9652800-4bdf-4d32-a133-a4b116ac31d1'),
    ('9980cf8e-b89a-4f04-902f-7e54ac3ab710', 0, '77f27be0-86f4-4094-bd07-b87841f007e5'),
    ('d8b474db-808d-4b7d-a0e6-c519c64f1a33', 0, '847311ca-a6c0-4f79-a717-f77fc7e0b1db'),
    ('d8b474db-808d-4b7d-a0e6-c519c64f1a33', 1, 'eff22c5a-fa9e-4e93-ad1f-520c8ea88eae'),
    ('70b16f22-2473-4394-b09e-c4b558429b52', 0, '3a46ce7d-5032-4455-885f-105355777a58'),
    ('eb331307-2a92-4bfa-8666-a694bb003592', 0, 'bd913d3d-806f-4500-8c0e-60f57a065fd7'),
    ('2d0301de-410a-4188-bd0b-1f2e12ba114a', 0, 'ffcc2752-c61f-431e-8e25-bb4a73433b6b'),
    ('0e799ef7-a77e-471a-9e89-1b9f9b6b286b', 0, 'c0ae4083-77c9-404b-aea4-2988fb9443c5'),
    ('128520c2-5158-44f8-827d-4da2e6633018', 0, 'b152ab80-622e-4167-9abe-897f2b9a8e5c'),
    ('3340c980-18c6-4a65-846b-6f8d2fdcd33e', 0, '87e646e9-2408-4224-8a24-6a6770c51bf8'),
    ('d8b474db-808d-4b7d-a0e6-c519c64f1a33', 2, 'd572ef5d-18b6-446d-a29c-e385f2dcc86d'),
    ('48bcaecd-5710-4a99-98ca-854f571698b8', 0, '3f2a69f1-6510-4e51-be50-f7f616e4e2e1'),
    ('e82572d1-6e7d-4f9d-87ea-fb422a1a47e7', 0, '058cb905-3ee3-4c23-97ab-7eeb4ffc7783'),
    ('2eac2aab-5223-426f-99c2-ebff28c3db33', 0, 'e59a1de0-8100-4d9f-a803-6981da957be4'),
    ('60ff402a-1dd2-4a8b-aa2c-f90a53cb7252', 0, '8a6220a4-4e35-41b0-922a-8df981262634'),
    ('8bdfa0ee-c55a-4a5b-9304-5947a98d4750', 0, 'd99eb69f-7091-45d8-8a33-50d75e5e0347'),
    ('0008e43d-a87d-4ba0-a974-5e94ad9d1bdf', 0, '11d46a75-f62c-4e70-a0be-ea38400572f1'),
    ('a05e388c-07ba-4c0f-b6e2-53757cbe9a27', 0, '6a19be8b-969f-4867-b75d-9be1d11a6da0'),
    ('73e7b621-94cb-4dab-aef7-55298bf97e98', 0, '0322e9f4-52ed-4388-91d1-105030e5e287'),
    ('637f33ec-6c8e-4b0b-b744-2ee8e3df68d6', 0, '846207e6-3c39-47d8-bc1d-c50d5296c010'),
    ('1fb3f89b-1799-495f-9ecd-5fcd9c9d6ba4', 0, '9797d2e6-4d12-4d1d-872d-a9eb5a332357'),
    ('2d0301de-410a-4188-bd0b-1f2e12ba114a', 1, '003475ee-3175-4af6-9a8b-bc954662e074'),
    ('0b07755d-1ef5-467e-9c9f-220fbb7ec00c', 0, '467c6a53-a751-4429-8ebc-7e2833670986'),
    ('3306d116-1516-4f47-aa75-e19de6edf06c', 0, '94ddd53a-08b3-42bf-b88a-3d7c7c8f1afb'),
    ('08d4d9af-4fbb-4e59-9381-a881de3a5c3c', 0, 'f4c1dd56-199f-41aa-8e5e-7f3046f3787d'),
    ('1b27b9ef-eca8-4046-8e53-315028c58373', 0, 'd4497457-5af7-4678-bc66-50ad29adc696'),
    ('f025fe62-d9b3-456e-98f1-8b651e6ecae8', 0, 'ba4009ed-b0c1-4c42-bd77-290635d22c5a'),
    ('7db46e95-15e2-4bf9-867b-f0dba9fba42d', 0, 'b61e025e-bc5c-4ec0-a258-3444b03a830d'),
    ('4d142b45-2741-471a-a6bf-855c634ff3b9', 0, 'dfa6bdeb-4041-4af7-a0c9-9d29394807f4'),
    ('96311494-dca2-48b4-b8e4-cfeb77563751', 0, '9f513f87-e8e7-4533-82c2-34f5daaf7788'),
    ('fbce19fd-2edf-4a77-a316-48652443d1cf', 0, 'df5e485f-5136-494d-bfd6-3a7dd4ceab70'),
    ('0f5af3ab-978c-4818-a309-5be460960c3b', 0, 'd72d39fa-8895-4b04-9a54-1c0f308545e5'),
    ('86378884-7341-4fbb-853e-6006d292605a', 0, 'c7fc6f36-a10f-47b9-9c0e-eb1a393a2133'),
    ('11d4138c-a373-4d14-a743-7f3d22bbfe37', 0, 'dc647927-8541-4129-9ff9-8cbae0ff997b'),
    ('d01ba16e-4ea8-4f29-a3c1-67936f1f0bca', 0, '6578c1ec-881b-4836-90b4-5c6972e16fb3'),
    ('1ac2b860-f884-474c-b587-008e4ba8f562', 0, '81937ca3-b070-4645-a780-0191197d6a37'),
    ('07c66d93-2ac8-4bf6-acbb-0b098d35d787', 0, '29fa1a87-774f-4d16-90f9-289a7d496452'),
    ('bdd255cd-b7de-427f-a497-a3ae9003919d', 0, '6dc21f2f-3c6e-46b0-bdec-dfdfbb397277'),
    ('c6d153d8-88d1-4b3e-b4bb-0ab1078b8887', 0, '79a55eee-84a8-46ec-8082-fb3a77d22ac7'),
    ('ad2b1bfd-6ae7-4a07-bc5c-b6ed530bd3d7', 0, 'f1a25f34-788a-4bca-8fd8-75312169a66e'),
    ('869b37e8-f538-47a6-8435-d47f5023ddf7', 0, '620e3a7c-5f5f-4de4-a633-1770ef4a5bba'),
    ('3dfb215a-f777-42a2-9695-d9db17587499', 0, '437dce60-08d4-4ab7-b925-694a4b0c029e'),
    ('c863b4df-34c6-4db0-8a5a-473461231173', 0, '3ba15f05-d443-49e3-be14-048092f5323c'),
    ('015ad4bb-99fc-4673-8dba-d23aa690b3fd', 0, '7ab469d7-6953-47a6-9d89-86f21e3da711'),
    ('32c08031-a617-4a3c-912b-96450740e7ec', 0, '9cafc5a1-84a0-4bca-a38f-dd2d61210a18'),
    ('deada94c-f103-405c-a007-9ed7215a68f0', 0, '67c9e62c-7197-4e88-ad80-f4bf6bd97bc1'),
    ('1603c897-af5f-4b9f-93d6-4770bf8fc7d3', 0, '1bf15560-d2fe-4b23-a584-a21edb703ab1'),
    ('d073f36c-d66c-4e52-906b-67aaf98488f3', 0, '694b6e68-b1e3-4158-97da-eb208b5f949c'),
    ('96da50a5-a264-42fc-b967-6c840dfe87a4', 0, '65df7c8a-a9c5-44b5-9526-a0aaf6a44392'),
    ('da16729d-77ef-46b0-b47b-c6ecca643f17', 0, '772b83e7-506d-4d7c-a0e8-ce908009b94f'),
    ('21946b17-6b0b-439e-9df4-f42ad3e43184', 0, 'f3be8875-305b-477a-b1b4-7b5a0402e6ab'),
    ('086f44b0-08ca-46ae-8ad1-4fb17f18f6c6', 0, '03fba709-2391-4e93-9fc2-528dd0243e37'),
    ('a06c617e-bb76-4b05-9dc8-9dec860d7ff4', 0, '22097e5a-4fec-409f-a735-6489ef1bf8a2'),
    ('8ce70c0a-8289-4f8b-83a8-aa08f41a3abc', 0, '00262321-b949-41df-8d6d-454b62f33ebf'),
    ('6dab4e31-6900-433f-9622-7ec1a1d826e3', 0, '120e8397-e2d5-4d51-b688-7c0a1425006f'),
    ('183fd46c-e7e7-44e4-b1ae-5e6a2244b904', 0, '3ef9d373-a6ca-4519-acec-37fc07accbbb'),
    ('e84840e0-515d-4fc5-9d70-157cea9eb71d', 0, 'b5229bb8-a0d0-460e-9afe-1ae3bf830be0'),
    ('87a621a6-e3dc-4e6a-a06e-a5b793bd3401', 0, '4e5fa6ed-27db-40f3-b286-9f48d5511f93'),
    ('7f5a2f13-7247-42c1-b9cd-efa01e47fbe8', 0, 'fa43b53a-ec22-4222-a4d8-adb3b388d37a'),
    ('64b82267-e5d1-474e-9651-8ed574608e81', 0, '0efb8078-2108-4217-97c4-a60497b5e7b3'),
    ('a69f5df4-c7e9-44e4-9a7e-a38a5726bee8', 0, 'c1be1ef9-c210-45cd-b5f7-98405e927142'),
    ('53e9b580-dac8-4298-a4d2-f5b95f914d80', 0, 'f8399689-59d6-4b3a-9048-7be73d7a8972'),
    ('a509c789-44a2-49d0-8aaf-3edad207b536', 0, '8168317a-5e0c-4b56-b76f-536e4d77ec26'),
    ('50219b75-6b05-4904-ab6f-a21b9ab3b745', 0, '8e21b79e-7dc6-4685-afa8-c63aa42a8404'),
    ('527afc75-60db-43d9-9072-1a3e972927ca', 0, '137b3573-0bac-4c2c-b272-a84524e66650'),
    ('888ec148-19a9-40e2-bd25-05cdb230f19d', 0, '2ce03fb1-117c-45f3-96dc-1269a5b0af98'),
    ('0c6c9ffd-629f-4ff7-92ec-c3462ce24489', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('e7a3b7a3-b675-4b45-8735-0fb7dbfea21e', 0, 'c1bd87aa-9659-4511-b328-2a41bc64376b'),
    ('1360f389-ca50-472b-98e6-b2fa1bc1a54f', 0, 'c7b86906-8b88-48bc-b526-6661379553cc'),
    ('e7f2c66c-6293-41ba-9cdb-190068857221', 0, 'a389ce55-33f6-4eef-9cbd-de979facf485'),
    ('b2673fd6-526c-4f19-96b0-bdba501a272a', 0, 'f7b6fa6c-addc-4fcc-884a-bbc80b18f246'),
    ('22a45e0d-7c04-477e-9b44-71c3fc4c02bc', 0, 'c16757c0-1aae-49bd-b874-81acb73ef2f0'),
    ('d308dd07-7505-47c1-aa4f-9e7bd13e7a05', 0, 'f479e115-137c-4a1c-a451-f039da55ff23'),
    ('78d3f023-e0ea-42d9-bc63-f8833eb5906f', 0, 'dc362476-afdc-4771-8816-afc79bd0ecc6'),
    ('bfb6fbbe-4bec-449c-a0db-649103ad34d3', 0, '85b09923-7805-42dc-a241-d175a09729e7'),
    ('7fb71e50-e0a9-4eb0-a53e-1da6958944eb', 0, 'b43f21db-401d-442e-9cb8-9d7903705249'),
    ('d45d3a43-cbcd-44d6-a7ec-6b154566ca7c', 0, '974ed496-c4a8-4758-97e6-63a6f1153d27'),
    ('b967f858-0f8b-446b-959b-bfa298eda8ee', 0, '24b9c7ec-9d98-4967-8711-419338f7d020'),
    ('37dd44d6-eb7c-45c8-af13-ce612e1b46b5', 0, '4acbad7f-01d2-4801-aa77-02f41b748196'),
    ('1312155b-89a5-4c30-9276-b1db884e77de', 0, '8120a9f5-0324-4dbc-bf68-31fff4d41148'),
    ('43e55eac-a075-40c1-b762-aed671ea9093', 0, 'b6556dce-d5de-487c-9fb4-619b859fac39'),
    ('b4d926f8-3660-4f44-9cf9-cef0316d33ae', 0, '9be714fe-edbd-44a1-80ee-db544e54bc6f'),
    ('524feff0-4e3f-47bf-a8ed-2a8c3a55e5a7', 0, 'd725049d-10a8-4828-8afe-090efa21a137'),
    ('82e7cbff-e94c-45ac-8fb2-7c9cf014b720', 0, 'aeaa6b6c-9cbb-46d3-a818-2cee77377dd9'),
    ('6ac2f007-441c-4b35-ad2d-4ec06af773f9', 0, '219fb6b1-dbf2-4e2d-9fbf-32ad566bf8d1'),
    ('418977e0-2155-4adf-bf22-a406b8b8b91f', 0, '8bd768e9-3223-4d61-81ba-c8e086e290de'),
    ('54119fcc-469b-49f7-a80e-2aea4824e971', 0, '0b5af084-875f-472c-b972-591fcc6f2e85'),
    ('98a5178f-62a0-43a9-a9d7-d8c6bd0e3675', 0, 'f192f408-1366-4599-a489-bf1fada760ec'),
    ('847c2c67-8c7b-4fda-810d-d0199c46357f', 0, 'd6305cb8-8ef4-418c-9785-75120a52c07e'),
    ('6d7f0368-e53f-4c80-b52e-c6f45b88098b', 0, '621287fc-beb6-411b-b9f6-c492820dda2d'),
    ('b894c988-3ff1-4c9d-9fab-11674c0def33', 0, 'ff622a1d-1d26-49bb-a64c-27db9b51e9a3'),
    ('a6869cc7-1c20-47f3-94cd-5bf20be8705a', 0, 'b31d59d9-607a-408d-8d76-4031e40f8521'),
    ('0c019588-ad9a-4469-9153-b02ef7505c33', 0, 'e77aa5ae-bb80-4ca2-9dbe-d1c59ce9ef33'),
    ('c1c24098-f62a-4b99-8456-668fc530fe95', 0, 'cf14b8ae-bae8-4747-a53a-67d0ffa99c61'),
    ('9e38ee90-e850-499f-9eb5-9bfdcf352ac3', 0, 'ae1a4acc-c071-4bda-a89f-4807da507dc8'),
    ('6ee0b8ae-8ad2-4e2a-b782-eaccb8fbc4f1', 0, '2e9ce1cb-3f52-4594-9faa-0c39ee13a486'),
    ('b27afee6-cd81-434c-8b17-f87357b626ac', 0, '7e99fe17-6a5a-481e-913a-f1bb32a08803'),
    ('3ba69797-73cc-4502-9a88-cbc458efddd9', 0, 'c7f44f7c-d4dc-4fef-a97d-cee3089b74d3'),
    ('6377f725-1a54-402a-ad3c-6075a1412c05', 0, 'd02a9bec-7dfa-401e-826f-a33e4a91602f'),
    ('98430641-bd86-47af-90bb-7b759e1a0d5f', 0, '5cea6f2f-0694-4126-97d9-2ab1f935b59d');
INSERT INTO players (id, name, portrait, role, nationality, birth_date, mechanics, teamfight, map_awareness, objectives, tempo, mental, itemisation, phase_early, phase_mid, phase_late, shotcalling, role_skill_kind, role_skill_score, form, fatigue) VALUES
    ('1c98c199-2783-49b1-9475-7a0437621eb2', 'Odoamne', NULL, 'top', 'RO', '1995-01-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2060bf1e-fc75-446e-a569-f92336a40ac2', 'k0u', NULL, 'jungle', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d8b07df4-29a3-4eb1-9f39-bcf366d51cfc', 'Febiven', NULL, 'mid', 'NL', '1996-09-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2b48f1ad-9ed6-4a2f-8dd2-e561f9451162', 'Hjärnan', NULL, 'adc', 'SE', '1993-11-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('73b733f6-d75f-48cc-9bbc-5fe308b7e12f', 'Voidle', NULL, 'support', 'EE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b60bc157-8ac9-47d3-ba44-123c38f6bef9', 'Koi', NULL, 'top', 'PL', '1995-02-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d1869dd9-cfbb-4477-beaa-e890a8e1f4f3', 'Skipper', NULL, 'jungle', 'DK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a7f88801-d1bc-4328-8e9b-85a14988fede', 'PowerOfEvil', NULL, 'mid', 'DE', '1997-10-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fed21ef8-9ce9-4c5c-ac18-abb63254426c', 'Sir Scott', NULL, 'adc', 'GB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bd34f4a6-2014-42f2-9328-407b37ecc20a', 'Qunsk', NULL, 'support', 'DK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('05252b66-0631-458f-8ac0-e2514337471f', 'Kubon', NULL, 'top', 'PL', '1993-03-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d261b8c8-ffeb-4968-bb2b-b8bc2cd128c0', 'Mokatte', NULL, 'jungle', 'PL', '1988-07-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('90ae0111-868d-471c-a350-310671eeaed2', 'Czaru', NULL, 'mid', 'PL', '1994-11-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c8622f0d-ebd5-4950-ac16-f3d20b33e315', 'Makler', NULL, 'adc', 'PL', '1992-03-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('76941ed9-5e7c-4965-95bb-0af80955a14f', 'Libik', NULL, 'support', 'PL', '1993-01-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('99600337-868b-4acd-a0e3-263244aeae68', 'Amin', NULL, 'jungle', 'SE', '1997-12-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e127562e-d6b7-418b-8f7a-ae3261697080', 'Shacker', NULL, 'jungle', 'GB', '1996-07-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a34ac609-84b9-4faf-8937-4f9d5e3378f8', 'Freeze', NULL, 'adc', 'CZ', '1994-06-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f6a114c8-ea95-4e08-97a8-9ee68e667fd0', 'Mithy', NULL, 'support', 'ES', '1994-10-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('51077df0-615c-4a47-8fa7-4c5db9b1916e', 'jokieez', NULL, 'top', 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f950048f-2233-4b70-b73c-c368fd349e14', 'Kikis', NULL, 'jungle', 'PL', '1996-03-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7b9060c0-5469-400c-a1b6-1dbb0b14e1d9', 'niQ', NULL, 'mid', 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('659580e8-9793-4622-9425-e9c8aad965df', 'Woolite', NULL, 'adc', 'PL', '1996-05-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0a8a11dc-af5b-4f58-ac68-18cb1d5f1079', 'Elendix', NULL, 'support', 'PL', '1992-08-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('99273260-9dcf-48c9-a9a6-830985e33997', 'Mozilla', NULL, 'top', 'CZ', '1992-05-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('69fa88ba-11a7-4aff-806b-f3d4591d1da8', 'Ginsu', NULL, 'jungle', 'SE', '1989-06-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('15181712-edd3-4f0e-8f02-9e8bf110e3e7', 'Exileh', NULL, 'mid', 'DE', '1997-04-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ace21f9e-cc1b-4124-8082-07953414ec4b', 'Zvanillan', NULL, 'adc', 'DK', '1997-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b352fad5-ab73-4b33-9e83-b5d6be4d2670', 'Sixx', NULL, 'support', 'AT', '1993-01-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a8a2b683-638c-408e-bbab-3237b4d07ce1', 'Cavalier', NULL, 'top', 'CZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4339266e-c795-4775-a645-cbf98e1bea81', 'GladIQ', NULL, 'jungle', 'SK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a485f766-1cad-4aa1-af30-426754dfba95', 'Miah', NULL, 'mid', 'SK', '1996-03-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c2c96fbe-d386-43fe-989b-7af07c7bec9d', 'WorstAdcWest', NULL, 'adc', 'CZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('399c456b-043a-4418-8a11-59eaca1a5230', 'LooLaa', NULL, 'support', 'CZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a185d4a5-a3a4-4e55-b932-ddef1f2e5f18', 'PhantomJo', NULL, 'top', 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f2aac3f6-eea3-46a9-83ed-8df99bcd2f7b', 'lNightmare', NULL, 'jungle', 'GR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ee530824-c499-47b2-99fd-b1b0a3324ede', 'Snow', NULL, 'mid', 'DE', '1993-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('aba35a68-1f97-4561-b79c-c3f0f1e59570', 'SunnyXX', NULL, 'adc', 'AT', '1992-09-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('31d23ac8-cccb-4f29-b2d0-f0ef6dc698f3', 'Bonaparte', NULL, 'support', 'DE', '1993-03-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5ec51de6-223f-4d67-9d9f-f66de29b6ac1', 'Yazuki', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b6662b9d-a8e0-4390-b38b-d3b313e412f7', 'Kez', NULL, 'jungle', 'US', '1994-03-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('557abc47-6235-401f-9a51-70cd9bb0cc70', 'Bischu', NULL, 'mid', 'KR', '1994-08-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1a69c5b8-d9d5-47e5-b7ff-f76d43ec71a7', 'Altec', NULL, 'adc', 'CA', '1997-05-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('42fa7925-a669-4001-ad6e-f72c91eee582', 'Gleebglarbu', NULL, 'support', 'US', '1996-03-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bfcd9d64-7fba-41d0-80a5-92c8aae8f9f3', 'RichERich', NULL, 'top', 'US', '1994-08-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('58e636bb-c0da-4e4b-90cc-32db53a03d54', 'Adm Ziploc', NULL, 'jungle', 'CA', '1992-10-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('12468385-11ca-480b-bd0c-00f7d499e10c', 'Zamphira', NULL, 'mid', 'CA', '1993-04-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b513d1f8-7c92-4617-8190-3d2831725e5e', 'nothinghere', NULL, 'adc', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ff5faf99-8328-4431-b722-2e20c759179f', 'Zaineking', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d380fac4-8512-4b78-9100-99e14db4ac1f', 'Westrice', NULL, 'top', 'US', '1992-07-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('25065bdc-17f6-44a2-aa65-dd233f3b5672', 'Brokenshard', NULL, 'jungle', 'IL', '1993-09-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('557d1a6e-188b-4b2e-80de-70547c4a7365', 'PR0LLY', NULL, 'mid', 'US', '1990-01-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('acd8fa6b-d75c-43f6-8fd1-3782c46f3472', 'Bubbadub', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('87f57365-bfd0-4b2f-9d65-0c6139f6f6ec', 'Jezie', NULL, 'top', 'CA', '1995-02-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7f70fbf2-2d6e-4215-867a-2e12ba4adc28', 'Nk Inc', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b0643902-be93-496c-aac6-76284aab5e5b', 'Impactful', NULL, 'adc', 'US', '1994-06-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('098c7d31-0f56-49f8-9193-4faae507781b', 'SupportDaddy', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('66691e41-93b7-4352-ad91-463b74e12498', 'Rhux', NULL, 'top', 'US', '1994-09-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6a9c51b9-4a24-41c0-a270-a667a98a42f7', 'Titours', NULL, 'jungle', 'CA', '1994-10-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('703a3e12-68f5-4484-88e0-2865ee0141a6', 'Jaximus', NULL, 'mid', 'US', '1994-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('efde7077-c1ad-49cf-a6e5-a65399471cb5', 'Fabbbyyy', NULL, 'adc', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('567be611-52f1-4c69-ba0e-a23f55e5d85e', 'ackerman', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('49564475-2ded-499f-b921-165d6154b20b', 'NoName', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5afc7478-b1f8-4600-bf7d-4c6e8fa59696', 'XiaoWeiXiao', NULL, 'mid', 'CN', '1994-09-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0e7269f8-f020-4bc5-99f2-c80fa96ccb5a', 'Vasilii', NULL, 'adc', 'CN', '1994-10-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6883eac4-5ab8-4c12-9f50-a0bd8016cbb2', 'Mor', NULL, 'support', 'CN', '1993-01-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2e271ad1-1587-432a-9c63-45266adf3d81', 'Cris', NULL, 'top', 'MX', '1992-10-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('aee4ce7a-382b-4c76-a023-1ff8f4e9bf0f', 'Get Snuggled', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('351c7844-8f86-4555-8a26-2df304a4849a', 'Microlatios', NULL, 'mid', 'SG', '1991-04-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('63de23b0-efbe-4ba3-b55e-316576395f9b', 'Frostalicious', NULL, 'adc', 'US', '1996-03-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b0c78431-c6d0-4c2c-a4db-9f5b27ffd795', 'baottousai', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4944feae-52f8-46f1-970f-674a2ccab25a', 'Sphinx', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0bee2f91-3ae2-4191-986a-ad5600b5460b', 'LGhunter', NULL, 'jungle', 'CA', '1993-05-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f9e4932b-16f2-4fef-84e8-4f76e1639e2e', 'Mikasa', NULL, 'mid', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9fb7d255-5ee2-4425-b6ed-121d44aa9e8a', 'Alextheman', NULL, 'adc', 'US', '1994-11-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7d254ea8-b947-4bad-ba54-4b64701bebb9', 'tic', NULL, 'support', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('86d9b45b-8227-408c-aa80-e0b90df8ee37', 'BillyBoss', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('115e2205-e770-4651-8c31-7771f1f814f0', 'Beautiful', NULL, 'jungle', 'US', '1997-10-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('13da5814-f7df-483f-93cd-71b3600f5b07', 'DkBnet', NULL, 'mid', 'US', '1993-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b8d93484-a3ca-441b-8739-2a6716beefed', 'Applum', NULL, 'adc', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a1a8584f-1dd3-472f-ab92-0067d2c49bfa', 'Grim Samurai', NULL, 'top', 'US', '1989-12-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('de91127f-97ff-4083-aea3-9d8ff172d06d', 'Wappa', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0ae9e624-3244-475f-9b79-4f7406902200', 'nubbypoohbear', NULL, 'mid', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e15568c4-b2da-4a8d-aa5e-dcd9b76fd94f', 'AtomicN', NULL, 'support', 'US', '1992-01-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('82c66565-6569-44fe-8d8c-b6634bf57cfc', 'DudeImAzn', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('989d6763-0cbe-48a7-b371-90231606f7c5', 'Doomtrobo', NULL, 'jungle', 'CA', '1986-11-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('85f49f75-6587-48cf-b29a-39856100252e', 'Reap22', NULL, 'mid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f44a6a61-c02f-4913-bc7b-c16065e4cd08', 'Autumn Charm', NULL, 'adc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5f8cedcc-b961-4edd-89b1-e2a6111f9ea5', 'babyeator', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('72243983-ce06-46b2-89b6-954bc059ec9c', 'XigneoN', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ed986182-8981-4192-9cba-030d11e4125b', 'WickedShot', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a1f3edfe-0de7-40e1-8095-24494f4e3450', 'Yusui', NULL, 'mid', 'US', '1997-09-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fdf2669b-a1ed-4a9e-af37-8fe2baccdfcf', 'Lock0nStratos', NULL, 'adc', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1d1413fc-25d0-4154-8ef2-213fe1556db6', 'GauNty', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8bd446b7-55bf-4f47-87bb-9e2352d66d58', 'Knives', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('58d736ee-b1a7-4910-953a-2ec4f0ed2f59', 'Broseboro', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0fedc059-8085-4d74-abf9-78763ccc36ce', 'Grumpylol', NULL, 'mid', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3a4a8568-5633-49d0-9a51-79a3e8905a05', 'Leo', NULL, 'adc', 'KR', '1994-09-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8b754483-1dea-476a-91f5-a69c5c7a22de', 'Gnodde', NULL, 'support', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c3414ec9-3353-4013-aff9-37b4b813828a', 'Dispencer', NULL, 'top', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a15d92b1-6224-4e23-94a0-216fe892f43c', 'Cloverblood', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2af6d2b4-fc06-4b41-bcde-eb6cba792686', 'Altrum', NULL, 'mid', 'US', '1997-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1c2f2e91-a788-4868-a77a-a20133535ae1', 'xPecake', NULL, 'adc', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d644aad2-0455-49e7-8f77-9608a8abf4e0', 'EV Gredrix', NULL, 'support', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d47f39fa-58ff-4405-a83c-9526ce71de04', 'Agaton', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0bf0dd23-c3ae-4147-9450-2eab93db4688', 'Maysecond', NULL, 'mid', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('de390e9b-0a30-4414-81be-ef4e241b8e04', 'KMJ Smurf', NULL, 'adc', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b73216d6-70c8-4248-859a-c6d76cff8881', 'S For Solis', NULL, 'support', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('75cf222e-7724-43c5-8983-48233ec6bc1c', 'Yoshi', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fab83dff-8617-4ad6-808a-9390b128a66a', 'Aerodactyl', NULL, 'jungle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a5ab8724-6abb-48bd-87d9-f0eae39a84a1', 'Aniratak', NULL, 'mid', 'US', '1997-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('de4a8e80-fafc-44ef-8d05-27dd7d356251', 'Jummychu', NULL, 'adc', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0d6c1ecb-fad2-4580-96a2-87e755e313a8', 'Yuno', NULL, 'support', 'US', '1995-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('82214463-9f1c-4867-9b5d-2c25735f07c9', 'SickMotion', NULL, 'top', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0c4aa3c5-25ff-43a4-88e0-8359274cb926', 'MasteRofLoL', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ca262eb3-1d1c-4235-8cd0-a8557a868a8a', 'shmoah', NULL, 'mid', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2312a2e6-95c7-46cd-937a-f17c2ecf554a', 'Krazÿness', NULL, 'adc', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('01299ce1-c106-452c-9ff2-310f54ad564e', 'Ramen', NULL, 'support', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6fb7aaee-4a8f-4dd1-9625-0da06eb7df05', 'Dat Control', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('37843eb8-1a60-4a06-96a4-078d8f8ac850', 'Maestro', NULL, 'jungle', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('706c8e1a-6ae8-4903-9573-b2159e8d4b6b', 'Nado', NULL, 'mid', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('59744412-5540-42c6-b710-ee6f0822cae5', 'Don', NULL, 'adc', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('37dbb6f4-480e-4186-a35f-664e43f56de9', 'Reborn', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b0aa12a5-9ad6-4ed4-9a7a-c9e98241299d', 'Hauntzer', NULL, 'top', 'US', '1995-05-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('69e6f079-d3cc-407f-96b9-c6ae9fea5052', 'heavenTime', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('214f0806-841d-4a19-a7ff-f138a86b017c', 'Nyjacky', NULL, 'mid', 'CN', '1988-08-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('35a3da3c-5508-4e3c-8f66-6dc64c12d57b', 'LOD', NULL, 'adc', 'CA', '1997-04-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b2c36f05-113c-4bce-a002-81605e3508aa', 'LoH', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('726b4637-bd6c-48bb-9bbc-b6b7dc99f621', 'GeekGoneMAD', NULL, 'top', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('10d91ff3-6674-4a15-9692-32cda6eb3650', 'Proof', NULL, 'jungle', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e22b162e-c0d4-44c2-96d3-e0e3973e2629', 'BabyZeus', NULL, 'mid', 'US', '1993-07-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a2b14002-19a2-44aa-913f-d34fda2f37cc', 'LattmaN', NULL, 'adc', 'US', '1995-02-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('abf6dab1-87a6-4999-abd9-895ac6908b96', 'Rockblood', NULL, 'support', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6baba667-152b-47bc-8b13-509e8475a389', 'DrillDrill', NULL, 'top', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d97849c3-d4dc-467b-9f6e-698260a513d8', 'AWildMiMo', NULL, 'jungle', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7ea77ba4-8d75-4e22-96d7-bf0a7d47cbe8', 'Taishi', NULL, 'mid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ff355fce-a898-4b90-9cd0-c78aef5a7918', 'EvanRL', NULL, 'adc', 'US', '1995-01-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('428bc44e-1470-4a9b-9ae2-7657b05a3684', 'ReMiik', NULL, 'support', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('62b30310-8ff7-4861-9c90-e30ee1719fac', 'Bee Sin', NULL, 'top', 'US', '1994-10-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('19026f7e-1453-4f67-b3df-4135e7db7be0', 'PorpoisePops', NULL, 'jungle', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4bbef270-06f7-42d1-9970-7300e1b91f9b', 'CheesdBeluga', NULL, 'mid', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('03c3ecf5-a123-44b6-8b4f-01425743ba2c', 'DontMashMe', NULL, 'adc', 'CA', '1994-12-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4b967f30-85cb-4beb-904f-9a83a030eaf9', 'Minoko', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a1061603-e8ef-4331-9aeb-ce551df94ec0', 'EM', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('df1526a3-1e5c-4a84-b57e-2f0c61890f82', '592', NULL, 'mid', 'CN', '1997-03-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0929f4c1-1581-4fba-8b2d-9dadab47d90c', 'Dnn', NULL, 'adc', 'CN', '1998-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('faa733ea-f64b-4b8e-9b6d-9d00bab95fef', 'Xcy', NULL, 'support', 'CN', '1993-06-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('28903bd4-5592-4cb7-a257-a387b0c08ceb', 'DaMao', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fa6a6d20-4cb4-4f57-a711-3a863871eefe', 'lonely', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('388f8930-dbaa-4133-9364-da12e95d5796', 'RalnesYoga', NULL, 'mid', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2b92f747-6cba-4c8e-a9fb-9b03720da0a8', 'loveletter', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('057fe6a4-d074-465c-b00d-2044bac1e463', 'XiaoTian', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cb642616-253d-499e-89cd-844058edfba6', '安逸', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('22575232-0112-4f50-a814-d8a1086ba1d8', '可乐', NULL, 'top', 'CN', '1994-04-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('51ce1b17-b062-411e-bd44-0feab65f853e', 'Dreamaster', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6fb0ca7a-ec90-4092-9d47-c6b55d584162', 'V', NULL, 'top', 'CN', '1994-10-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7bde49cf-4fd5-4b41-8f4a-1c35cf1e01a1', 'Limitless', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b43500d1-e3ae-4736-9ac3-a7db92d76473', '小裸裸', NULL, 'mid', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fb0dc054-65c7-4bdf-b5fa-765b3f952436', '黑狼', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e71370ea-982a-4c69-baa2-9c1f51b8a2f0', 'HaoKai', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b0825a3b-8249-431f-8100-7023e7c289f6', 'Coma', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d0d547e0-26e8-4225-92b4-d2e16fa271f6', 'Morted', NULL, 'mid', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e38e397d-6a60-400e-8cec-cc375c034a35', 'Dream', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bac83c39-c360-48ba-a77f-89d1a4a32364', 'Lx', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('51f97ead-037b-4e23-89da-a53829ab4949', 'YuJian', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('aa3999c2-3bc0-4cdc-9a7e-3473c4d98b00', '逝去青春', NULL, 'jungle', 'CN', '1990-08-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('06589384-cd93-4578-8d65-0b78cbf8944a', 'YeLuo', NULL, 'mid', 'CN', '1992-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bf073803-18f8-44ef-9e36-245bff258bea', 'Boeing', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('446326f4-16ae-4d06-8c93-9196c5d5629c', 'Autumn', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4296a070-f786-415a-8143-3715f0381baa', 'zcty', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7cc63d22-ac84-4537-b6f7-9273b0b49e85', 'AmBiGuS', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7bf0476a-b18f-4915-b400-714e959dc6e0', 'Carry', NULL, 'top', 'CN', '1993-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5d469055-ae60-4f02-967a-605008d5d74d', 'Eimy', NULL, 'jungle', 'CN', '1996-01-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2e9bc330-9eb0-41c9-8fdf-503a9e88e34c', 'We1s', NULL, 'mid', 'CN', '1997-07-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f1bce540-5e71-487d-afd6-13bd9796fae2', 'Mes', NULL, 'adc', 'CN', '1994-05-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b50a753c-ad77-4853-8056-c23897cd094d', 'Yh', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8463cd8f-3285-4737-b770-42b75dd71166', 'Yoyo', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('29816c2b-815d-4b02-b841-999471b0e037', 'RuoYi', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0011af54-8916-4027-b5d1-b5de90c3166a', '非神', NULL, 'mid', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2d9bda42-77fa-440d-bbbe-7915d0c6accf', 'Maybey', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3d371c13-d128-44a0-87fd-e4839783e887', 'Ciwei', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('15db3036-26d2-40fe-a813-e7a7902a8806', 'L1va', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8f6b867d-b09c-4b67-855c-0c5d6fd61cec', 'Number1', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b79a2b2b-d297-41e1-8575-2ef08f213eb2', 'YinFu', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c7e3796f-4c75-4395-88f8-76d767dc26b1', 'WenJianGun', NULL, 'mid', 'CN', '1996-03-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('be3a7ec5-ae95-46ff-b906-0a031516beb5', 'ZhenLong', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2bedf544-e96d-4bd3-9dc9-ab66c134bc2b', 'Gamsu', NULL, 'top', 'KR', '1995-02-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('44624bf6-8bc6-4aab-b1b5-d364b89e1d76', 'g4nk', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e0e1a674-90da-4a29-b763-4283b4541e25', 'Frozen', NULL, 'mid', 'KR', '1994-11-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2a223e3a-c1aa-4cdb-9136-1c80abf4339b', 'Kite', NULL, 'adc', 'KR', '1995-02-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c7f213fe-b0b8-43fb-8235-bef82474d61f', 'Jelly', NULL, 'support', 'KR', '1988-08-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d0e34b90-e185-43fa-8406-a8d53b7c56e9', 'Stera', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2565292f-3c04-46cb-820f-80bd619e6eb8', 'Rizzle', NULL, 'jungle', 'KR', '1994-10-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('064c19af-b7de-4540-8730-8145b099732e', 'Nox', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b7815159-8dea-4127-a7be-ea47d3db7121', 'CallE', NULL, 'adc', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b302831f-12e2-45b0-9180-99dde9fb0078', 'TaRo', NULL, 'support', 'KR', '1995-09-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('55c37bad-2f91-427e-bd1d-a45d2426645f', 'Mid ChicChic', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('36e379b2-4a9d-4dff-96b5-8db7c49d475d', '회색시티관장', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c0907f09-b5e0-41e3-874b-bd8abf10cf47', 'nOmaF', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('904080c9-b3b0-4055-aa87-7d21948b6310', 'SaSin', NULL, 'adc', 'KR', '1994-02-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('dd4ce0be-a15c-43bf-89e5-b8df02d46add', 'B X', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('07f04bc4-a4df-4f16-aa40-1e953f742247', 'Spero', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4d00222c-c398-451e-8f0b-e9bfe07f022f', 'Slave', NULL, 'jungle', 'KR', '1995-01-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2116dcd2-90e4-4d40-b2bd-ecbf1c76729d', 'KangKang', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('45bb7c75-5252-4f97-a4dc-abb2570d44d6', 'Wit', NULL, 'adc', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9308ac29-8afb-4ffa-ae4f-bf23f92bc953', 'Ventus', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2c051d95-0948-45f8-bf46-99fe5efe6f38', 'Sudal', NULL, 'top', 'KR', '1994-02-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b2faaf43-90c7-46f0-aad4-0c20af1ea00c', 'Nuclear Winter', NULL, 'jungle', 'KR', '1995-03-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('72ba2b5b-f9ba-43e2-ab58-2ede94b0680a', 'huhi', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b079a099-c105-4f37-b3af-2fe18ce9bb13', 'Core', NULL, 'adc', 'KR', '1994-06-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e8d85a7b-4af3-42ee-8f4a-f21fcdc9afdd', 'LinLan', NULL, 'support', 'KR', '1995-02-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('13d7aa0a-269f-4ca3-a2a8-edab4a512150', 'CuVee', NULL, 'top', 'KR', '1996-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('344cc86c-ad3a-4234-b383-1ea5176903f5', '2R3S', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c804425c-992b-467d-bfeb-0d8db12da303', 'Widow', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8f1944b3-8caa-49aa-a4cd-d37b00224cae', '듣기평가', NULL, 'adc', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('39559272-6e76-4351-adf2-3137d2a97cfc', 'Ggoogle', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('601dca3f-2091-439b-b627-86b13f4b6a1e', 'Ready', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bfa40682-3a89-4d4e-9638-9caf08b2061c', '0903', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('414fc081-b458-449b-9652-2d631b648ee5', 'Necklet', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a91a29f1-b176-45b8-9416-8f3572ee4c6b', 'Ggoggo', NULL, 'adc', 'KR', '1990-03-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('89aed1ef-9a10-4c03-a547-37992d55414c', 'Raoching', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e01749af-7009-44da-98c2-810d814ec264', 'TrAce', NULL, 'top', 'KR', '1989-11-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('343606c7-38e1-4e5b-a190-2ecb4960fab3', 'Radar', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5ab31b6e-bc57-40a2-88e0-f99a35848687', 'Fly', NULL, 'mid', 'KR', '1996-02-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a2c9b2f2-9925-420b-9e26-68056f044eeb', 'Cpt Jack', NULL, 'adc', 'KR', '1993-01-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6211a760-f50f-40ec-a93c-2b412238d93c', 'XD', NULL, 'support', 'KR', '1995-07-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8b68e372-98a6-46bc-b323-b5dcaad1441e', 'Excuse', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('34cfa7ca-e3d0-4a31-bcb7-4fa9f7e5a9b7', '엉덩국 보부상', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('dc9580bf-7323-44af-a405-63324a290613', 'Be blind', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8c38d2ab-b868-4ec3-863a-e9eb99fb60fb', 'Flash xd', NULL, 'adc', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c3f64376-65a5-4418-9370-47a51f6a7c05', '멘탈고진아레스', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('38dc26e9-629a-4295-9419-75a853a3b30a', 'YongSoo', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e46961d7-8f07-4069-80a0-c1c4df3272c8', 'sMite', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('934fb4b2-4d0e-43d3-aebb-e6f396ad18e6', 'Raphael', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('dc37ff98-239a-4f8c-ade3-b6270f6a6006', '브이몬캡슐진화', NULL, 'adc', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('88eaf1df-0a74-4744-83a0-db863f24a099', 'SenMa', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5a8dee1e-c1c3-43c4-b27d-e5eb72cfae85', 'WTF Horo', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6701376e-6911-42bb-b287-23a41d8e057c', 'Valor', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3341b22b-e5d9-4b48-b036-a69889aff590', 'Police', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7ae34284-64cd-4cb0-b6ca-abf468e8494c', 'Eve', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9dbee17c-3413-42df-aaac-e646554e4061', 'Woody', NULL, 'adc', 'KR', '1996-11-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5bc48065-1fd4-4721-9766-9b4f36c0fa4b', 'Buzz', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('848d14db-4e68-4f4c-836b-e35d281a2958', '산악거인', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b7a28f1b-c4d7-4de3-aabc-34bfeef4c4ff', '엘리스 리신 한다', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7c140e4b-64b1-4d07-b78a-34e9e1e0e979', '엔준', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4bce504a-4a90-43e7-86b5-dff40405afe3', '황동현', NULL, 'adc', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('de886ba4-4d76-4677-882a-e3fd4adacca8', 'genius supporter', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('06d6c258-8d5a-413b-b3c9-5f23e099b526', '아세안', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f1cfbc3d-4874-48be-b7bf-f6d56dc08cf8', '메뚜기장인', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d58a9e23-5ef5-4a33-9927-a3e9afc872b2', 'MIDMOSTMIDJOM', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('643d7309-4af3-46b8-a775-44ef1da56bf1', '학생회', NULL, 'adc', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a79c595d-9ee5-4fd7-95fa-2c622a22fd5c', '우오오와', NULL, 'support', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d53a83eb-5b72-453d-9e5b-4ea50647a1eb', 'cogcog', NULL, 'top', 'JP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('acf18962-9f37-4392-812f-3ac4380054c9', 'Rainbrain', NULL, 'jungle', 'JP', '1987-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('da18cfa2-cf23-4747-aef3-ab8dbb0c575f', 'apaMEN', NULL, 'mid', 'JP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f814a280-a8d2-4d55-bd2e-7a0958e5da2f', 'Rkp', NULL, 'adc', 'JP', '1991-07-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b2580f9b-49b7-4b56-a4c0-bbe73b42a1aa', 'Lillebelt', NULL, 'support', 'JP', '1993-04-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4ca3b736-f426-4de4-b42c-51223baa7def', 'KangQui', NULL, 'top', 'KR', '1988-10-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2cd33b2f-3393-4f84-87ad-38be9ff6e893', 'AcE', NULL, 'jungle', 'KR', '1994-02-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bb9dac1f-d319-4390-b3f6-6493bce70c49', 'HooN', NULL, 'mid', 'KR', '1987-01-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('34f6ed2f-a664-4316-9bd6-a607fe9bef51', 'Hermes', NULL, 'adc', 'KR', '1992-10-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b6092409-6912-4cf6-957c-72a591d553be', 'MyLittlePony', NULL, 'support', 'KR', '1992-02-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('23baa737-99d1-4cb3-9001-eec6863bce2a', 'Aggro Boy', NULL, 'top', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c4a26bfa-eb52-4738-9964-3326994ee92a', 'Nisekoi', NULL, 'jungle', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1f5f32ae-3aad-4487-a37e-e5fae8253222', 'Wixx', NULL, 'mid', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('72ef008d-43ad-4521-b4a3-ab910833c718', 'GGoTJunGi', NULL, 'adc', 'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('598cc79a-9a2b-469d-88ab-efa4ecd20f73', 'Snowfall', NULL, 'support', 'KR', '1995-07-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('539f0f1b-23f1-4741-b803-ef2df49c70f9', 'Prydz', NULL, 'top', 'TW', '1988-02-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a83bd0ea-d3d5-4e10-837e-bd1707f43e79', 'Naz', NULL, 'jungle', 'TW', '1993-12-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e72e979a-232f-4292-a844-985d92897597', 'westdoor', NULL, 'mid', 'TW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5d2b9662-6d47-4aeb-98a3-4f7604f73476', 'GarnetDevil', NULL, 'adc', 'TW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('dd505bcf-aac0-428f-ae1d-190af325add8', 'GreenTea', NULL, 'support', 'TW', '1991-04-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('db04bac6-f3e1-4a5d-9782-5c3c3fd73284', 'QaiZer', NULL, 'top', 'TH', '1995-08-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cb99f9ec-203c-4462-afa4-217010ca407b', 'InTreso', NULL, 'mid', 'TH', '1994-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f3783b5c-d019-4ba0-85ee-8a533d53d76e', 'Lloyd', NULL, 'adc', 'TH', '1995-08-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d47e53cc-31c2-4ffa-87bf-38a274923a1d', 'SKLz', NULL, 'support', 'TH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0d2f21e3-96c0-48ec-84a5-56f912ad1851', 'Light', NULL, 'mid', 'PH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('25e3c4a9-549e-4c5b-aa16-c70de85a1eb6', 'Fear', NULL, 'adc', 'PH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9c084e46-e956-4f5b-96fd-9f8f3718c08e', 'Hatred', NULL, 'support', 'PH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bd92a2bd-d66c-4afb-a82c-7012bd82ca4c', 'Shadow', NULL, 'support', 'PH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('86bab0e6-8d06-4994-8b20-cd2f232f71bf', 'BBTY', NULL, 'top', 'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6d0cc373-fdc5-4779-9baa-7e0facaf14cd', 'Zappy', NULL, 'top', 'SG', '1993-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b7e5cc04-8033-4931-bab8-992173beb2b7', 'windowlicka', NULL, 'jungle', 'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9074f42b-70a4-4f10-afb9-a5ae34bc0c84', 'ShinYa', NULL, 'mid', 'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('98f75278-56e4-462a-beb8-b95d440559d3', 'CrazyPine', NULL, 'adc', 'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('31bfbf4c-32b2-4e0e-a015-130472c80e4a', 'Vera', NULL, 'support', 'SG', '1993-12-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f431a9a7-6335-4b54-a494-3aa0fa402335', 'QTV', NULL, 'top', 'VN', '1988-03-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1b4a2df1-3eeb-49eb-903e-d9ac4417de5d', 'Safety', NULL, 'jungle', 'VN', '1988-12-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4565b702-736b-4ca3-8f3d-3769e19e4aed', 'Optimus', NULL, 'mid', 'VN', '1996-12-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2fcd8a28-02a7-4168-b740-9cfb87d632ef', 'Lovida', NULL, 'mid', 'VN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('468b53b4-9357-4a16-9eb7-4ad3d4516791', 'Archie', NULL, 'adc', 'VN', '1992-07-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('577f39a5-7391-4eb9-bb83-d3b7c720a68c', 'Junie', NULL, 'support', 'VN', '1991-03-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0fd9ef39-2196-4295-ac09-a29a32a858e5', 'Zonda', NULL, 'top', 'TW', '1991-07-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('512fd01d-d274-493c-aa1d-44cfb5f33c25', 'Winds', NULL, 'jungle', 'TW', '1990-10-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('711928c1-7124-4a26-adf8-e71940e59884', 'OhReal', NULL, 'mid', 'TW', '1994-10-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f501ecdf-67b4-4b24-ac14-700625eea129', 'GoDJJ', NULL, 'adc', 'TW', '1994-07-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('da5b0361-4020-4d46-a79a-47eb5b5a805d', 'Awei', NULL, 'support', 'TW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('83fd913e-fdb9-4c29-b3bc-a05a013ea409', 'Knut', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e7a52891-1052-4bbd-a929-f3922377aad2', 'Chock', NULL, 'mid', 'PH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('59b20a72-4c7a-4520-9585-3628005d5c7e', 'Tgee', NULL, 'support', 'PH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d500e734-7254-4001-bd1b-71288d417ddd', 'GoNy', NULL, 'top', 'VN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e8790f33-be7f-48e1-bb37-1ae753e34532', 'Jungleology', NULL, 'jungle', 'VN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d1544f1d-c00f-44fb-abc6-747c22587546', 'Yushin', NULL, 'jungle', 'VN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6fbe8176-9d12-4a36-8a26-af25c3446d11', 'NIXWATER', NULL, 'mid', 'VN', '1985-06-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('089fde1a-70c2-4676-99cc-e7c85b3205d1', 'MinaS', NULL, 'adc', 'VN', '1996-10-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('61e3822c-2d7a-4171-9708-6d50ad7a56e7', 'Vigoss', NULL, 'support', 'VN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('eccf3591-10ce-4e95-87f1-2adb50916159', 'BeNw', NULL, 'top', 'SG', '1993-05-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('61112097-2e03-4d05-a22a-1dfe71ff942f', 'DDan', NULL, 'jungle', 'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f70b86dc-635e-4c6d-92cf-d67c1fbe5f14', 'Chawy', NULL, 'mid', 'SG', '1991-11-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('58e87a70-7bf8-4c7d-85b0-8743838fc2a7', 'KRYONICS', NULL, 'adc', 'SG', '1994-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('aca1a639-f47a-4416-a953-97c0fc3eec2b', 'HaRleLuYaR', NULL, 'support', 'SG', '1995-07-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('07952074-a5b9-4065-be7b-df191bd34125', 'Kailing', NULL, 'support', 'SG', '1987-12-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b31fed7e-4e53-45e0-a803-6189f2743101', 'Achie', NULL, 'top', 'TW', '1992-09-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('861acb26-95db-4e61-830e-a3c7d595f069', 'DinTer', NULL, 'jungle', 'TW', '1990-11-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('13a9a716-6611-4a96-ad0f-64ba3d75b4d4', 'Morning', NULL, 'mid', 'TW', '1995-10-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e3678a4d-b5a0-4fcd-b4d9-e35207106d04', 'bebe', NULL, 'adc', 'TW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5e338e18-ab7f-4fd3-832b-58d95ae48f3b', 'Jay', NULL, 'support', 'TW', '1992-09-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('893d4651-7516-4012-a9c4-b552e90ea475', 'Steak', NULL, 'top', 'TW', '1992-08-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('87bc16ed-8466-4b93-90bc-a335c55518ce', 'NL', NULL, 'adc', 'TW', '1995-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f1b7ec47-3163-48ab-8f0a-a144aeccd31d', 'SwordArt', NULL, 'support', 'TW', '1996-12-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f3686b9e-bc59-46e4-8b70-21d525c0b73d', 'Leko', NULL, 'top', 'BR', '1992-01-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7091acd4-73db-49a1-932f-0a7965626e6e', 'Revolta', NULL, 'jungle', 'BR', '1995-12-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0faa657f-0a6e-4c1c-8c73-a1ab027ebf3c', 'takeshi', NULL, 'mid', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b7abef9f-138d-466b-878e-af59ff32434c', 'manajj', NULL, 'adc', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f0a51dd8-28fa-4185-a37f-80566d0a1397', 'Alocs', NULL, 'support', 'BR', '1989-08-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cb06478e-0038-4758-af7d-881dee6ab896', 'LEP', NULL, 'top', 'BR', '1996-02-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ed5e4c71-fd67-4c23-b9f4-3693c11197ef', 'Danagorn', NULL, 'jungle', 'BR', '1992-02-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8a4d4cb5-dd6d-4546-8119-0a40957f6136', 'TinOwns', NULL, 'mid', 'BR', '1997-05-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('dc2a34e5-12c1-4fae-8f41-84db3c20b0f6', 'dans', NULL, 'adc', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a2be735e-ed41-40aa-adab-abddd1a3530c', 'bit1', NULL, 'support', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('106dabd7-ad1c-4894-9ae2-843993076f60', 'Espeon', NULL, 'support', 'BR', '1992-07-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fe28ca82-134e-48d7-bc25-e2b4693e2b1c', 'Mylon', NULL, 'top', 'BR', '1996-11-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b8ea26b7-86ba-4318-a1a8-7c33decd79fa', 'Winged', NULL, 'jungle', 'KR', '1992-08-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c6274cef-d785-4675-9213-76e2e593c8ae', 'SuNo', NULL, 'mid', 'KR', '1994-03-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('00e89b5f-be36-45b6-9292-76545b7a7b7b', 'brTT', NULL, 'adc', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9b09dbbf-d41c-4dc4-b805-feb09d922c85', 'Loop', NULL, 'support', 'BR', '1995-02-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('52509888-df64-4f16-a24b-4810cd10606b', 'Venon', NULL, 'top', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2c1ef63f-84a3-43a4-99a2-efc19a49beef', 'SirT', NULL, 'jungle', 'BR', '1992-10-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('dfcef63a-4acc-40a1-a9cb-ff06c13d4d21', 'Kami', NULL, 'mid', 'BR', '1996-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('713983a9-4c1a-4bd4-9eff-70b9b75abfc0', 'owN', NULL, 'adc', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b1d865a0-56d1-4ae1-9f6a-e579d6dd9a54', 'Minerva', NULL, 'support', 'BR', '1995-11-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('00d9a2c4-275f-45b0-ab5e-cb48aa736040', 'element', NULL, 'top', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b10b02fb-3fbe-4028-8ac7-f8f3510e106f', 'Turtle', NULL, 'jungle', 'BR', '1994-05-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('83e8028a-85e8-4619-966d-c44c6816e2a1', 'yeTz', NULL, 'mid', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fc25e625-6093-44fd-832c-f085cfa2b1ca', 'Digolera', NULL, 'adc', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cb6ee0cb-ed28-475c-9850-22db561d0172', 'Gigante', NULL, 'support', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('40746d60-ca12-49d1-8e91-ecdffb1c4806', 'w0lv', NULL, 'top', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6856b55d-31c3-47c1-a065-88f2752f8fb2', 'Jockster', NULL, 'jungle', 'BR', '1996-02-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c074a1d1-4230-421c-b833-a005435c5b52', 'Fire', NULL, 'mid', 'BR', '1990-09-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bebc8362-470a-4c84-986e-8a1c3a042376', 'micaO', NULL, 'adc', 'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e3388f67-6b3c-4471-a82e-c350f127d6f0', 'Eryon', NULL, 'support', 'BR', '1989-03-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('42b07591-0f6d-42e3-8562-70217d8de125', 'Accelerator', NULL, 'top', 'AR', '1995-10-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('405ff760-85ae-452d-a5a1-13522b9530f4', 'Khynm', NULL, 'jungle', 'AR', '1995-05-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b151e297-5d73-4d97-8b84-2ed1de6e1600', 'Kvrof', NULL, 'mid', 'AR', '1994-10-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5732bd05-361c-4dd3-8d14-a33114773e3e', '1984', NULL, 'adc', 'AR', '1993-02-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ace93bc8-ce5c-4bf9-ad1c-ac60036e25e4', 'Tomex', NULL, 'support', 'AR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8065cd4c-47c1-4478-bb02-2e133ea2b80b', 'TurtleGG', NULL, 'top', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('05e3f51d-8325-40ff-9b25-b0576420c75c', 'Helior', NULL, 'jungle', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('64673705-de2a-4e9b-9364-095704df57ef', 'chalaa', NULL, 'mid', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fb7e696b-883b-4ca9-bb00-c3bcb0591c76', 'Zeicro', NULL, 'adc', 'CL', '1996-12-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('253af738-9bab-4a22-8ed3-9625aad983e9', 'Omi', NULL, 'support', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d48dcfe8-ebc7-4066-83e8-b180fdc98773', 'MANTARRAYA', NULL, 'top', 'UY', '1994-05-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a55abd14-e960-47d6-99b0-4db64e29d209', 'FraGio', NULL, 'jungle', 'PE', '1993-05-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('89473083-5a7d-4e4a-adde-3a03219d866c', 'Uri', NULL, 'mid', 'UY', '1989-11-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('54641b2e-07c1-4de5-b971-dad4cf631541', 'Megajp', NULL, 'adc', 'UY', '1993-08-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d7a1db19-01cc-45ca-9829-0d74c11c401a', 'Badmilk', NULL, 'support', 'AR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a4e1c44a-deb3-45ca-9829-9d677df1caff', 'Rushley', NULL, 'top', 'CO', '1996-02-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cce25dc2-6419-4bef-977b-db0b825e9da2', 'S1rCris', NULL, 'jungle', 'CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a1e974cd-3c7e-488a-aa81-d4410e83ff44', 'TetricAttack', NULL, 'mid', 'CO', '1995-02-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5ada4032-21d2-43f5-b21f-7c147debb819', 'Newjack', NULL, 'adc', 'CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('09eae617-a663-4ebd-a169-15191eb2c022', 'Suppa', NULL, 'support', 'CO', '1992-03-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('225e8770-c3ca-4d2b-931d-12b75de9a12d', 'Porky', NULL, 'top', 'MX', '1995-12-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0c627abe-130d-4bc4-8afe-0df2c29285bd', 'Thyak', NULL, 'jungle', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ca3bd319-0196-4e2e-a6ba-7f52ea72a8cf', 'Seeiya', NULL, 'mid', 'MX', '1996-08-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('567006c1-4b5c-4980-a87f-d5d40d3a925c', '1an', NULL, 'adc', 'MX', '1993-11-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('049e3304-f576-4faf-aa43-71dddd460d39', 'NerzhuL', NULL, 'support', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f07c5ac2-8487-473f-a83c-5ad07da93319', 'Pillo', NULL, 'top', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fd9e7401-0cac-42ef-92d0-c04d62b5781c', 'Leafs', NULL, 'jungle', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b10910f1-d337-4a0c-9fd6-80064be5480c', 'Pansy', NULL, 'mid', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('efbbaf5e-f663-4a8d-99a7-1c93b260f7a4', 'xpng', NULL, 'adc', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('dc65fc81-a951-4a3b-820d-658ae7468605', 'Sky', NULL, 'support', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8e385769-1da7-4ddb-9925-6459b4bc8936', 'Lulos', NULL, 'top', 'TW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f3a11c0b-9cc4-41df-93f0-e8c84ade8265', 'Wikko', NULL, 'jungle', 'CO', '1991-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ce1424d0-3183-49bf-9fa4-989315d99ddd', 'irvintaype', NULL, 'mid', 'CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1706ffde-614f-42c9-95e6-017e7062e11a', 'Esteban', NULL, 'adc', 'CR', '1995-07-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bc01e733-031b-41a9-8a89-5238b82222f4', 'Naka', NULL, 'support', 'CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a27f2e0c-fc86-4bba-8a17-52988691b826', 'xSWRD', NULL, 'top', 'PA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cb1b779d-ee2f-47ae-80a4-1f599c43c07e', 'Desyah', NULL, 'jungle', 'US', '1989-06-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fe3d1659-6dff-4f72-a480-61434a5a1f7c', 'Sogo', NULL, 'mid', 'EC', '1992-08-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9ddf40a7-5abc-4763-bb8d-9dc511bd9560', '4zeer0', NULL, 'adc', 'VE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1b9e47ab-892c-4f34-bc9f-f57ce660fee2', 'AxKhan', NULL, 'support', 'CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('91b58c5a-f02b-42f7-abfb-25313b234c23', 'Arce', NULL, 'support', 'PE', '1993-06-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e75ee8c4-bba2-4ccf-a37f-6eb5cf29c540', 'El Dari', NULL, 'top', 'AR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d377b73a-5c75-435c-8e32-923fb065a054', 'CHELitw', NULL, 'jungle', 'AR', '1989-04-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b38b5c86-895e-469e-8eec-0f5e593d87d0', 'Dinamox', NULL, 'mid', 'AR', '1990-03-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f3759cbc-85ee-4dfc-95b3-35e80a9d6d77', 'Prophuth', NULL, 'adc', 'AR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2c787176-a5c6-47d7-8ee3-15c7bc918087', 'Genthix', NULL, 'support', 'AR', '1990-12-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cc5e8120-e0e3-4e2a-bf1d-73c8759ea95f', 'pR1', NULL, 'top', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('37e596b9-eaae-4276-9e40-1410d062c6b1', 'Snakin', NULL, 'jungle', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b1592cfc-95c4-4a06-97a7-cb6608f7114f', 'TroubleMaker', NULL, 'mid', 'CL', '1997-04-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a9f86e68-3342-4752-9763-9e98b876f0d4', 'Baws', NULL, 'adc', 'CL', '1995-05-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('357e0731-2254-4120-b258-9ca53928c495', 'Hazkill', NULL, 'support', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e12b49fd-a4c9-411c-b305-5a1324141805', 'Julaxe', NULL, 'jungle', 'CO', '1994-06-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bea8b223-08c7-4858-8a24-8cca9f44f5d0', 'Zeypher', NULL, 'adc', 'CO', '1996-03-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('69d99ce3-2230-43d0-9061-b236ae1c24f5', 'Cachúo', NULL, 'support', 'CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('20da8fbf-802e-4fa6-ac83-3e9b3eb13ae8', 'Gonto', NULL, 'jungle', 'AR', '1995-04-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cdc2ba9a-5f43-4449-a4e2-fae33720bbac', 'Hydra', NULL, 'mid', 'AR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('86dd5a81-f9b8-4e5a-8ebd-526c29d22118', 'Prodigy', NULL, 'adc', 'AR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d70365b7-6b26-4b8e-aa1c-bd2116e7e7cd', 'Mettaz', NULL, 'support', 'AR', '1993-11-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9baf58c6-c6d4-41d6-9d1a-57432cc8c698', 'Vendetta', NULL, 'top', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2d6d9189-1abd-49b6-a3bd-3137aee9242b', 'Mada', NULL, 'jungle', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('db1f0453-29ef-4a34-acf3-f3563f9936c7', 'Raegast', NULL, 'mid', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('62322752-6483-49f1-8092-04aed2987616', 'Blindmondz', NULL, 'adc', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1aaa4b56-c38a-4e02-981c-82a6341fe70f', 'Urek Mazin0', NULL, 'top', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('226f5e5e-a769-4365-b918-6f9f318785b1', 'H4ckerv2', NULL, 'jungle', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d0936da8-0567-4cf6-bc3b-86b2d2237702', 'Genre', NULL, 'mid', 'MX', '1994-03-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8fed0c0f-b753-404a-97e9-f893baae7f31', 'Shakita', NULL, 'support', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5be72df5-770b-4ad4-9905-ae07f31a15c6', 'Jirall', NULL, 'top', 'MX', '1996-07-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3755990b-8da1-454f-bdf8-0aca9c203b63', 'Tarzán', NULL, 'jungle', 'MX', '1993-03-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3b6a412b-5916-4b20-b5de-6b61f6357b92', 'Maxzor', NULL, 'mid', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('134fc5a5-7825-4671-8a12-11b9d9ab01a3', 'Bonjoovi', NULL, 'adc', 'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9b8222cb-9348-4ddb-aa39-115204bc5489', 'Rhopercy', NULL, 'support', 'MX', '1991-11-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('62e1f009-0971-4888-b263-64cf2b8a83fa', 'Crimson', NULL, 'top', 'TR', '1994-05-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b0722574-f446-48a1-b4d5-85fc07a07e96', 'Marshall', NULL, 'jungle', 'TR', '1998-02-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('13558a99-be17-4f9a-bdd0-5952ac9baaeb', 'EowiElwind', NULL, 'mid', 'TR', '1993-10-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('264fce90-a4eb-4751-8ba3-3507e5064cfb', 'WrisTCutter', NULL, 'adc', 'TR', '1992-02-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('69b77f74-35e3-49ec-96cc-6f01bb18d503', 'Lelouch', NULL, 'support', 'TR', '1990-11-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5abd87a7-6b89-4d42-820a-06f77058882e', 'Crisange', NULL, 'top', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('68e74131-92a7-4f50-b655-8a4e01efe16b', 'Duxen', NULL, 'jungle', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bed56f6c-a6a4-4b76-af6d-453023534a5f', 'Afrox', NULL, 'mid', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6d68d7da-4603-4298-8f27-f1112ec4b49f', 'Prod', NULL, 'adc', 'TR', '1994-10-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('208f5071-4e84-4c98-8e46-d4332abc8b52', 'Holythoth', NULL, 'support', 'TR', '1994-01-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('081b36d8-c647-4d70-9587-53cac2813a33', 'fabulous', NULL, 'top', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e3c361af-67c8-4679-8867-b34b40a229a7', 'Crystal Meth', NULL, 'jungle', 'TR', '1993-04-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c8f470a3-c708-4b0d-8fce-b46f66454c45', 'Naru', NULL, 'mid', 'TR', '1996-08-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('18e72159-3800-4f47-8944-58cb5faba897', 'Holyphoenix', NULL, 'adc', 'TR', '1997-06-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('5d4c52ef-e1c4-4f34-9e16-ab890a32fd7c', 'TrieLBaenRe', NULL, 'support', 'TR', '1988-03-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('dee2c072-ccc9-44a9-85fe-0f229a563055', 'Realen', NULL, 'top', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2a2694ab-1549-4641-909b-433583f4b54c', 'clink', NULL, 'jungle', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1a2ad687-a173-4fd8-8c89-84e6fbb8583c', 'Lethenor', NULL, 'mid', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('dd3aa534-bacf-4da4-9b37-fe03043ab446', 'Komodo', NULL, 'adc', 'TR', '1994-02-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ee806324-59ca-44e0-889d-2682c00f202b', 'un1tback', NULL, 'support', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('db88ee9c-ed02-4945-a482-ead2a8049e98', 'LongB', NULL, 'top', 'TR', '1997-04-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7c9f5e2d-ea2b-4717-a3b9-d35ebcb86f7c', 'Halpern', NULL, 'jungle', 'TR', '1992-07-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('308a9cd2-7b2f-4063-bf43-e4f334d2535b', 'Egzap', NULL, 'mid', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('578507f1-5905-4a10-b3a0-bc7e32309cb1', 'Kazze', NULL, 'adc', 'TR', '1996-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7b6ee08c-779a-41bf-9a39-0cf152be592b', 'Zergsting', NULL, 'support', 'TR', '1998-11-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('09346a46-eec3-4141-a510-48b75e5c1d2e', 'Padden', NULL, 'top', 'TR', '1995-10-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2dd28bbc-42f9-40ec-a6f3-3602a3b3fefb', 'Tatlısu', NULL, 'jungle', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('489437d5-25ab-4187-9b2e-a53fb34158de', 'MrMago', NULL, 'mid', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('64e58313-d1e4-4f6b-a7f9-2e78aff3f20a', 'Katze', NULL, 'adc', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1ee0e28e-a97c-4422-ab70-7f5f472587d6', 'Roogu', NULL, 'support', 'TR', '1994-06-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4a907b84-0555-49d3-9ef0-ef9087d48989', 'Stomaged', NULL, 'top', 'TR', '1997-03-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2e3aa419-6ec0-4b1c-a3bf-b9220ca57c29', 'Stansfield', NULL, 'jungle', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('740dc164-61fa-4621-82c3-58d45c48841c', 'ReostA', NULL, 'mid', 'TR', '1994-04-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('939603ad-bc58-4d55-be9d-7f109d4ce1f8', 'Zeitnot', NULL, 'adc', 'TR', '1995-01-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bcfb0990-2bc8-429a-99a4-0a4f4d6288d3', 'Scatz', NULL, 'support', 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('7ff8d6db-7178-459d-b830-424146d9babf', 'Swip3rR', NULL, 'top', 'AU', '1994-04-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c0ae1ee0-97e7-4e8f-94c9-dc7539192cf5', 'spookz', NULL, 'jungle', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8f745f8b-e787-4e68-8950-8d3c192f5425', 'Swiffer', NULL, 'mid', 'AU', '1994-03-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b420a962-2e19-4fa2-8978-b74c4a86e7c3', 'raydere', NULL, 'adc', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('40c861f8-4203-4194-9544-63d81323b6b2', 'Rosey', NULL, 'support', 'AU', '1994-03-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c7262445-72e2-42fb-b312-361201e0d10b', 'Cool Mog', NULL, 'top', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('067aab80-45d8-4212-ad49-dc5306c61ae1', 'Jaykey', NULL, 'jungle', 'AU', '1996-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('60f3cd98-6580-4bb5-9485-2ef1ec13c8a5', 'fourg33k', NULL, 'mid', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('88d1922a-c0ae-4c72-bed0-925a7e815b2e', 'Ness', NULL, 'adc', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1574096d-f0ec-4636-b2ef-4e240aab4a58', 'Ice Cold Killer', NULL, 'support', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('27b3e981-2701-4945-bd9e-5d279cf11016', 'Porky (Nikolo Tayag)', NULL, 'top', 'PH', '1992-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('335a4e1d-a091-4e0b-ab40-f2bdc14b4715', 'Chelby', NULL, 'jungle', 'NZ', '1996-02-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('72e0e285-fcbb-41bd-b106-d0733f3a4614', 'Keane', NULL, 'mid', 'KR', '1993-08-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9bfbb5b3-21be-4838-9049-db9d3fc41acf', 'Stars', NULL, 'adc', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0d4e6708-7e87-4fc5-ae03-75c022ec1638', 'Bhz', NULL, 'support', 'AU', '1993-03-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9d1fa4ca-5ae3-4a1b-925d-b03bd13775dd', 'Minkywhale', NULL, 'top', 'AU', '1991-12-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2ca64a88-90b8-41b6-996a-df4c7affaa8e', 'Carbon', NULL, 'jungle', 'AU', '1992-01-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('86e45541-73d4-4871-967e-f5cfbf7e25fb', 'ChuChuZ', NULL, 'mid', 'AU', '1996-10-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('76586768-18aa-4f30-9b50-f2f0c14b0526', 'Cardrid', NULL, 'adc', 'AU', '1996-10-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cc13bee1-7588-4844-8530-a44498935909', 'ErectGymnast', NULL, 'support', 'AU', '1994-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('85998fdc-3417-433e-881c-46ab13e214b2', 'Juves', NULL, 'jungle', 'AU', '1994-01-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('28df357e-2d3e-4793-8bc6-3fa30d45499e', 'JKSmithy', NULL, 'top', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('35c1d1c3-1bd0-44d7-8779-35d59c5c7ac2', 'Rippii', NULL, 'jungle', 'AU', '1995-12-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2b6293ff-3115-4835-9189-39ea4a4df7f0', 'Kenste', NULL, 'mid', 'AU', '1994-11-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('802edbf3-f35a-4a10-a85c-168d1b99ebf9', 'UberGiantsBro', NULL, 'adc', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b6155f4c-808d-4f11-b1b7-5d81e963dbd8', 'LittleUberGiant', NULL, 'support', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3cd11b6b-27f2-4d2a-8d37-ebcb7d1f2408', 'Jakattack', NULL, 'top', 'NZ', '1995-01-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fb8ee87e-a942-4661-8314-45bc392193fc', 'Zahe', NULL, 'jungle', 'AU', '1992-11-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cde301fe-2d40-4205-88ed-c7bb95f86de3', 'LilQtCheese', NULL, 'mid', 'AU', '1993-06-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3d6b7573-e50a-4f92-9ddf-1246c4b6c7f5', 'Denian', NULL, 'adc', 'AU', '1990-10-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('8d15487d-99a5-40c8-aee8-3d5543d9fc18', 'flying Joo', NULL, 'support', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e431e022-acf1-4aed-8e2b-7299676c84db', 'Pekka Kokko', NULL, 'top', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0d5bc89e-8b46-4be5-9799-773179121f95', 'Mattress', NULL, 'jungle', 'AU', '1992-01-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1ea2747f-7947-48e0-a3eb-c5f753674b74', 'Heavenz', NULL, 'mid', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('89a37c8f-d6a5-4837-ac23-c9145b213c4b', 'FirstMate', NULL, 'adc', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('f2d767ac-5ae4-44d3-85fd-4ab065ecce1c', 'DeltaFreeze', NULL, 'support', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('453b0769-5b9f-41fd-8292-b1e0b7cacd1c', 'Skwiggle', NULL, 'top', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('fe21526d-6d8d-4595-b674-485b619d7229', 'Prince', NULL, 'jungle', 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b24b4284-5787-484e-a48a-a95e221212a4', 'Rusty', NULL, 'mid', 'AU', '1993-06-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('198d63a8-7e5b-49e9-883a-59644a029155', 'Will2g', NULL, 'adc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('0619dc6d-2368-47f7-b83a-fd9f711516cc', 'Tgun', NULL, 'support', 'AU', '1990-11-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1d306043-2546-42bc-98cc-edc45d26e125', 'Kastro', NULL, 'adc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO player_teams (player_id, position, team_id) VALUES
    ('1c98c199-2783-49b1-9475-7a0437621eb2', 0, '180ca826-9041-4f53-8edb-bbb1c69f0755'),
    ('2060bf1e-fc75-446e-a569-f92336a40ac2', 0, '180ca826-9041-4f53-8edb-bbb1c69f0755'),
    ('d8b07df4-29a3-4eb1-9f39-bcf366d51cfc', 0, '180ca826-9041-4f53-8edb-bbb1c69f0755'),
    ('2b48f1ad-9ed6-4a2f-8dd2-e561f9451162', 0, '180ca826-9041-4f53-8edb-bbb1c69f0755'),
    ('73b733f6-d75f-48cc-9bbc-5fe308b7e12f', 0, '180ca826-9041-4f53-8edb-bbb1c69f0755'),
    ('b60bc157-8ac9-47d3-ba44-123c38f6bef9', 0, 'b2f1cb10-48ab-406d-a435-60bfcfb13e6d'),
    ('d1869dd9-cfbb-4477-beaa-e890a8e1f4f3', 0, 'b2f1cb10-48ab-406d-a435-60bfcfb13e6d'),
    ('a7f88801-d1bc-4328-8e9b-85a14988fede', 0, 'b2f1cb10-48ab-406d-a435-60bfcfb13e6d'),
    ('fed21ef8-9ce9-4c5c-ac18-abb63254426c', 0, 'b2f1cb10-48ab-406d-a435-60bfcfb13e6d'),
    ('bd34f4a6-2014-42f2-9328-407b37ecc20a', 0, 'b2f1cb10-48ab-406d-a435-60bfcfb13e6d'),
    ('05252b66-0631-458f-8ac0-e2514337471f', 0, '553bc53d-fa85-4925-8a32-49b73570a98c'),
    ('d261b8c8-ffeb-4968-bb2b-b8bc2cd128c0', 0, '553bc53d-fa85-4925-8a32-49b73570a98c'),
    ('90ae0111-868d-471c-a350-310671eeaed2', 0, '553bc53d-fa85-4925-8a32-49b73570a98c'),
    ('c8622f0d-ebd5-4950-ac16-f3d20b33e315', 0, '553bc53d-fa85-4925-8a32-49b73570a98c'),
    ('76941ed9-5e7c-4965-95bb-0af80955a14f', 0, '553bc53d-fa85-4925-8a32-49b73570a98c'),
    ('99600337-868b-4acd-a0e3-263244aeae68', 0, '07ebcbcc-43a1-467f-a02e-e311dd728acb'),
    ('e127562e-d6b7-418b-8f7a-ae3261697080', 0, '07ebcbcc-43a1-467f-a02e-e311dd728acb'),
    ('a34ac609-84b9-4faf-8937-4f9d5e3378f8', 0, '07ebcbcc-43a1-467f-a02e-e311dd728acb'),
    ('f6a114c8-ea95-4e08-97a8-9ee68e667fd0', 0, '07ebcbcc-43a1-467f-a02e-e311dd728acb'),
    ('51077df0-615c-4a47-8fa7-4c5db9b1916e', 0, 'a77584a8-5c69-45e0-8509-77bc2a83105b'),
    ('f950048f-2233-4b70-b73c-c368fd349e14', 0, 'a77584a8-5c69-45e0-8509-77bc2a83105b'),
    ('7b9060c0-5469-400c-a1b6-1dbb0b14e1d9', 0, 'a77584a8-5c69-45e0-8509-77bc2a83105b'),
    ('659580e8-9793-4622-9425-e9c8aad965df', 0, 'a77584a8-5c69-45e0-8509-77bc2a83105b'),
    ('0a8a11dc-af5b-4f58-ac68-18cb1d5f1079', 0, 'a77584a8-5c69-45e0-8509-77bc2a83105b'),
    ('99273260-9dcf-48c9-a9a6-830985e33997', 0, 'a927109d-e5d4-4e3c-89d4-1261332e4ee2'),
    ('69fa88ba-11a7-4aff-806b-f3d4591d1da8', 0, 'a927109d-e5d4-4e3c-89d4-1261332e4ee2'),
    ('15181712-edd3-4f0e-8f02-9e8bf110e3e7', 0, 'a927109d-e5d4-4e3c-89d4-1261332e4ee2'),
    ('ace21f9e-cc1b-4124-8082-07953414ec4b', 0, 'a927109d-e5d4-4e3c-89d4-1261332e4ee2'),
    ('b352fad5-ab73-4b33-9e83-b5d6be4d2670', 0, 'a927109d-e5d4-4e3c-89d4-1261332e4ee2'),
    ('a8a2b683-638c-408e-bbab-3237b4d07ce1', 0, 'd0064273-bcdb-40ca-8dd5-c46807053bc3'),
    ('4339266e-c795-4775-a645-cbf98e1bea81', 0, 'd0064273-bcdb-40ca-8dd5-c46807053bc3'),
    ('a485f766-1cad-4aa1-af30-426754dfba95', 0, 'd0064273-bcdb-40ca-8dd5-c46807053bc3'),
    ('c2c96fbe-d386-43fe-989b-7af07c7bec9d', 0, 'd0064273-bcdb-40ca-8dd5-c46807053bc3'),
    ('399c456b-043a-4418-8a11-59eaca1a5230', 0, 'd0064273-bcdb-40ca-8dd5-c46807053bc3'),
    ('a185d4a5-a3a4-4e55-b932-ddef1f2e5f18', 0, '7a49f0a2-22fd-4b58-96b9-543355abd4e9'),
    ('f2aac3f6-eea3-46a9-83ed-8df99bcd2f7b', 0, '7a49f0a2-22fd-4b58-96b9-543355abd4e9'),
    ('ee530824-c499-47b2-99fd-b1b0a3324ede', 0, '7a49f0a2-22fd-4b58-96b9-543355abd4e9'),
    ('aba35a68-1f97-4561-b79c-c3f0f1e59570', 0, '7a49f0a2-22fd-4b58-96b9-543355abd4e9'),
    ('31d23ac8-cccb-4f29-b2d0-f0ef6dc698f3', 0, '7a49f0a2-22fd-4b58-96b9-543355abd4e9'),
    ('5ec51de6-223f-4d67-9d9f-f66de29b6ac1', 0, 'c9652800-4bdf-4d32-a133-a4b116ac31d1'),
    ('b6662b9d-a8e0-4390-b38b-d3b313e412f7', 0, 'c9652800-4bdf-4d32-a133-a4b116ac31d1'),
    ('557abc47-6235-401f-9a51-70cd9bb0cc70', 0, 'c9652800-4bdf-4d32-a133-a4b116ac31d1'),
    ('1a69c5b8-d9d5-47e5-b7ff-f76d43ec71a7', 0, 'c9652800-4bdf-4d32-a133-a4b116ac31d1'),
    ('42fa7925-a669-4001-ad6e-f72c91eee582', 0, 'c9652800-4bdf-4d32-a133-a4b116ac31d1'),
    ('bfcd9d64-7fba-41d0-80a5-92c8aae8f9f3', 0, '77f27be0-86f4-4094-bd07-b87841f007e5'),
    ('58e636bb-c0da-4e4b-90cc-32db53a03d54', 0, '77f27be0-86f4-4094-bd07-b87841f007e5'),
    ('12468385-11ca-480b-bd0c-00f7d499e10c', 0, '77f27be0-86f4-4094-bd07-b87841f007e5'),
    ('b513d1f8-7c92-4617-8190-3d2831725e5e', 0, '77f27be0-86f4-4094-bd07-b87841f007e5'),
    ('ff5faf99-8328-4431-b722-2e20c759179f', 0, '77f27be0-86f4-4094-bd07-b87841f007e5'),
    ('d380fac4-8512-4b78-9100-99e14db4ac1f', 0, '847311ca-a6c0-4f79-a717-f77fc7e0b1db'),
    ('25065bdc-17f6-44a2-aa65-dd233f3b5672', 0, '847311ca-a6c0-4f79-a717-f77fc7e0b1db'),
    ('557d1a6e-188b-4b2e-80de-70547c4a7365', 0, '847311ca-a6c0-4f79-a717-f77fc7e0b1db'),
    ('acd8fa6b-d75c-43f6-8fd1-3782c46f3472', 0, '847311ca-a6c0-4f79-a717-f77fc7e0b1db'),
    ('87f57365-bfd0-4b2f-9d65-0c6139f6f6ec', 0, 'eff22c5a-fa9e-4e93-ad1f-520c8ea88eae'),
    ('7f70fbf2-2d6e-4215-867a-2e12ba4adc28', 0, 'eff22c5a-fa9e-4e93-ad1f-520c8ea88eae'),
    ('b0643902-be93-496c-aac6-76284aab5e5b', 0, 'eff22c5a-fa9e-4e93-ad1f-520c8ea88eae'),
    ('098c7d31-0f56-49f8-9193-4faae507781b', 0, 'eff22c5a-fa9e-4e93-ad1f-520c8ea88eae'),
    ('66691e41-93b7-4352-ad91-463b74e12498', 0, '3a46ce7d-5032-4455-885f-105355777a58'),
    ('6a9c51b9-4a24-41c0-a270-a667a98a42f7', 0, '3a46ce7d-5032-4455-885f-105355777a58'),
    ('703a3e12-68f5-4484-88e0-2865ee0141a6', 0, '3a46ce7d-5032-4455-885f-105355777a58'),
    ('efde7077-c1ad-49cf-a6e5-a65399471cb5', 0, '3a46ce7d-5032-4455-885f-105355777a58'),
    ('567be611-52f1-4c69-ba0e-a23f55e5d85e', 0, 'bd913d3d-806f-4500-8c0e-60f57a065fd7'),
    ('49564475-2ded-499f-b921-165d6154b20b', 0, 'bd913d3d-806f-4500-8c0e-60f57a065fd7'),
    ('5afc7478-b1f8-4600-bf7d-4c6e8fa59696', 0, 'bd913d3d-806f-4500-8c0e-60f57a065fd7'),
    ('0e7269f8-f020-4bc5-99f2-c80fa96ccb5a', 0, 'bd913d3d-806f-4500-8c0e-60f57a065fd7'),
    ('6883eac4-5ab8-4c12-9f50-a0bd8016cbb2', 0, 'bd913d3d-806f-4500-8c0e-60f57a065fd7'),
    ('2e271ad1-1587-432a-9c63-45266adf3d81', 0, 'ffcc2752-c61f-431e-8e25-bb4a73433b6b'),
    ('aee4ce7a-382b-4c76-a023-1ff8f4e9bf0f', 0, 'ffcc2752-c61f-431e-8e25-bb4a73433b6b'),
    ('351c7844-8f86-4555-8a26-2df304a4849a', 0, 'ffcc2752-c61f-431e-8e25-bb4a73433b6b'),
    ('63de23b0-efbe-4ba3-b55e-316576395f9b', 0, 'ffcc2752-c61f-431e-8e25-bb4a73433b6b'),
    ('b0c78431-c6d0-4c2c-a4db-9f5b27ffd795', 0, 'ffcc2752-c61f-431e-8e25-bb4a73433b6b'),
    ('4944feae-52f8-46f1-970f-674a2ccab25a', 0, 'c0ae4083-77c9-404b-aea4-2988fb9443c5'),
    ('0bee2f91-3ae2-4191-986a-ad5600b5460b', 0, 'c0ae4083-77c9-404b-aea4-2988fb9443c5'),
    ('f9e4932b-16f2-4fef-84e8-4f76e1639e2e', 0, 'c0ae4083-77c9-404b-aea4-2988fb9443c5'),
    ('9fb7d255-5ee2-4425-b6ed-121d44aa9e8a', 0, 'c0ae4083-77c9-404b-aea4-2988fb9443c5'),
    ('7d254ea8-b947-4bad-ba54-4b64701bebb9', 0, 'c0ae4083-77c9-404b-aea4-2988fb9443c5'),
    ('86d9b45b-8227-408c-aa80-e0b90df8ee37', 0, 'b152ab80-622e-4167-9abe-897f2b9a8e5c'),
    ('115e2205-e770-4651-8c31-7771f1f814f0', 0, 'b152ab80-622e-4167-9abe-897f2b9a8e5c'),
    ('13da5814-f7df-483f-93cd-71b3600f5b07', 0, 'b152ab80-622e-4167-9abe-897f2b9a8e5c'),
    ('b8d93484-a3ca-441b-8739-2a6716beefed', 0, 'b152ab80-622e-4167-9abe-897f2b9a8e5c'),
    ('a1a8584f-1dd3-472f-ab92-0067d2c49bfa', 0, '87e646e9-2408-4224-8a24-6a6770c51bf8'),
    ('de91127f-97ff-4083-aea3-9d8ff172d06d', 0, '87e646e9-2408-4224-8a24-6a6770c51bf8'),
    ('0ae9e624-3244-475f-9b79-4f7406902200', 0, '87e646e9-2408-4224-8a24-6a6770c51bf8'),
    ('e15568c4-b2da-4a8d-aa5e-dcd9b76fd94f', 0, '87e646e9-2408-4224-8a24-6a6770c51bf8'),
    ('82c66565-6569-44fe-8d8c-b6634bf57cfc', 0, 'd572ef5d-18b6-446d-a29c-e385f2dcc86d'),
    ('989d6763-0cbe-48a7-b371-90231606f7c5', 0, 'd572ef5d-18b6-446d-a29c-e385f2dcc86d'),
    ('85f49f75-6587-48cf-b29a-39856100252e', 0, 'd572ef5d-18b6-446d-a29c-e385f2dcc86d'),
    ('f44a6a61-c02f-4913-bc7b-c16065e4cd08', 0, 'd572ef5d-18b6-446d-a29c-e385f2dcc86d'),
    ('5f8cedcc-b961-4edd-89b1-e2a6111f9ea5', 0, 'd572ef5d-18b6-446d-a29c-e385f2dcc86d'),
    ('72243983-ce06-46b2-89b6-954bc059ec9c', 0, '3f2a69f1-6510-4e51-be50-f7f616e4e2e1'),
    ('ed986182-8981-4192-9cba-030d11e4125b', 0, '3f2a69f1-6510-4e51-be50-f7f616e4e2e1'),
    ('a1f3edfe-0de7-40e1-8095-24494f4e3450', 0, '3f2a69f1-6510-4e51-be50-f7f616e4e2e1'),
    ('fdf2669b-a1ed-4a9e-af37-8fe2baccdfcf', 0, '3f2a69f1-6510-4e51-be50-f7f616e4e2e1'),
    ('1d1413fc-25d0-4154-8ef2-213fe1556db6', 0, '3f2a69f1-6510-4e51-be50-f7f616e4e2e1'),
    ('8bd446b7-55bf-4f47-87bb-9e2352d66d58', 0, '058cb905-3ee3-4c23-97ab-7eeb4ffc7783'),
    ('58d736ee-b1a7-4910-953a-2ec4f0ed2f59', 0, '058cb905-3ee3-4c23-97ab-7eeb4ffc7783'),
    ('0fedc059-8085-4d74-abf9-78763ccc36ce', 0, '058cb905-3ee3-4c23-97ab-7eeb4ffc7783'),
    ('3a4a8568-5633-49d0-9a51-79a3e8905a05', 0, '058cb905-3ee3-4c23-97ab-7eeb4ffc7783'),
    ('8b754483-1dea-476a-91f5-a69c5c7a22de', 0, '058cb905-3ee3-4c23-97ab-7eeb4ffc7783'),
    ('c3414ec9-3353-4013-aff9-37b4b813828a', 0, 'e59a1de0-8100-4d9f-a803-6981da957be4'),
    ('a15d92b1-6224-4e23-94a0-216fe892f43c', 0, 'e59a1de0-8100-4d9f-a803-6981da957be4'),
    ('2af6d2b4-fc06-4b41-bcde-eb6cba792686', 0, 'e59a1de0-8100-4d9f-a803-6981da957be4'),
    ('1c2f2e91-a788-4868-a77a-a20133535ae1', 0, 'e59a1de0-8100-4d9f-a803-6981da957be4'),
    ('d644aad2-0455-49e7-8f77-9608a8abf4e0', 0, 'e59a1de0-8100-4d9f-a803-6981da957be4'),
    ('d47f39fa-58ff-4405-a83c-9526ce71de04', 0, '8a6220a4-4e35-41b0-922a-8df981262634'),
    ('0bf0dd23-c3ae-4147-9450-2eab93db4688', 0, '8a6220a4-4e35-41b0-922a-8df981262634'),
    ('de390e9b-0a30-4414-81be-ef4e241b8e04', 0, '8a6220a4-4e35-41b0-922a-8df981262634'),
    ('b73216d6-70c8-4248-859a-c6d76cff8881', 0, '8a6220a4-4e35-41b0-922a-8df981262634'),
    ('75cf222e-7724-43c5-8983-48233ec6bc1c', 0, 'd99eb69f-7091-45d8-8a33-50d75e5e0347'),
    ('fab83dff-8617-4ad6-808a-9390b128a66a', 0, 'd99eb69f-7091-45d8-8a33-50d75e5e0347'),
    ('a5ab8724-6abb-48bd-87d9-f0eae39a84a1', 0, 'd99eb69f-7091-45d8-8a33-50d75e5e0347'),
    ('de4a8e80-fafc-44ef-8d05-27dd7d356251', 0, 'd99eb69f-7091-45d8-8a33-50d75e5e0347'),
    ('0d6c1ecb-fad2-4580-96a2-87e755e313a8', 0, 'd99eb69f-7091-45d8-8a33-50d75e5e0347'),
    ('82214463-9f1c-4867-9b5d-2c25735f07c9', 0, '11d46a75-f62c-4e70-a0be-ea38400572f1'),
    ('0c4aa3c5-25ff-43a4-88e0-8359274cb926', 0, '11d46a75-f62c-4e70-a0be-ea38400572f1'),
    ('ca262eb3-1d1c-4235-8cd0-a8557a868a8a', 0, '11d46a75-f62c-4e70-a0be-ea38400572f1'),
    ('2312a2e6-95c7-46cd-937a-f17c2ecf554a', 0, '11d46a75-f62c-4e70-a0be-ea38400572f1'),
    ('01299ce1-c106-452c-9ff2-310f54ad564e', 0, '11d46a75-f62c-4e70-a0be-ea38400572f1'),
    ('6fb7aaee-4a8f-4dd1-9625-0da06eb7df05', 0, '6a19be8b-969f-4867-b75d-9be1d11a6da0'),
    ('37843eb8-1a60-4a06-96a4-078d8f8ac850', 0, '6a19be8b-969f-4867-b75d-9be1d11a6da0'),
    ('706c8e1a-6ae8-4903-9573-b2159e8d4b6b', 0, '6a19be8b-969f-4867-b75d-9be1d11a6da0'),
    ('59744412-5540-42c6-b710-ee6f0822cae5', 0, '6a19be8b-969f-4867-b75d-9be1d11a6da0'),
    ('37dbb6f4-480e-4186-a35f-664e43f56de9', 0, '6a19be8b-969f-4867-b75d-9be1d11a6da0'),
    ('b0aa12a5-9ad6-4ed4-9a7a-c9e98241299d', 0, '0322e9f4-52ed-4388-91d1-105030e5e287'),
    ('69e6f079-d3cc-407f-96b9-c6ae9fea5052', 0, '0322e9f4-52ed-4388-91d1-105030e5e287'),
    ('214f0806-841d-4a19-a7ff-f138a86b017c', 0, '0322e9f4-52ed-4388-91d1-105030e5e287'),
    ('35a3da3c-5508-4e3c-8f66-6dc64c12d57b', 0, '0322e9f4-52ed-4388-91d1-105030e5e287'),
    ('b2c36f05-113c-4bce-a002-81605e3508aa', 0, '0322e9f4-52ed-4388-91d1-105030e5e287'),
    ('726b4637-bd6c-48bb-9bbc-b6b7dc99f621', 0, '846207e6-3c39-47d8-bc1d-c50d5296c010'),
    ('10d91ff3-6674-4a15-9692-32cda6eb3650', 0, '846207e6-3c39-47d8-bc1d-c50d5296c010'),
    ('e22b162e-c0d4-44c2-96d3-e0e3973e2629', 0, '846207e6-3c39-47d8-bc1d-c50d5296c010'),
    ('a2b14002-19a2-44aa-913f-d34fda2f37cc', 0, '846207e6-3c39-47d8-bc1d-c50d5296c010'),
    ('abf6dab1-87a6-4999-abd9-895ac6908b96', 0, '846207e6-3c39-47d8-bc1d-c50d5296c010'),
    ('6baba667-152b-47bc-8b13-509e8475a389', 0, '9797d2e6-4d12-4d1d-872d-a9eb5a332357'),
    ('d97849c3-d4dc-467b-9f6e-698260a513d8', 0, '9797d2e6-4d12-4d1d-872d-a9eb5a332357'),
    ('7ea77ba4-8d75-4e22-96d7-bf0a7d47cbe8', 0, '9797d2e6-4d12-4d1d-872d-a9eb5a332357'),
    ('ff355fce-a898-4b90-9cd0-c78aef5a7918', 0, '9797d2e6-4d12-4d1d-872d-a9eb5a332357'),
    ('428bc44e-1470-4a9b-9ae2-7657b05a3684', 0, '9797d2e6-4d12-4d1d-872d-a9eb5a332357'),
    ('62b30310-8ff7-4861-9c90-e30ee1719fac', 0, '003475ee-3175-4af6-9a8b-bc954662e074'),
    ('19026f7e-1453-4f67-b3df-4135e7db7be0', 0, '003475ee-3175-4af6-9a8b-bc954662e074'),
    ('4bbef270-06f7-42d1-9970-7300e1b91f9b', 0, '003475ee-3175-4af6-9a8b-bc954662e074'),
    ('03c3ecf5-a123-44b6-8b4f-01425743ba2c', 0, '003475ee-3175-4af6-9a8b-bc954662e074'),
    ('4b967f30-85cb-4beb-904f-9a83a030eaf9', 0, '467c6a53-a751-4429-8ebc-7e2833670986'),
    ('a1061603-e8ef-4331-9aeb-ce551df94ec0', 0, '467c6a53-a751-4429-8ebc-7e2833670986'),
    ('df1526a3-1e5c-4a84-b57e-2f0c61890f82', 0, '467c6a53-a751-4429-8ebc-7e2833670986'),
    ('0929f4c1-1581-4fba-8b2d-9dadab47d90c', 0, '467c6a53-a751-4429-8ebc-7e2833670986'),
    ('faa733ea-f64b-4b8e-9b6d-9d00bab95fef', 0, '467c6a53-a751-4429-8ebc-7e2833670986'),
    ('28903bd4-5592-4cb7-a257-a387b0c08ceb', 0, '94ddd53a-08b3-42bf-b88a-3d7c7c8f1afb'),
    ('fa6a6d20-4cb4-4f57-a711-3a863871eefe', 0, '94ddd53a-08b3-42bf-b88a-3d7c7c8f1afb'),
    ('388f8930-dbaa-4133-9364-da12e95d5796', 0, '94ddd53a-08b3-42bf-b88a-3d7c7c8f1afb'),
    ('2b92f747-6cba-4c8e-a9fb-9b03720da0a8', 0, '94ddd53a-08b3-42bf-b88a-3d7c7c8f1afb'),
    ('057fe6a4-d074-465c-b00d-2044bac1e463', 0, '94ddd53a-08b3-42bf-b88a-3d7c7c8f1afb'),
    ('cb642616-253d-499e-89cd-844058edfba6', 0, 'f4c1dd56-199f-41aa-8e5e-7f3046f3787d'),
    ('22575232-0112-4f50-a814-d8a1086ba1d8', 0, 'd4497457-5af7-4678-bc66-50ad29adc696'),
    ('51ce1b17-b062-411e-bd44-0feab65f853e', 0, 'd4497457-5af7-4678-bc66-50ad29adc696'),
    ('6fb0ca7a-ec90-4092-9d47-c6b55d584162', 0, 'ba4009ed-b0c1-4c42-bd77-290635d22c5a'),
    ('7bde49cf-4fd5-4b41-8f4a-1c35cf1e01a1', 0, 'ba4009ed-b0c1-4c42-bd77-290635d22c5a'),
    ('b43500d1-e3ae-4736-9ac3-a7db92d76473', 0, 'ba4009ed-b0c1-4c42-bd77-290635d22c5a'),
    ('fb0dc054-65c7-4bdf-b5fa-765b3f952436', 0, 'ba4009ed-b0c1-4c42-bd77-290635d22c5a'),
    ('e71370ea-982a-4c69-baa2-9c1f51b8a2f0', 0, 'b61e025e-bc5c-4ec0-a258-3444b03a830d'),
    ('b0825a3b-8249-431f-8100-7023e7c289f6', 0, 'b61e025e-bc5c-4ec0-a258-3444b03a830d'),
    ('d0d547e0-26e8-4225-92b4-d2e16fa271f6', 0, 'b61e025e-bc5c-4ec0-a258-3444b03a830d'),
    ('e38e397d-6a60-400e-8cec-cc375c034a35', 0, 'b61e025e-bc5c-4ec0-a258-3444b03a830d'),
    ('bac83c39-c360-48ba-a77f-89d1a4a32364', 0, 'b61e025e-bc5c-4ec0-a258-3444b03a830d'),
    ('51f97ead-037b-4e23-89da-a53829ab4949', 0, 'dfa6bdeb-4041-4af7-a0c9-9d29394807f4'),
    ('aa3999c2-3bc0-4cdc-9a7e-3473c4d98b00', 0, 'dfa6bdeb-4041-4af7-a0c9-9d29394807f4'),
    ('06589384-cd93-4578-8d65-0b78cbf8944a', 0, 'dfa6bdeb-4041-4af7-a0c9-9d29394807f4'),
    ('bf073803-18f8-44ef-9e36-245bff258bea', 0, 'dfa6bdeb-4041-4af7-a0c9-9d29394807f4'),
    ('446326f4-16ae-4d06-8c93-9196c5d5629c', 0, 'dfa6bdeb-4041-4af7-a0c9-9d29394807f4'),
    ('4296a070-f786-415a-8143-3715f0381baa', 0, '9f513f87-e8e7-4533-82c2-34f5daaf7788'),
    ('7cc63d22-ac84-4537-b6f7-9273b0b49e85', 0, '9f513f87-e8e7-4533-82c2-34f5daaf7788'),
    ('7bf0476a-b18f-4915-b400-714e959dc6e0', 0, 'df5e485f-5136-494d-bfd6-3a7dd4ceab70'),
    ('5d469055-ae60-4f02-967a-605008d5d74d', 0, 'df5e485f-5136-494d-bfd6-3a7dd4ceab70'),
    ('2e9bc330-9eb0-41c9-8fdf-503a9e88e34c', 0, 'df5e485f-5136-494d-bfd6-3a7dd4ceab70'),
    ('f1bce540-5e71-487d-afd6-13bd9796fae2', 0, 'df5e485f-5136-494d-bfd6-3a7dd4ceab70'),
    ('b50a753c-ad77-4853-8056-c23897cd094d', 0, 'df5e485f-5136-494d-bfd6-3a7dd4ceab70'),
    ('8463cd8f-3285-4737-b770-42b75dd71166', 0, 'd72d39fa-8895-4b04-9a54-1c0f308545e5'),
    ('29816c2b-815d-4b02-b841-999471b0e037', 0, 'd72d39fa-8895-4b04-9a54-1c0f308545e5'),
    ('0011af54-8916-4027-b5d1-b5de90c3166a', 0, 'd72d39fa-8895-4b04-9a54-1c0f308545e5'),
    ('2d9bda42-77fa-440d-bbbe-7915d0c6accf', 0, 'd72d39fa-8895-4b04-9a54-1c0f308545e5'),
    ('3d371c13-d128-44a0-87fd-e4839783e887', 0, 'd72d39fa-8895-4b04-9a54-1c0f308545e5'),
    ('15db3036-26d2-40fe-a813-e7a7902a8806', 0, 'd72d39fa-8895-4b04-9a54-1c0f308545e5'),
    ('8f6b867d-b09c-4b67-855c-0c5d6fd61cec', 0, 'c7fc6f36-a10f-47b9-9c0e-eb1a393a2133'),
    ('b79a2b2b-d297-41e1-8575-2ef08f213eb2', 0, 'c7fc6f36-a10f-47b9-9c0e-eb1a393a2133'),
    ('c7e3796f-4c75-4395-88f8-76d767dc26b1', 0, 'c7fc6f36-a10f-47b9-9c0e-eb1a393a2133'),
    ('be3a7ec5-ae95-46ff-b906-0a031516beb5', 0, 'c7fc6f36-a10f-47b9-9c0e-eb1a393a2133'),
    ('2bedf544-e96d-4bd3-9dc9-ab66c134bc2b', 0, 'dc647927-8541-4129-9ff9-8cbae0ff997b'),
    ('44624bf6-8bc6-4aab-b1b5-d364b89e1d76', 0, 'dc647927-8541-4129-9ff9-8cbae0ff997b'),
    ('e0e1a674-90da-4a29-b763-4283b4541e25', 0, 'dc647927-8541-4129-9ff9-8cbae0ff997b'),
    ('2a223e3a-c1aa-4cdb-9136-1c80abf4339b', 0, 'dc647927-8541-4129-9ff9-8cbae0ff997b'),
    ('c7f213fe-b0b8-43fb-8235-bef82474d61f', 0, 'dc647927-8541-4129-9ff9-8cbae0ff997b'),
    ('d0e34b90-e185-43fa-8406-a8d53b7c56e9', 0, '6578c1ec-881b-4836-90b4-5c6972e16fb3'),
    ('2565292f-3c04-46cb-820f-80bd619e6eb8', 0, '6578c1ec-881b-4836-90b4-5c6972e16fb3'),
    ('064c19af-b7de-4540-8730-8145b099732e', 0, '6578c1ec-881b-4836-90b4-5c6972e16fb3'),
    ('b7815159-8dea-4127-a7be-ea47d3db7121', 0, '6578c1ec-881b-4836-90b4-5c6972e16fb3'),
    ('b302831f-12e2-45b0-9180-99dde9fb0078', 0, '6578c1ec-881b-4836-90b4-5c6972e16fb3'),
    ('55c37bad-2f91-427e-bd1d-a45d2426645f', 0, '81937ca3-b070-4645-a780-0191197d6a37'),
    ('36e379b2-4a9d-4dff-96b5-8db7c49d475d', 0, '81937ca3-b070-4645-a780-0191197d6a37'),
    ('c0907f09-b5e0-41e3-874b-bd8abf10cf47', 0, '81937ca3-b070-4645-a780-0191197d6a37'),
    ('904080c9-b3b0-4055-aa87-7d21948b6310', 0, '81937ca3-b070-4645-a780-0191197d6a37'),
    ('dd4ce0be-a15c-43bf-89e5-b8df02d46add', 0, '81937ca3-b070-4645-a780-0191197d6a37'),
    ('07f04bc4-a4df-4f16-aa40-1e953f742247', 0, '29fa1a87-774f-4d16-90f9-289a7d496452'),
    ('4d00222c-c398-451e-8f0b-e9bfe07f022f', 0, '29fa1a87-774f-4d16-90f9-289a7d496452'),
    ('2116dcd2-90e4-4d40-b2bd-ecbf1c76729d', 0, '29fa1a87-774f-4d16-90f9-289a7d496452'),
    ('45bb7c75-5252-4f97-a4dc-abb2570d44d6', 0, '29fa1a87-774f-4d16-90f9-289a7d496452'),
    ('9308ac29-8afb-4ffa-ae4f-bf23f92bc953', 0, '29fa1a87-774f-4d16-90f9-289a7d496452'),
    ('2c051d95-0948-45f8-bf46-99fe5efe6f38', 0, '6dc21f2f-3c6e-46b0-bdec-dfdfbb397277'),
    ('b2faaf43-90c7-46f0-aad4-0c20af1ea00c', 0, '6dc21f2f-3c6e-46b0-bdec-dfdfbb397277'),
    ('72ba2b5b-f9ba-43e2-ab58-2ede94b0680a', 0, '6dc21f2f-3c6e-46b0-bdec-dfdfbb397277'),
    ('b079a099-c105-4f37-b3af-2fe18ce9bb13', 0, '6dc21f2f-3c6e-46b0-bdec-dfdfbb397277'),
    ('e8d85a7b-4af3-42ee-8f4a-f21fcdc9afdd', 0, '6dc21f2f-3c6e-46b0-bdec-dfdfbb397277'),
    ('13d7aa0a-269f-4ca3-a2a8-edab4a512150', 0, '79a55eee-84a8-46ec-8082-fb3a77d22ac7'),
    ('344cc86c-ad3a-4234-b383-1ea5176903f5', 0, '79a55eee-84a8-46ec-8082-fb3a77d22ac7'),
    ('c804425c-992b-467d-bfeb-0d8db12da303', 0, '79a55eee-84a8-46ec-8082-fb3a77d22ac7'),
    ('8f1944b3-8caa-49aa-a4cd-d37b00224cae', 0, '79a55eee-84a8-46ec-8082-fb3a77d22ac7'),
    ('39559272-6e76-4351-adf2-3137d2a97cfc', 0, '79a55eee-84a8-46ec-8082-fb3a77d22ac7'),
    ('601dca3f-2091-439b-b627-86b13f4b6a1e', 0, 'f1a25f34-788a-4bca-8fd8-75312169a66e'),
    ('bfa40682-3a89-4d4e-9638-9caf08b2061c', 0, 'f1a25f34-788a-4bca-8fd8-75312169a66e'),
    ('414fc081-b458-449b-9652-2d631b648ee5', 0, 'f1a25f34-788a-4bca-8fd8-75312169a66e'),
    ('a91a29f1-b176-45b8-9416-8f3572ee4c6b', 0, 'f1a25f34-788a-4bca-8fd8-75312169a66e'),
    ('89aed1ef-9a10-4c03-a547-37992d55414c', 0, 'f1a25f34-788a-4bca-8fd8-75312169a66e'),
    ('e01749af-7009-44da-98c2-810d814ec264', 0, '620e3a7c-5f5f-4de4-a633-1770ef4a5bba'),
    ('343606c7-38e1-4e5b-a190-2ecb4960fab3', 0, '620e3a7c-5f5f-4de4-a633-1770ef4a5bba'),
    ('5ab31b6e-bc57-40a2-88e0-f99a35848687', 0, '620e3a7c-5f5f-4de4-a633-1770ef4a5bba'),
    ('a2c9b2f2-9925-420b-9e26-68056f044eeb', 0, '620e3a7c-5f5f-4de4-a633-1770ef4a5bba'),
    ('6211a760-f50f-40ec-a93c-2b412238d93c', 0, '620e3a7c-5f5f-4de4-a633-1770ef4a5bba'),
    ('8b68e372-98a6-46bc-b323-b5dcaad1441e', 0, '437dce60-08d4-4ab7-b925-694a4b0c029e'),
    ('34cfa7ca-e3d0-4a31-bcb7-4fa9f7e5a9b7', 0, '437dce60-08d4-4ab7-b925-694a4b0c029e'),
    ('dc9580bf-7323-44af-a405-63324a290613', 0, '437dce60-08d4-4ab7-b925-694a4b0c029e'),
    ('8c38d2ab-b868-4ec3-863a-e9eb99fb60fb', 0, '437dce60-08d4-4ab7-b925-694a4b0c029e'),
    ('c3f64376-65a5-4418-9370-47a51f6a7c05', 0, '437dce60-08d4-4ab7-b925-694a4b0c029e'),
    ('38dc26e9-629a-4295-9419-75a853a3b30a', 0, '3ba15f05-d443-49e3-be14-048092f5323c'),
    ('e46961d7-8f07-4069-80a0-c1c4df3272c8', 0, '3ba15f05-d443-49e3-be14-048092f5323c'),
    ('934fb4b2-4d0e-43d3-aebb-e6f396ad18e6', 0, '3ba15f05-d443-49e3-be14-048092f5323c'),
    ('dc37ff98-239a-4f8c-ade3-b6270f6a6006', 0, '3ba15f05-d443-49e3-be14-048092f5323c'),
    ('88eaf1df-0a74-4744-83a0-db863f24a099', 0, '3ba15f05-d443-49e3-be14-048092f5323c'),
    ('5a8dee1e-c1c3-43c4-b27d-e5eb72cfae85', 0, '7ab469d7-6953-47a6-9d89-86f21e3da711'),
    ('6701376e-6911-42bb-b287-23a41d8e057c', 0, '7ab469d7-6953-47a6-9d89-86f21e3da711'),
    ('3341b22b-e5d9-4b48-b036-a69889aff590', 0, '7ab469d7-6953-47a6-9d89-86f21e3da711'),
    ('7ae34284-64cd-4cb0-b6ca-abf468e8494c', 0, '7ab469d7-6953-47a6-9d89-86f21e3da711'),
    ('9dbee17c-3413-42df-aaac-e646554e4061', 0, '7ab469d7-6953-47a6-9d89-86f21e3da711'),
    ('5bc48065-1fd4-4721-9766-9b4f36c0fa4b', 0, '7ab469d7-6953-47a6-9d89-86f21e3da711'),
    ('848d14db-4e68-4f4c-836b-e35d281a2958', 0, '9cafc5a1-84a0-4bca-a38f-dd2d61210a18'),
    ('b7a28f1b-c4d7-4de3-aabc-34bfeef4c4ff', 0, '9cafc5a1-84a0-4bca-a38f-dd2d61210a18'),
    ('7c140e4b-64b1-4d07-b78a-34e9e1e0e979', 0, '9cafc5a1-84a0-4bca-a38f-dd2d61210a18'),
    ('4bce504a-4a90-43e7-86b5-dff40405afe3', 0, '9cafc5a1-84a0-4bca-a38f-dd2d61210a18'),
    ('de886ba4-4d76-4677-882a-e3fd4adacca8', 0, '9cafc5a1-84a0-4bca-a38f-dd2d61210a18'),
    ('06d6c258-8d5a-413b-b3c9-5f23e099b526', 0, '67c9e62c-7197-4e88-ad80-f4bf6bd97bc1'),
    ('f1cfbc3d-4874-48be-b7bf-f6d56dc08cf8', 0, '67c9e62c-7197-4e88-ad80-f4bf6bd97bc1'),
    ('d58a9e23-5ef5-4a33-9927-a3e9afc872b2', 0, '67c9e62c-7197-4e88-ad80-f4bf6bd97bc1'),
    ('643d7309-4af3-46b8-a775-44ef1da56bf1', 0, '67c9e62c-7197-4e88-ad80-f4bf6bd97bc1'),
    ('a79c595d-9ee5-4fd7-95fa-2c622a22fd5c', 0, '67c9e62c-7197-4e88-ad80-f4bf6bd97bc1'),
    ('d53a83eb-5b72-453d-9e5b-4ea50647a1eb', 0, '1bf15560-d2fe-4b23-a584-a21edb703ab1'),
    ('acf18962-9f37-4392-812f-3ac4380054c9', 0, '1bf15560-d2fe-4b23-a584-a21edb703ab1'),
    ('da18cfa2-cf23-4747-aef3-ab8dbb0c575f', 0, '1bf15560-d2fe-4b23-a584-a21edb703ab1'),
    ('f814a280-a8d2-4d55-bd2e-7a0958e5da2f', 0, '1bf15560-d2fe-4b23-a584-a21edb703ab1'),
    ('b2580f9b-49b7-4b56-a4c0-bbe73b42a1aa', 0, '1bf15560-d2fe-4b23-a584-a21edb703ab1'),
    ('4ca3b736-f426-4de4-b42c-51223baa7def', 0, '694b6e68-b1e3-4158-97da-eb208b5f949c'),
    ('2cd33b2f-3393-4f84-87ad-38be9ff6e893', 0, '694b6e68-b1e3-4158-97da-eb208b5f949c'),
    ('bb9dac1f-d319-4390-b3f6-6493bce70c49', 0, '694b6e68-b1e3-4158-97da-eb208b5f949c'),
    ('34f6ed2f-a664-4316-9bd6-a607fe9bef51', 0, '694b6e68-b1e3-4158-97da-eb208b5f949c'),
    ('b6092409-6912-4cf6-957c-72a591d553be', 0, '694b6e68-b1e3-4158-97da-eb208b5f949c'),
    ('23baa737-99d1-4cb3-9001-eec6863bce2a', 0, '65df7c8a-a9c5-44b5-9526-a0aaf6a44392'),
    ('c4a26bfa-eb52-4738-9964-3326994ee92a', 0, '65df7c8a-a9c5-44b5-9526-a0aaf6a44392'),
    ('1f5f32ae-3aad-4487-a37e-e5fae8253222', 0, '65df7c8a-a9c5-44b5-9526-a0aaf6a44392'),
    ('72ef008d-43ad-4521-b4a3-ab910833c718', 0, '65df7c8a-a9c5-44b5-9526-a0aaf6a44392'),
    ('598cc79a-9a2b-469d-88ab-efa4ecd20f73', 0, '65df7c8a-a9c5-44b5-9526-a0aaf6a44392'),
    ('539f0f1b-23f1-4741-b803-ef2df49c70f9', 0, '772b83e7-506d-4d7c-a0e8-ce908009b94f'),
    ('a83bd0ea-d3d5-4e10-837e-bd1707f43e79', 0, '772b83e7-506d-4d7c-a0e8-ce908009b94f'),
    ('e72e979a-232f-4292-a844-985d92897597', 0, '772b83e7-506d-4d7c-a0e8-ce908009b94f'),
    ('5d2b9662-6d47-4aeb-98a3-4f7604f73476', 0, '772b83e7-506d-4d7c-a0e8-ce908009b94f'),
    ('dd505bcf-aac0-428f-ae1d-190af325add8', 0, '772b83e7-506d-4d7c-a0e8-ce908009b94f'),
    ('db04bac6-f3e1-4a5d-9782-5c3c3fd73284', 0, 'f3be8875-305b-477a-b1b4-7b5a0402e6ab'),
    ('cb99f9ec-203c-4462-afa4-217010ca407b', 0, 'f3be8875-305b-477a-b1b4-7b5a0402e6ab'),
    ('f3783b5c-d019-4ba0-85ee-8a533d53d76e', 0, 'f3be8875-305b-477a-b1b4-7b5a0402e6ab'),
    ('d47e53cc-31c2-4ffa-87bf-38a274923a1d', 0, 'f3be8875-305b-477a-b1b4-7b5a0402e6ab'),
    ('0d2f21e3-96c0-48ec-84a5-56f912ad1851', 0, '03fba709-2391-4e93-9fc2-528dd0243e37'),
    ('25e3c4a9-549e-4c5b-aa16-c70de85a1eb6', 0, '03fba709-2391-4e93-9fc2-528dd0243e37'),
    ('9c084e46-e956-4f5b-96fd-9f8f3718c08e', 0, '03fba709-2391-4e93-9fc2-528dd0243e37'),
    ('bd92a2bd-d66c-4afb-a82c-7012bd82ca4c', 0, '03fba709-2391-4e93-9fc2-528dd0243e37'),
    ('86bab0e6-8d06-4994-8b20-cd2f232f71bf', 0, '22097e5a-4fec-409f-a735-6489ef1bf8a2'),
    ('6d0cc373-fdc5-4779-9baa-7e0facaf14cd', 0, '22097e5a-4fec-409f-a735-6489ef1bf8a2'),
    ('b7e5cc04-8033-4931-bab8-992173beb2b7', 0, '22097e5a-4fec-409f-a735-6489ef1bf8a2'),
    ('9074f42b-70a4-4f10-afb9-a5ae34bc0c84', 0, '22097e5a-4fec-409f-a735-6489ef1bf8a2'),
    ('98f75278-56e4-462a-beb8-b95d440559d3', 0, '22097e5a-4fec-409f-a735-6489ef1bf8a2'),
    ('31bfbf4c-32b2-4e0e-a015-130472c80e4a', 0, '22097e5a-4fec-409f-a735-6489ef1bf8a2'),
    ('f431a9a7-6335-4b54-a494-3aa0fa402335', 0, '00262321-b949-41df-8d6d-454b62f33ebf'),
    ('1b4a2df1-3eeb-49eb-903e-d9ac4417de5d', 0, '00262321-b949-41df-8d6d-454b62f33ebf'),
    ('4565b702-736b-4ca3-8f3d-3769e19e4aed', 0, '00262321-b949-41df-8d6d-454b62f33ebf'),
    ('2fcd8a28-02a7-4168-b740-9cfb87d632ef', 0, '00262321-b949-41df-8d6d-454b62f33ebf'),
    ('468b53b4-9357-4a16-9eb7-4ad3d4516791', 0, '00262321-b949-41df-8d6d-454b62f33ebf'),
    ('577f39a5-7391-4eb9-bb83-d3b7c720a68c', 0, '00262321-b949-41df-8d6d-454b62f33ebf'),
    ('0fd9ef39-2196-4295-ac09-a29a32a858e5', 0, '120e8397-e2d5-4d51-b688-7c0a1425006f'),
    ('512fd01d-d274-493c-aa1d-44cfb5f33c25', 0, '120e8397-e2d5-4d51-b688-7c0a1425006f'),
    ('711928c1-7124-4a26-adf8-e71940e59884', 0, '120e8397-e2d5-4d51-b688-7c0a1425006f'),
    ('f501ecdf-67b4-4b24-ac14-700625eea129', 0, '120e8397-e2d5-4d51-b688-7c0a1425006f'),
    ('da5b0361-4020-4d46-a79a-47eb5b5a805d', 0, '120e8397-e2d5-4d51-b688-7c0a1425006f'),
    ('83fd913e-fdb9-4c29-b3bc-a05a013ea409', 0, '3ef9d373-a6ca-4519-acec-37fc07accbbb'),
    ('e7a52891-1052-4bbd-a929-f3922377aad2', 0, '3ef9d373-a6ca-4519-acec-37fc07accbbb'),
    ('59b20a72-4c7a-4520-9585-3628005d5c7e', 0, '3ef9d373-a6ca-4519-acec-37fc07accbbb'),
    ('d500e734-7254-4001-bd1b-71288d417ddd', 0, 'b5229bb8-a0d0-460e-9afe-1ae3bf830be0'),
    ('e8790f33-be7f-48e1-bb37-1ae753e34532', 0, 'b5229bb8-a0d0-460e-9afe-1ae3bf830be0'),
    ('d1544f1d-c00f-44fb-abc6-747c22587546', 0, 'b5229bb8-a0d0-460e-9afe-1ae3bf830be0'),
    ('6fbe8176-9d12-4a36-8a26-af25c3446d11', 0, 'b5229bb8-a0d0-460e-9afe-1ae3bf830be0'),
    ('089fde1a-70c2-4676-99cc-e7c85b3205d1', 0, 'b5229bb8-a0d0-460e-9afe-1ae3bf830be0'),
    ('61e3822c-2d7a-4171-9708-6d50ad7a56e7', 0, 'b5229bb8-a0d0-460e-9afe-1ae3bf830be0'),
    ('eccf3591-10ce-4e95-87f1-2adb50916159', 0, '4e5fa6ed-27db-40f3-b286-9f48d5511f93'),
    ('61112097-2e03-4d05-a22a-1dfe71ff942f', 0, '4e5fa6ed-27db-40f3-b286-9f48d5511f93'),
    ('f70b86dc-635e-4c6d-92cf-d67c1fbe5f14', 0, '4e5fa6ed-27db-40f3-b286-9f48d5511f93'),
    ('58e87a70-7bf8-4c7d-85b0-8743838fc2a7', 0, '4e5fa6ed-27db-40f3-b286-9f48d5511f93'),
    ('aca1a639-f47a-4416-a953-97c0fc3eec2b', 0, '4e5fa6ed-27db-40f3-b286-9f48d5511f93'),
    ('07952074-a5b9-4065-be7b-df191bd34125', 0, '4e5fa6ed-27db-40f3-b286-9f48d5511f93'),
    ('b31fed7e-4e53-45e0-a803-6189f2743101', 0, 'fa43b53a-ec22-4222-a4d8-adb3b388d37a'),
    ('861acb26-95db-4e61-830e-a3c7d595f069', 0, 'fa43b53a-ec22-4222-a4d8-adb3b388d37a'),
    ('13a9a716-6611-4a96-ad0f-64ba3d75b4d4', 0, 'fa43b53a-ec22-4222-a4d8-adb3b388d37a'),
    ('e3678a4d-b5a0-4fcd-b4d9-e35207106d04', 0, 'fa43b53a-ec22-4222-a4d8-adb3b388d37a'),
    ('5e338e18-ab7f-4fd3-832b-58d95ae48f3b', 0, 'fa43b53a-ec22-4222-a4d8-adb3b388d37a'),
    ('893d4651-7516-4012-a9c4-b552e90ea475', 0, '0efb8078-2108-4217-97c4-a60497b5e7b3'),
    ('87bc16ed-8466-4b93-90bc-a335c55518ce', 0, '0efb8078-2108-4217-97c4-a60497b5e7b3'),
    ('f1b7ec47-3163-48ab-8f0a-a144aeccd31d', 0, '0efb8078-2108-4217-97c4-a60497b5e7b3'),
    ('f3686b9e-bc59-46e4-8b70-21d525c0b73d', 0, 'c1be1ef9-c210-45cd-b5f7-98405e927142'),
    ('7091acd4-73db-49a1-932f-0a7965626e6e', 0, 'c1be1ef9-c210-45cd-b5f7-98405e927142'),
    ('0faa657f-0a6e-4c1c-8c73-a1ab027ebf3c', 0, 'c1be1ef9-c210-45cd-b5f7-98405e927142'),
    ('b7abef9f-138d-466b-878e-af59ff32434c', 0, 'c1be1ef9-c210-45cd-b5f7-98405e927142'),
    ('f0a51dd8-28fa-4185-a37f-80566d0a1397', 0, 'c1be1ef9-c210-45cd-b5f7-98405e927142'),
    ('cb06478e-0038-4758-af7d-881dee6ab896', 0, 'f8399689-59d6-4b3a-9048-7be73d7a8972'),
    ('ed5e4c71-fd67-4c23-b9f4-3693c11197ef', 0, 'f8399689-59d6-4b3a-9048-7be73d7a8972'),
    ('8a4d4cb5-dd6d-4546-8119-0a40957f6136', 0, 'f8399689-59d6-4b3a-9048-7be73d7a8972'),
    ('dc2a34e5-12c1-4fae-8f41-84db3c20b0f6', 0, 'f8399689-59d6-4b3a-9048-7be73d7a8972'),
    ('a2be735e-ed41-40aa-adab-abddd1a3530c', 0, 'f8399689-59d6-4b3a-9048-7be73d7a8972'),
    ('106dabd7-ad1c-4894-9ae2-843993076f60', 0, 'f8399689-59d6-4b3a-9048-7be73d7a8972'),
    ('fe28ca82-134e-48d7-bc25-e2b4693e2b1c', 0, '8168317a-5e0c-4b56-b76f-536e4d77ec26'),
    ('b8ea26b7-86ba-4318-a1a8-7c33decd79fa', 0, '8168317a-5e0c-4b56-b76f-536e4d77ec26'),
    ('c6274cef-d785-4675-9213-76e2e593c8ae', 0, '8168317a-5e0c-4b56-b76f-536e4d77ec26'),
    ('00e89b5f-be36-45b6-9292-76545b7a7b7b', 0, '8168317a-5e0c-4b56-b76f-536e4d77ec26'),
    ('9b09dbbf-d41c-4dc4-b805-feb09d922c85', 0, '8168317a-5e0c-4b56-b76f-536e4d77ec26'),
    ('52509888-df64-4f16-a24b-4810cd10606b', 0, '8e21b79e-7dc6-4685-afa8-c63aa42a8404'),
    ('2c1ef63f-84a3-43a4-99a2-efc19a49beef', 0, '8e21b79e-7dc6-4685-afa8-c63aa42a8404'),
    ('dfcef63a-4acc-40a1-a9cb-ff06c13d4d21', 0, '8e21b79e-7dc6-4685-afa8-c63aa42a8404'),
    ('713983a9-4c1a-4bd4-9eff-70b9b75abfc0', 0, '8e21b79e-7dc6-4685-afa8-c63aa42a8404'),
    ('b1d865a0-56d1-4ae1-9f6a-e579d6dd9a54', 0, '8e21b79e-7dc6-4685-afa8-c63aa42a8404'),
    ('00d9a2c4-275f-45b0-ab5e-cb48aa736040', 0, '137b3573-0bac-4c2c-b272-a84524e66650'),
    ('b10b02fb-3fbe-4028-8ac7-f8f3510e106f', 0, '137b3573-0bac-4c2c-b272-a84524e66650'),
    ('83e8028a-85e8-4619-966d-c44c6816e2a1', 0, '137b3573-0bac-4c2c-b272-a84524e66650'),
    ('fc25e625-6093-44fd-832c-f085cfa2b1ca', 0, '137b3573-0bac-4c2c-b272-a84524e66650'),
    ('cb6ee0cb-ed28-475c-9850-22db561d0172', 0, '137b3573-0bac-4c2c-b272-a84524e66650'),
    ('40746d60-ca12-49d1-8e91-ecdffb1c4806', 0, '2ce03fb1-117c-45f3-96dc-1269a5b0af98'),
    ('6856b55d-31c3-47c1-a065-88f2752f8fb2', 0, '2ce03fb1-117c-45f3-96dc-1269a5b0af98'),
    ('c074a1d1-4230-421c-b833-a005435c5b52', 0, '2ce03fb1-117c-45f3-96dc-1269a5b0af98'),
    ('bebc8362-470a-4c84-986e-8a1c3a042376', 0, '2ce03fb1-117c-45f3-96dc-1269a5b0af98'),
    ('e3388f67-6b3c-4471-a82e-c350f127d6f0', 0, '2ce03fb1-117c-45f3-96dc-1269a5b0af98'),
    ('42b07591-0f6d-42e3-8562-70217d8de125', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('405ff760-85ae-452d-a5a1-13522b9530f4', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('b151e297-5d73-4d97-8b84-2ed1de6e1600', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('5732bd05-361c-4dd3-8d14-a33114773e3e', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('ace93bc8-ce5c-4bf9-ad1c-ac60036e25e4', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('8065cd4c-47c1-4478-bb02-2e133ea2b80b', 0, 'c1bd87aa-9659-4511-b328-2a41bc64376b'),
    ('05e3f51d-8325-40ff-9b25-b0576420c75c', 0, 'c1bd87aa-9659-4511-b328-2a41bc64376b'),
    ('64673705-de2a-4e9b-9364-095704df57ef', 0, 'c1bd87aa-9659-4511-b328-2a41bc64376b'),
    ('fb7e696b-883b-4ca9-bb00-c3bcb0591c76', 0, 'c1bd87aa-9659-4511-b328-2a41bc64376b'),
    ('253af738-9bab-4a22-8ed3-9625aad983e9', 0, 'c1bd87aa-9659-4511-b328-2a41bc64376b'),
    ('d48dcfe8-ebc7-4066-83e8-b180fdc98773', 0, 'c7b86906-8b88-48bc-b526-6661379553cc'),
    ('a55abd14-e960-47d6-99b0-4db64e29d209', 0, 'c7b86906-8b88-48bc-b526-6661379553cc'),
    ('89473083-5a7d-4e4a-adde-3a03219d866c', 0, 'c7b86906-8b88-48bc-b526-6661379553cc'),
    ('54641b2e-07c1-4de5-b971-dad4cf631541', 0, 'c7b86906-8b88-48bc-b526-6661379553cc'),
    ('d7a1db19-01cc-45ca-9829-0d74c11c401a', 0, 'c7b86906-8b88-48bc-b526-6661379553cc'),
    ('a4e1c44a-deb3-45ca-9829-9d677df1caff', 0, 'a389ce55-33f6-4eef-9cbd-de979facf485'),
    ('cce25dc2-6419-4bef-977b-db0b825e9da2', 0, 'a389ce55-33f6-4eef-9cbd-de979facf485'),
    ('a1e974cd-3c7e-488a-aa81-d4410e83ff44', 0, 'a389ce55-33f6-4eef-9cbd-de979facf485'),
    ('5ada4032-21d2-43f5-b21f-7c147debb819', 0, 'a389ce55-33f6-4eef-9cbd-de979facf485'),
    ('09eae617-a663-4ebd-a169-15191eb2c022', 0, 'a389ce55-33f6-4eef-9cbd-de979facf485'),
    ('225e8770-c3ca-4d2b-931d-12b75de9a12d', 0, 'f7b6fa6c-addc-4fcc-884a-bbc80b18f246'),
    ('0c627abe-130d-4bc4-8afe-0df2c29285bd', 0, 'f7b6fa6c-addc-4fcc-884a-bbc80b18f246'),
    ('ca3bd319-0196-4e2e-a6ba-7f52ea72a8cf', 0, 'f7b6fa6c-addc-4fcc-884a-bbc80b18f246'),
    ('567006c1-4b5c-4980-a87f-d5d40d3a925c', 0, 'f7b6fa6c-addc-4fcc-884a-bbc80b18f246'),
    ('049e3304-f576-4faf-aa43-71dddd460d39', 0, 'f7b6fa6c-addc-4fcc-884a-bbc80b18f246'),
    ('f07c5ac2-8487-473f-a83c-5ad07da93319', 0, 'c16757c0-1aae-49bd-b874-81acb73ef2f0'),
    ('fd9e7401-0cac-42ef-92d0-c04d62b5781c', 0, 'c16757c0-1aae-49bd-b874-81acb73ef2f0'),
    ('b10910f1-d337-4a0c-9fd6-80064be5480c', 0, 'c16757c0-1aae-49bd-b874-81acb73ef2f0'),
    ('efbbaf5e-f663-4a8d-99a7-1c93b260f7a4', 0, 'c16757c0-1aae-49bd-b874-81acb73ef2f0'),
    ('dc65fc81-a951-4a3b-820d-658ae7468605', 0, 'c16757c0-1aae-49bd-b874-81acb73ef2f0'),
    ('8e385769-1da7-4ddb-9925-6459b4bc8936', 0, 'f479e115-137c-4a1c-a451-f039da55ff23'),
    ('f3a11c0b-9cc4-41df-93f0-e8c84ade8265', 0, 'f479e115-137c-4a1c-a451-f039da55ff23'),
    ('ce1424d0-3183-49bf-9fa4-989315d99ddd', 0, 'f479e115-137c-4a1c-a451-f039da55ff23'),
    ('1706ffde-614f-42c9-95e6-017e7062e11a', 0, 'f479e115-137c-4a1c-a451-f039da55ff23'),
    ('bc01e733-031b-41a9-8a89-5238b82222f4', 0, 'f479e115-137c-4a1c-a451-f039da55ff23'),
    ('a27f2e0c-fc86-4bba-8a17-52988691b826', 0, 'dc362476-afdc-4771-8816-afc79bd0ecc6'),
    ('cb1b779d-ee2f-47ae-80a4-1f599c43c07e', 0, 'dc362476-afdc-4771-8816-afc79bd0ecc6'),
    ('fe3d1659-6dff-4f72-a480-61434a5a1f7c', 0, 'dc362476-afdc-4771-8816-afc79bd0ecc6'),
    ('9ddf40a7-5abc-4763-bb8d-9dc511bd9560', 0, 'dc362476-afdc-4771-8816-afc79bd0ecc6'),
    ('1b9e47ab-892c-4f34-bc9f-f57ce660fee2', 0, 'dc362476-afdc-4771-8816-afc79bd0ecc6'),
    ('91b58c5a-f02b-42f7-abfb-25313b234c23', 0, '85b09923-7805-42dc-a241-d175a09729e7'),
    ('e75ee8c4-bba2-4ccf-a37f-6eb5cf29c540', 0, 'b43f21db-401d-442e-9cb8-9d7903705249'),
    ('d377b73a-5c75-435c-8e32-923fb065a054', 0, 'b43f21db-401d-442e-9cb8-9d7903705249'),
    ('b38b5c86-895e-469e-8eec-0f5e593d87d0', 0, 'b43f21db-401d-442e-9cb8-9d7903705249'),
    ('f3759cbc-85ee-4dfc-95b3-35e80a9d6d77', 0, 'b43f21db-401d-442e-9cb8-9d7903705249'),
    ('2c787176-a5c6-47d7-8ee3-15c7bc918087', 0, 'b43f21db-401d-442e-9cb8-9d7903705249'),
    ('cc5e8120-e0e3-4e2a-bf1d-73c8759ea95f', 0, '974ed496-c4a8-4758-97e6-63a6f1153d27'),
    ('37e596b9-eaae-4276-9e40-1410d062c6b1', 0, '974ed496-c4a8-4758-97e6-63a6f1153d27'),
    ('b1592cfc-95c4-4a06-97a7-cb6608f7114f', 0, '974ed496-c4a8-4758-97e6-63a6f1153d27'),
    ('a9f86e68-3342-4752-9763-9e98b876f0d4', 0, '974ed496-c4a8-4758-97e6-63a6f1153d27'),
    ('357e0731-2254-4120-b258-9ca53928c495', 0, '974ed496-c4a8-4758-97e6-63a6f1153d27'),
    ('e12b49fd-a4c9-411c-b305-5a1324141805', 0, 'a389ce55-33f6-4eef-9cbd-de979facf485'),
    ('bea8b223-08c7-4858-8a24-8cca9f44f5d0', 0, 'a389ce55-33f6-4eef-9cbd-de979facf485'),
    ('69d99ce3-2230-43d0-9061-b236ae1c24f5', 0, 'a389ce55-33f6-4eef-9cbd-de979facf485'),
    ('20da8fbf-802e-4fa6-ac83-3e9b3eb13ae8', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('cdc2ba9a-5f43-4449-a4e2-fae33720bbac', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('86dd5a81-f9b8-4e5a-8ebd-526c29d22118', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('d70365b7-6b26-4b8e-aa1c-bd2116e7e7cd', 0, '5efc7978-2b10-4242-b61b-f3525b0f9d6b'),
    ('9baf58c6-c6d4-41d6-9d1a-57432cc8c698', 0, '24b9c7ec-9d98-4967-8711-419338f7d020'),
    ('2d6d9189-1abd-49b6-a3bd-3137aee9242b', 0, '24b9c7ec-9d98-4967-8711-419338f7d020'),
    ('db1f0453-29ef-4a34-acf3-f3563f9936c7', 0, '24b9c7ec-9d98-4967-8711-419338f7d020'),
    ('62322752-6483-49f1-8092-04aed2987616', 0, '24b9c7ec-9d98-4967-8711-419338f7d020'),
    ('1aaa4b56-c38a-4e02-981c-82a6341fe70f', 0, '4acbad7f-01d2-4801-aa77-02f41b748196'),
    ('226f5e5e-a769-4365-b918-6f9f318785b1', 0, '4acbad7f-01d2-4801-aa77-02f41b748196'),
    ('d0936da8-0567-4cf6-bc3b-86b2d2237702', 0, '4acbad7f-01d2-4801-aa77-02f41b748196'),
    ('8fed0c0f-b753-404a-97e9-f893baae7f31', 0, '4acbad7f-01d2-4801-aa77-02f41b748196'),
    ('5be72df5-770b-4ad4-9905-ae07f31a15c6', 0, '8120a9f5-0324-4dbc-bf68-31fff4d41148'),
    ('3755990b-8da1-454f-bdf8-0aca9c203b63', 0, '8120a9f5-0324-4dbc-bf68-31fff4d41148'),
    ('3b6a412b-5916-4b20-b5de-6b61f6357b92', 0, '8120a9f5-0324-4dbc-bf68-31fff4d41148'),
    ('134fc5a5-7825-4671-8a12-11b9d9ab01a3', 0, '8120a9f5-0324-4dbc-bf68-31fff4d41148'),
    ('9b8222cb-9348-4ddb-aa39-115204bc5489', 0, '8120a9f5-0324-4dbc-bf68-31fff4d41148'),
    ('62e1f009-0971-4888-b263-64cf2b8a83fa', 0, '8bd768e9-3223-4d61-81ba-c8e086e290de'),
    ('b0722574-f446-48a1-b4d5-85fc07a07e96', 0, '8bd768e9-3223-4d61-81ba-c8e086e290de'),
    ('13558a99-be17-4f9a-bdd0-5952ac9baaeb', 0, '8bd768e9-3223-4d61-81ba-c8e086e290de'),
    ('264fce90-a4eb-4751-8ba3-3507e5064cfb', 0, '8bd768e9-3223-4d61-81ba-c8e086e290de'),
    ('69b77f74-35e3-49ec-96cc-6f01bb18d503', 0, '8bd768e9-3223-4d61-81ba-c8e086e290de'),
    ('5abd87a7-6b89-4d42-820a-06f77058882e', 0, '0b5af084-875f-472c-b972-591fcc6f2e85'),
    ('68e74131-92a7-4f50-b655-8a4e01efe16b', 0, '0b5af084-875f-472c-b972-591fcc6f2e85'),
    ('bed56f6c-a6a4-4b76-af6d-453023534a5f', 0, '0b5af084-875f-472c-b972-591fcc6f2e85'),
    ('6d68d7da-4603-4298-8f27-f1112ec4b49f', 0, '0b5af084-875f-472c-b972-591fcc6f2e85'),
    ('208f5071-4e84-4c98-8e46-d4332abc8b52', 0, '0b5af084-875f-472c-b972-591fcc6f2e85'),
    ('081b36d8-c647-4d70-9587-53cac2813a33', 0, 'f192f408-1366-4599-a489-bf1fada760ec'),
    ('e3c361af-67c8-4679-8867-b34b40a229a7', 0, 'f192f408-1366-4599-a489-bf1fada760ec'),
    ('c8f470a3-c708-4b0d-8fce-b46f66454c45', 0, 'f192f408-1366-4599-a489-bf1fada760ec'),
    ('18e72159-3800-4f47-8944-58cb5faba897', 0, 'f192f408-1366-4599-a489-bf1fada760ec'),
    ('5d4c52ef-e1c4-4f34-9e16-ab890a32fd7c', 0, 'f192f408-1366-4599-a489-bf1fada760ec'),
    ('dee2c072-ccc9-44a9-85fe-0f229a563055', 0, 'd6305cb8-8ef4-418c-9785-75120a52c07e'),
    ('2a2694ab-1549-4641-909b-433583f4b54c', 0, 'd6305cb8-8ef4-418c-9785-75120a52c07e'),
    ('1a2ad687-a173-4fd8-8c89-84e6fbb8583c', 0, 'd6305cb8-8ef4-418c-9785-75120a52c07e'),
    ('dd3aa534-bacf-4da4-9b37-fe03043ab446', 0, 'd6305cb8-8ef4-418c-9785-75120a52c07e'),
    ('ee806324-59ca-44e0-889d-2682c00f202b', 0, 'd6305cb8-8ef4-418c-9785-75120a52c07e'),
    ('db88ee9c-ed02-4945-a482-ead2a8049e98', 0, '621287fc-beb6-411b-b9f6-c492820dda2d'),
    ('7c9f5e2d-ea2b-4717-a3b9-d35ebcb86f7c', 0, '621287fc-beb6-411b-b9f6-c492820dda2d'),
    ('308a9cd2-7b2f-4063-bf43-e4f334d2535b', 0, '621287fc-beb6-411b-b9f6-c492820dda2d'),
    ('578507f1-5905-4a10-b3a0-bc7e32309cb1', 0, '621287fc-beb6-411b-b9f6-c492820dda2d'),
    ('7b6ee08c-779a-41bf-9a39-0cf152be592b', 0, '621287fc-beb6-411b-b9f6-c492820dda2d'),
    ('09346a46-eec3-4141-a510-48b75e5c1d2e', 0, 'ff622a1d-1d26-49bb-a64c-27db9b51e9a3'),
    ('2dd28bbc-42f9-40ec-a6f3-3602a3b3fefb', 0, 'ff622a1d-1d26-49bb-a64c-27db9b51e9a3'),
    ('489437d5-25ab-4187-9b2e-a53fb34158de', 0, 'ff622a1d-1d26-49bb-a64c-27db9b51e9a3'),
    ('64e58313-d1e4-4f6b-a7f9-2e78aff3f20a', 0, 'ff622a1d-1d26-49bb-a64c-27db9b51e9a3'),
    ('1ee0e28e-a97c-4422-ab70-7f5f472587d6', 0, 'ff622a1d-1d26-49bb-a64c-27db9b51e9a3'),
    ('4a907b84-0555-49d3-9ef0-ef9087d48989', 0, 'b31d59d9-607a-408d-8d76-4031e40f8521'),
    ('2e3aa419-6ec0-4b1c-a3bf-b9220ca57c29', 0, 'b31d59d9-607a-408d-8d76-4031e40f8521'),
    ('740dc164-61fa-4621-82c3-58d45c48841c', 0, 'b31d59d9-607a-408d-8d76-4031e40f8521'),
    ('939603ad-bc58-4d55-be9d-7f109d4ce1f8', 0, 'b31d59d9-607a-408d-8d76-4031e40f8521'),
    ('bcfb0990-2bc8-429a-99a4-0a4f4d6288d3', 0, 'b31d59d9-607a-408d-8d76-4031e40f8521'),
    ('7ff8d6db-7178-459d-b830-424146d9babf', 0, 'e77aa5ae-bb80-4ca2-9dbe-d1c59ce9ef33'),
    ('c0ae1ee0-97e7-4e8f-94c9-dc7539192cf5', 0, 'e77aa5ae-bb80-4ca2-9dbe-d1c59ce9ef33'),
    ('8f745f8b-e787-4e68-8950-8d3c192f5425', 0, 'e77aa5ae-bb80-4ca2-9dbe-d1c59ce9ef33'),
    ('b420a962-2e19-4fa2-8978-b74c4a86e7c3', 0, 'e77aa5ae-bb80-4ca2-9dbe-d1c59ce9ef33'),
    ('40c861f8-4203-4194-9544-63d81323b6b2', 0, 'e77aa5ae-bb80-4ca2-9dbe-d1c59ce9ef33'),
    ('c7262445-72e2-42fb-b312-361201e0d10b', 0, 'cf14b8ae-bae8-4747-a53a-67d0ffa99c61'),
    ('067aab80-45d8-4212-ad49-dc5306c61ae1', 0, 'cf14b8ae-bae8-4747-a53a-67d0ffa99c61'),
    ('60f3cd98-6580-4bb5-9485-2ef1ec13c8a5', 0, 'cf14b8ae-bae8-4747-a53a-67d0ffa99c61'),
    ('88d1922a-c0ae-4c72-bed0-925a7e815b2e', 0, 'cf14b8ae-bae8-4747-a53a-67d0ffa99c61'),
    ('1574096d-f0ec-4636-b2ef-4e240aab4a58', 0, 'cf14b8ae-bae8-4747-a53a-67d0ffa99c61'),
    ('27b3e981-2701-4945-bd9e-5d279cf11016', 0, 'ae1a4acc-c071-4bda-a89f-4807da507dc8'),
    ('335a4e1d-a091-4e0b-ab40-f2bdc14b4715', 0, 'ae1a4acc-c071-4bda-a89f-4807da507dc8'),
    ('72e0e285-fcbb-41bd-b106-d0733f3a4614', 0, 'ae1a4acc-c071-4bda-a89f-4807da507dc8'),
    ('9bfbb5b3-21be-4838-9049-db9d3fc41acf', 0, 'ae1a4acc-c071-4bda-a89f-4807da507dc8'),
    ('0d4e6708-7e87-4fc5-ae03-75c022ec1638', 0, 'ae1a4acc-c071-4bda-a89f-4807da507dc8'),
    ('9d1fa4ca-5ae3-4a1b-925d-b03bd13775dd', 0, '2e9ce1cb-3f52-4594-9faa-0c39ee13a486'),
    ('2ca64a88-90b8-41b6-996a-df4c7affaa8e', 0, '2e9ce1cb-3f52-4594-9faa-0c39ee13a486'),
    ('86e45541-73d4-4871-967e-f5cfbf7e25fb', 0, '2e9ce1cb-3f52-4594-9faa-0c39ee13a486'),
    ('76586768-18aa-4f30-9b50-f2f0c14b0526', 0, '2e9ce1cb-3f52-4594-9faa-0c39ee13a486'),
    ('cc13bee1-7588-4844-8530-a44498935909', 0, '2e9ce1cb-3f52-4594-9faa-0c39ee13a486'),
    ('85998fdc-3417-433e-881c-46ab13e214b2', 0, '2e9ce1cb-3f52-4594-9faa-0c39ee13a486'),
    ('28df357e-2d3e-4793-8bc6-3fa30d45499e', 0, '7e99fe17-6a5a-481e-913a-f1bb32a08803'),
    ('35c1d1c3-1bd0-44d7-8779-35d59c5c7ac2', 0, '7e99fe17-6a5a-481e-913a-f1bb32a08803'),
    ('2b6293ff-3115-4835-9189-39ea4a4df7f0', 0, '7e99fe17-6a5a-481e-913a-f1bb32a08803'),
    ('802edbf3-f35a-4a10-a85c-168d1b99ebf9', 0, '7e99fe17-6a5a-481e-913a-f1bb32a08803'),
    ('b6155f4c-808d-4f11-b1b7-5d81e963dbd8', 0, '7e99fe17-6a5a-481e-913a-f1bb32a08803'),
    ('3cd11b6b-27f2-4d2a-8d37-ebcb7d1f2408', 0, 'c7f44f7c-d4dc-4fef-a97d-cee3089b74d3'),
    ('fb8ee87e-a942-4661-8314-45bc392193fc', 0, 'c7f44f7c-d4dc-4fef-a97d-cee3089b74d3'),
    ('cde301fe-2d40-4205-88ed-c7bb95f86de3', 0, 'c7f44f7c-d4dc-4fef-a97d-cee3089b74d3'),
    ('3d6b7573-e50a-4f92-9ddf-1246c4b6c7f5', 0, 'c7f44f7c-d4dc-4fef-a97d-cee3089b74d3'),
    ('8d15487d-99a5-40c8-aee8-3d5543d9fc18', 0, 'c7f44f7c-d4dc-4fef-a97d-cee3089b74d3'),
    ('e431e022-acf1-4aed-8e2b-7299676c84db', 0, 'd02a9bec-7dfa-401e-826f-a33e4a91602f'),
    ('0d5bc89e-8b46-4be5-9799-773179121f95', 0, 'd02a9bec-7dfa-401e-826f-a33e4a91602f'),
    ('1ea2747f-7947-48e0-a3eb-c5f753674b74', 0, 'd02a9bec-7dfa-401e-826f-a33e4a91602f'),
    ('89a37c8f-d6a5-4837-ac23-c9145b213c4b', 0, 'd02a9bec-7dfa-401e-826f-a33e4a91602f'),
    ('f2d767ac-5ae4-44d3-85fd-4ab065ecce1c', 0, 'd02a9bec-7dfa-401e-826f-a33e4a91602f'),
    ('453b0769-5b9f-41fd-8292-b1e0b7cacd1c', 0, '5cea6f2f-0694-4126-97d9-2ab1f935b59d'),
    ('fe21526d-6d8d-4595-b674-485b619d7229', 0, '5cea6f2f-0694-4126-97d9-2ab1f935b59d'),
    ('b24b4284-5787-484e-a48a-a95e221212a4', 0, '5cea6f2f-0694-4126-97d9-2ab1f935b59d'),
    ('198d63a8-7e5b-49e9-883a-59644a029155', 0, '5cea6f2f-0694-4126-97d9-2ab1f935b59d'),
    ('0619dc6d-2368-47f7-b83a-fd9f711516cc', 0, '5cea6f2f-0694-4126-97d9-2ab1f935b59d'),
    ('1d306043-2546-42bc-98cc-edc45d26e125', 0, '5cea6f2f-0694-4126-97d9-2ab1f935b59d');

-- Portraits for the other 2014 leagues, their teams, and the players whose wiki page has a photo.
UPDATE players SET portrait = 'portraits/wiki/H2K-Odaomne-2015spring.jpg' WHERE name = 'Odoamne';
UPDATE players SET portrait = 'portraits/wiki/Fnatic-febiven-2015spring.jpg' WHERE name = 'Febiven';
UPDATE players SET portrait = 'portraits/wiki/Lol_hjarnan.jpg' WHERE name = 'Hjärnan';
UPDATE players SET portrait = 'portraits/wiki/S3_Voidle.jpg' WHERE name = 'Voidle';
UPDATE players SET portrait = 'portraits/wiki/Koi.jpg' WHERE name = 'Koi';
UPDATE players SET portrait = 'portraits/wiki/UoL-powerofevil-2015spring.jpg' WHERE name = 'PowerOfEvil';
UPDATE players SET portrait = 'portraits/wiki/MYM_Kubon_2013_Summer.png' WHERE name = 'Kubon';
UPDATE players SET portrait = 'portraits/wiki/Moka.png' WHERE name = 'Mokatte';
UPDATE players SET portrait = 'portraits/wiki/MYM_Czaru_2013_Summer.png' WHERE name = 'Czaru';
UPDATE players SET portrait = 'portraits/wiki/Makler.png' WHERE name = 'Makler';
UPDATE players SET portrait = 'portraits/wiki/MYM_Libik_2013_Summer.png' WHERE name = 'Libik';
UPDATE players SET portrait = 'portraits/wiki/Amin.jpeg' WHERE name = 'Amin';
UPDATE players SET portrait = 'portraits/wiki/EG_Shacker_2013_Summer.png' WHERE name = 'Shacker';
UPDATE players SET portrait = 'portraits/wiki/NIP_Freeze_2013_Summer.png' WHERE name = 'Freeze';
UPDATE players SET portrait = 'portraits/wiki/S3_Mithy.jpg' WHERE name = 'Mithy';
UPDATE players SET portrait = 'portraits/wiki/UoL-kikis-2015spring.jpg' WHERE name = 'Kikis';
UPDATE players SET portrait = 'portraits/wiki/WooliteCW2014.png' WHERE name = 'Woolite';
UPDATE players SET portrait = 'portraits/wiki/Elendix.jpg' WHERE name = 'Elendix';
UPDATE players SET portrait = 'portraits/wiki/Mozilla.jpg' WHERE name = 'Mozilla';
UPDATE players SET portrait = 'portraits/wiki/UOL_Exileh_2016_Summer.png' WHERE name = 'Exileh';
UPDATE players SET portrait = 'portraits/wiki/OG-niels-2015Summer.jpg' WHERE name = 'Zvanillan';
UPDATE players SET portrait = 'portraits/wiki/ESuba_Miah.png' WHERE name = 'Miah';
UPDATE players SET portrait = 'portraits/wiki/Snow.jpg' WHERE name = 'Snow';
UPDATE players SET portrait = 'portraits/wiki/SunnyXX.jpg' WHERE name = 'SunnyXX';
UPDATE players SET portrait = 'portraits/wiki/Bonaparte.jpg' WHERE name = 'Bonaparte';
UPDATE players SET portrait = 'portraits/wiki/Tdk-kez-2015spring.jpg' WHERE name = 'Kez';
UPDATE players SET portrait = 'portraits/wiki/TDK_Bischu_2015_Summer.png' WHERE name = 'Bischu';
UPDATE players SET portrait = 'portraits/wiki/Wfx-altec-2015spring.jpg' WHERE name = 'Altec';
UPDATE players SET portrait = 'portraits/wiki/GleebTSM2014.png' WHERE name = 'Gleebglarbu';
UPDATE players SET portrait = 'portraits/wiki/UCI_Richerich_2017.jpg' WHERE name = 'RichERich';
UPDATE players SET portrait = 'portraits/wiki/Zaineking.jpg' WHERE name = 'Zaineking';
UPDATE players SET portrait = 'portraits/wiki/WestriceCOL2014.png' WHERE name = 'Westrice';
UPDATE players SET portrait = 'portraits/wiki/BrokenshardFA2014.png' WHERE name = 'Brokenshard';
UPDATE players SET portrait = 'portraits/wiki/Pr0llyCOL2014.png' WHERE name = 'PR0LLY';
UPDATE players SET portrait = 'portraits/wiki/BubbadubCOL2014.png' WHERE name = 'Bubbadub';
UPDATE players SET portrait = 'portraits/wiki/S3_vesnkinc_2.jpg' WHERE name = 'Nk Inc';
UPDATE players SET portrait = 'portraits/wiki/ENX_Impactful_2016_Summer.png' WHERE name = 'Impactful';
UPDATE players SET portrait = 'portraits/wiki/S3_vesevaniskus_2.jpg' WHERE name = 'SupportDaddy';
UPDATE players SET portrait = 'portraits/wiki/Tip-rhux-2015spring.jpg' WHERE name = 'Rhux';
UPDATE players SET portrait = 'portraits/wiki/Titours.jpg' WHERE name = 'Titours';
UPDATE players SET portrait = 'portraits/wiki/Oj.jpg' WHERE name = 'Jaximus';
UPDATE players SET portrait = 'portraits/wiki/TL_Fabbbyyy_2016_Summer.png' WHERE name = 'Fabbbyyy';
UPDATE players SET portrait = 'portraits/wiki/NoNameLMQ2014.png' WHERE name = 'NoName';
UPDATE players SET portrait = 'portraits/wiki/XiaoWeiXiaoLMQ2014.png' WHERE name = 'XiaoWeiXiao';
UPDATE players SET portrait = 'portraits/wiki/VasiliiLMQ2014.png' WHERE name = 'Vasilii';
UPDATE players SET portrait = 'portraits/wiki/MorLMQ2014.png' WHERE name = 'Mor';
UPDATE players SET portrait = 'portraits/wiki/S3_vescris.jpg' WHERE name = 'Cris';
UPDATE players SET portrait = 'portraits/wiki/Get_Snuggled.jpg' WHERE name = 'Get Snuggled';
UPDATE players SET portrait = 'portraits/wiki/Ss_(2014-02-03_at_02.59.15).jpg' WHERE name = 'Microlatios';
UPDATE players SET portrait = 'portraits/wiki/UCI_Frostalicious_2018.png' WHERE name = 'Frostalicious';
UPDATE players SET portrait = 'portraits/wiki/NVA_Trance_2016_Summer.png' WHERE name = 'LGhunter';
UPDATE players SET portrait = 'portraits/wiki/DIG_Billyboss_2016_Spring.png' WHERE name = 'BillyBoss';
UPDATE players SET portrait = 'portraits/wiki/Aware_DkBnet.jpg' WHERE name = 'DkBnet';
UPDATE players SET portrait = 'portraits/wiki/Mrn_atomicn_lcs.png' WHERE name = 'AtomicN';
UPDATE players SET portrait = 'portraits/wiki/C9T-Yusui-2015nacs.png' WHERE name = 'Yusui';
UPDATE players SET portrait = 'portraits/wiki/TL_Youngbin_2016_Spring.png' WHERE name = 'Leo';
UPDATE players SET portrait = 'portraits/wiki/Aniratak.png' WHERE name = 'Aniratak';
UPDATE players SET portrait = 'portraits/wiki/REN_Remi_2016_Spring_1.png' WHERE name = 'Yuno';
UPDATE players SET portrait = 'portraits/wiki/MasteR_of_LoL.jpg' WHERE name = 'MasteRofLoL';
UPDATE players SET portrait = 'portraits/wiki/Gv-hauntzer-2015spring.jpg' WHERE name = 'Hauntzer';
UPDATE players SET portrait = 'portraits/wiki/S3_cursejacky.jpg' WHERE name = 'Nyjacky';
UPDATE players SET portrait = 'portraits/wiki/C9T-LOD-2015nacs.png' WHERE name = 'LOD';
UPDATE players SET portrait = 'portraits/wiki/Lohpally.png' WHERE name = 'LoH';
UPDATE players SET portrait = 'portraits/wiki/GCU_BonQuish_2017_Summer.png' WHERE name = 'BabyZeus';
UPDATE players SET portrait = 'portraits/wiki/TDK_Lattman_2015_Summer.png' WHERE name = 'LattmaN';
UPDATE players SET portrait = 'portraits/wiki/MiMo.jpg' WHERE name = 'AWildMiMo';
UPDATE players SET portrait = 'portraits/wiki/JTH_EvanRL_CLN_Clausura_2016.jpg' WHERE name = 'EvanRL';
UPDATE players SET portrait = 'portraits/wiki/DT_BeeSin_2016_Summer.png' WHERE name = 'Bee Sin';
UPDATE players SET portrait = 'portraits/wiki/T8-porpoise-2015spring.jpg' WHERE name = 'PorpoisePops';
UPDATE players SET portrait = 'portraits/wiki/Cheesdbeluga.jpg' WHERE name = 'CheesdBeluga';
UPDATE players SET portrait = 'portraits/wiki/Ggu_dontmashme_lcs.png' WHERE name = 'DontMashMe';
UPDATE players SET portrait = 'portraits/wiki/21D_Naruto_2016_Summer.png' WHERE name = 'Minoko';
UPDATE players SET portrait = 'portraits/wiki/WE_WuShuang_2015.png' WHERE name = 'EM';
UPDATE players SET portrait = 'portraits/wiki/EDG_JinJiao_2015_Summer.png' WHERE name = 'Dnn';
UPDATE players SET portrait = 'portraits/wiki/ADG_Shine_2015_Spring.jpg' WHERE name = 'Xcy';
UPDATE players SET portrait = 'portraits/wiki/King_Skye.jpg' WHERE name = 'DaMao';
UPDATE players SET portrait = 'portraits/wiki/EP.C_RalnesYoga.jpg' WHERE name = 'RalnesYoga';
UPDATE players SET portrait = 'portraits/wiki/SHR_Cola_2014_WCS.jpg' WHERE name = '可乐';
UPDATE players SET portrait = 'portraits/wiki/EP.C_V.jpg' WHERE name = 'V';
UPDATE players SET portrait = 'portraits/wiki/EP_Captain57_2015.jpg' WHERE name = 'Limitless';
UPDATE players SET portrait = 'portraits/wiki/EP_XiaoLuoLuo.jpg' WHERE name = '小裸裸';
UPDATE players SET portrait = 'portraits/wiki/QG_Mortred_2016_Spring.jpg' WHERE name = 'Morted';
UPDATE players SET portrait = 'portraits/wiki/LGD_Yu_2016_Spring.jpg' WHERE name = '逝去青春';
UPDATE players SET portrait = 'portraits/wiki/LGD_YeLuo_2015_Summer.png' WHERE name = 'YeLuo';
UPDATE players SET portrait = 'portraits/wiki/VG_Carry_2015_Summer.png' WHERE name = 'Carry';
UPDATE players SET portrait = 'portraits/wiki/UP_Eimy_2015_Summer.jpg' WHERE name = 'Eimy';
UPDATE players SET portrait = 'portraits/wiki/LGD_We1less.jpg' WHERE name = 'We1s';
UPDATE players SET portrait = 'portraits/wiki/LMQ_Avenger.png' WHERE name = 'Mes';
UPDATE players SET portrait = 'portraits/wiki/VG_Yh.jpg' WHERE name = 'Yh';
UPDATE players SET portrait = 'portraits/wiki/YG_Number1.png' WHERE name = 'Number1';
UPDATE players SET portrait = 'portraits/wiki/YG_YinFu.png' WHERE name = 'YinFu';
UPDATE players SET portrait = 'portraits/wiki/YG_Wenjiangun.png' WHERE name = 'WenJianGun';
UPDATE players SET portrait = 'portraits/wiki/YG_Dragon.png' WHERE name = 'ZhenLong';
UPDATE players SET portrait = 'portraits/wiki/Smb_gamsu_S1.jpg' WHERE name = 'Gamsu';
UPDATE players SET portrait = 'portraits/wiki/IM_Frozen_2015_Split_1.png' WHERE name = 'Frozen';
UPDATE players SET portrait = 'portraits/wiki/BRO.C_Kite_2021_Split_1.png' WHERE name = 'Kite';
UPDATE players SET portrait = 'portraits/wiki/2019_Allstars_Jelly.png' WHERE name = 'Jelly';
UPDATE players SET portrait = 'portraits/wiki/EP_Drizzle.jpg' WHERE name = 'Rizzle';
UPDATE players SET portrait = 'portraits/wiki/EDE_Road_2016_Spring.png' WHERE name = 'TaRo';
UPDATE players SET portrait = 'portraits/wiki/SSB_SaSin_2015_Split_2.png' WHERE name = 'SaSin';
UPDATE players SET portrait = 'portraits/wiki/21D_Kar1n_2016_Summer.png' WHERE name = 'Slave';
UPDATE players SET portrait = 'portraits/wiki/SudalBFM2014.png' WHERE name = 'Sudal';
UPDATE players SET portrait = 'portraits/wiki/BeastBFM2014.png' WHERE name = 'Nuclear Winter';
UPDATE players SET portrait = 'portraits/wiki/CoreBFM2014.png' WHERE name = 'Core';
UPDATE players SET portrait = 'portraits/wiki/LinLanBFM2014.png' WHERE name = 'LinLan';
UPDATE players SET portrait = 'portraits/wiki/Samsung_CuVee.jpg' WHERE name = 'CuVee';
UPDATE players SET portrait = 'portraits/wiki/Riot_Ggoggo.png' WHERE name = 'Ggoggo';
UPDATE players SET portrait = 'portraits/wiki/TraceJAS2014.png' WHERE name = 'TrAce';
UPDATE players SET portrait = 'portraits/wiki/FlyJAS2014.png' WHERE name = 'Fly';
UPDATE players SET portrait = 'portraits/wiki/MiG_CaptainJack.png' WHERE name = 'Cpt Jack';
UPDATE players SET portrait = 'portraits/wiki/Falcons_XD.jpg' WHERE name = 'XD';
UPDATE players SET portrait = 'portraits/wiki/IG_YongSu.jpg' WHERE name = 'YongSoo';
UPDATE players SET portrait = 'portraits/wiki/EP_Rapheal.jpg' WHERE name = 'Raphael';
UPDATE players SET portrait = 'portraits/wiki/APX_Police_2016_Spring.png' WHERE name = 'Police';
UPDATE players SET portrait = 'portraits/wiki/MSE_Stitch.jpg' WHERE name = 'Woody';
UPDATE players SET portrait = 'portraits/wiki/RF_Rainbrain.jpg' WHERE name = 'Rainbrain';
UPDATE players SET portrait = 'portraits/wiki/RJ_Rkp1.jpg' WHERE name = 'Rkp';
UPDATE players SET portrait = 'portraits/wiki/RJ_Lillebelt.jpg' WHERE name = 'Lillebelt';
UPDATE players SET portrait = 'portraits/wiki/Mvpbduelist.jpg' WHERE name = 'KangQui';
UPDATE players SET portrait = 'portraits/wiki/Wfx-imagine-2015spring.jpg' WHERE name = 'AcE';
UPDATE players SET portrait = 'portraits/wiki/NaJin_sxspp.png' WHERE name = 'HooN';
UPDATE players SET portrait = 'portraits/wiki/Mvpbhankun.jpg' WHERE name = 'Hermes';
UPDATE players SET portrait = 'portraits/wiki/LCK_Pony.png' WHERE name = 'MyLittlePony';
UPDATE players SET portrait = 'portraits/wiki/WY_Aggro_2016_Spring.png' WHERE name = 'Aggro Boy';
UPDATE players SET portrait = 'portraits/wiki/CJ_Trick_2015_Split_2.png' WHERE name = 'Snowfall';
UPDATE players SET portrait = 'portraits/wiki/JT_Prydz.png' WHERE name = 'Prydz';
UPDATE players SET portrait = 'portraits/wiki/Ahq_Naz_2014_WCS.png' WHERE name = 'Naz';
UPDATE players SET portrait = 'portraits/wiki/Ahq_GarnetDevil_2014_WCS.png' WHERE name = 'GarnetDevil';
UPDATE players SET portrait = 'portraits/wiki/Ahq_GreenTea_2014_WCS.png' WHERE name = 'GreenTea';
UPDATE players SET portrait = 'portraits/wiki/QaiZer-BKT-S5.png' WHERE name = 'QaiZer';
UPDATE players SET portrait = 'portraits/wiki/BKT_InTreso_2014_Spring.png' WHERE name = 'InTreso';
UPDATE players SET portrait = 'portraits/wiki/BKT_Lloyd_IWCI_2015.png' WHERE name = 'Lloyd';
UPDATE players SET portrait = 'portraits/wiki/BKT_SKLz_2014_Spring.png' WHERE name = 'SKLz';
UPDATE players SET portrait = 'portraits/wiki/IPT_Light_2014_Spring.png' WHERE name = 'Light';
UPDATE players SET portrait = 'portraits/wiki/IPT_Hatred_2014_Spring.jpeg' WHERE name = 'Hatred';
UPDATE players SET portrait = 'portraits/wiki/ISG_BBTY_2014_Spring.png' WHERE name = 'BBTY';
UPDATE players SET portrait = 'portraits/wiki/SGS_d4rkness.jpg' WHERE name = 'Zappy';
UPDATE players SET portrait = 'portraits/wiki/ISG_CrazyPine_2014_Spring.png' WHERE name = 'CrazyPine';
UPDATE players SET portrait = 'portraits/wiki/Qtv-cao-dau.png' WHERE name = 'QTV';
UPDATE players SET portrait = 'portraits/wiki/SAJSafety.png' WHERE name = 'Safety';
UPDATE players SET portrait = 'portraits/wiki/OPTIMUS.jpg' WHERE name = 'Optimus';
UPDATE players SET portrait = 'portraits/wiki/SAJLovida.jpg' WHERE name = 'Lovida';
UPDATE players SET portrait = 'portraits/wiki/SAJArchie.png' WHERE name = 'Archie';
UPDATE players SET portrait = 'portraits/wiki/JQVwx_-_Imgur.jpg' WHERE name = 'Junie';
UPDATE players SET portrait = 'portraits/wiki/TPS_Zonda_2014_Spring.png' WHERE name = 'Zonda';
UPDATE players SET portrait = 'portraits/wiki/Gamania_Winds.jpg' WHERE name = 'Winds';
UPDATE players SET portrait = 'portraits/wiki/TPS_OhReaL_2014_Spring.png' WHERE name = 'OhReal';
UPDATE players SET portrait = 'portraits/wiki/HKE_GoDJJ_2015_Summer.png' WHERE name = 'GoDJJ';
UPDATE players SET portrait = 'portraits/wiki/TPS_Awei_2014_Spring.png' WHERE name = 'Awei';
UPDATE players SET portrait = 'portraits/wiki/MLE_Knut.jpg' WHERE name = 'Knut';
UPDATE players SET portrait = 'portraits/wiki/Chock.jpg' WHERE name = 'Chock';
UPDATE players SET portrait = 'portraits/wiki/MSK_Tgee_2013_WCS.png' WHERE name = 'Tgee';
UPDATE players SET portrait = 'portraits/wiki/SAJ_Gony.jpg' WHERE name = 'GoNy';
UPDATE players SET portrait = 'portraits/wiki/Jungleology.jpg' WHERE name = 'Jungleology';
UPDATE players SET portrait = 'portraits/wiki/SF5_Yushin_new.png' WHERE name = 'Yushin';
UPDATE players SET portrait = 'portraits/wiki/NIXWATER.png' WHERE name = 'NIXWATER';
UPDATE players SET portrait = 'portraits/wiki/SF5_Minas_new.png' WHERE name = 'MinaS';
UPDATE players SET portrait = 'portraits/wiki/SF5_Vigoss_2014_Spring.png' WHERE name = 'Vigoss';
UPDATE players SET portrait = 'portraits/wiki/BenW.jpg' WHERE name = 'BeNw';
UPDATE players SET portrait = 'portraits/wiki/TPA_Chawy_2014_WCS.jpg' WHERE name = 'Chawy';
UPDATE players SET portrait = 'portraits/wiki/Fan_Kai.jpg' WHERE name = 'KRYONICS';
UPDATE players SET portrait = 'portraits/wiki/ESPORTS.ALLSTARS.PLYRPROFILE.SEA_.HARLELUYAR.jpg' WHERE name = 'HaRleLuYaR';
UPDATE players SET portrait = 'portraits/wiki/Sgskailing.jpg' WHERE name = 'Kailing';
UPDATE players SET portrait = 'portraits/wiki/TPA_Achie_2014_WCS.png' WHERE name = 'Achie';
UPDATE players SET portrait = 'portraits/wiki/HKE_DinTer_2016_Spring.png' WHERE name = 'DinTer';
UPDATE players SET portrait = 'portraits/wiki/TPA_Morning_2014_WCS.png' WHERE name = 'Morning';
UPDATE players SET portrait = 'portraits/wiki/TPA_Jay_2014_WCS.png' WHERE name = 'Jay';
UPDATE players SET portrait = 'portraits/wiki/GAB_Steak_2013_WCS.png' WHERE name = 'Steak';
UPDATE players SET portrait = 'portraits/wiki/GAB_NL_2013_WCS.png' WHERE name = 'NL';
UPDATE players SET portrait = 'portraits/wiki/GAB_SwordArt_2013_WCS.png' WHERE name = 'SwordArt';
UPDATE players SET portrait = 'portraits/wiki/Leko.png' WHERE name = 'Leko';
UPDATE players SET portrait = 'portraits/wiki/Rev_Teddy_Bear.jpg' WHERE name = 'Revolta';
UPDATE players SET portrait = 'portraits/wiki/CNB_Alocs.jpg' WHERE name = 'Alocs';
UPDATE players SET portrait = 'portraits/wiki/Irelia.jpg' WHERE name = 'LEP';
UPDATE players SET portrait = 'portraits/wiki/KBM_Danagorn_2016_Winter.jpg' WHERE name = 'Danagorn';
UPDATE players SET portrait = 'portraits/wiki/KabumTin.jpg' WHERE name = 'TinOwns';
UPDATE players SET portrait = 'portraits/wiki/Xpeon.jpg' WHERE name = 'Espeon';
UPDATE players SET portrait = 'portraits/wiki/Mylon.jpg' WHERE name = 'Mylon';
UPDATE players SET portrait = 'portraits/wiki/JAG_Winged_2015_Split_1.png' WHERE name = 'Winged';
UPDATE players SET portrait = 'portraits/wiki/Sk_suno.png' WHERE name = 'SuNo';
UPDATE players SET portrait = 'portraits/wiki/VFK_Loop_CBLOL2015.jpg' WHERE name = 'Loop';
UPDATE players SET portrait = 'portraits/wiki/Venon.jpg' WHERE name = 'Venon';
UPDATE players SET portrait = 'portraits/wiki/PaiN_SirT_2016_Winter.jpg' WHERE name = 'SirT';
UPDATE players SET portrait = 'portraits/wiki/Kami.jpg' WHERE name = 'Kami';
UPDATE players SET portrait = 'portraits/wiki/PainMinerva.jpg' WHERE name = 'Minerva';
UPDATE players SET portrait = 'portraits/wiki/VFK_Turtle_2016_Summer.png' WHERE name = 'Turtle';
UPDATE players SET portrait = 'portraits/wiki/Digolera.jpg' WHERE name = 'Digolera';
UPDATE players SET portrait = 'portraits/wiki/Awp_Gigante.jpg' WHERE name = 'Gigante';
UPDATE players SET portrait = 'portraits/wiki/INTZ_Jockster_CBLOL2015.jpg' WHERE name = 'Jockster';
UPDATE players SET portrait = 'portraits/wiki/UNITED_Fire.jpg' WHERE name = 'Fire';
UPDATE players SET portrait = 'portraits/wiki/INTZ_Red_Eryon.jpg' WHERE name = 'Eryon';
UPDATE players SET portrait = 'portraits/wiki/Accelerator.png' WHERE name = 'Accelerator';
UPDATE players SET portrait = 'portraits/wiki/HAF_Khynm.jpg' WHERE name = 'Khynm';
UPDATE players SET portrait = 'portraits/wiki/FG_Kvrof.jpg' WHERE name = 'Kvrof';
UPDATE players SET portrait = 'portraits/wiki/1984.jpg' WHERE name = '1984';
UPDATE players SET portrait = 'portraits/wiki/Tomex.png' WHERE name = 'Tomex';
UPDATE players SET portrait = 'portraits/wiki/HeliorCampeon.jpg' WHERE name = 'Helior';
UPDATE players SET portrait = 'portraits/wiki/Zeicro.png' WHERE name = 'Zeicro';
UPDATE players SET portrait = 'portraits/wiki/Omi.jpg' WHERE name = 'Omi';
UPDATE players SET portrait = 'portraits/wiki/Mantarraya.jpg' WHERE name = 'MANTARRAYA';
UPDATE players SET portrait = 'portraits/wiki/Fragio.jpg' WHERE name = 'FraGio';
UPDATE players SET portrait = 'portraits/wiki/Uri.jpg' WHERE name = 'Uri';
UPDATE players SET portrait = 'portraits/wiki/Megajp_image.jpg' WHERE name = 'Megajp';
UPDATE players SET portrait = 'portraits/wiki/Badmilk_Image.jpg' WHERE name = 'Badmilk';
UPDATE players SET portrait = 'portraits/wiki/Rushley.jpg' WHERE name = 'Rushley';
UPDATE players SET portrait = 'portraits/wiki/TetricAttack.jpg' WHERE name = 'TetricAttack';
UPDATE players SET portrait = 'portraits/wiki/2017_D9_Suppa.png' WHERE name = 'Suppa';
UPDATE players SET portrait = 'portraits/wiki/Porky.jpg' WHERE name = 'Porky';
UPDATE players SET portrait = 'portraits/wiki/7w_Lyon_Thyak.png' WHERE name = 'Thyak';
UPDATE players SET portrait = 'portraits/wiki/LyonSeiya.png' WHERE name = 'Seeiya';
UPDATE players SET portrait = 'portraits/wiki/GLG_1an_CLN_Clausura_2016.jpg' WHERE name = '1an';
UPDATE players SET portrait = 'portraits/wiki/GLG_NerzhuL_CLN_Clausura_2016.jpg' WHERE name = 'NerzhuL';
UPDATE players SET portrait = 'portraits/wiki/Pillo.png' WHERE name = 'Pillo';
UPDATE players SET portrait = 'portraits/wiki/Pansy.jpg' WHERE name = 'Pansy';
UPDATE players SET portrait = 'portraits/wiki/Skylight.jpeg' WHERE name = 'Sky';
UPDATE players SET portrait = 'portraits/wiki/2017_INF_Wikko.png' WHERE name = 'Wikko';
UPDATE players SET portrait = 'portraits/wiki/MegaK.jpg' WHERE name = 'Esteban';
UPDATE players SET portrait = 'portraits/wiki/Desyah_profile.jpg' WHERE name = 'Desyah';
UPDATE players SET portrait = 'portraits/wiki/Sogo.jpg' WHERE name = 'Sogo';
UPDATE players SET portrait = 'portraits/wiki/4zeer0.png' WHERE name = '4zeer0';
UPDATE players SET portrait = 'portraits/wiki/Axkhan.jpg' WHERE name = 'AxKhan';
UPDATE players SET portrait = 'portraits/wiki/Lyon_Arce2.jpg' WHERE name = 'Arce';
UPDATE players SET portrait = 'portraits/wiki/Chelito.png' WHERE name = 'CHELitw';
UPDATE players SET portrait = 'portraits/wiki/Dinamox2015FG.png' WHERE name = 'Dinamox';
UPDATE players SET portrait = 'portraits/wiki/Prophuth.jpg' WHERE name = 'Prophuth';
UPDATE players SET portrait = 'portraits/wiki/Genthix.jpg' WHERE name = 'Genthix';
UPDATE players SET portrait = 'portraits/wiki/Gambite.jpg' WHERE name = 'TroubleMaker';
UPDATE players SET portrait = 'portraits/wiki/Baws.jpg' WHERE name = 'Baws';
UPDATE players SET portrait = 'portraits/wiki/Julaxe.png' WHERE name = 'Julaxe';
UPDATE players SET portrait = 'portraits/wiki/Zeypher.jpg' WHERE name = 'Zeypher';
UPDATE players SET portrait = 'portraits/wiki/FG_Gonto_2017.png' WHERE name = 'Gonto';
UPDATE players SET portrait = 'portraits/wiki/Mettaz.jpg' WHERE name = 'Mettaz';
UPDATE players SET portrait = 'portraits/wiki/Vendetta_BEN_2015.png' WHERE name = 'Vendetta';
UPDATE players SET portrait = 'portraits/wiki/2017_GG_Mazino.png' WHERE name = 'Urek Mazin0';
UPDATE players SET portrait = 'portraits/wiki/H4ckerv2.jpg' WHERE name = 'H4ckerv2';
UPDATE players SET portrait = 'portraits/wiki/Genre.jpg' WHERE name = 'Genre';
UPDATE players SET portrait = 'portraits/wiki/Jirall.png' WHERE name = 'Jirall';
UPDATE players SET portrait = 'portraits/wiki/Tarzán.jpg' WHERE name = 'Tarzán';
UPDATE players SET portrait = 'portraits/wiki/Rhopercy.png' WHERE name = 'Rhopercy';
UPDATE players SET portrait = 'portraits/wiki/Marshall.jpg' WHERE name = 'Marshall';
UPDATE players SET portrait = 'portraits/wiki/HWA_Elwind.jpg' WHERE name = 'EowiElwind';
UPDATE players SET portrait = 'portraits/wiki/WtcN.jpg' WHERE name = 'WrisTCutter';
UPDATE players SET portrait = 'portraits/wiki/Şükrü_''Lelouch''_Şentürk.png' WHERE name = 'Lelouch';
UPDATE players SET portrait = 'portraits/wiki/Prod.jpg' WHERE name = 'Prod';
UPDATE players SET portrait = 'portraits/wiki/9066638895_c50912e089_k.jpg' WHERE name = 'Holythoth';
UPDATE players SET portrait = 'portraits/wiki/DP_Crystal_2014_WCS.jpg' WHERE name = 'Crystal Meth';
UPDATE players SET portrait = 'portraits/wiki/Naru.jpg' WHERE name = 'Naru';
UPDATE players SET portrait = 'portraits/wiki/DP_HolyPhoenix_2014_WCS.jpg' WHERE name = 'Holyphoenix';
UPDATE players SET portrait = 'portraits/wiki/Pom9mvkX.jpeg' WHERE name = 'TrieLBaenRe';
UPDATE players SET portrait = 'portraits/wiki/PRS_Lethenor_2018_Split_2.png' WHERE name = 'Lethenor';
UPDATE players SET portrait = 'portraits/wiki/Komodo.jpg' WHERE name = 'Komodo';
UPDATE players SET portrait = 'portraits/wiki/DPLongQ.jpg' WHERE name = 'LongB';
UPDATE players SET portrait = 'portraits/wiki/Halpern.jpg' WHERE name = 'Halpern';
UPDATE players SET portrait = 'portraits/wiki/Kazze.jpg' WHERE name = 'Kazze';
UPDATE players SET portrait = 'portraits/wiki/Zergsting_0.jpg' WHERE name = 'Zergsting';
UPDATE players SET portrait = 'portraits/wiki/FB_Padden_2017_Spring.png' WHERE name = 'Padden';
UPDATE players SET portrait = 'portraits/wiki/Hibiki.jpg' WHERE name = 'Roogu';
UPDATE players SET portrait = 'portraits/wiki/Stomaged_2.jpg' WHERE name = 'Stomaged';
UPDATE players SET portrait = 'portraits/wiki/DP_ReostA.jpg' WHERE name = 'ReostA';
UPDATE players SET portrait = 'portraits/wiki/Zeitnot_3.jpg' WHERE name = 'Zeitnot';
UPDATE players SET portrait = 'portraits/wiki/CHIEFS_Swip3rR_2017_Spring.png' WHERE name = 'Swip3rR';
UPDATE players SET portrait = 'portraits/wiki/CHIEFS_Swiffer_2017_Spring.png' WHERE name = 'Swiffer';
UPDATE players SET portrait = 'portraits/wiki/Chiefs_Rosey.jpg' WHERE name = 'Rosey';
UPDATE players SET portrait = 'portraits/wiki/AVANT_Jayke_2017_Spring.png' WHERE name = 'Jaykey';
UPDATE players SET portrait = 'portraits/wiki/Av_Porky.jpg' WHERE name = 'Porky (Nikolo Tayag)';
UPDATE players SET portrait = 'portraits/wiki/AVANT_Chelby_2017_Spring.png' WHERE name = 'Chelby';
UPDATE players SET portrait = 'portraits/wiki/Gv-keane-2015spring.jpg' WHERE name = 'Keane';
UPDATE players SET portrait = 'portraits/wiki/Trashboat.jpg' WHERE name = 'Bhz';
UPDATE players SET portrait = 'portraits/wiki/Minky_mug.png' WHERE name = 'Minkywhale';
UPDATE players SET portrait = 'portraits/wiki/Carbon_headshot.jpg' WHERE name = 'Carbon';
UPDATE players SET portrait = 'portraits/wiki/LGC_ChuChuZ_-_OPL_Autumn_2016.png' WHERE name = 'ChuChuZ';
UPDATE players SET portrait = 'portraits/wiki/Legacy_Cardrid.png' WHERE name = 'Cardrid';
UPDATE players SET portrait = 'portraits/wiki/Legacy_EGym.png' WHERE name = 'ErectGymnast';
UPDATE players SET portrait = 'portraits/wiki/SIN_Juves_2017_OPL.png' WHERE name = 'Juves';
UPDATE players SET portrait = 'portraits/wiki/Immunity_Niwa.jpg' WHERE name = 'JKSmithy';
UPDATE players SET portrait = 'portraits/wiki/DIW_Rippii.jpg' WHERE name = 'Rippii';
UPDATE players SET portrait = 'portraits/wiki/Av_Kenste.jpg' WHERE name = 'Kenste';
UPDATE players SET portrait = 'portraits/wiki/Immunity_UberBro.jpg' WHERE name = 'UberGiantsBro';
UPDATE players SET portrait = 'portraits/wiki/LGC_Denian_2020_Split_1.jpg' WHERE name = 'Denian';
UPDATE players SET portrait = 'portraits/wiki/IMHeavenz.jpg' WHERE name = 'Heavenz';
UPDATE players SET portrait = 'portraits/wiki/Rusty.jpg' WHERE name = 'Rusty';
UPDATE organisations SET portrait = 'portraits/wiki/ANT_Gaminglogo_square.png' WHERE name = 'ANT Gaming';
UPDATE teams SET portrait = 'portraits/wiki/ANT_Gaminglogo_square.png' WHERE name = 'ANT Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/ATLAS_eSports_Teamlogo_square.png' WHERE name = 'ATLAS eSports Team';
UPDATE teams SET portrait = 'portraits/wiki/ATLAS_eSports_Teamlogo_square.png' WHERE name = 'ATLAS eSports Team';
UPDATE organisations SET portrait = 'portraits/wiki/AcFun_e-Sports_Clublogo_square.png' WHERE name = 'AcFun e-Sports Club';
UPDATE teams SET portrait = 'portraits/wiki/AcFun_e-Sports_Clublogo_square.png' WHERE name = 'AcFun e-Sports Club';
UPDATE organisations SET portrait = 'portraits/wiki/Alienware_Arenalogo_square.png' WHERE name = 'Alienware Arena';
UPDATE teams SET portrait = 'portraits/wiki/Alienware_Arenalogo_square.png' WHERE name = 'Alienware Arena';
UPDATE organisations SET portrait = 'portraits/wiki/Alienware_TOPlogo_square.png' WHERE name = 'Alienware TOP';
UPDATE teams SET portrait = 'portraits/wiki/Alienware_TOPlogo_square.png' WHERE name = 'Alienware TOP';
UPDATE organisations SET portrait = 'portraits/wiki/Always_With_Honorlogo_square.png' WHERE name = 'Always With Honor';
UPDATE teams SET portrait = 'portraits/wiki/Always_With_Honorlogo_square.png' WHERE name = 'Always With Honor';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Athene Skype';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Athene Skype';
UPDATE organisations SET portrait = 'portraits/wiki/Avant_Gaminglogo_std.png' WHERE name = 'Avant Garde Ascension';
UPDATE teams SET portrait = 'portraits/wiki/Avant_Gaminglogo_std.png' WHERE name = 'Avant Garde Ascension';
UPDATE organisations SET portrait = 'portraits/wiki/Bangkok_Titanslogo_square.png' WHERE name = 'Bangkok Titans';
UPDATE teams SET portrait = 'portraits/wiki/Bangkok_Titanslogo_square.png' WHERE name = 'Bangkok Titans';
UPDATE organisations SET portrait = 'portraits/wiki/Bencheados_de_KLGlogo_square.png' WHERE name = 'Bencheados de KLG';
UPDATE teams SET portrait = 'portraits/wiki/Bencheados_de_KLGlogo_square.png' WHERE name = 'Bencheados de KLG';
UPDATE organisations SET portrait = 'portraits/wiki/Big_Plays_Incorporatedlogo_square.png' WHERE name = 'Big Plays Incorporated';
UPDATE teams SET portrait = 'portraits/wiki/Big_Plays_Incorporatedlogo_square.png' WHERE name = 'Big Plays Incorporated';
UPDATE organisations SET portrait = 'portraits/wiki/Bigfile_Amorlogo_std.png' WHERE name = 'Bigfile Amor';
UPDATE teams SET portrait = 'portraits/wiki/Bigfile_Amorlogo_std.png' WHERE name = 'Bigfile Amor';
UPDATE organisations SET portrait = 'portraits/wiki/Bigfile_Miraclelogo_square.png' WHERE name = 'Bigfile Miracle';
UPDATE teams SET portrait = 'portraits/wiki/Bigfile_Miraclelogo_square.png' WHERE name = 'Bigfile Miracle';
UPDATE organisations SET portrait = 'portraits/wiki/BrawL_eSportslogo_std.png' WHERE name = 'BrawL eSports';
UPDATE teams SET portrait = 'portraits/wiki/BrawL_eSportslogo_std.png' WHERE name = 'BrawL eSports';
UPDATE organisations SET portrait = 'portraits/wiki/CNB_e-Sports_Clublogo_square.png' WHERE name = 'CNB e-Sports Club';
UPDATE teams SET portrait = 'portraits/wiki/CNB_e-Sports_Clublogo_square.png' WHERE name = 'CNB e-Sports Club';
UPDATE organisations SET portrait = 'portraits/wiki/COGnitive_Gaminglogo_square.png' WHERE name = 'COGnitive Gaming';
UPDATE teams SET portrait = 'portraits/wiki/COGnitive_Gaminglogo_square.png' WHERE name = 'COGnitive Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/COGnitive_Gaming_Forgelogo_square.png' WHERE name = 'COGnitive Gaming Forge';
UPDATE teams SET portrait = 'portraits/wiki/COGnitive_Gaming_Forgelogo_square.png' WHERE name = 'COGnitive Gaming Forge';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Challenger8';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Challenger8';
UPDATE organisations SET portrait = 'portraits/wiki/Cloud9_Eclipselogo_profile.png' WHERE name = 'Cloud9 Eclipse';
UPDATE teams SET portrait = 'portraits/wiki/Cloud9_Eclipselogo_profile.png' WHERE name = 'Cloud9 Eclipse';
UPDATE organisations SET portrait = 'portraits/wiki/Cloud9_Tempestlogo_square.png' WHERE name = 'Cloud9 Tempest';
UPDATE teams SET portrait = 'portraits/wiki/Cloud9_Tempestlogo_square.png' WHERE name = 'Cloud9 Tempest';
UPDATE organisations SET portrait = 'portraits/wiki/Crossover_eSportslogo_square.png' WHERE name = 'Crossover eSports';
UPDATE teams SET portrait = 'portraits/wiki/Crossover_eSportslogo_square.png' WHERE name = 'Crossover eSports';
UPDATE organisations SET portrait = 'portraits/wiki/Curse_Academylogo_square.png' WHERE name = 'Curse Academy';
UPDATE teams SET portrait = 'portraits/wiki/Curse_Academylogo_square.png' WHERE name = 'Curse Academy';
UPDATE organisations SET portrait = 'portraits/wiki/Dark_Passagelogo_square.png' WHERE name = 'Dark Passage';
UPDATE teams SET portrait = 'portraits/wiki/Dark_Passagelogo_square.png' WHERE name = 'Dark Passage';
UPDATE organisations SET portrait = 'portraits/wiki/Dash9_Gaminglogo_square.png' WHERE name = 'Dash9 Gaming';
UPDATE teams SET portrait = 'portraits/wiki/Dash9_Gaminglogo_square.png' WHERE name = 'Dash9 Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Destroy_Gaminglogo_std.png' WHERE name = 'Destroy Gaming';
UPDATE teams SET portrait = 'portraits/wiki/Destroy_Gaminglogo_std.png' WHERE name = 'Destroy Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'EP.The One';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'EP.The One';
UPDATE organisations SET portrait = 'portraits/wiki/EYES_ON_Ulogo_square.png' WHERE name = 'EYES ON U';
UPDATE teams SET portrait = 'portraits/wiki/EYES_ON_Ulogo_square.png' WHERE name = 'EYES ON U';
UPDATE organisations SET portrait = 'portraits/wiki/Evisceratelogo_std.png' WHERE name = 'Eviscerate';
UPDATE teams SET portrait = 'portraits/wiki/Evisceratelogo_std.png' WHERE name = 'Eviscerate';
UPDATE organisations SET portrait = 'portraits/wiki/Frenetic_Arraylogo_std.png' WHERE name = 'Frenetic Array';
UPDATE teams SET portrait = 'portraits/wiki/Frenetic_Arraylogo_std.png' WHERE name = 'Frenetic Array';
UPDATE organisations SET portrait = 'portraits/wiki/Furious_Gaminglogo_square.png' WHERE name = 'Furious Gaming';
UPDATE teams SET portrait = 'portraits/wiki/Furious_Gaminglogo_square.png' WHERE name = 'Furious Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Gamefylogo_square.png' WHERE name = 'Gamefy';
UPDATE teams SET portrait = 'portraits/wiki/Gamefylogo_square.png' WHERE name = 'Gamefy';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'God-sin';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'God-sin';
UPDATE organisations SET portrait = 'portraits/wiki/HWA_Gaminglogo_square.png' WHERE name = 'HWA Gaming';
UPDATE teams SET portrait = 'portraits/wiki/HWA_Gaminglogo_square.png' WHERE name = 'HWA Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Imperium_Pro_Teamlogo_square.png' WHERE name = 'Imperium Pro Team';
UPDATE teams SET portrait = 'portraits/wiki/Imperium_Pro_Teamlogo_square.png' WHERE name = 'Imperium Pro Team';
UPDATE organisations SET portrait = 'portraits/wiki/Insidious_Gaminglogo_square.png' WHERE name = 'Insidious Gaming';
UPDATE teams SET portrait = 'portraits/wiki/Insidious_Gaminglogo_square.png' WHERE name = 'Insidious Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Invengers';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Invengers';
UPDATE organisations SET portrait = 'portraits/wiki/Isuruslogo_square.png' WHERE name = 'Isurus';
UPDATE teams SET portrait = 'portraits/wiki/Isuruslogo_square.png' WHERE name = 'Isurus';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Jet Fuel';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Jet Fuel';
UPDATE organisations SET portrait = 'portraits/wiki/Jin_Air_Green_Wings_Stealthslogo_square.png' WHERE name = 'Jin Air Stealths';
UPDATE teams SET portrait = 'portraits/wiki/Jin_Air_Green_Wings_Stealthslogo_square.png' WHERE name = 'Jin Air Stealths';
UPDATE organisations SET portrait = 'portraits/wiki/KaBuM!_Esportslogo_square.png' WHERE name = 'KaBuM! Esports';
UPDATE teams SET portrait = 'portraits/wiki/KaBuM!_Esportslogo_square.png' WHERE name = 'KaBuM! Esports';
UPDATE organisations SET portrait = 'portraits/wiki/Kaos_Latin_Gamerslogo_square.png' WHERE name = 'Kaos Latin Gamers';
UPDATE teams SET portrait = 'portraits/wiki/Kaos_Latin_Gamerslogo_square.png' WHERE name = 'Kaos Latin Gamers';
UPDATE organisations SET portrait = 'portraits/wiki/Keyd_Starslogo_square.png' WHERE name = 'Keyd Stars';
UPDATE teams SET portrait = 'portraits/wiki/Keyd_Starslogo_square.png' WHERE name = 'Keyd Stars';
UPDATE organisations SET portrait = 'portraits/wiki/Kx.Cashlogo_square.png' WHERE name = 'Kx.Cash';
UPDATE teams SET portrait = 'portraits/wiki/Kx.Cashlogo_square.png' WHERE name = 'Kx.Cash';
UPDATE organisations SET portrait = 'portraits/wiki/Kx.Happylogo_square.png' WHERE name = 'Kx.Happy';
UPDATE teams SET portrait = 'portraits/wiki/Kx.Happylogo_square.png' WHERE name = 'Kx.Happy';
UPDATE organisations SET portrait = 'portraits/wiki/LMQlogo_square.png' WHERE name = 'LMQ';
UPDATE teams SET portrait = 'portraits/wiki/LMQlogo_square.png' WHERE name = 'LMQ';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Let it go';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Let it go';
UPDATE organisations SET portrait = 'portraits/wiki/Little_Wraithlogo_square.png' WHERE name = 'Little Wraith';
UPDATE teams SET portrait = 'portraits/wiki/Little_Wraithlogo_square.png' WHERE name = 'Little Wraith';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Lyon Gaming';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Lyon Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Manila_Eagleslogo_square.png' WHERE name = 'Manila Eagles';
UPDATE teams SET portrait = 'portraits/wiki/Manila_Eagleslogo_square.png' WHERE name = 'Manila Eagles';
UPDATE organisations SET portrait = 'portraits/wiki/MeetYourMakerslogo_square.png' WHERE name = 'MeetYourMakers';
UPDATE teams SET portrait = 'portraits/wiki/MeetYourMakerslogo_square.png' WHERE name = 'MeetYourMakers';
UPDATE organisations SET portrait = 'portraits/wiki/Mooklogo_std.png' WHERE name = 'Mook Comet';
UPDATE teams SET portrait = 'portraits/wiki/Mooklogo_std.png' WHERE name = 'Mook Comet';
UPDATE organisations SET portrait = 'portraits/wiki/Mooklogo_std.png' WHERE name = 'Mook Secret';
UPDATE teams SET portrait = 'portraits/wiki/Mooklogo_std.png' WHERE name = 'Mook Secret';
UPDATE organisations SET portrait = 'portraits/wiki/No_Big_Deallogo_square.png' WHERE name = 'No Big Deal';
UPDATE teams SET portrait = 'portraits/wiki/No_Big_Deallogo_square.png' WHERE name = 'No Big Deal';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'OX';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'OX';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Optic Snipers';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Optic Snipers';
UPDATE organisations SET portrait = 'portraits/wiki/Pineapple_Expresslogo_square.png' WHERE name = 'Pineapple Express';
UPDATE teams SET portrait = 'portraits/wiki/Pineapple_Expresslogo_square.png' WHERE name = 'Pineapple Express';
UPDATE organisations SET portrait = 'portraits/wiki/Pink_Pwnyslogo_square.png' WHERE name = 'Pink Pwnys';
UPDATE teams SET portrait = 'portraits/wiki/Pink_Pwnyslogo_square.png' WHERE name = 'Pink Pwnys';
UPDATE organisations SET portrait = 'portraits/wiki/Pulse_Esportslogo_square.png' WHERE name = 'Pulse Esports';
UPDATE teams SET portrait = 'portraits/wiki/Pulse_Esportslogo_square.png' WHERE name = 'Pulse Esports';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Pyeongchon High School';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Pyeongchon High School';
UPDATE organisations SET portrait = 'portraits/wiki/Rascal_Jesterlogo_square.png' WHERE name = 'Rascal Jester';
UPDATE teams SET portrait = 'portraits/wiki/Rascal_Jesterlogo_square.png' WHERE name = 'Rascal Jester';
UPDATE organisations SET portrait = 'portraits/wiki/Red_Arrows_Teamlogo_square.png' WHERE name = 'Red Arrows Team';
UPDATE teams SET portrait = 'portraits/wiki/Red_Arrows_Teamlogo_square.png' WHERE name = 'Red Arrows Team';
UPDATE organisations SET portrait = 'portraits/wiki/Renegades_of_Helllogo_square.png' WHERE name = 'Renegades of Hell';
UPDATE teams SET portrait = 'portraits/wiki/Renegades_of_Helllogo_square.png' WHERE name = 'Renegades of Hell';
UPDATE organisations SET portrait = 'portraits/wiki/SK_Gaming_Primelogo_square.png' WHERE name = 'SK Gaming Prime';
UPDATE teams SET portrait = 'portraits/wiki/SK_Gaming_Primelogo_square.png' WHERE name = 'SK Gaming Prime';
UPDATE organisations SET portrait = 'portraits/wiki/Saigon_Fantastic_Fivelogo_square.png' WHERE name = 'Saigon Fantastic Five';
UPDATE teams SET portrait = 'portraits/wiki/Saigon_Fantastic_Fivelogo_square.png' WHERE name = 'Saigon Fantastic Five';
UPDATE organisations SET portrait = 'portraits/wiki/Saigon_Jokerslogo_square.png' WHERE name = 'Saigon Jokers';
UPDATE teams SET portrait = 'portraits/wiki/Saigon_Jokerslogo_square.png' WHERE name = 'Saigon Jokers';
UPDATE organisations SET portrait = 'portraits/wiki/Satorilogo_square.png' WHERE name = 'Satori';
UPDATE teams SET portrait = 'portraits/wiki/Satorilogo_square.png' WHERE name = 'Satori';
UPDATE organisations SET portrait = 'portraits/wiki/Seven_Wars_e-Sportslogo_std.png' WHERE name = 'Seven Wars Lyon';
UPDATE teams SET portrait = 'portraits/wiki/Seven_Wars_e-Sportslogo_std.png' WHERE name = 'Seven Wars Lyon';
UPDATE organisations SET portrait = 'portraits/wiki/Singapore_Sentinelslogo_square.png' WHERE name = 'Singapore Sentinels';
UPDATE teams SET portrait = 'portraits/wiki/Singapore_Sentinelslogo_square.png' WHERE name = 'Singapore Sentinels';
UPDATE organisations SET portrait = 'portraits/wiki/Storm_Games_Clanlogo_square.png' WHERE name = 'Storm Games Clan';
UPDATE teams SET portrait = 'portraits/wiki/Storm_Games_Clanlogo_square.png' WHERE name = 'Storm Games Clan';
UPDATE organisations SET portrait = 'portraits/wiki/TINT_Gaminglogo_square.png' WHERE name = 'TINT Gaming';
UPDATE teams SET portrait = 'portraits/wiki/TINT_Gaminglogo_square.png' WHERE name = 'TINT Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Taipei_Assassinslogo_square.png' WHERE name = 'Taipei Assassins';
UPDATE teams SET portrait = 'portraits/wiki/Taipei_Assassinslogo_square.png' WHERE name = 'Taipei Assassins';
UPDATE organisations SET portrait = 'portraits/wiki/Taipei_Sniperslogo_square.png' WHERE name = 'Taipei Snipers';
UPDATE teams SET portrait = 'portraits/wiki/Taipei_Sniperslogo_square.png' WHERE name = 'Taipei Snipers';
UPDATE organisations SET portrait = 'portraits/wiki/Team_DKlogo_square.png' WHERE name = 'Team DK';
UPDATE teams SET portrait = 'portraits/wiki/Team_DKlogo_square.png' WHERE name = 'Team DK';
UPDATE organisations SET portrait = 'portraits/wiki/Team_Green_Forestlogo_square.png' WHERE name = 'Team Green Forest';
UPDATE teams SET portrait = 'portraits/wiki/Team_Green_Forestlogo_square.png' WHERE name = 'Team Green Forest';
UPDATE organisations SET portrait = 'portraits/wiki/Team_Immunitylogo_square.png' WHERE name = 'Team Immunity';
UPDATE teams SET portrait = 'portraits/wiki/Team_Immunitylogo_square.png' WHERE name = 'Team Immunity';
UPDATE organisations SET portrait = 'portraits/wiki/Team_LoLPrologo_square.png' WHERE name = 'Team LoLPro';
UPDATE teams SET portrait = 'portraits/wiki/Team_LoLPrologo_square.png' WHERE name = 'Team LoLPro';
UPDATE organisations SET portrait = 'portraits/wiki/Team_Nvlogo_square.png' WHERE name = 'Team Nv';
UPDATE teams SET portrait = 'portraits/wiki/Team_Nvlogo_square.png' WHERE name = 'Team Nv';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Team OLYMPUS';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Team OLYMPUS';
UPDATE organisations SET portrait = 'portraits/wiki/Team_Quetzallogo_square.png' WHERE name = 'Team Quetzal';
UPDATE teams SET portrait = 'portraits/wiki/Team_Quetzallogo_square.png' WHERE name = 'Team Quetzal';
UPDATE organisations SET portrait = 'portraits/wiki/Team_Tempestlogo_square.png' WHERE name = 'Team Tempest';
UPDATE teams SET portrait = 'portraits/wiki/Team_Tempestlogo_square.png' WHERE name = 'Team Tempest';
UPDATE organisations SET portrait = 'portraits/wiki/Team_Turqualitylogo_square.png' WHERE name = 'Team Turquality';
UPDATE teams SET portrait = 'portraits/wiki/Team_Turqualitylogo_square.png' WHERE name = 'Team Turquality';
UPDATE organisations SET portrait = 'portraits/wiki/Team_Unitedlogo_square.png' WHERE name = 'Team United';
UPDATE teams SET portrait = 'portraits/wiki/Team_Unitedlogo_square.png' WHERE name = 'Team United';
UPDATE organisations SET portrait = 'portraits/wiki/Team_awplogo_square.png' WHERE name = 'Team awp';
UPDATE teams SET portrait = 'portraits/wiki/Team_awplogo_square.png' WHERE name = 'Team awp';
UPDATE organisations SET portrait = 'portraits/wiki/Tesla_Gaminglogo_square.png' WHERE name = 'Tesla Gaming';
UPDATE teams SET portrait = 'portraits/wiki/Tesla_Gaminglogo_square.png' WHERE name = 'Tesla Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/The_Last_Resistancelogo_std.png' WHERE name = 'The Last Resistance';
UPDATE teams SET portrait = 'portraits/wiki/The_Last_Resistancelogo_std.png' WHERE name = 'The Last Resistance';
UPDATE organisations SET portrait = 'portraits/wiki/Tick_Trick_and_Ducklogo_square.png' WHERE name = 'Tick Trick and Duck';
UPDATE teams SET portrait = 'portraits/wiki/Tick_Trick_and_Ducklogo_square.png' WHERE name = 'Tick Trick and Duck';
UPDATE organisations SET portrait = 'portraits/wiki/Titan_Catipaylogo_square.png' WHERE name = 'Titan Catipay';
UPDATE teams SET portrait = 'portraits/wiki/Titan_Catipaylogo_square.png' WHERE name = 'Titan Catipay';
UPDATE organisations SET portrait = 'portraits/wiki/VTG_2logo_square.png' WHERE name = 'VTG 2';
UPDATE teams SET portrait = 'portraits/wiki/VTG_2logo_square.png' WHERE name = 'VTG 2';
UPDATE organisations SET portrait = 'portraits/wiki/Vici_Esportslogo_square.png' WHERE name = 'Vici Esports';
UPDATE teams SET portrait = 'portraits/wiki/Vici_Esportslogo_square.png' WHERE name = 'Vici Esports';
UPDATE organisations SET portrait = 'portraits/wiki/Vici_Gaminglogo_square.png' WHERE name = 'Vici Gaming';
UPDATE teams SET portrait = 'portraits/wiki/Vici_Gaminglogo_square.png' WHERE name = 'Vici Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Wings_of_Auroralogo_square.png' WHERE name = 'Wings of Aurora';
UPDATE teams SET portrait = 'portraits/wiki/Wings_of_Auroralogo_square.png' WHERE name = 'Wings of Aurora';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Yisus traia GA';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'Yisus traia GA';
UPDATE organisations SET portrait = 'portraits/wiki/Young_Glorylogo_square.png' WHERE name = 'Young Glory';
UPDATE teams SET portrait = 'portraits/wiki/Young_Glorylogo_square.png' WHERE name = 'Young Glory';
UPDATE organisations SET portrait = 'portraits/wiki/Your_Soul_Shall_Chufferlogo_square.png' WHERE name = 'Your Soul Shall Chuffer';
UPDATE teams SET portrait = 'portraits/wiki/Your_Soul_Shall_Chufferlogo_square.png' WHERE name = 'Your Soul Shall Chuffer';
UPDATE organisations SET portrait = 'portraits/wiki/Ahq_eSports_Clublogo_square.png' WHERE name = 'ahq eSports Club';
UPDATE teams SET portrait = 'portraits/wiki/Ahq_eSports_Clublogo_square.png' WHERE name = 'ahq eSports Club';
UPDATE organisations SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'kimchi 2 spicy';
UPDATE teams SET portrait = 'portraits/wiki/Logo-E-corp-big.png' WHERE name = 'kimchi 2 spicy';
UPDATE organisations SET portrait = 'portraits/wiki/PaiN_Gaminglogo_square_(2013_-_May_2017).png' WHERE name = 'paiN Gaming';
UPDATE teams SET portrait = 'portraits/wiki/PaiN_Gaminglogo_square_(2013_-_May_2017).png' WHERE name = 'paiN Gaming';
UPDATE organisations SET portrait = 'portraits/wiki/Y_so_E-Sportslogo_square.png' WHERE name = 'y so E-Sports';
UPDATE teams SET portrait = 'portraits/wiki/Y_so_E-Sportslogo_square.png' WHERE name = 'y so E-Sports';
UPDATE organisations SET portrait = 'portraits/wiki/Yoe_Flash_Wolveslogo_std.png' WHERE name = 'yoe Flash Wolves';
UPDATE teams SET portrait = 'portraits/wiki/Yoe_Flash_Wolveslogo_std.png' WHERE name = 'yoe Flash Wolves';
UPDATE leagues SET portrait = 'portraits/wiki/CS_EU_logo.png' WHERE name = 'EU Challenger Series';
UPDATE leagues SET portrait = 'portraits/wiki/CS_NA_logo.png' WHERE name = 'NA Challenger Series';
UPDATE leagues SET portrait = 'portraits/wiki/LSPL_Logo.jpg' WHERE name = 'LSPL';
UPDATE leagues SET portrait = 'portraits/wiki/Bigfile_NLB_Spring_2014.jpg' WHERE name = 'NLB';
UPDATE leagues SET portrait = 'portraits/wiki/Logo-gpl.png' WHERE name = 'GPL';
UPDATE leagues SET portrait = 'portraits/wiki/CBLOL.png' WHERE name = 'CBLOL';
UPDATE leagues SET portrait = 'portraits/wiki/Copa_LatinAm_logo.png' WHERE name = 'Latin America Cup';
UPDATE leagues SET portrait = 'portraits/wiki/Logo_0_0.png' WHERE name = 'TCL';
UPDATE leagues SET portrait = 'portraits/wiki/OR_Autumn_logo.png' WHERE name = 'Oceanic Regional Tournament';

-- compLexity Black, Red and Academy are squads of one organisation.
UPDATE organisations SET portrait = 'portraits/wiki/Col_logo.png' WHERE name = 'compLexity Gaming';
UPDATE teams SET portrait = 'portraits/wiki/CoLBlack.png' WHERE name = 'compLexity.Black';
UPDATE teams SET portrait = 'portraits/wiki/Col_logo.png' WHERE name = 'compLexity.Red';
UPDATE teams SET portrait = 'portraits/wiki/CompLexity_Gaminglogo_square.png' WHERE name = 'compLexity Academy';

-- vVv Gaming White and Red are squads of one organisation and share its logo.
-- https://lol.fandom.com/wiki/VVv_Gaming_White
UPDATE organisations SET portrait = 'portraits/wiki/VVv_Gaminglogo_square.png' WHERE name = 'vVv Gaming';
UPDATE teams SET portrait = 'portraits/wiki/VVv_Gaminglogo_square.png' WHERE name IN ('vVv Gaming White', 'vVv Gaming Red');


-- Players listed with role1 rather than role were left out of the opening rosters. The first role is kept.
INSERT INTO organisations (id, name, region, history, staff_seats, scrim_room, gaming_house, chef, jersey_name, budget, wage_bill, fan_count, fan_mood, portrait) VALUES
    ('9d2bbeb1-1023-4f3c-9a14-28065e842866', 'Full Louis', 'SEA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO teams (id, name, organisation_id, league_id, season_year, portrait) VALUES
    ('ad32d9fb-ebfd-456a-9c59-bba99de2c6ba', 'Full Louis', '9d2bbeb1-1023-4f3c-9a14-28065e842866', '2b171fa1-5597-43b0-9a32-fafcb2ec6915', 2014, NULL);
INSERT INTO organisation_teams (organisation_id, position, team_id) VALUES
    ('9d2bbeb1-1023-4f3c-9a14-28065e842866', 0, 'ad32d9fb-ebfd-456a-9c59-bba99de2c6ba');
INSERT INTO players (id, name, portrait, role, nationality, birth_date, mechanics, teamfight, map_awareness, objectives, tempo, mental, itemisation, phase_early, phase_mid, phase_late, shotcalling, role_skill_kind, role_skill_score, form, fatigue) VALUES
    ('f2232b79-39fc-4876-85c4-d0636f173d15', 'WarL0cK', NULL, 'top', 'TH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a897eb70-2a6e-44a9-8048-e10e42ebd94c', 'NdD', NULL, 'jungle', 'TH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('bd73e613-5689-4cdd-9d89-90d7e705793c', 'Hero', NULL, 'top', 'PH', '1996-04-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e8cddd07-9300-45d7-9dbb-138afd1a5a1f', 'Rebengga', NULL, 'jungle', 'PH', '1992-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('40040165-226b-48b6-815e-66b8859ca48c', 'Yukz', NULL, 'top', 'PH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('74967a3a-7074-44e9-800e-95e95b00fbe9', 'H4T3', NULL, 'adc', 'PH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('72b05c52-4a71-4c9e-b76d-9821bf8e8374', 'Mountain', NULL, 'jungle', 'TW', '1995-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('901ad404-0bba-44c8-99e9-507fc2aba60a', 'REFRA1N', NULL, 'mid', 'TW', '1993-10-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('17e8cd71-48fe-4e06-90c0-c1d66298f734', 'MeW', NULL, 'top', 'VN', '1991-11-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3354cda7-f8fe-4c42-813a-fd01f3fb17cf', 'SofM', NULL, 'jungle', 'VN', '1998-02-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('4ca49036-3512-4c25-9e47-c64777993de0', 'Starfall', NULL, 'mid', 'VN', '1993-12-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1e0b0492-96f0-4c83-9aa3-d3a07225000e', 'Shyn', NULL, 'adc', 'VN', '1994-03-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('2ac606d7-78c0-4ea6-bb68-85f0e25feea0', 'Violet (Ngô Mạnh Quyền)', NULL, 'support', 'VN', '1987-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('415bf75d-b389-45a2-84f2-d30c216c205a', 'x1Aolong', NULL, 'top', 'CN', '1995-11-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c9cf0ecc-e28a-40d4-a559-10efcf1b5421', 'Wind', NULL, 'jungle', 'CN', '1997-09-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('a509d48e-d1fd-44b1-9860-07fcc93aa9a8', 'sanxin', NULL, 'mid', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('6f0de2ed-78b9-4f0a-b411-30f2136329be', 'sAviOr', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('ddddb159-b563-4078-b50d-f57b2fe3b363', 'Myuseru', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('71f42128-c51e-4cd0-8a5d-84b021d5e711', 'qixi', NULL, 'mid', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('cc15d1fd-6d17-4646-b956-513b2a080648', 'Trn', NULL, 'adc', 'CN', '1998-01-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('50a0622c-3ec1-4e64-9051-ae970ebb4a06', 'Rui (Lyu Rui)', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('88096918-7aa3-440f-9a9e-bcba376a1692', 'TK', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('3bc976f5-216a-484f-b040-6b84d3556b62', '12345', NULL, 'jungle', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('45c0bd7f-9420-40ec-9a4f-bc32d2e1a175', 'XuaN', NULL, 'mid', 'CN', '1997-10-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('86631624-c674-426b-bde4-4135a23ef0f0', 'Yi', NULL, 'top', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b01de81b-3e0e-4226-b295-5cd3930b03c4', 'YanSir', NULL, 'support', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('151422b3-f883-4710-aa20-ae5852040d05', 'Ominator', NULL, 'support', 'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b82a80e0-54c6-411d-8f60-7f945dc73e10', 'K For Kimchi', NULL, 'top', 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO player_teams (player_id, position, team_id) VALUES
    ('f2232b79-39fc-4876-85c4-d0636f173d15', 0, 'f3be8875-305b-477a-b1b4-7b5a0402e6ab'),
    ('a897eb70-2a6e-44a9-8048-e10e42ebd94c', 0, 'f3be8875-305b-477a-b1b4-7b5a0402e6ab'),
    ('bd73e613-5689-4cdd-9d89-90d7e705793c', 0, '03fba709-2391-4e93-9fc2-528dd0243e37'),
    ('e8cddd07-9300-45d7-9dbb-138afd1a5a1f', 0, '03fba709-2391-4e93-9fc2-528dd0243e37'),
    ('40040165-226b-48b6-815e-66b8859ca48c', 0, '3ef9d373-a6ca-4519-acec-37fc07accbbb'),
    ('74967a3a-7074-44e9-800e-95e95b00fbe9', 0, '3ef9d373-a6ca-4519-acec-37fc07accbbb'),
    ('72b05c52-4a71-4c9e-b76d-9821bf8e8374', 0, '0efb8078-2108-4217-97c4-a60497b5e7b3'),
    ('901ad404-0bba-44c8-99e9-507fc2aba60a', 0, '0efb8078-2108-4217-97c4-a60497b5e7b3'),
    ('17e8cd71-48fe-4e06-90c0-c1d66298f734', 0, 'ad32d9fb-ebfd-456a-9c59-bba99de2c6ba'),
    ('3354cda7-f8fe-4c42-813a-fd01f3fb17cf', 0, 'ad32d9fb-ebfd-456a-9c59-bba99de2c6ba'),
    ('4ca49036-3512-4c25-9e47-c64777993de0', 0, 'ad32d9fb-ebfd-456a-9c59-bba99de2c6ba'),
    ('1e0b0492-96f0-4c83-9aa3-d3a07225000e', 0, 'ad32d9fb-ebfd-456a-9c59-bba99de2c6ba'),
    ('2ac606d7-78c0-4ea6-bb68-85f0e25feea0', 0, 'ad32d9fb-ebfd-456a-9c59-bba99de2c6ba'),
    ('415bf75d-b389-45a2-84f2-d30c216c205a', 0, 'f4c1dd56-199f-41aa-8e5e-7f3046f3787d'),
    ('c9cf0ecc-e28a-40d4-a559-10efcf1b5421', 0, 'f4c1dd56-199f-41aa-8e5e-7f3046f3787d'),
    ('a509d48e-d1fd-44b1-9860-07fcc93aa9a8', 0, 'f4c1dd56-199f-41aa-8e5e-7f3046f3787d'),
    ('6f0de2ed-78b9-4f0a-b411-30f2136329be', 0, 'f4c1dd56-199f-41aa-8e5e-7f3046f3787d'),
    ('ddddb159-b563-4078-b50d-f57b2fe3b363', 0, 'd4497457-5af7-4678-bc66-50ad29adc696'),
    ('71f42128-c51e-4cd0-8a5d-84b021d5e711', 0, 'd4497457-5af7-4678-bc66-50ad29adc696'),
    ('cc15d1fd-6d17-4646-b956-513b2a080648', 0, 'd4497457-5af7-4678-bc66-50ad29adc696'),
    ('50a0622c-3ec1-4e64-9051-ae970ebb4a06', 0, '9f513f87-e8e7-4533-82c2-34f5daaf7788'),
    ('88096918-7aa3-440f-9a9e-bcba376a1692', 0, '9f513f87-e8e7-4533-82c2-34f5daaf7788'),
    ('3bc976f5-216a-484f-b040-6b84d3556b62', 0, '9f513f87-e8e7-4533-82c2-34f5daaf7788'),
    ('45c0bd7f-9420-40ec-9a4f-bc32d2e1a175', 0, '9f513f87-e8e7-4533-82c2-34f5daaf7788'),
    ('86631624-c674-426b-bde4-4135a23ef0f0', 0, 'd72d39fa-8895-4b04-9a54-1c0f308545e5'),
    ('b01de81b-3e0e-4226-b295-5cd3930b03c4', 0, 'c7fc6f36-a10f-47b9-9c0e-eb1a393a2133'),
    ('151422b3-f883-4710-aa20-ae5852040d05', 0, '24b9c7ec-9d98-4967-8711-419338f7d020'),
    ('b82a80e0-54c6-411d-8f60-7f945dc73e10', 0, '8a6220a4-4e35-41b0-922a-8df981262634');

-- Fifth players whose short name collided with someone else, or who were simply skipped.
-- PEX Team is the same squad as Pineapple Express, so that empty team is not kept.
INSERT INTO players (id, name, portrait, role, nationality, birth_date, mechanics, teamfight, map_awareness, objectives, tempo, mental, itemisation, phase_early, phase_mid, phase_late, shotcalling, role_skill_kind, role_skill_score, form, fatigue) VALUES
    ('746d2c84-fe75-4f5a-9205-b635cf130d08', 'RobertxLee', NULL, 'adc', 'US', '1992-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9ca3de69-0705-4233-a51e-1abc373f7817', 'Diamond (David Bérubé)', NULL, 'adc', 'CA', '1996-02-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('60701273-3ac7-47ff-abfb-53b07607b9b9', 'Sheep (Jamie Gallagher)', NULL, 'support', 'CA', '1992-06-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('33890ef7-bc88-4ed2-9f28-06853388355c', 'Star (Pu Hao)', NULL, 'adc', 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO player_teams (player_id, position, team_id) VALUES
    ('746d2c84-fe75-4f5a-9205-b635cf130d08', 0, '847311ca-a6c0-4f79-a717-f77fc7e0b1db'),
    ('9ca3de69-0705-4233-a51e-1abc373f7817', 0, '87e646e9-2408-4224-8a24-6a6770c51bf8'),
    ('60701273-3ac7-47ff-abfb-53b07607b9b9', 0, '3a46ce7d-5032-4455-885f-105355777a58'),
    ('33890ef7-bc88-4ed2-9f28-06853388355c', 0, 'ba4009ed-b0c1-4c42-bd77-290635d22c5a');

-- Mexico season 1 names five teams that never published a roster.
DELETE FROM organisation_teams WHERE team_id IN (
    'b6556dce-d5de-487c-9fb4-619b859fac39',
    '9be714fe-edbd-44a1-80ee-db544e54bc6f',
    'd725049d-10a8-4828-8afe-090efa21a137',
    'aeaa6b6c-9cbb-46d3-a818-2cee77377dd9',
    '219fb6b1-dbf2-4e2d-9fbf-32ad566bf8d1'
);
DELETE FROM teams WHERE id IN (
    'b6556dce-d5de-487c-9fb4-619b859fac39',
    '9be714fe-edbd-44a1-80ee-db544e54bc6f',
    'd725049d-10a8-4828-8afe-090efa21a137',
    'aeaa6b6c-9cbb-46d3-a818-2cee77377dd9',
    '219fb6b1-dbf2-4e2d-9fbf-32ad566bf8d1'
);
DELETE FROM organisations WHERE id IN (
    '43e55eac-a075-40c1-b762-aed671ea9093',
    'b4d926f8-3660-4f44-9cf9-cef0316d33ae',
    '524feff0-4e3f-47bf-a8ed-2a8c3a55e5a7',
    '82e7cbff-e94c-45ac-8fb2-7c9cf014b720',
    '6ac2f007-441c-4b35-ad2d-4ec06af773f9'
);

-- Lyon Gaming's former-roster table: on 2014-01-01 the squad is Porky, Thyak, Seiya and NerzhuL.
-- 1an joins on 2014-02-03. All five leave for Seven Wars Lyon on 2014-02-15.
-- The career opens while they are still Lyon Gaming, so that later name is not a second team.
-- FraGio leaves on 2013-06-10. h4ckerv2 leaves on 2013-09-08.
-- https://lol.fandom.com/wiki/Lyon_Gaming_(2013_Latin_American_Team)
UPDATE player_teams SET team_id = '85b09923-7805-42dc-a241-d175a09729e7'
WHERE team_id = 'f7b6fa6c-addc-4fcc-884a-bbc80b18f246';
DELETE FROM organisation_teams WHERE team_id = 'f7b6fa6c-addc-4fcc-884a-bbc80b18f246';
DELETE FROM teams WHERE id = 'f7b6fa6c-addc-4fcc-884a-bbc80b18f246';
DELETE FROM organisations WHERE id = 'b2673fd6-526c-4f19-96b0-bdba501a272a';

-- Former rosters, keeping the stint that covers the 2014 spring snapshot.
-- Zorozero and nukeduck stay on Ninjas in Pyjamas until 2014-05-01. Gambit is only 2014-02-20 to 2014-02-22.
UPDATE player_teams SET team_id = '07ebcbcc-43a1-467f-a02e-e311dd728acb'
WHERE player_id IN ('795fbf31-99d9-4f73-a047-4c95e2a3b8d9', 'cac85be0-7fe9-4352-96d9-98a2e1bf99ad');
-- goldenglue stays on compLexity.Red from 2014-02-04 to 2014-03-25, then joins Dignitas as a sub.
UPDATE player_teams SET team_id = 'eff22c5a-fa9e-4e93-ad1f-520c8ea88eae'
WHERE player_id = '9c5c49b8-c257-44e4-888a-9b06bdb9b444';
-- 4zeer0 stays on BrawL eSports until 2014-04-05 and joins Tesla Gaming on 2014-04-24.
UPDATE player_teams SET team_id = '4acbad7f-01d2-4801-aa77-02f41b748196'
WHERE player_id = '9ddf40a7-5abc-4763-bb8d-9dc511bd9560';
-- Bunny FuFuu joins Team Curse as a sub on 2014-03-06. Challenger8 has no team page; the spring roster lists him.
UPDATE player_teams SET team_id = 'b152ab80-622e-4167-9abe-897f2b9a8e5c'
WHERE player_id = '51be46b7-167b-4f76-be91-aac3ffce042c';
-- Koukin is Tesla Gaming's bot from 2014-02-01 to 2014-06-10. No birth date on the player page.
-- https://lol.fandom.com/wiki/Koukin
INSERT INTO players VALUES (
    'ef168eb0-c6a3-4df2-87f1-f8fb169bdf5f', 'Koukin', NULL, 'adc', 'EC', NULL,
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
);
INSERT INTO player_teams (player_id, position, team_id) VALUES
    ('ef168eb0-c6a3-4df2-87f1-f8fb169bdf5f', 0, 'dc362476-afdc-4771-8816-afc79bd0ecc6');

-- vVv Gaming Red's former roster is four players, 2014-01-05 to 2014-01-18. The team is not kept.
DELETE FROM player_teams WHERE team_id = '003475ee-3175-4af6-9a8b-bc954662e074';
DELETE FROM organisation_teams WHERE team_id = '003475ee-3175-4af6-9a8b-bc954662e074';
DELETE FROM teams WHERE id = '003475ee-3175-4af6-9a8b-bc954662e074';

-- Champion ratings on patch 4.21.5.
-- Source: https://ddragon.leagueoflegends.com/cdn/4.21.5/data/en_US/championFull.json
-- Method: crates/domain/src/champion_rating.rs
-- The date stays empty: this file does not carry a calendar day.
INSERT INTO patches (id, version, date, source_url) VALUES (
    'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0',
    '4.21.5',
    '2014-12-10',
    'https://wiki.leagueoflegends.com/en-us/V4.21'
);
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 80, 30, 0, 67, 89, 53, 39, 48, 58 FROM champions WHERE name = 'Aatrox';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 28, 43, 80, 8, 25, 30, 80, 40, 57, 80, 30, 24, 29, 35 FROM champions WHERE name = 'Ahri';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 35, 70, 75, 5, 10, 50, 80, 0, 68, 86, 53, 27, 35, 44 FROM champions WHERE name = 'Akali';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 38, 18, 5, 68, 60, 50, 0, 79, 84, 53, 24, 29, 35 FROM champions WHERE name = 'Alistar';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 53, 35, 48, 5, 43, 20, 80, 0, 68, 80, 53, 32, 39, 47 FROM champions WHERE name = 'Amumu';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 10, 100, 0, 51, 89, 30, 21, 26, 31 FROM champions WHERE name = 'Anivia';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 20, 100, 0, 55, 87, 30, 37, 46, 55 FROM champions WHERE name = 'Annie';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 13, 13, 20, 50, 55, 70, 20, 0, 56, 79, 30, 29, 36, 42 FROM champions WHERE name = 'Ashe';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 15, 10, 50, 50, 30, 60, 80, 0, 56, 70, 30, 26, 34, 43 FROM champions WHERE name = 'Azir';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 40, 50, 0, 74, 84, 53, 36, 45, 52 FROM champions WHERE name = 'Blitzcrank';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 20, 90, 0, 55, 81, 30, 37, 44, 51 FROM champions WHERE name = 'Brand';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 38, 18, 5, 68, 30, 40, 0, 71, 95, 53, 51, 51, 53 FROM champions WHERE name = 'Braum';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 10, 5, 15, 90, 20, 80, 20, 0, 57, 82, 30, 46, 60, 72 FROM champions WHERE name = 'Caitlyn';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 20, 90, 0, 55, 90, 30, 28, 32, 36 FROM champions WHERE name = 'Cassiopeia';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 53, 35, 48, 5, 43, 30, 70, 20, 96, 88, 53, 25, 34, 45 FROM champions WHERE name = 'Cho''Gath';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 10, 5, 15, 90, 20, 80, 60, 20, 58, 83, 30, 45, 54, 61 FROM champions WHERE name = 'Corki';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 90, 10, 20, 73, 89, 53, 100, 100, 100 FROM champions WHERE name = 'Darius';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 40, 55, 8, 28, 70, 80, 0, 71, 87, 53, 20, 27, 35 FROM champions WHERE name = 'Diana';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 50, 60, 0, 71, 86, 53, 37, 36, 38 FROM champions WHERE name = 'Dr. Mundo';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 10, 5, 15, 90, 20, 90, 10, 0, 59, 82, 30, 74, 76, 84 FROM champions WHERE name = 'Draven';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 40, 55, 8, 28, 60, 70, 0, 57, 79, 30, 47, 50, 56 FROM champions WHERE name = 'Elise';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 28, 43, 80, 8, 25, 40, 70, 0, 70, 91, 53, 64, 64, 69 FROM champions WHERE name = 'Evelynn';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 15, 10, 50, 50, 30, 70, 60, 0, 56, 81, 30, 46, 55, 66 FROM champions WHERE name = 'Ezreal';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 20, 90, 0, 57, 80, 30, 18, 25, 31 FROM champions WHERE name = 'Fiddlesticks';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 100, 20, 0, 68, 84, 53, 27, 37, 46 FROM champions WHERE name = 'Fiora';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 60, 70, 0, 67, 80, 53, 32, 44, 56 FROM champions WHERE name = 'Fizz';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 53, 35, 48, 5, 43, 30, 60, 0, 68, 86, 53, 35, 41, 47 FROM champions WHERE name = 'Galio';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 48, 43, 25, 8, 53, 70, 40, 0, 67, 82, 53, 20, 27, 35 FROM champions WHERE name = 'Gangplank';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 70, 10, 0, 73, 73, 53, 100, 97, 100 FROM champions WHERE name = 'Garen';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 45, 35, 20, 48, 18, 60, 50, 0, 48, 66, 30, 60, 71, 85 FROM champions WHERE name = 'Gnar';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 40, 55, 8, 28, 40, 60, 0, 71, 87, 53, 56, 61, 69 FROM champions WHERE name = 'Gragas';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 10, 5, 15, 90, 20, 80, 30, 0, 60, 79, 30, 47, 56, 63 FROM champions WHERE name = 'Graves';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 80, 40, 0, 76, 95, 53, 44, 53, 64 FROM champions WHERE name = 'Hecarim';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 20, 80, 0, 52, 70, 30, 99, 96, 94 FROM champions WHERE name = 'Heimerdinger';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 70, 50, 20, 72, 89, 53, 30, 36, 44 FROM champions WHERE name = 'Irelia';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 30, 70, 0, 55, 84, 30, 21, 30, 41 FROM champions WHERE name = 'Janna';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 60, 30, 0, 71, 85, 53, 32, 41, 49 FROM champions WHERE name = 'Jarvan IV';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 70, 70, 0, 67, 78, 53, 29, 39, 50 FROM champions WHERE name = 'Jax';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 45, 35, 20, 48, 18, 80, 30, 0, 64, 82, 30, 100, 100, 100 FROM champions WHERE name = 'Jayce';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 10, 5, 15, 90, 20, 90, 40, 0, 58, 82, 30, 68, 73, 77 FROM champions WHERE name = 'Jinx';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 10, 5, 15, 90, 20, 80, 40, 0, 58, 79, 30, 32, 35, 41 FROM champions WHERE name = 'Kalista';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 10, 80, 0, 59, 85, 30, 46, 54, 62 FROM champions WHERE name = 'Karma';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 20, 100, 0, 54, 80, 30, 27, 32, 37 FROM champions WHERE name = 'Karthus';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 28, 43, 80, 8, 25, 30, 80, 0, 57, 78, 30, 31, 38, 47 FROM champions WHERE name = 'Kassadin';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 28, 43, 80, 8, 25, 40, 90, 0, 65, 86, 53, 46, 67, 86 FROM champions WHERE name = 'Katarina';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 48, 43, 25, 8, 53, 60, 70, 0, 66, 86, 30, 16, 24, 34 FROM champions WHERE name = 'Kayle';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 15, 10, 50, 50, 30, 60, 70, 0, 58, 88, 30, 32, 40, 51 FROM champions WHERE name = 'Kennen';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 90, 30, 0, 66, 75, 53, 25, 33, 43 FROM champions WHERE name = 'Kha''Zix';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 15, 10, 50, 50, 30, 80, 50, 20, 61, 79, 30, 28, 35, 44 FROM champions WHERE name = 'Kog''Maw';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 28, 43, 80, 8, 25, 10, 100, 0, 54, 81, 30, 44, 62, 73 FROM champions WHERE name = 'LeBlanc';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 80, 30, 0, 68, 87, 53, 35, 48, 59 FROM champions WHERE name = 'Lee Sin';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 38, 18, 5, 68, 40, 30, 0, 68, 80, 53, 33, 41, 49 FROM champions WHERE name = 'Leona';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 20, 80, 0, 59, 83, 30, 35, 43, 51 FROM champions WHERE name = 'Lissandra';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 10, 5, 15, 90, 20, 80, 30, 0, 57, 75, 30, 90, 92, 100 FROM champions WHERE name = 'Lucian';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 40, 70, 0, 59, 82, 30, 20, 27, 36 FROM champions WHERE name = 'Lulu';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 20, 90, 0, 56, 87, 30, 38, 44, 50 FROM champions WHERE name = 'Lux';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 50, 70, 0, 72, 92, 53, 55, 60, 69 FROM champions WHERE name = 'Malphite';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 28, 43, 80, 8, 25, 20, 90, 0, 57, 81, 30, 43, 53, 62 FROM champions WHERE name = 'Malzahar';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 53, 35, 48, 5, 43, 30, 60, 0, 66, 97, 30, 47, 51, 57 FROM champions WHERE name = 'Maokai';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 100, 20, 20, 71, 75, 53, 84, 80, 83 FROM champions WHERE name = 'Master Yi';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 10, 5, 15, 90, 20, 80, 50, 0, 60, 75, 30, 24, 31, 41 FROM champions WHERE name = 'Miss Fortune';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 40, 55, 8, 28, 40, 70, 0, 64, 84, 53, 23, 35, 49 FROM champions WHERE name = 'Mordekaiser';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 10, 80, 0, 62, 90, 30, 26, 36, 46 FROM champions WHERE name = 'Morgana';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 40, 70, 0, 54, 88, 30, 33, 41, 49 FROM champions WHERE name = 'Nami';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 70, 60, 0, 70, 84, 53, 21, 26, 33 FROM champions WHERE name = 'Nasus';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 40, 60, 0, 68, 82, 53, 42, 51, 59 FROM champions WHERE name = 'Nautilus';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 50, 70, 0, 63, 82, 30, 88, 99, 100 FROM champions WHERE name = 'Nidalee';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 90, 20, 0, 68, 86, 53, 30, 39, 48 FROM champions WHERE name = 'Nocturne';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 48, 43, 25, 8, 53, 40, 70, 20, 75, 86, 53, 88, 92, 98 FROM champions WHERE name = 'Nunu';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 90, 30, 20, 72, 77, 53, 26, 28, 33 FROM champions WHERE name = 'Olaf';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 40, 90, 0, 55, 68, 30, 34, 43, 53 FROM champions WHERE name = 'Orianna';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 90, 30, 0, 71, 94, 53, 44, 57, 67 FROM champions WHERE name = 'Pantheon';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 60, 50, 0, 61, 97, 30, 53, 61, 70 FROM champions WHERE name = 'Poppy';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 45, 35, 20, 48, 18, 90, 20, 0, 60, 83, 30, 23, 30, 38 FROM champions WHERE name = 'Quinn';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 40, 50, 0, 70, 96, 53, 21, 27, 33 FROM champions WHERE name = 'Rammus';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 80, 65, 25, 5, 15, 80, 20, 20, 73, 92, 53, 99, 95, 99 FROM champions WHERE name = 'Rek''Sai';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 80, 20, 0, 70, 90, 53, 45, 56, 70 FROM champions WHERE name = 'Renekton';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 70, 20, 0, 71, 85, 53, 22, 27, 34 FROM champions WHERE name = 'Rengar';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 80, 10, 0, 67, 79, 53, 67, 71, 80 FROM champions WHERE name = 'Riven';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 40, 55, 8, 28, 30, 80, 0, 65, 85, 53, 32, 39, 46 FROM champions WHERE name = 'Rumble';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 40, 55, 8, 28, 20, 100, 0, 62, 88, 30, 20, 24, 31 FROM champions WHERE name = 'Ryze';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 50, 60, 0, 73, 81, 53, 39, 47, 56 FROM champions WHERE name = 'Sejuani';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 35, 70, 75, 5, 10, 80, 60, 0, 67, 84, 53, 100, 100, 100 FROM champions WHERE name = 'Shaco';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 30, 30, 0, 63, 94, 30, 25, 36, 50 FROM champions WHERE name = 'Shen';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 80, 30, 0, 74, 85, 53, 100, 100, 100 FROM champions WHERE name = 'Shyvana';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 40, 70, 0, 59, 87, 30, 16, 20, 26 FROM champions WHERE name = 'Singed';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 50, 30, 0, 58, 74, 53, 76, 88, 95 FROM champions WHERE name = 'Sion';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 10, 5, 15, 90, 20, 90, 10, 0, 57, 77, 30, 100, 100, 100 FROM champions WHERE name = 'Sivir';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 70, 50, 0, 77, 94, 53, 29, 36, 45 FROM champions WHERE name = 'Skarner';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 50, 80, 0, 54, 77, 30, 20, 27, 34 FROM champions WHERE name = 'Sona';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 20, 70, 0, 57, 88, 30, 19, 29, 40 FROM champions WHERE name = 'Soraka';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 40, 55, 8, 28, 20, 90, 0, 57, 91, 30, 35, 42, 51 FROM champions WHERE name = 'Swain';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 20, 90, 0, 56, 83, 30, 33, 40, 49 FROM champions WHERE name = 'Syndra';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 90, 10, 0, 68, 86, 53, 27, 35, 44 FROM champions WHERE name = 'Talon';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 48, 43, 25, 8, 53, 40, 50, 0, 71, 80, 53, 35, 43, 50 FROM champions WHERE name = 'Taric';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 23, 38, 45, 48, 15, 50, 70, 0, 59, 88, 30, 28, 36, 44 FROM champions WHERE name = 'Teemo';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 48, 43, 25, 8, 53, 50, 60, 0, 51, 16, 30, 100, 100, 100 FROM champions WHERE name = 'Thresh';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 23, 38, 45, 48, 15, 90, 50, 0, 58, 75, 30, 44, 53, 64 FROM champions WHERE name = 'Tristana';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 70, 20, 0, 73, 73, 53, 100, 94, 89 FROM champions WHERE name = 'Trundle';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 100, 20, 0, 75, 77, 53, 16, 28, 42 FROM champions WHERE name = 'Tryndamere';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 60, 60, 0, 57, 74, 30, 30, 36, 46 FROM champions WHERE name = 'Twisted Fate';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 23, 38, 45, 48, 15, 90, 30, 20, 57, 74, 30, 11, 13, 18 FROM champions WHERE name = 'Twitch';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 80, 40, 0, 78, 93, 53, 24, 32, 43 FROM champions WHERE name = 'Udyr';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 45, 35, 20, 48, 18, 80, 30, 0, 63, 81, 30, 28, 34, 42 FROM champions WHERE name = 'Urgot';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 15, 10, 50, 50, 30, 70, 40, 0, 58, 81, 30, 39, 49, 61 FROM champions WHERE name = 'Varus';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 23, 38, 45, 48, 15, 100, 10, 20, 57, 77, 30, 57, 56, 62 FROM champions WHERE name = 'Vayne';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 20, 100, 0, 58, 86, 30, 39, 47, 56 FROM champions WHERE name = 'Veigar';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 20, 100, 20, 55, 81, 30, 58, 61, 64 FROM champions WHERE name = 'Vel''Koz';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 80, 30, 0, 68, 85, 53, 44, 54, 65 FROM champions WHERE name = 'Vi';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 20, 100, 0, 57, 91, 30, 28, 37, 45 FROM champions WHERE name = 'Viktor';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 53, 35, 48, 5, 43, 20, 80, 0, 60, 81, 30, 36, 42, 50 FROM champions WHERE name = 'Vladimir';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 70, 40, 0, 69, 86, 53, 29, 32, 38 FROM champions WHERE name = 'Volibear';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 70, 40, 0, 76, 85, 53, 24, 33, 42 FROM champions WHERE name = 'Warwick';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 80, 20, 0, 68, 84, 53, 36, 44, 54 FROM champions WHERE name = 'Wukong';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 28, 43, 80, 8, 25, 10, 100, 0, 57, 81, 30, 37, 41, 47 FROM champions WHERE name = 'Xerath';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 80, 30, 0, 69, 85, 53, 25, 36, 46 FROM champions WHERE name = 'Xin Zhao';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 80, 40, 0, 58, 83, 30, 31, 37, 44 FROM champions WHERE name = 'Yasuo';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 50, 40, 55, 8, 28, 60, 60, 0, 68, 86, 53, 67, 76, 85 FROM champions WHERE name = 'Yorick';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 83, 60, 18, 3, 30, 30, 70, 0, 74, 83, 53, 38, 42, 47 FROM champions WHERE name = 'Zac';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 58, 68, 50, 5, 13, 90, 10, 0, 65, 86, 53, 50, 64, 78 FROM champions WHERE name = 'Zed';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 20, 15, 85, 10, 40, 20, 90, 0, 57, 78, 30, 40, 46, 53 FROM champions WHERE name = 'Ziggs';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 20, 80, 0, 52, 82, 30, 14, 26, 39 FROM champions WHERE name = 'Zilean';
INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) SELECT 'b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0', id, 18, 18, 55, 10, 65, 40, 80, 20, 51, 71, 30, 29, 37, 45 FROM champions WHERE name = 'Zyra';

-- Opening roster is the squad already linked on player_teams, ordered by lane.
INSERT INTO roster_players (team_id, position, player_id)
SELECT team_id,
       ROW_NUMBER() OVER (
           PARTITION BY team_id
           ORDER BY CASE players.role
               WHEN 'top' THEN 0
               WHEN 'jungle' THEN 1
               WHEN 'mid' THEN 2
               WHEN 'adc' THEN 3
               WHEN 'support' THEN 4
               ELSE 5
           END,
           players.name
       ) - 1,
       players.id
FROM players
JOIN player_teams ON player_teams.player_id = players.id;

-- Sister teams of 2014 share one organisation.
-- Samsung Galaxy: https://lol.fandom.com/wiki/Samsung_Galaxy
-- SK Telecom T1: https://lol.fandom.com/wiki/SK_Telecom_T1
-- CJ Entus: https://lol.fandom.com/wiki/CJ_Entus
-- KT Rolster: https://lol.fandom.com/wiki/KT_Rolster
-- NaJin e-mFire: https://lol.fandom.com/wiki/NaJin_e-mFire
-- Incredible Miracle: https://lol.fandom.com/wiki/Incredible_Miracle
-- Jin Air Green Wings: https://lol.fandom.com/wiki/Jin_Air_Green_Wings
INSERT INTO organisations (
    id, name, region, history, staff_seats, scrim_room, gaming_house, chef, jersey_name,
    budget, wage_bill, fan_count, fan_mood, portrait
) VALUES
    ('f3c8a1d0-6b24-4e1a-9c77-2d5e8f01a4b6', 'Samsung Galaxy', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('c4d91e20-7a15-4b88-8e33-1f6a0c92d7e4', 'SK Telecom T1', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('b8e2c514-3f90-4d6a-a1c8-9e7b4d05f2a1', 'CJ Entus', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('d0a6f783-2c41-4e9b-b5d2-8a3c1e70f6b9', 'KT Rolster', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('e7b1d294-5a38-4c0f-9e66-3b8d2a41c5f0', 'NaJin e-mFire', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('9c4e7a12-8d60-4f3b-a2e5-6c1b0d93e8a7', 'Incredible Miracle', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('1f5a8c36-4b72-4d9e-8a01-7e2c6b4d5f83', 'Jin Air Green Wings', 'KR', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE teams SET organisation_id = 'f3c8a1d0-6b24-4e1a-9c77-2d5e8f01a4b6' WHERE name IN ('Samsung Blue', 'Samsung Ozone');
UPDATE teams SET organisation_id = 'c4d91e20-7a15-4b88-8e33-1f6a0c92d7e4' WHERE name IN ('SK Telecom T1 K', 'SK Telecom T1 S');
UPDATE teams SET organisation_id = 'b8e2c514-3f90-4d6a-a1c8-9e7b4d05f2a1' WHERE name IN ('CJ Entus Blaze', 'CJ Entus Frost');
UPDATE teams SET organisation_id = 'd0a6f783-2c41-4e9b-b5d2-8a3c1e70f6b9' WHERE name IN ('KT Rolster Bullets', 'KT Rolster Arrows');
UPDATE teams SET organisation_id = 'e7b1d294-5a38-4c0f-9e66-3b8d2a41c5f0' WHERE name IN ('NaJin White Shield', 'NaJin Black Sword');
UPDATE teams SET organisation_id = '9c4e7a12-8d60-4f3b-a2e5-6c1b0d93e8a7' WHERE name IN ('Incredible Miracle 1', 'Incredible Miracle 2');
UPDATE teams SET organisation_id = '1f5a8c36-4b72-4d9e-8a01-7e2c6b4d5f83' WHERE name IN ('Jin Air Falcons', 'Jin Air Stealths');

DELETE FROM organisation_teams WHERE team_id IN (
    SELECT id FROM teams WHERE organisation_id IN (
        'f3c8a1d0-6b24-4e1a-9c77-2d5e8f01a4b6',
        'c4d91e20-7a15-4b88-8e33-1f6a0c92d7e4',
        'b8e2c514-3f90-4d6a-a1c8-9e7b4d05f2a1',
        'd0a6f783-2c41-4e9b-b5d2-8a3c1e70f6b9',
        'e7b1d294-5a38-4c0f-9e66-3b8d2a41c5f0',
        '9c4e7a12-8d60-4f3b-a2e5-6c1b0d93e8a7',
        '1f5a8c36-4b72-4d9e-8a01-7e2c6b4d5f83'
    )
);
INSERT INTO organisation_teams (organisation_id, position, team_id)
SELECT organisation_id,
       ROW_NUMBER() OVER (PARTITION BY organisation_id ORDER BY name) - 1,
       id
FROM teams
WHERE organisation_id IN (
    'f3c8a1d0-6b24-4e1a-9c77-2d5e8f01a4b6',
    'c4d91e20-7a15-4b88-8e33-1f6a0c92d7e4',
    'b8e2c514-3f90-4d6a-a1c8-9e7b4d05f2a1',
    'd0a6f783-2c41-4e9b-b5d2-8a3c1e70f6b9',
    'e7b1d294-5a38-4c0f-9e66-3b8d2a41c5f0',
    '9c4e7a12-8d60-4f3b-a2e5-6c1b0d93e8a7',
    '1f5a8c36-4b72-4d9e-8a01-7e2c6b4d5f83'
);
DELETE FROM organisations WHERE name IN (
    'Samsung Blue', 'Samsung Ozone',
    'SK Telecom T1 K', 'SK Telecom T1 S',
    'CJ Entus Blaze', 'CJ Entus Frost',
    'KT Rolster Bullets', 'KT Rolster Arrows',
    'NaJin White Shield', 'NaJin Black Sword',
    'Incredible Miracle 1', 'Incredible Miracle 2',
    'Jin Air Falcons', 'Jin Air Stealths'
);

-- Formats written in issue 9. Champions stays without a series length: the issue does not give one for the whole tournament.
INSERT INTO split_formats (league_id, year, position, name, series) VALUES
    ('166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, 0, 'Spring', 'single_game'),
    ('166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, 1, 'Spring playoffs', 'first_to_three'),
    ('166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, 2, 'Summer', 'single_game'),
    ('166cd91e-7856-4cf3-abcc-64aee51f8623', 2014, 3, 'Summer playoffs', 'first_to_three'),
    ('9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, 0, 'Spring', 'single_game'),
    ('9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, 1, 'Spring playoffs', 'first_to_three'),
    ('9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, 2, 'Summer', 'single_game'),
    ('9c6da7b4-c421-47ba-8b2c-34910daecfb9', 2014, 3, 'Summer playoffs', 'first_to_three'),
    ('23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, 0, 'Spring', 'two_games'),
    ('23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, 1, 'Summer', 'two_games'),
    ('23c166ad-27a9-4513-9f8a-82372a0e5d8e', 2014, 2, 'Summer playoffs', 'first_to_three');

