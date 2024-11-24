-- Create the Dish table
CREATE TABLE IF NOT EXISTS Dish (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Unique identifier for the dish
    name TEXT NOT NULL,                    -- Name of the dish
    description TEXT,                      -- Description or details of the dish
    instructions TEXT,                     -- Instructions on how to make the dish
    prep_time INTEGER,                     -- Preparation time in minutes
    cook_time INTEGER,                     -- Cooking time in minutes
    notes TEXT
);

-- Create the Ingredients table
CREATE TABLE IF NOT EXISTS Ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Unique identifier for the ingredient
    dish_id INTEGER,                       -- Foreign key to the Dish table
    name TEXT NOT NULL,                     -- Name of the ingredient (e.g., "Sugar", "Salt")
    quantity INTEGER,                          -- Quantity of the ingredient (e.g., "2 cups", "1 tbsp")
    unit TEXT,                              -- Unit of measurement (e.g., "grams", "cups")
    FOREIGN KEY (dish_id) REFERENCES Dish(id) ON DELETE CASCADE -- Foreign key constraint
);

-- Insert into Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES (
    'Beef Ragu',
    'A hearty and flavorful beef ragu dish, perfect with pasta.',
    '1. Season the beef with salt and pepper. '
    || '2. Brown the beef in batches until nicely brown. '
    || '3. Add onion with salt and pepper and sweat for 4-5 minutes. '
    || '4. Add the garlic and chili flakes and cook for 1 minute. '
    || '5. Add the tomato paste, cook for 2 minutes. '
    || '6. Add the boullion cube and wine and boil. '
    || '7. Add the tomato, beef stock, herbs, bay leaves, Worcestershire sauce, beef and its juices and mix well. '
    || '8. Check for seasoning and adjust to taste. '
    || '9. Bring to a boil, then reduce heat to low and cook for 2 - 2.5 hours or until beef is tender. '
    || '10. Shred the beef and serve with pasta.',
    15, -- Prep time in minutes
    150 -- Cook time in minutes (2.5 hours)
);

-- Retrieve the ID of the inserted dish
SELECT last_insert_rowid();

-- Insert into Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES 
    (1, 'Beef, diced into bigger chunks', 0.5, 'kg'),
    (1, 'Yellow onion, diced', 1, 'pcs'),
    (1, 'Garlic cloves, chopped', 6, 'pcs'),
    (1, 'Chilli flakes (gochugaru)', NULL, 'pinch'),
    (1, 'Tomato paste', 90, 'g'),
    (1, 'Pinot Noir red wine', 125, 'ml'),
    (1, 'Bouillon cube', 1, 'pcs'),
    (1, 'Crushed tomatoes', 800, 'g'),
    (1, 'Beef stock', 125, 'ml'),
    (1, 'Bay leaves', 3, 'pcs'),
    (1, 'Worcestershire Sauce', NULL, 'splash'),
    (1, 'Fresh thyme sprigs', 6, 'pcs'),
    (1, 'Basil stems', 5.5, 'pcs');

-- Insert the dish into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES 
    ('Pancakes', 
     'A classic breakfast dish made with flour, milk, sugar, and other ingredients.', 
     '1. Mix all dry and all wet separate. 2. Put wet into dry. 3. Mix until smooth, don''t overmix. 4. Let rest for 10-15min before cooking.', 
     10, 15);

-- Insert the ingredients for the Pancakes into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (2, 'Flour', 150, 'g'),
    (2, 'Milk', 188, 'ml'),
    (2, 'Sugar', 30, 'g'),
    (2, 'Salt', 1, 'pinch'),
    (2, 'Egg', 1, 'unit'),
    (2, 'Melted Butter', 50, 'g'),
    (2, 'Vanilla Extract', 1, 'tsp'),
    (2, 'Baking Powder', 6, 'g');

-- Insert the Gochujang Chicken Burgers into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES 
    ('Gochujang Chicken Burgers', 
     'A flavorful burger made with ground chicken, gochujang, and topped with kimchi bacon jam and fresh toppings.',
     'Kimchi Bacon Jam: Fry the bacon until crispy. Add the kimchi and brown sugar. Saute for 3-5 minutes, until caramelized.\nChicken Burgers: Mix the ingredients. Form into 4 balls. Smash into a pan and flip often to not burn.\nPro tip: Build the burger: patty, cheese, bacon jam, patty, cheese, toppings.',
     15, 20);

-- Insert the ingredients for the Gochujang Chicken Burgers into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (3, 'Ground Chicken', 200, 'g'),
    (3, 'Panko Breadcrumbs', 45, 'g'),
    (3, 'Gochujang', 1, 'tbsp'),
    (3, 'Garlic Powder', 1, 'tsp'),
    (3, 'Salt', 1, 'tsp'),
    (3, 'Bacon', 3, 'slices'),
    (3, 'Kimchi', 2, 'tbsp'),
    (3, 'Brown Sugar', 1, 'tbsp'),
    (3, 'Cheese', NULL, 'as needed'),
    (3, 'Salad', NULL, 'as needed'),
    (3, 'Mayo', NULL, 'as needed'),
    (3, 'Cucumber', NULL, 'as needed');

