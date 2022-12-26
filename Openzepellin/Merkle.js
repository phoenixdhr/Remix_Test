// instalar las dependencias : "merkletreejs" y "keccak256"
const {MerkleTree} = require ("merkletreejs")
const keccak256 = require("keccak256")

let whitelistAddress = [
    "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
    "0xc280ce2A54F0AF39B1A79A521B6d2C826eA11026",
    "0x17A2DaEDc65bdBC419B22ea54796Fd06d6798025",
    "0xa031a0ed63AB4DC9569CC2226B050271aC0222e2",
    "0x92Ec7c60A1DfaE0B6A95A47139494f3f3101eDDA",
    "0x586f0a32C98EaD76ED8c60eBccEC9c74EC1FeE78",
    "0x0aC6C5d054F9BB68981c0116065773B3D83c9903" ];


//leafNodes array que contiene los HASH de cada address
const vleafNodes = whitelistAddress.map(adr => keccak256(adr));
//Es un objeto que contiene varios datos entre ellos un array como leafNodes, y un array que contiene otros array segun el nivel del arbol.
const vmerkleTree = new MerkleTree(vleafNodes,keccak256, {sortPairs: true});

// console.log("LEAFNODES \n",vleafNodes);
// console.log("MERKLETREE \n",vmerkleTree);

//"getRoot" devuelve el root del arbol vmerkleTree
const roothash = vmerkleTree.getRoot()
console.log("ROOT HASH : ", roothash);

//Creamos el arbol de HASH de una forma facil de vizualizar
console.log("WHITELIST MERKLETREE : \n", vmerkleTree.toString());

//a traves de msg.sender, se obtendrá la dirección que desea retirar fondos de la whitelist, para el ejemplo es el primer elemento del array "vleafNodes"
const claiminingAddress = vleafNodes[0]
// "getHexProof" retorna un array de todos los HASH parientes con quien se HASHSHEARA (keccak256) para obtener el "root"
const hexProof = vmerkleTree.getHexProof(claiminingAddress)
console.log(hexProof)

//"verify" verifica si un hash pertenece al Merkletree generado
const veri = vmerkleTree.verify(hexProof,claiminingAddress,roothash)
console.log(`la prueba Merkle para "${claiminingAddress}" es ${veri}`);