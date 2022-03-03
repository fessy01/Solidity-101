// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract VehicleId{

    struct vehicleDetails{
        uint  Id;
        string nameofOwner;
        uint engineNumber;
        string vehicleColor;
        string vehicleMaker;
        uint yearOfManufacture;
        string vehicleType;
    }
    mapping (address => uint) private vehicleToId;
    mapping(uint => vehicleDetails) internal vehicleDetail;
    mapping (uint => vehicleDetails) public accidentVehicles;
    vehicleDetails [] vehiclesRecords;

      address  public admin;
      uint public Id = 0;
      constructor (address _admin){
          admin = _admin;
      }

      modifier onlyAdmin{
          require( admin == msg.sender, "only admin is permitted to call");
          _;
      }

      function regVehicle( address _address,
       string memory _nameofOwner, 
       uint _engineNumber,
       string memory _vehicleColor,
       string memory _vehicleMaker, 
       uint _yearOfManufacture,
       string memory _vehicleType ) public onlyAdmin returns (bool, uint){
        if(addressExist(_address)) {
              return (false, vehicleToId[_address]);  
         }

            Id +=1;

            vehicleDetails memory newReg = vehicleDetails(Id, _nameofOwner, _engineNumber, _vehicleColor, _vehicleMaker, _yearOfManufacture, _vehicleType );

            vehiclesRecords.push(newReg);

            vehicleToId[_address] = Id;

            vehicleDetail[Id] = newReg;

            return(true, Id);
          
      }

      function retriveId() external view returns(bool, uint256) {
        uint id = vehicleToId[msg.sender];
        if(id == 0) return (false, 0);
        return (true, id);
      }

      function adminRecovery(address _address) onlyAdmin external view returns(bool, uint256) {
        uint id = vehicleToId[_address];
        if(id == 0) return (false, 0);
        return (true, id);
    }

    function confirmRegistration(uint256 _id) external view returns(vehicleDetails memory) {
        return vehicleDetail[_id];

    }

    
        function addressExist(address _address) internal view returns(bool) {
        return !(vehicleToId[_address] == 0);
    }

    function accidentVehicle(uint256 _removeId) external onlyAdmin returns(bool) {
        require(vehicleDetail[_removeId].Id != 0, "Student does not exist");
        accidentVehicles[_removeId] = vehicleDetail[_removeId];
        delete vehicleDetail[_removeId];

       uint indexTobeRemoved;
        for(uint i; i < vehiclesRecords.length; i++) {
            if(vehiclesRecords[i].Id == _removeId) {
                indexTobeRemoved = i;
                break;
            }
        }
        vehiclesRecords[indexTobeRemoved] = vehiclesRecords[vehiclesRecords.length - 1];
        vehiclesRecords.pop();


        return true;
    
    }

}