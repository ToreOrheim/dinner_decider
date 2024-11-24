use serde::{Deserialize, Serialize};

// Represents a Dish record
#[derive(Debug, Serialize, Deserialize)]
pub struct Dish {
    pub id: Option<i32>, // Option to handle auto-incremented primary key
    pub name: String,
    pub description: Option<String>,
    pub dish_id: Option<i32>,
}
