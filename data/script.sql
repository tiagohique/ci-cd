CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    preco NUMERIC(10, 2) NOT NULL,
    data_validade DATE,
    codigo_barras VARCHAR(50) UNIQUE
);


INSERT INTO produtos (nome, preco, data_validade, codigo_barras) VALUES
('Arroz Tipo 1', 23.90, '2025-12-31', '7891234560001'),
('Feijão Carioca', 8.75, '2025-11-15', '7891234560002'),
('Macarrão Espaguete', 4.50, '2026-01-10', '7891234560003'),
('Óleo de Soja', 7.80, '2025-09-20', '7891234560004'),
('Açúcar Refinado', 5.25, '2026-02-28', '7891234560005'),
('Café Tradicional', 16.90, '2025-10-05', '7891234560006'),
('Leite Integral 1L', 4.99, '2025-08-15', '7891234560007'),
('Margarina 500g', 6.40, '2025-07-30', '7891234560008'),
('Pão de Forma', 7.10, '2025-06-12', '7891234560009'),
('Presunto Fatiado', 10.90, '2025-04-30', '7891234560010'),
('Queijo Mussarela', 19.75, '2025-05-05', '7891234560011'),
('Refrigerante Cola 2L', 8.50, '2026-03-01', '7891234560012'),
('Suco de Laranja 1L', 6.80, '2025-12-01', '7891234560013'),
('Biscoito Recheado', 3.99, '2026-01-15', '7891234560014'),
('Bolacha Água e Sal', 4.30, '2025-11-22', '7891234560015'),
('Farinha de Trigo', 5.60, '2025-09-09', '7891234560016'),
('Fermento Químico', 2.99, '2026-04-20', '7891234560017'),
('Molho de Tomate', 3.45, '2025-10-18', '7891234560018'),
('Ketchup Tradicional', 7.25, '2026-02-10', '7891234560019'),
('Maionese 500g', 6.90, '2025-08-08', '7891234560020'),
('Sabão em Pó 1kg', 9.90, '2027-01-01', '7891234560021'),
('Detergente Líquido', 2.30, '2026-06-30', '7891234560022'),
('Esponja Multiuso', 1.99, '2029-12-31', '7891234560023'),
('Shampoo 350ml', 14.90, '2026-08-15', '7891234560024'),
('Condicionador 350ml', 15.90, '2026-08-15', '7891234560025'),
('Papel Higiênico 4un', 12.50, '2029-01-01', '7891234560026'),
('Escova de Dentes', 3.25, '2028-05-20', '7891234560027'),
('Creme Dental 90g', 4.40, '2027-07-07', '7891234560028'),
('Sabonete 90g', 2.10, '2027-10-12', '7891234560029'),
('Desodorante Spray', 9.70, '2026-12-25', '7891234560030'),
('Água Mineral 500ml', 2.50, '2026-06-01', '7891234560031'),
('Chocolate ao Leite', 6.80, '2026-01-30', '7891234560032'),
('Chocolate Meio Amargo', 7.20, '2026-02-10', '7891234560033'),
('Cereal Matinal', 13.50, '2026-03-15', '7891234560034'),
('Granola 500g', 14.90, '2026-05-20', '7891234560035'),
('Iogurte Natural 170g', 2.80, '2025-05-01', '7891234560036'),
('Iogurte de Morango 170g', 3.00, '2025-05-01', '7891234560037'),
('Bebida de Soja 1L', 5.99, '2025-09-01', '7891234560038'),
('Achocolatado em Pó 400g', 7.50, '2026-03-05', '7891234560039'),
('Salgadinho de Milho', 4.20, '2025-10-12', '7891234560040'),
('Batata Chips', 5.90, '2025-10-12', '7891234560041'),
('Amendoim Torrado', 6.30, '2026-01-18', '7891234560042'),
('Castanha de Caju', 19.99, '2026-05-01', '7891234560043'),
('Azeitona Verde 200g', 8.99, '2026-07-20', '7891234560044'),
('Picles de Pepino', 7.45, '2026-04-10', '7891234560045'),
('Sardinha em Óleo', 5.60, '2027-02-25', '7891234560046'),
('Atum em Conserva', 8.20, '2027-03-10', '7891234560047'),
('Ervilha em Conserva', 3.40, '2026-10-15', '7891234560048'),
('Milho Verde em Conserva', 3.60, '2026-11-10', '7891234560049'),
('Leite Condensado', 7.99, '2026-12-20', '7891234560050'),
('Creme de Leite', 4.90, '2026-12-20', '7891234560051'),
('Gelatina de Morango', 2.00, '2026-09-30', '7891234560052'),
('Gelatina de Uva', 2.00, '2026-09-30', '7891234560053'),
('Pão Francês (kg)', 14.00, '2025-04-27', '7891234560054'),
('Croissant', 5.50, '2025-04-28', '7891234560055'),
('Torta de Frango', 25.00, '2025-04-30', '7891234560056'),
('Empada de Palmito', 6.90, '2025-05-01', '7891234560057'),
('Pizza Congelada', 19.90, '2026-07-01', '7891234560058'),
('Lasanha Congelada', 21.90, '2026-08-01', '7891234560059'),
('Hambúrguer Congelado', 16.50, '2026-06-01', '7891234560060'),
('Salsicha 1kg', 12.80, '2025-06-30', '7891234560061'),
('Frango Inteiro Congelado', 18.00, '2026-01-20', '7891234560062'),
('Peito de Frango 1kg', 22.00, '2025-11-01', '7891234560063'),
('Costela Bovina 1kg', 38.90, '2025-10-15', '7891234560064'),
('Picanha 1kg', 95.00, '2025-10-20', '7891234560065'),
('Linguiça Toscana 1kg', 24.50, '2025-09-10', '7891234560066'),
('Tilápia Congelada 1kg', 32.90, '2026-03-20', '7891234560067'),
('Camarão 500g', 49.90, '2026-04-30', '7891234560068'),
('Salame Italiano', 29.90, '2026-01-01', '7891234560069'),
('Mortadela Defumada', 14.99, '2025-12-15', '7891234560070'),
('Queijo Prato 500g', 27.80, '2025-11-10', '7891234560071'),
('Queijo Minas Padrão', 33.50, '2025-09-05', '7891234560072'),
('Ricota Fresca', 15.40, '2025-07-20', '7891234560073'),
('Iogurte Grego', 4.50, '2025-06-10', '7891234560074'),
('Bebida Energética', 9.90, '2026-10-01', '7891234560075'),
('Chá Verde 1L', 6.00, '2026-09-01', '7891234560076'),
('Chá de Camomila', 4.00, '2027-02-01', '7891234560077'),
('Água de Coco 1L', 7.50, '2026-11-10', '7891234560078'),
('Vinho Tinto Seco', 39.90, '2028-12-01', '7891234560079'),
('Vinho Branco Suave', 34.90, '2028-12-01', '7891234560080'),
('Cerveja Pilsen 350ml', 3.50, '2025-12-31', '7891234560081'),
('Cerveja IPA 500ml', 7.90, '2025-12-31', '7891234560082'),
('Whisky Escocês 1L', 129.90, '2030-01-01', '7891234560083'),
('Vodka Premium 1L', 89.90, '2030-01-01', '7891234560084'),
('Amaciante 2L', 12.99, '2027-04-01', '7891234560085'),
('Desinfetante 1L', 5.99, '2027-03-01', '7891234560086'),
('Sabão Líquido 3L', 27.50, '2027-06-01', '7891234560087'),
('Alvejante 1L', 4.99, '2027-05-01', '7891234560088'),
('Álcool em Gel 500ml', 6.90, '2027-09-01', '7891234560089'),
('Inseticida Spray', 15.90, '2028-01-01', '7891234560090'),
('Repelente 200ml', 18.90, '2028-02-01', '7891234560091'),
('Sabonete Líquido 250ml', 7.50, '2027-11-01', '7891234560092'),
('Pano de Limpeza', 3.50, '2030-01-01', '7891234560093'),
('Rodo de Plástico', 12.00, '2030-01-01', '7891234560094'),
('Vassoura', 15.00, '2030-01-01', '7891234560095'),
('Pá de Lixo', 8.00, '2030-01-01', '7891234560096'),
('Detergente em Pó 1kg', 9.20, '2027-03-30', '7891234560097'),
('Limpador Perfumado', 11.90, '2027-02-20', '7891234560098'),
('Desengordurante 500ml', 8.30, '2027-02-10', '7891234560099'),
('Desentupidor de Pia', 6.00, '2030-01-01', '7891234560100'),
('Desinfetante Floral 500ml', 5.20, '2027-04-05', '7891234560101'),
('Papel Toalha 2un', 9.50, '2029-09-09', '7891234560102'),
('Filtro de Café 100un', 5.80, '2029-12-12', '7891234560103'),
('Guardanapo 50un', 4.00, '2029-10-10', '7891234560104'),
('Isqueiro', 3.90, '2030-01-01', '7891234560105'),
('Velas de Emergência', 7.00, '2030-01-01', '7891234560106'),
('Pilhas AA 4un', 12.00, '2030-01-01', '7891234560107'),
('Extensão Elétrica 5m', 29.90, '2030-01-01', '7891234560108'),
('Carregador de Celular', 45.00, '2030-01-01', '7891234560109'),
('Cabo USB 1m', 15.00, '2030-01-01', '7891234560110'),
('Mouse Sem Fio', 59.90, '2030-01-01', '7891234560111'),
('Teclado USB', 79.90, '2030-01-01', '7891234560112'),
('Fone de Ouvido', 49.90, '2030-01-01', '7891234560113'),
('Luminária de Mesa', 89.00, '2030-01-01', '7891234560114'),
('Relógio de Parede', 45.00, '2030-01-01', '7891234560115'),
('Quadro Decorativo', 120.00, '2030-01-01', '7891234560116'),
('Tapete de Sala', 250.00, '2030-01-01', '7891234560117'),
('Cortina de Janela', 180.00, '2030-01-01', '7891234560118'),
('Almofada Decorativa', 70.00, '2030-01-01', '7891234560119'),
('Cobertor Casal', 199.90, '2030-01-01', '7891234560120');