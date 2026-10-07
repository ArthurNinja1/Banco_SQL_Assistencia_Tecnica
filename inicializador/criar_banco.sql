PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Os_Peca;
DROP TABLE IF EXISTS Ordem_Servico;
DROP TABLE IF EXISTS Peca;
DROP TABLE IF EXISTS Tecnico;
DROP TABLE IF EXISTS Equipamento;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    id_cliente     INTEGER PRIMARY KEY AUTOINCREMENT,
    nome           TEXT NOT NULL,
    cpf            TEXT NOT NULL UNIQUE,
    telefone       TEXT NOT NULL,
    email          TEXT UNIQUE,
    endereco       TEXT,
    data_cadastro  TEXT NOT NULL DEFAULT (date('now'))
);

CREATE TABLE Equipamento (
    id_equipamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente     INTEGER NOT NULL,
    tipo           TEXT NOT NULL CHECK (tipo IN ('Computador','Notebook')),
    marca          TEXT NOT NULL,
    modelo         TEXT NOT NULL,
    numero_serie   TEXT NOT NULL UNIQUE,
    observacoes    TEXT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Tecnico (
    id_tecnico     INTEGER PRIMARY KEY AUTOINCREMENT,
    nome           TEXT NOT NULL,
    cpf            TEXT NOT NULL UNIQUE,
    telefone       TEXT NOT NULL,
    especialidade  TEXT NOT NULL,
    data_admissao  TEXT NOT NULL,
    ativo          INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0,1))
);

CREATE TABLE Peca (
    id_peca            INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao          TEXT NOT NULL,
    fabricante         TEXT,
    codigo_interno     TEXT NOT NULL UNIQUE,
    quantidade_estoque INTEGER NOT NULL DEFAULT 0 CHECK (quantidade_estoque >= 0),
    valor_unitario     REAL NOT NULL CHECK (valor_unitario >= 0)
);

CREATE TABLE Ordem_Servico (
    id_os             INTEGER PRIMARY KEY AUTOINCREMENT,
    id_equipamento    INTEGER NOT NULL,
    id_tecnico        INTEGER NOT NULL,
    data_entrada      TEXT NOT NULL DEFAULT (date('now')),
    problema_relatado TEXT NOT NULL,
    diagnostico       TEXT,                         
    situacao          TEXT NOT NULL DEFAULT 'Aberta'
                      CHECK (situacao IN ('Aberta','Em análise','Aguardando peça','Em reparo','Concluída','Cancelada')),
    valor_servico     REAL NOT NULL DEFAULT 0 CHECK (valor_servico >= 0),
    FOREIGN KEY (id_equipamento) REFERENCES Equipamento(id_equipamento)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_tecnico) REFERENCES Tecnico(id_tecnico)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Os_Peca (
    id_os                INTEGER NOT NULL,
    id_peca              INTEGER NOT NULL,
    quantidade_utilizada INTEGER NOT NULL CHECK (quantidade_utilizada > 0),
    valor_unitario_na_os REAL NOT NULL CHECK (valor_unitario_na_os >= 0),
    data_utilizacao      TEXT NOT NULL DEFAULT (date('now')),
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
        ON UPDATE CASCADE ON DELETE RESTRICT
);
