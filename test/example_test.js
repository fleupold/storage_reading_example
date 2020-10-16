const ExampleContract = artifacts.require("ExampleContract")
const ExampleExtension = artifacts.require("ExampleExtension")
const ExternalReaderContract = artifacts.require("ExternalReaderContract")

contract("ExampleContract", () => {
  it("can invoke extension method", async () => {
    const contract = await ExampleContract.new(42)
    const extension = await ExampleExtension.new()

    const calldata = extension.contract.methods.setAndGetFoo(13).encodeABI()
    assert.equal(
      await contract.simulateDelegatecall.call(extension.address, calldata),
      13)
  })
})

contract("ExternalReaderContract", () => {
  it("can invoke extension method via external contract", async () => {
    const contract = await ExampleContract.new(42)
    const extension = await ExampleExtension.new()

    const reader = await ExternalReaderContract.new(contract.address, extension.address)
    assert.equal(await reader.invokeExtension.call(), 42)
  })
})