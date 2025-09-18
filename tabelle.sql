-- Tabella Passeggero
CREATE TABLE Passeggero (
    id_passeggero SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    documento_identita VARCHAR(50)
);

-- Tabella Biglietto
CREATE TABLE Biglietto (
    id_biglietto SERIAL PRIMARY KEY,
    id_corsa INT NOT NULL,
    id_passeggero INT NOT NULL,
    stato VARCHAR(20) CHECK (stato IN ('attivo', 'annullato', 'utilizzato')),
    data_emissione DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_corsa) REFERENCES Corsa(id_corsa),
    FOREIGN KEY (id_passeggero) REFERENCES Passeggero(id_passeggero)
);

-- Tabella Pagamento
CREATE TABLE Pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_biglietto INT UNIQUE NOT NULL,
    importo DECIMAL(10,2) NOT NULL CHECK (importo > 0),
    metodo VARCHAR(20) CHECK (metodo IN ('carta', 'paypal', 'contanti')),
    data_pagamento DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_biglietto) REFERENCES Biglietto(id_biglietto)
);

-- Tabella Corsa
CREATE TABLE Corsa (
    id_corsa SERIAL PRIMARY KEY,
    data_partenza DATE NOT NULL,
    ora_partenza TIME NOT NULL,
    ora_arrivo_previsto TIME NOT NULL,
    id_tratta INT NOT NULL,
    id_mezzo INT NOT NULL,
    FOREIGN KEY (id_tratta) REFERENCES Tratta(id_tratta),
    FOREIGN KEY (id_mezzo) REFERENCES Mezzo(id_mezzo),
    CONSTRAINT chk_orari CHECK (ora_arrivo_previsto > ora_partenza)
);

-- Tabella Tratta
CREATE TABLE Tratta (
    id_tratta SERIAL PRIMARY KEY,
    citta_partenza VARCHAR(50) NOT NULL,
    citta_arrivo VARCHAR(50) NOT NULL,
    distanza_km INT CHECK (distanza_km > 0),
    CONSTRAINT chk_tratta CHECK (citta_partenza <> citta_arrivo)
);

-- Tabella Mezzo
CREATE TABLE Mezzo (
    id_mezzo SERIAL PRIMARY KEY,
    tipologia VARCHAR(50) NOT NULL,
    numero_posti INT NOT NULL CHECK (numero_posti > 0),
    codice_mezzo VARCHAR(20) UNIQUE NOT NULL
);