# 🛒 Banco de Dados - Gerenciamento de Loja e Pedidos (SQL)

Este repositório contém o script SQL (banco.sql) para criação, povoamento, consulta e manipulação de um banco de dados relacional voltado para o gerenciamento de clientes, produtos, pedidos e itens de pedidos.

# 📐 Modelagem do Banco de Dados

O banco de dados foi estruturado em 4 tabelas principais, garantindo a integridade referencial por meio de Chaves Primárias (PRIMARY KEY) e Chaves Estrangeiras (FOREIGN KEY):

       +-----------------+
       |     Cliente     |
       +-----------------+
       | PK: Codigo      |
       |     Nome        |
       |     Email       |
       |     Telefone    |
       +--------+--------+
                |
                | 1
                |
                | N
       +--------v--------+                 +-----------------+
       |     Pedido      |                 |     Produto     |
       +-----------------+                 +-----------------+
       | PK: Codigo      |                 | PK: Codigo      |
       |     Dt_entrada  |                 |     Nome        |
       |     ValorTotal  |                 |     UnidadeMed  |
       |     Dt_Embarque |                 |     Preco       |
       |     Desconto    |                 +--------+--------+
       |     Tipo        |                          |
       | FK: ID_Cliente  |                          | 1
       +--------+--------+                          |
                |                                   |
                | 1                                 | N
                |          +-----------------+      |
                +--------->| Itens_dos_pedidos|<-----+
                         N +-----------------+
                           | PK,FK: ID_pedido|
                           | PK,FK: ID_prod  |
                           | Quantidade      |
                           | SubTotal        |
                           +-----------------+


# 📋 Tabelas


*Cliente:* Armazena os dados cadastrais dos clientes (Codigo, Nome, Email, Telefone).

*Produto:* Registra os produtos comercializados (Codigo, Nome, UnidadeMedida, Preco).

*Pedido:* Registra os pedidos realizados (Codigo, Dt_entrada, ValorTotal, Dt_Embarque, Desconto, Tipo, ID_Clientefk).

*Itens_dos_pedidos:* Tabela associativa entre Pedido e Produto (relacionamento N:N), contendo a chave composta pelos dois IDs, Quantidade e SubTotal.


# 🛠️ Funções e Comandos SQL Utilizados
O script foi divido em etapas didáticas cobrindo os conceitos centrais do SQL:

1. DDL (Data Definition Language)
CREATE TABLE: Criação das tabelas e definição de tipos de dados (INT, VARCHAR, DATE, DECIMAL).

Restrições de Integridade: Definição de PRIMARY KEY, FOREIGN KEY e restrições NOT NULL.

2. DML (Data Manipulation Language)
INSERT INTO: Inserção de dados simulados (múltiplos clientes, produtos em unidades UN, KG, L, CX, pedidos e itens).

UPDATE: Atualização de registros (alteração de telefone, reajuste percentual de preço com Preco * 1.10, inclusão de datas de embarque e alteração de descontos).

DELETE: Exclusão controlada de registros sem violação de chave estrangeira.

3. DQL (Data Query Language) - Consultas e Filtros
Seleção e Projeção: SELECT, SELECT DISTINCT.

Filtros e Cláusulas:

WHERE com comparadores (>, <, =).

BETWEEN ... AND ...: Busca por faixa de preços e intervalos de datas.

IN (...): Filtragem por múltiplas opções categóricas.

LIKE: Busca por padrões em strings ('A%', '%Silva%').

Tratamento de Nulos: IS NULL e IS NOT NULL.

Ordenação: ORDER BY ... ASC / DESC.

Funções de Agregação:

COUNT(): Contagem total de clientes, produtos e pedidos pendentes.

SUM(): Soma total das vendas.

AVG(): Média de preços dos produtos.

MAX() / MIN(): Identificação dos preços mais alto e mais baixo.

# 💡 Sistemas que Podem ser Complementados por este Banco

Este modelo relacional serve como núcleo (core) de backend para diversos tipos de aplicações comerciais e industriais. Ele pode ser expandido para alimentar sistemas como:

E-commerce / Lojas Virtuais

Aprimoramentos: Adicionar tabela de carrinho de compras, integração com gateways de pagamento (Pix, Cartão), status detalhado do pedido (Aprovado, Em Separação, Enviado, Entregue) e controle de frete.

Sistema de Gestão de Vendas e PDV (Ponto de Venda / Balcão)

Aprimoramentos: Emissão de nota fiscal (NFC-e), abertura e fechamento de caixa, cadastro de vendedores/atendentes e formas de pagamento detalhadas.

ERP / Controle de Estoque e Suprimentos

Aprimoramentos: Adicionar tabela de Estoque (quantidade disponível, ponto de reposição), movimentação de entradas/saídas, cadastro de Fornecedores e relatórios de curva ABC de vendas.

Sistemas de CRM e Fidelização de Clientes

Aprimoramentos: Adicionar histórico de interações, categorização de clientes (VIP, Inativo), programa de pontos/milhas e gestão de campanhas de e-mail marketing com base nas compras.

Dashboards e BI (Business Intelligence)

Aprimoramentos: Criação de Views e Stored Procedures para alimentar ferramentas como Power BI, Metabase ou Grafana com relatórios de ticket médio, faturamento mensal, curva de vendas por região e produtos mais vendidos.

# 🚀 Como Executar o Script

Instale um SGBD compatível (MySQL, PostgreSQL, SQL Server ou SQLite com pequenas adaptações sintáticas se necessário).

Abra o seu cliente SQL preferido (DBeaver, MySQL Workbench, pgAdmin, VS Code SQL Tools).

Execute o arquivo banco_loja.sql.

# 📝 Licença
Este projeto é de uso livre para fins acadêmicos, de estudo e portfólio.


