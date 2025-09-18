-- Query per verificare la disponibilita dei posti su una corsa
SELECT C.id_corsa,
    T.citta_partenza,
    T.citta_arrivo,
    M.numero_posti - COUNT(B.id_biglietto) AS posti_disponibili
FROM Corsa C
JOIN Tratta T ON C.id_tratta = T.id_tratta
JOIN Mezzo M ON C.id_mezzo = M.id_mezzo
LEFT JOIN Biglietto B ON B.id_corsa = C.id_corsa
WHERE C.data_partenza = <?> AND T.id_tratta = <?>
GROUP BY C.id_corsa, T.citta_partenza, T.citta_arrivo, M.numero_posti;


-- Query per lo storico prenotazioni di un passeggero
SELECT B.id_biglietto,
    C.data_partenza,
    T.citta_partenza,
    T.citta_arrivo,
    B.stato
FROM Biglietto B
JOIN Corsa C ON B.id_corsa = C.id_corsa
JOIN Tratta T ON C.id_tratta = T.id_tratta
WHERE B.id_passeggero = <?>
ORDER BY C.data_partenza DESC;


-- Query per la validita di un biglietto
SELECT B.stato,
    C.data_partenza,
    CASE 
        WHEN B.stato = 'attivo' AND C.data_partenza >= CURRENT_DATE 
        THEN 'valido'
        ELSE 'non valido'
    END AS validita
FROM Biglietto B
JOIN Corsa C ON B.id_corsa = C.id
WHERE B.id = <?>;


-- Query per le entrate totali mensili
SELECT DATE_TRUNC('month', data_pagamento) AS mese,
    SUM(importo) AS totale
FROM Pagamento
GROUP BY mese
ORDER BY mese;


-- Query per il numero di corse per tratta
SELECT T.citta_partenza,
    T.citta_arrivo,
    COUNT(*) AS corse_totali
FROM Corsa C
JOIN Tratta T ON C.id_tratta = T.id
GROUP BY T.citta_partenza, T.citta_arrivo;