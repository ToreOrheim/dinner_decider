use crate::models::mapper_for_dish;

use crate::Dish;
use mapper_for_dish::map_row_to_dish;
use rusqlite::{params, Connection, Result};

pub fn get_dish_by_id(conn: &Connection, id: i32) -> Result<Dish> {
    // SQL query to fetch the dish by ID
    let mut stmt = conn.prepare(
        "SELECT d.id, d.name, d.description, d.instructions, d.prep_time, d.cook_time, d.notes 
         FROM Dish as d
         INNER JOIN Tags AS t ON d.id = t.dish_id
         WHERE d.id = ?1 AND t.name = 'DINNER'",
    )?;

    // Execute the query and map the result to a Dish struct
    let dish = stmt.query_row(params![id], map_row_to_dish)?;

    Ok(dish)
}

pub fn get_all_dish_ids(conn: &Connection) -> Result<Vec<i32>> {
    // SQL query to fetch all dish IDs
    let mut stmt = conn.prepare("SELECT id FROM Dish")?;

    // Execute the query and map the results to a vector of dish IDs
    let dish_ids = stmt
        .query_map([], |row| row.get(0))?
        .collect::<Result<Vec<i32>, _>>()?;

    Ok(dish_ids)
}
