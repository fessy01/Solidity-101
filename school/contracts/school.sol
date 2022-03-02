//Write a contract that has a struct ,a function(struct as input) which assigns values to a struct.
//Event emits a struct
//Another function returns a struct given a key

//script
//console.logs your view function
//console.log(at most one of your event parameters)


// SPDX-License-Identifier: GPL-3.0
 
 pragma solidity ^0.8.4;

contract School{

    struct student{
        uint id;
        string name;
        string class;
        uint age;
    }

    mapping(uint => student) studentDetails;
    event std (student);

    function setStudent(student calldata _student) external{
        student storage s = studentDetails[1];
        s.id = _student.id;
        s.name = _student.name;
        s.class = _student.class;
        s.age = _student.age;
    }

    function viewStudent() public view returns(student memory students_){

        students_ = studentDetails[1];
    }
}