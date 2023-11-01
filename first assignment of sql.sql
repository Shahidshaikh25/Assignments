
# First Query

use info;

CREATE TABLE technology (
    id INT,
    tech VARCHAR(50) NOT NULL
);

INSERT INTO technology VALUES
    (1, 'DS'),
    (1, 'POWERBI'),
    (1, 'PYTHON'),
    (1, 'SQL'),
    (2, 'POWERBI'),
    (2, 'PYTHON'),
    (2, 'SQL'),
    (3, 'POWERBI'),
    (3, 'PYTHON'),
    (3, 'SQL');

##Answer 1
SELECT id
FROM technology
WHERE tech = 'DS'
AND id IN (
    SELECT id
    FROM technology
    WHERE tech = 'SQL'
    AND id IN (
        SELECT id
        FROM technology
        WHERE tech = 'PYTHON'
    )
);



# Second Query
  CREATE TABLE product_info (
    product_id INT NOT NULL,
    product_name VARCHAR(50)
);
INSERT INTO product_info (product_id, product_name)
VALUES
    (1001, 'blog'),
    (1002, 'youtube'),
    (1003, 'education');

CREATE TABLE product_info_likes (
    user_id INT,
    product_id INT NOT NULL,
    like_dates DATE
);

INSERT INTO product_info_likes (user_id, product_id, like_dates)
VALUES
    (1, 1001, '2023-08-19'),
    (1, 1003, '2023-08-18');

##Answer 2
SELECT product_info.product_id
FROM product_info
LEFT JOIN product_info_likes ON product_info.product_id = product_info_likes.product_id
WHERE product_info_likes.product_id IS NULL;