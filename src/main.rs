mod database;

use database::Dish;
use rusqlite::{params, Connection, Result};

fn main() -> Result<()> {
    // Open a connection to the database
    let conn = Connection::open("/db/database.db")?;

    // Query a dish by its ID
    let dish_id = 2; // Replace with the desired dish ID
    let dish = get_dish_by_id(&conn, dish_id)?;

    println!("Fetched Dish: {:?}", dish);

    Ok(())
}

fn get_dish_by_id(conn: &Connection, id: i32) -> Result<Dish> {
    // SQL query to fetch the dish by ID
    let mut stmt = conn.prepare(
        "SELECT id, name, description, instructions, prep_time, cook_time, notes 
         FROM Dish 
         WHERE id = ?1",
    )?;

    // Execute the query and map the result to a Dish struct
    let dish = stmt.query_row(params![id], |row| {
        Ok(Dish {
            id: row.get(0)?,               // ID column
            name: row.get(1)?,             // Name column
            description: row.get(2).ok(),  // Nullable
            instructions: row.get(3).ok(), // Nullable
            prep_time: row.get(4).ok(),    // Nullable
            cook_time: row.get(5).ok(),    // Nullable
            notes: row.get(6).ok(),        // Nullable
        })
    })?;

    Ok(dish)
}
