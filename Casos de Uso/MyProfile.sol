// SPDX-License-Identifier: MIT
pragma solidity  >=0.7.0  <=0.9.0 ;

contract Identity {

    struct BasicInfo {
                        string  name;
                        string email;
    }

    struct PersonalInfo {
                        uint salary;
                        string direccion;
    }

    address owner;

    BasicInfo private basicInfo;
    PersonalInfo private personalInfo;

    mapping (address => bool) public usersBasic;
    mapping (address => bool) public usersPersonal;

    enum TypeUSer {basic, personal }
    
    constructor(string memory _name, string memory _email, uint _salary, string memory _direccion) {
        basicInfo = BasicInfo(_name,_email);
        personalInfo = PersonalInfo (_salary, _direccion);
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(owner==msg.sender, "only contract owner can get access to information");
        _;
    }


        event setdatos (string mensaje, address);

    function setRegisterUser(address _user, TypeUSer _typeuser) public onlyOwner {
        if (_typeuser == TypeUSer.basic){
            usersBasic[_user]=true;
                    emit setdatos ("se deio permiso de los datos a: ", msg.sender);
        }
        else if (_typeuser == TypeUSer.personal){
            usersPersonal[_user]=true;
                    emit setdatos ("se deio permiso de los datos a: ", msg.sender);
        }

        else {
            revert("seas webon pe, solo hay dos estados");
        }
    }


    modifier authorizedUser (TypeUSer tipousuario){
        if(msg.sender==owner || usersPersonal[msg.sender]==true){
            _;
        }
        else if(usersBasic[msg.sender]==true && TypeUSer.basic==tipousuario ){
            _;
        }
        else {
        revert("No tienes acceso a ver los datos");
        }
   
    }

            event eventoBasico(string mensaje);
            event eventoPrivado(PersonalInfo datos_personales, string mensaje);

    function getBasicInfo() public  authorizedUser (TypeUSer.basic) returns(BasicInfo memory)  {
            
            emit eventoBasico ("se envio datos basicos");
            return basicInfo;        
    }

    function getPersonal() public authorizedUser (TypeUSer.personal) returns(PersonalInfo memory)  {
            emit eventoPrivado(personalInfo,"se enviaron adtos personales");
            return personalInfo;
    }

}