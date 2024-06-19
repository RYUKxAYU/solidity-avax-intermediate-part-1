// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//For this project, write a smart contract that implements the require(), assert() and revert() statements.
//Upload your solution to GitHub and share the link with us along with a quick code walk-through as explained below.

//created the contract 
contract StudentRegistration  {
//took streams 
    enum Subject { Accounts, Bio, Maths }

    struct StudentInfo {
        string name;
        uint age;
        uint256 phno; 
        uint256 cgpa;
        bool hasPassed; 
    }

    mapping(address => StudentInfo) public studentInfo;

    function addStudentInfo(address _studentAddress, string memory _name, uint _age, uint256 _phno, uint256 _cgpa, bool _hasPassed) public {
        studentInfo[_studentAddress] = StudentInfo(_name, _age, _phno, _cgpa, _hasPassed);
    }
//to check qualification
    function checkPassingStatus(address _studentAddress) public {
        require(studentInfo[_studentAddress].cgpa >= 5.0, "Not qualified due to CGPA"); 
        studentInfo[_studentAddress].hasPassed = true;
    }
//to update info
    function updateStudentInfo(address _studentAddress, uint256 _newphno) public returns (StudentInfo memory, string memory) {
        // Useing require to check that the student has passed before updating
        require(studentInfo[_studentAddress].hasPassed, "Update failed: Student must pass exam first");

        studentInfo[_studentAddress].phno = _newphno;
        return (studentInfo[_studentAddress], "Student phone number updated");
    }
//to update cgpa using revert 
    function updateCGPA(address _studentAddress, uint256 _newCGPA) public {
        if (_newCGPA > 10) {
            revert("Invalid CGPA: CGPA cannot be more than 10"); // Using revert for custom error message
        }

        studentInfo[_studentAddress].cgpa = _newCGPA;

        // Assert to ensure CGPA is within the expected range after update
        assert(studentInfo[_studentAddress].cgpa <= 10);
    }
}
