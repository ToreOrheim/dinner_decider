-- Create the Dish table
CREATE TABLE IF NOT EXISTS Dish (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Unique identifier for the dish
    name TEXT NOT NULL,                    -- Name of the dish
    description TEXT,                      -- Description or details of the dish
    instructions TEXT,                     -- Instructions on how to make the dish
    prep_time INTEGER,                     -- Preparation time in minutes
    cook_time INTEGER                      -- Cooking time in minutes
);

-- Create the Ingredients table
CREATE TABLE IF NOT EXISTS Ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Unique identifier for the ingredient
    dish_id INTEGER,                       -- Foreign key to the Dish table
    name TEXT NOT NULL,                     -- Name of the ingredient (e.g., "Sugar", "Salt")
    quantity TEXT,                          -- Quantity of the ingredient (e.g., "2 cups", "1 tbsp")
    unit TEXT,                              -- Unit of measurement (e.g., "grams", "cups")
    FOREIGN KEY (dish_id) REFERENCES Dish(id) ON DELETE CASCADE -- Foreign key constraint
);

