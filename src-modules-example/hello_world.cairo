fn sayHelloWorld () {
    println!("Hello world");
}
    
pub mod hello_country {
     pub fn sayHelloCountry () {
        println!("Hello country");
    }

    #[derive(Drop)]
    pub struct Circle {
        pub a: u32,
    }
}
    
pub mod hello_town;

