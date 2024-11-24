use crate::Dish;

pub fn map_row_to_dish(row: &rusqlite::Row) -> rusqlite::Result<Dish> {
    Ok(Dish {
        id: row.get(0)?,               // ID column
        name: row.get(1)?,             // Name column
        description: row.get(2).ok(),  // Nullable
        instructions: row.get(3).ok(), // Nullable
        prep_time: row.get(4).ok(),    // Nullable
        cook_time: row.get(5).ok(),    // Nullable
        notes: row.get(6).ok(),        // Nullable
    })
}
