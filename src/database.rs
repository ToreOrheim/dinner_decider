use serde::{Deserialize, Serialize};

// Represents a Dish record
#[derive(Debug, Serialize, Deserialize)]
pub struct Dish {
    pub id: Option<i32>, // Option to handle auto-incremented primary key
    pub name: String,
    pub description: Option<String>,
    pub instructions: Option<String>,
    pub prep_time: Option<i32>, // Nullable in DB
    pub cook_time: Option<i32>, // Nullable in DB
    pub notes: Option<String>,
}

// Represents an Ingredient record
#[derive(Debug, Serialize, Deserialize)]
pub struct Ingredient {
    pub id: Option<i32>, // Option to handle auto-incremented primary key
    pub dish_id: i32,    // Foreign key; assumed non-null
    pub name: String,
    pub quantity: Option<i32>, // Nullable in DB
    pub unit: Option<String>,  // Nullable in DB
}
