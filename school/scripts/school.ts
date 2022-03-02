import { ethers } from 'hardhat'

async function deployTest() {
  const School = ethers.getContractFactory('School')
  const school = (await School).deploy()
  await (await school).deployed()
  const student = {
      id: 1,
    name: 'Ayo',
    class: "jess one",
    age: 7,
  }

  //write into contract
  const tx = await (await school).setStudent(student)
  const txWait = await tx.wait()
  console.log(txWait)
  
  //read contract
  const output = await (await school).viewStudent()
  console.log(output)
}

deployTest().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
