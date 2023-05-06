CREATE TABLE Clientes
(
	Codigo int Identity (1,1) NOT NULL,
	CPF CHAR(11) NOT NULL,
	Nome VARCHAR(40),
	Email VARCHAR(40),
	Telefone CHAR(11),
	Celular CHAR(11),
	CEP CHAR(8),
	Logadouro VARCHAR(40),
	Estado CHAR(2),
	Cidade VARCHAR(35),
	CONSTRAINT PK_CodigoClientes PRIMARY KEY (Codigo)
)

CREATE TABLE Fidelidade
(
	Codigo_Cliente int,
	Data_Adesao DATETIME NOT NULL,
	Pontos INT,
	CONSTRAINT PK_CodigoClienteFidelidade PRIMARY KEY (Codigo_Cliente),
	CONSTRAINT FK_CodigoClientes_Fidelidade FOREIGN KEY (Codigo_Cliente) REFERENCES Clientes(Codigo)
)

CREATE TABLE Forma_Pagamento
(
	Codigo INT IDENTITY (1,1) NOT NULL,
	Nome VARCHAR(25),
	Tipo VARCHAR(25),
	CONSTRAINT PK_CodigoPagamento PRIMARY KEY (Codigo)
)

CREATE TABLE Marcas
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(20),
	Descricao VARCHAR(50),
	CONSTRAINT PK_CodigoMarcas PRIMARY KEY (Codigo)
)

CREATE TABLE Produtos
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(30),
	Descricao VARCHAR(MAX),
	Codigo_Marcas INT NOT NULL,
	CONSTRAINT PK_CodigoProdutos PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoMarcas FOREIGN KEY (Codigo_Marcas) REFERENCES Marcas(codigo)
)

CREATE TABLE Pedido_Venda
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor DECIMAL(6,2),
	Valor_Imposto DECIMAL(6,2),
	Data DATETIME NOT NULL,
	Codigo_Forma_Pagamento INT NOT NULL,
	Codigo_Clientes INT NOT NULL,
	CONSTRAINT PK_CodigoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoFormaPagamento FOREIGN KEY (Codigo_Forma_Pagamento) REFERENCES Forma_Pagamento(Codigo),	
	CONSTRAINT FK_CodigoClientes FOREIGN KEY (Codigo_Clientes) REFERENCES Clientes(Codigo)
)

CREATE TABLE Item_Pedido_Venda
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor_Total DECIMAL(6,2),
	Valor_Imposto DECIMAL(6,2),
	Valor_Unitario DECIMAL(6,2),
	Quantidade int,
	Codigo_Produtos INT NOT NULL,
	Codigo_Pedido_Venda INT NOT NULL,
	CONSTRAINT PK_CodigoPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProdutosVenda FOREIGN KEY (Codigo_Produtos) REFERENCES Produtos(Codigo),
	CONSTRAINT FK_CodigoVenda FOREIGN KEY (Codigo_Pedido_Venda) REFERENCES Pedido_Venda(Codigo)
)

CREATE TABLE Distribuidor 
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	CNPJ VARCHAR(14) NOT NULL,
	Nome_Fantasia VARCHAR(40) NOT NULL,
	Razao_Social VARCHAR(40) NOT NULL,
	CEP NCHAR(8),
	Logadouro VARCHAR(40),
	Estado CHAR(2),
	Cidade VARCHAR(35),
	CONSTRAINT PK_CodigoDistribuidor PRIMARY KEY (Codigo)
)

CREATE TABLE Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Data DATETIME NOT NULL,
	Valor DECIMAL(6,2),
	Entregue BIT,
	Codigo_Distribuidor INT NOT NULL,
	CONSTRAINT PK_CodigoPedido_Venda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoDistribuidor FOREIGN KEY (Codigo_Distribuidor) REFERENCES Distribuidor(Codigo)
)

CREATE TABLE Item_Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	ValorTotal DECIMAL(6,2),
	ValorUnitario DECIMAL(6,2),
	Quantidade int,
	Codigo_Produtos INT NOT NULL,
	Codigo_Pedido_Compra INT NOT NULL,
	CONSTRAINT PK_CodigoItemPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProdutosCompra FOREIGN KEY (Codigo_Produtos) REFERENCES Produtos(Codigo),
	CONSTRAINT FK_CodigoitemPedidoCompra FOREIGN KEY (Codigo_Pedido_Compra) REFERENCES Pedido_Compra(Codigo),
)
