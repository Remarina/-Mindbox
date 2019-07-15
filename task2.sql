CREATE TABLE products (
    product_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(20) NOT NULL UNIQUE);

CREATE TABLE categories (
    category_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(20) NOT NULL UNIQUE);

CREATE TABLE products_categories (
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    category_id INT FOREIGN KEY REFERENCES categories(category_id));

INSERT INTO products values('Banana'), ('Tomato'), ('Qiwi'),
                            ('Watermelon'), ('Feijoa'), ('Pepper'), ('Potato');

INSERT INTO categories values('Yellow'), ('Red'), ('Green');

INSERT INTO products_categories values (1,1), (2,2), (3,3), (4,3), (4,2), (6,1), (6,2), (6,3);

SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM products_categories;

SELECT products.product_name, categories.category_name FROM products
LEFT JOIN products_categories ON products.product_id = products_categories.product_id
LEFT JOIN categories ON categories.category_id = products_categories.category_id;