-- Insert the Gochujang Spaghetti into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time, notes)
VALUES 
    ('Gochujang Spaghetti', 
     'A flavorful pasta dish with a spicy and sweet sauce made from gochujang, honey, and rice wine vinegar, finished with butter.',
     'Melt 4 tbsp butter in a pan. Add gochujang, honey, and vinegar. Simmer for 5 minutes until the sauce thickens (make a line in the pan, it should stay bare for 3 seconds).\nAdd cooked spaghetti to the pan with the sauce, add the remaining 2 tbsp butter, mix and enjoy.',
     5, 10,
    'Sergeja didnt like?');

-- Insert the ingredients for the Gochujang Spaghetti into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (4, 'Butter', 6, 'tbsp'),
    (4, 'Gochujang', 0.6, 'dl'),
    (4, 'Rice Wine Vinegar', 0.6, 'dl'),
    (4, 'Honey', 0.6, 'dl');

-- Insert the Korean Stew into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES 
    ('Korean Stew', 
     'A hearty and flavorful stew with pork, potatoes, onions, and a spicy, savory sauce made from gochujang and gochugaru.',
     '1. Cut up the meat and veggies into chunks, keeping each separate.\n2. Brown the meat in a mix of normal/olive oil and sesame oil.\n3. Add the onion and cook until translucent. Then add the garlic and cook until fragrant.\n4. Add the potatoes, gochujang, soy sauce, mix well, then add water until everything is covered.\n5. Bring to a boil, then add gochugaru.\n6. Let cook with the lid on until the potatoes are cooked through. Then cook with the lid off until desired thickness.\n7. Serve with rice and green onions.',
     15, 45);

-- Insert the ingredients for the Korean Stew into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (5, 'Pork', 400, 'g'),
    (5, 'Potatoes', 4, 'units'),
    (5, 'Onions', 4, 'units'),
    (5, 'Garlic', 2, 'cloves'),
    (5, 'Gochujang', 1.5, 'tbsp'),
    (5, 'Sesame Oil', 2, 'tbsp'),
    (5, 'Gochugaru', 1.5, 'tbsp'),
    (5, 'Soy Sauce', 2, 'tbsp');

-- Insert the Pickled Red Onions into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES 
    ('Pickled Red Onions', 
     'A tangy and spicy pickled red onion recipe with garlic and dried chilis for extra flavor.',
     'Combine vinegar and water in a pot. Add red onions, garlic, and dried chilis. Bring to a boil and simmer for 5-10 minutes. Let cool and refrigerate until ready to use.',
     10, 5);

-- Insert the ingredients for the Pickled Red Onions into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (6, 'Vinegar', 1, 'part'),
    (6, 'Water', 1, 'part'),
    (6, 'Red Onions', 1.5, 'units'),
    (6, 'Garlic', 2, 'cloves'),
    (6, 'Dried Chilis', 2, 'units');

-- Insert the Pizza Dough into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES 
    ('Pizza Dough', 
     'A simple and versatile pizza dough recipe that can be used to make a variety of pizzas. The dough can be stored for several days for better flavor.',
     '1. Combine water, sugar, and yeast in a large bowl and let sit for 5 minutes.\n2. Add olive oil, salt, and 300g of flour. Mix until just combined, then start kneading.\n3. Add just enough additional flour to keep dough workable (not too sticky) and knead until you can stretch the dough into a thin sheet without it tearing.\n4. Divide the dough into two balls and put them in containers. Lightly coat the balls and the interior of the container with olive oil.\n5. Cover and let rise at room temperature for two hours, or in the refrigerator for 1-7 days.',
     10, 120);

-- Insert the ingredients for the Pizza Dough into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (7, 'Warm Water', 265, 'ml'),
    (7, 'Sugar', 6, 'g'),
    (7, 'Dry Yeast', 4.5, 'g'),
    (7, 'Olive Oil', 1, 'tbsp'),
    (7, 'Salt', 0.5, 'tbsp'),
    (7, 'Bread Flour', 300, 'g'),
    (7, 'Additional Flour for Working', NULL, 'as needed'),
    (7, 'Oil for Greasing Dough', NULL, 'as needed'),
    (7, 'Cornmeal/Semolina/Coarse-ground Whole Wheat', NULL, 'for dusting');

-- Insert the ingredients for the Pizza Sauce into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (7, 'Canned Tomatoes', 414, 'ml'),
    (7, 'Olive Oil', 1, 'tbsp'),
    (7, 'Dried Oregano', 1, 'tsp');

-- Insert the Ricepaper Rolls into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES 
    ('Ricepaper Rolls', 
     'A delicious and fresh dish made with rice paper rolls filled with chicken, vegetables, and a savory dipping sauce.',
     '1. Mix all the filling ingredients in a bowl. Sauté in a pan until all the liquid is cooked off. Let the mixture cool a little.\n2. Roll the desired amount in rice paper, double wrap if needed.\n3. Sear the rolls in a pan until they are nicely golden.\nFor the dip: Mix the ingredients together and adjust the ratio to taste. Serve the rolls with the dip.',
     10, 15);

