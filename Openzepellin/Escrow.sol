
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0;

//Contrato
import "@openzeppelin/contracts/utils/escrow/Escrow.sol";


// Permite que el dueño del contrato pueda generar una "orden de deposito a otra dirección" con la funcion "deposit" 
// Los fondos quedan congelados en el contrato hastq que
// El dueño libera los fondos con la funcion "witdraw"

contract UsingEscrow is Escrow {
   

}