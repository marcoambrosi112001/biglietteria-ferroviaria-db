INSERT INTO Passeggero (nome, cognome, email)
VALUES ('Mario', 'Rossi', 'mario.rossi@email.it'),
    ('Lucia', 'Bianchi', 'lucia.bianchi@email.it');

INSERT INTO Biglietto (id_corsa, id_passeggero, stato)
VALUES (1, 1, 'Attivo'),
    (1, 2, 'Attivo'),
    (3, 1, 'Utilizzato');

INSERT INTO Pagamento (id_biglietto, data_pagamento, importo)
VALUES (1, '2026-07-01', 45.00),
    (2, '2026-07-01', 45.00),
    (3, '2026-05-20', 30.00);

INSERT INTO Corsa (id_tratta, id_mezzo, data_partenza)
VALUES (1, 1, '2026-07-25'),
    (1, 1, '2026-07-26'),
    (2, 2, '2026-06-10'),
    (3, 2, '2026-07-26');

INSERT INTO Mezzo (tipo, numero_posti)
VALUES ('Frecciarossa', 100),
    ('Intercity', 80);

INSERT INTO Tratta (citta_partenza, citta_arrivo)
VALUES ('Napoli', 'Roma'),
    ('Roma', 'Firenze'),
    ('Milano', 'Venezia');