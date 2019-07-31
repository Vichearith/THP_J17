-- Récupérer tous les albums
SELECT Title FROM albums;

-- Récupérer tous les albums dont le titre contient "Great" (indice)
SELECT Title FROM albums
WHERE Title LIKE '%Great%';

-- Donner le nombre total d'albums contenus dans la base (sans regarder les id bien sûr)
SELECT COUNT(*) FROM albums;

-- Supprimer tous les albums dont le nom contient "music"
DELETE FROM albums WHERE Title LIKE '%music%';

-- Récupérer tous les albums écrits par AC/DC
SELECT albums.Title FROM albums
JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.Name = 'AC/DC';

-- Récupérer tous les titres des albums de AC/DC
SELECT tracks.Name FROM tracks
JOIN albums ON tracks.AlbumId = albums.AlbumId
JOIN artists ON artists.ArtistId = albums.ArtistId
WHERE artists.Name = 'AC/DC';

-- Récupérer la liste des titres de l'album "Let There Be Rock"
SELECT tracks.Name FROM tracks
JOIN albums ON tracks.AlbumId = albums.AlbumId
WHERE albums.Title = 'Let There Be Rock';

-- Afficher le prix de cet album ainsi que sa durée totale
SELECT albums.Title, SUM(tracks.UnitPrice) AS Price, SUM(tracks.Milliseconds) AS Duration_in_ms
FROM albums
JOIN tracks ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId
HAVING albums.Title = 'Let There Be Rock';

-- Afficher le coût de l'intégralité de la discographie de "Deep Purple"
SELECT artists.Name, SUM(tracks.UnitPrice) AS Price
FROM tracks
JOIN albums ON tracks.AlbumId = albums.AlbumId
JOIN artists ON artists.ArtistId = albums.ArtistId
GROUP BY artists.ArtistId
HAVING artists.Name = 'Deep Purple';

-- Créer l'album de ton artiste favori en base, en renseignant correctement les trois tables albums, artists et tracks
INSERT INTO artists(Name) VALUES ('Bon Entendeur');
INSERT INTO albums(Title, ArtistId) VALUES ('Aller-Retour', (SELECT COUNT(*) FROM artists));
INSERT INTO tracks(Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES
('Coup de Tête', (SELECT COUNT(*) FROM albums), 1, (3*60+53)*1000, 0.99),
('Entrevue Optimisme (feat. PPDA)', (SELECT COUNT(*) FROM albums), 1, (3*60+43)*1000, 0.99),
('Vive Nous', (SELECT COUNT(*) FROM albums), 1, (3*60+21)*1000, 0.99),
('Le temps est bon', (SELECT COUNT(*) FROM albums), 1, (3*60+23)*1000, 0.99),
('La Rue Madureira', (SELECT COUNT(*) FROM albums), 1, (3*60+41)*1000, 0.99);
