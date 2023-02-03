// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0;

contract Almacenamiento {


    struct Personaje {
        uint ki;
        string nombre;
    }


    mapping(address => Personaje) public dragonbolas;
    Personaje public goku = Personaje(1600,"Goku");

    // Se ingresan datos al mapping que esta en almacenado en storage
    function MainVegeta() external returns(Personaje memory) {
        dragonbolas[msg.sender]  = Personaje(1500,"vegeta");
        return dragonbolas[msg.sender];
    }

    // Para modificar datos del struct se estrae el sctruct del mapping como una nueva variable "vegeta" y se declarada como "storage"
    function storageVegeta()public returns(Personaje memory) {
        Personaje storage vegeta = dragonbolas[msg.sender];
        vegeta.ki=2500; // se modifica el struct, la modificacion afecta al storage
        return vegeta;

    }
    
    // Para usar los datos del struct en una funcion, se extraen los datos como una variable "vegetaSuper" declarada como "memory"
    function memoryVegeta()public view returns(Personaje memory) {
        Personaje memory vegetaSuper = dragonbolas[msg.sender];
        vegetaSuper.ki=3600;  // el cambio del valor no permanece, no afecta al storage. 
        vegetaSuper.nombre="vegeta supersaya";
        return vegetaSuper;
    }

    // se crea un array dinamico en storage con un tamaño inical de 2
    uint[] array1 = new uint[](2);

    // para obtener una variable de tipo cadena con "returns" se debe especificar que corresponder a una variable "memory"
    function memoryArray(uint x) public returns(uint[] memory){
        array1.push(x); // se agrega elementos al array, si el array fuera declarado como memory no podria usar la funcion "push"
        
        return array1;
    }

    // usamos CallData para argumentos de funciones, estos valores permanecen invariables y se pueden usar para pasar los mismos
    // parametros a otras funciones
    function calldataArray(uint[] calldata x) public pure returns(uint){
        return _calldataArray(x);
    }


    function _calldataArray(uint[] calldata x) internal pure returns(uint){
        uint y =x[0];
        return y;
    }


}