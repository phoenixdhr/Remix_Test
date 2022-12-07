
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0  <=0.9.0 ;

contract SupplyChain {

    enum Status  {
        CREATED,
        READY_FOR_PICK_UP,
        PICKED_UP,
        READY_FOR_DELIVERY,
        DELIVERED
    }
  
    struct Step {
        Status status;
        string metadata;        
    }

    mapping (uint=>Step[]) public Productos;

    event registroProducto(Status, string);

    function registerProduct(uint nProducto) public   {
        
        require(Productos[nProducto].length ==0, "El Lote-Codigo de producto ya existe");

        Productos[nProducto].push(Step(Status.CREATED,"Lote-Codigo Id de producto creado"));

        emit registroProducto(Status.CREATED,"Lote-Codigo Id de producto creado");        
    }


    event cambioStatus (string,address,uint,Status,string );

    function ChangeStatus(uint nProducto, string memory menssage) public  {
        require(Productos[nProducto].length !=0, "El Lote-Codigo de producto NO existe");
        require(Productos[nProducto].length-1<uint(Status.DELIVERED), "ya no hay mas pasos, el producto fue entregado");

        Status newstatus;
        newstatus = Status(Productos[nProducto].length);
        
        Productos[nProducto].push(Step(newstatus,menssage));
        emit cambioStatus ("El producto cambio de estado",msg.sender,nProducto, newstatus,menssage );
    }

    function EstadoActualProducto(uint nProducto) public view returns (Status) {
          require(Productos[nProducto].length !=0, "El Lote-Codigo de producto NO existe");
          return Status(Productos[nProducto].length-1);
    }


    
}