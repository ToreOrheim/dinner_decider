mod models {
    pub mod dish;
    pub mod ingredient;
    pub mod mapper_for_dish;
    pub mod tag;
}

mod readers {
    pub mod dish;
}

use models::dish::Dish;
use rand::seq::SliceRandom;
use rand::thread_rng;
use readers::dish::{get_all_dish_ids, get_dish_by_id};
use rusqlite::{Connection, Result};

fn main() -> Result<()> {
    // Open a connection to the database
    let conn = Connection::open("/db/database.db")?;

    // Fetch 7 unique random dishes
    let dishes = random_dishes(&conn).unwrap();

    // Print the fetched dishes
    for dish in dishes {
        println!("Random Dish: {:?}", dish.name);
    }

    Ok(())
}

fn random_dishes(conn: &Connection) -> Result<Vec<Dish>> {
    let all_dish_ids = get_all_dish_ids(conn).unwrap();
    // Create a random number generator
    let mut rng = thread_rng();

    // Select 7 random dish IDs
    let random_dish_ids: Vec<i32> = all_dish_ids.choose_multiple(&mut rng, 7).cloned().collect();

    let mut dishes: Vec<Dish> = Vec::new();
    for rand_id in random_dish_ids {
        let dish = get_dish_by_id(&conn, rand_id);
        if !dish.is_err() {
            dishes.push(dish.unwrap());
        }
    }

    Ok(dishes)
}
