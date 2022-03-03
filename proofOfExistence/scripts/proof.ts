import { ethers } from 'hardhat'

async function deployTest() {
  const VehicleId = ethers.getContractFactory('VehicleId')
  const vehicleId = (await VehicleId).deploy('_admin')
  await (await vehicleId).deployed()
}
deployTest().catch((error) => {
  console.error(error)
  process.exitCode = 1

})