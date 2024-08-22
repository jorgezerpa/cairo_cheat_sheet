mod hello_world;

use hello_cairo::hello_world::hello_country as helloCo;
use hello_cairo::hello_world::hello_town as helloTo;
// use hello_cairo::hello_world::hello_town::hello_house::sayHelloHouse;




fn sayHelloGalaxyAb () {
    helloCo::sayHelloCountry();
    helloTo::sayHelloTown();
    helloTo::hello_house::sayHelloHouse()
}


fn main() {
    sayHelloGalaxyAb()
}