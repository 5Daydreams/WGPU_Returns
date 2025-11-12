use std::{thread, time::Duration};

use wgpu_returns::run;

fn main() {
    println!("Start!");

    run().unwrap();
    
    println!("Done!");
}

fn test_2() {
    let handle = thread::spawn(|| {
        for i in 1..10 {
            println!("hi number {i} from the spawned thread!");
            thread::sleep(Duration::from_millis(1));
        }
    });

    for i in 1..7 {
        println!("hi number {i} from the main thread!");
        thread::sleep(Duration::from_millis(1));
    }

    handle.join().unwrap();
}
