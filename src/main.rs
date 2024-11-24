use rusqlite::{params, Connection, Result};

fn main() -> Result<()> {
    // Open a connection to the database
    let conn = Connection::open("/db/database.db")?;

    // Retrieve and print all dishes
    let mut stmt = conn.prepare("SELECT id, name, description FROM Dish")?;
    let dishes = stmt.query_map([], |row| {
        Ok((
            row.get::<_, i32>(0)?, // id
            row.get::<_, String>(1)?, // name
            row.get::<_, String>(2)?, // description
        ))
    })?;

    println!("Dishes in the database:");
    for dish in dishes {
        let (id, name, description) = dish?;
        println!("ID: {}, Name: {}, Description: {}", id, name, description);
    }

    Ok(())
}

