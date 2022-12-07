
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0  <=0.9.0 ;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Ciberseguridad is Ownable {
    

    uint public topEventos;

    constructor (uint _topEventos){
        topEventos=_topEventos;
    }

    mapping (address =>mapping(uint=>string)) public Events;
    mapping (address =>uint) public  EventCounter;

    function createEvent(string memory evento) public  {
        uint contador = EventCounter[msg.sender]+1;

        if(contador > topEventos){
            contador=1;
        }
        
        EventCounter[msg.sender]=contador;
        Events[msg.sender][contador]=evento;
    }

    function setTopEventos(uint _topEventos) public onlyOwner  {
        topEventos=_topEventos;
    }


}