INSERT INTO Ingredients (dish_id, name, quantity, unit)
    VALUES
    (8, 'Rice Paper', NULL, 'as needed');

-- Insert the ingredients for the Ricepaper Rolls into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (8, 'Chicken Mince', NULL, 'as needed'),
    (8, 'Carrots', NULL, 'as needed'),
    (8, 'Salad', NULL, 'as needed'),
    (8, 'Gochujang', NULL, 'to taste'),
    (8, 'Sesame Oil', NULL, 'to taste'),
    (8, 'Soy Sauce', NULL, 'to taste');

-- Insert the ingredients for the Dip into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (8, 'Rice Vinegar', NULL, 'to taste'),
    (8, 'Soy Sauce', NULL, 'to taste'),
    (8, 'Green Onions', NULL, 'to taste'),
    (8, 'Sambal Oelek', NULL, 'to taste');

-- Insert the Salmon Cube Pasta into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES 
    ('Salmon Cube Pasta', 
     'A creamy pasta dish with salmon cubes, a rich tomato cream sauce, and a flavorful seasoning blend.',
     '1. Cut the salmon into cubes and season with the seasoning blend and some oil.\n2. Sear the salmon and remove once nicely browned.\n3. Add the minced garlic, sear until fragrant, then add the tomato paste.\n4. Add the cream and the seasoning blend (without the lemon pepper). After the sauce thickens, add the parmesan.\n5. Add back the salmon and mix in the pasta.\n6. Serve with extra parmesan.',
     10, 20);

-- Insert the ingredients for the Salmon Cube Pasta into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (9, 'Salmon', NULL, 'as needed'),
    (9, 'Tomato Paste', NULL, 'to taste'),
    (9, 'Cream', NULL, 'to taste'),
    (9, 'Garlic', NULL, 'to taste'),
    (9, 'Parmesan', NULL, 'to taste');

-- Insert the ingredients for the Seasoning Blend into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (9, 'Garlic Powder', NULL, 'to taste'),
    (9, 'Onion Powder', NULL, 'to taste'),
    (9, 'Lemon Pepper', NULL, 'to taste'),
    (9, 'Cayenne', NULL, 'to taste'),
    (9, 'Paprika', NULL, 'to taste'),
    (9, 'Oregano', NULL, 'to taste');

-- Insert the Svele into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES 
    ('Svele', 
     'A traditional Scandinavian pancake-like dish made with kefir, eggs, and a light, fluffy batter.',
     '1. Mix sodium bicarbonate into a cup with a little bit of kefir (it will double in size), then set aside.\n2. Mix eggs and sugar until fluffy.\n3. Alternate between mixing in flour and kefir with the egg and sugar batter.\n4. At the end, add vanilla sugar and carefully mix in the cup with sodium bicarbonate. Do not agitate too much.\n5. Cook in a pan on one side until holes appear on the top, then flip and cook until done.',
     10, 20);

-- Insert the ingredients for the Svele into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (10, 'Eggs', 3, 'units'),
    (10, 'Sugar', 2, 'dl'),
    (10, 'Flour', 4.5, 'cups'),
    (10, 'Sodium Bicarbonate', 3.5, 'tsp'),
    (10, 'Vanilla Sugar', 1, 'tsp'),
    (10, 'Kefir', 1, 'l');

-- Insert the Yaki Udon into the Dish table
INSERT INTO Dish (name, description, instructions, prep_time, cook_time)
VALUES 
    ('Yaki Udon', 
     'A delicious stir-fried udon noodle dish with a savory sauce, vegetables, and optional protein.',
     '1. Combine sauce ingredients (dark soy sauce, oyster sauce, mirin, brown sugar, gochujang, rice wine vinegar).\n2. Cook udon noodles, wash with cold water, and set aside.\n3. Heat oil and cook protein if used, remove and set aside.\n4. Add oil, then sauté onion and garlic until aromatic. Add cabbage, carrot, and mushrooms, and continue to cook for 2-3 minutes.\n5. Add protein, udon noodles, and sauce, tossing together until noodles are evenly coated. Add green onions and mix. Garnish and enjoy.',
     15, 15);

-- Insert the ingredients for the Yaki Udon into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (11, 'Udon Noodles', NULL, 'as needed'),
    (11, 'Onion', 0.5, 'units'),
    (11, 'Garlic', 2, 'cloves'),
    (11, 'Carrot', NULL, 'as needed'),
    (11, 'Mushrooms', NULL, 'as needed'),
    (11, 'Green Onions', NULL, 'as needed');

-- Insert the ingredients for the Sauce into the Ingredients table
INSERT INTO Ingredients (dish_id, name, quantity, unit)
VALUES
    (11, 'Dark Soy Sauce', 1.5, 'tbsp'),
    (11, 'Oyster Sauce', 2, 'tbsp'),
    (11, 'Mirin', 1, 'tbsp'),
    (11, 'Brown Sugar', 1, 'tbsp'),
    (11, 'Gochujang', 0.5, 'tsp'),
    (11, 'Rice Wine Vinegar', 0.5, 'tsp');

