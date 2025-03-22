SET search_path TO ezecream_05;

INSERT INTO ezecream_05.customer(first_name, last_name, email, address)
VALUES
(
        'Ragnar',
        'Lothbrok',
        'ragnar@kattegat.com',
        '1 Valhalla Way'
    ),
    (
        'Lagertha',
        'Lothbrok',
        'lagertha@kattegat.com',
        '2 Shieldmaiden Road'
    ),
    (
        'Bjorn',
        'Ironside',
        'bjorn@kattegat.com',
        '3 Viking Bay'
    ),
    (
        'Ivar',
        'the Boneless',
        'ivar@danes.com',
        '4 The Great Heathen Army Camp'
    );

    INSERT INTO ezecream_05.customer(customer_id, first_name, last_name, email, address)
VALUES
(
        '50',
        'Ubbe',
        'Lothbrok',
        'ragnar@kattegat.com',
        '1 Valhalla Way'
    );  
    DELETE FROM ezecream_05.customer WHERE customer_id = 50;
--ERROR: update or delete on table "customer" violates foreign key constraint "orders_customer_id_fkey" on table "orders"

-- TO do: how to delete row with customer _ID 50?
    SELECT * FROM ezecream_05.customer;