use core::option::OptionTrait;
use core::traits::TryInto;
use core::traits::Into;
const Z:u256 = 1; // constants have to be on the global scope and have to be setted to a type

fn main() {

    println!("Hello world!");

    let x = 5; // felt252 (default type)
    // x = 6;  // This line will throw an error, by default ALL variables are inmutable

    let mut y = 7; // mut keyword convert a variable to mutable
    y = 8; // print y will show 8


    // SHADOWING AND SCOPE
    let shadow = 1;
    let shadow = 2;
    println!("{}", shadow); // 2
    
    // scope (functions, flow controllers, etc)
    {
        println!("{}", shadow); // 2
        let shadow = 3;
        println!("{}", shadow); // 3
        let scopedVariable = 4;
        println!("{}", scopedVariable); // 4
    }
    println!("{}", shadow); // 2
    // println!("{}", scopedVariable); // this will throw an error, cause scopedVariable is not defined in this context
    

    // TYPES
    let aFelt252Value = 255;
    let aFelt252Value:felt252 = 255; // this 2 lines are the same

    let number:u8 = 255;
    let number2:u16 = 65535;
    let number3:u32 = 4294967295;
    let number4:u64 = 18446744073709551615;
    let number5:u128 = 340282366920938463463374607431768211455;
    let number5:u256 = 115792089237316195423570985008687907853269984665640564039457584007913129639935;

    // suffixes
    let number = 255_u8;
    let number2:u16 = 65535_u16;
    // ... and so on

    let aBoolean = true;
    let aBoolean:bool = false;

    let shortString = 'hello'; // felt252 --> max 21 chars (31*8 = 248 bits)
    let longString: ByteArray = "Hello";


    // OPERATIONS 
    // addition
    let sum = 5_u128 + 10_u128;

    // subtraction
    let difference = 95_u128 - 4_u128;

    // multiplication
    let product = 4_u128 * 30_u128;

    // division
    let quotient = 5_u128 / 2_u128; //result is 2 (remaind 1)
    let quotient = 64_u128 / 32_u128; //result is 2

    // remainder
    let remainder = 5_u128 % 2_u128; // result is 1


    // CASTING TYPES or TYPE CONVERSION
    let conversionGaranteed:u8 = 3; 
    let conversionGaranteed:u16 = conversionGaranteed.into(); 
    let conversionNotGaranteed:u16 = 3; 
    let conversionNotGaranteed:u8 = conversionNotGaranteed.try_into().unwrap(); 



    // COMPOUND TYPES
    let tuple: (u32, u64, bool) = (10,20, true);
    let (tx, ty, tz) = tuple;
    println!("{} {} {}",tx,ty,tz);
    let (t2x, t2y, t2z, ): (u32, u64, bool) = (10,20, true);

    
    let arr1: [u64; 5] = [1, 2, 3, 4, 5];
    let [a, b, c, _, _] = arr1;
    let arr2 = [3;5]; // [3,3,3,3,3]
    let arr2_span = arr2.span();
    println!("{}", arr2_span[2]);
    
    let mut arr: Array<u128> = array![];
    arr.append(1);
    arr.append(2);

    // CONTROL FLOW

    //  CONDITIONALS
    let number = 3;

    if number == 5 {
        println!("condition was true and number = {}", number);
    } else {
        println!("condition was false and number = {}", number);
    }

    
    if number == 12 { // else if 
        println!("number is 12");
    } else if number == 3 {
        println!("number is 3");
    } else if number - 2 == 1 {
        println!("number minus 2 is 1");
    } else {
        println!("number not found");
    }

    // using it on variable setting 
    let condition = true;
    let number = if condition {5} else {6}; // if keyworld is an expression 


    // LOOPS 
    // loop { // INFINITE LOOP
    //     println!("again!");
    // };

    let mut i: usize = 0;
    loop {
        if i > 10 {
            break;
        }
        println!("i = {}", i);
        i += 1;
    };

    // continue 
    let mut i: usize = 0;
    loop {
        if i > 10 {
            break;
        }
        if i == 5 {
            i += 1;
            continue;
        }
        println!("i = {}", i);
        i += 1;
    };

    // returning value 
    // One of the uses of a loop is to retry an operation you know might fail, such as checking whether an operation has succeeded.
    let mut counter = 0;

    let result = loop {
        if counter == 10 {
            break counter * 2;
        }
        counter += 1;
    };

    // while 
    let mut number = 3;

    while number != 0 {
        println!("{number}!");
        number -= 1;
    };

    // looping through a collection 
    let a = [10, 20, 30, 40, 50].span();
    let mut index = 0;

    while index < a.len()-1 {
        println!("the value is: {}", a[index]);
        index += 1;
    };

    // now using for 
    let a = [10, 20, 30, 40, 50].span();

    for element in a {
        println!("the value is: {element}");
    };




    //FUNCTIONS  
    say_hello();
    say_hello_with_params("Solidity Due");
    let name = "Rusty Crab";
    say_hello_with_params(:name); // calling with name parameters
    return_something();
}


// if fn returns something is an expression, else is an statement 
fn say_hello() {
    println!("Helloo Satoshi!");
}

fn say_hello_with_params(name:ByteArray) {
    print!("Hello {}", name )
}

fn return_something() -> u32 {
    5 // no ; at the end to return this value, if you add ; at the end, you are converting the expresion to an statement
}
