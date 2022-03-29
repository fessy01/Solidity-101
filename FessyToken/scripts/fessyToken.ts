import { ethers } from "hardhat";

async function DeployToken() {


    const FessyToken = await ethers.getContractFactory("FessyToken");
    const fessyToken = await FessyToken.deploy();
  
    await fessyToken.deployed();

    const totalSup = await fessyToken.totalSupply();
    console.log(totalSup);

const approve = await fessyToken.approve("0xEa56cf7a806940c86fD6B6f7f4a4Ae62540C55DC", 1000);
console.log(approve);

const transfer = await fessyToken.transfer("0xf0d5aE856302A7D042f0eb83203DFAbe4f79B7e1", 100);
  console.log(transfer);

    console.log("FessyToken deployed to:", fessyToken.address);
  }

  DeployToken().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });