use serde::{Deserialize, Serialize};

// Represents an Ingredient record
#[derive(Debug, Serialize, Deserialize)]
pub struct Ingredient {
    pub id: Option<i32>, // Option to handle auto-incremented primary key
    pub dish_id: i32,    // Foreign key; assumed non-null
    pub name: String,
    pub quantity: Option<i32>, // Nullable in DB
    pub unit: Option<String>,  // Nullable in DB
}
