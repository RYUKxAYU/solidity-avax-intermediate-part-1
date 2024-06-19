# Student Registration Smart Contract

This smart contract implements a simple student registration system using Solidity. It demonstrates the use of `require()`, `assert()`, and `revert()` statements for error handling and validation.

## Table of Contents

- [Overview](#overview)
- [Contract Details](#contract-details)
  - [Enums and Structs](#enums-and-structs)
  - [Mappings](#mappings)
  - [Functions](#functions)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Contact](#contact)

## Overview

I took real life example, in INDIA when we complete our highschool we need to choose a steam from the MATHS,BIO,ACCOUNTS,ARTS or just dropout so i created this `StudentRegistration` contract allows for the addition, update, and verification of student information a student could use this to check just check his qualifications. It includes validation checks to ensure data integrity and proper flow of operations.

## Contract Details

### Enums and Structs

- **Subject Enum**: Represents different subjects (currently not used in the functions but reserved for future use).
- **StudentInfo Struct**: Holds the information of a student, including their name, age, phone number, CGPA, and passing status.

### Mappings

- **studentInfo**: A mapping from student addresses to their `StudentInfo` records.

### Functions

1. **addStudentInfo**: Adds a new student's information to the contract.
    ```solidity
    function addStudentInfo(address _studentAddress, string memory _name, uint _age, uint256 _phno, uint256 _cgpa, bool _hasPassed) public {
        studentInfo[_studentAddress] = StudentInfo(_name, _age, _phno, _cgpa, _hasPassed);
    }
    ```
    - Parameters: `_studentAddress`, `_name`, `_age`, `_phno`, `_cgpa`, `_hasPassed`
    - Purpose: To add or update a student's information.

2. **checkPassingStatus**: Checks if a student has passed based on their CGPA.
    ```solidity
    function checkPassingStatus(address _studentAddress) public {
        require(studentInfo[_studentAddress].cgpa >= 5.0, "Not qualified due to CGPA");
        studentInfo[_studentAddress].hasPassed = true;
    }
    ```
    - Parameters: `_studentAddress`
    - Purpose: Sets the student's passing status to true if their CGPA is 5.0 or higher.

3. **updateStudentInfo**: Updates the phone number of a student who has passed.
    ```solidity
    function updateStudentInfo(address _studentAddress, uint256 _newphno) public returns (StudentInfo memory, string memory) {
        require(studentInfo[_studentAddress].hasPassed, "Update failed: Student must pass exam first");
        studentInfo[_studentAddress].phno = _newphno;
        return (studentInfo[_studentAddress], "Student phone number updated");
    }
    ```
    - Parameters: `_studentAddress`, `_newphno`
    - Purpose: Updates the student's phone number if they have passed.

4. **updateCGPA**: Updates the CGPA of a student with a validation check.
    ```solidity
    function updateCGPA(address _studentAddress, uint256 _newCGPA) public {
        if (_newCGPA > 10) {
            revert("Invalid CGPA: CGPA cannot be more than 10");
        }
        studentInfo[_studentAddress].cgpa = _newCGPA;
        assert(studentInfo[_studentAddress].cgpa <= 10);
    }
    ```
    - Parameters: `_studentAddress`, `_newCGPA`
    - Purpose: Updates the student's CGPA, ensuring it does not exceed 10.

## Installation

To set up this project locally, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/your-repository.git
    cd your-repository
    ```

2. **Install dependencies**:
    Ensure you have [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed, then install the project dependencies:
    ```bash
    npm install
    ```

3. **Compile the contract**:
    Use a Solidity compiler like [solc](https://github.com/ethereum/solc-js) or an integrated development environment (IDE) like [Remix](https://remix.ethereum.org/) to compile the contract.

## Usage

1. **Deploy the contract**:
    Deploy the contract on your preferred Ethereum network (local, testnet, or mainnet).

2. **Interact with the contract**:
    Use a tool like [Remix](https://remix.ethereum.org/), [Truffle](https://www.trufflesuite.com/), or [web3.js](https://web3js.readthedocs.io/) to interact with the deployed contract.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

- **Ayush** - [@linkedin](https://www.linkedin.com/in/ayush-yadav-162aa024a/)) -
