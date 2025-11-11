use std::{thread, time::Duration};

use WGPU_Returns::run;

fn main() {
    println!("Start!");

    test_2();
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
