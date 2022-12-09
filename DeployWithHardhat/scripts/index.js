const { ethers } = require("hardhat");

async function main() {

const address = "0x5fbdb2315678afecb367f032d93f642f64180aa3";
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach(address);

const value = await box.getNum()

await box.setNum(150);
console.log("Box value is: ", value);


console.log("Box value is: ", value.toString());


}


main()
    .then(()=>process.exit(0))
    .catch(error=>{console.error(error); process.exit(1)})