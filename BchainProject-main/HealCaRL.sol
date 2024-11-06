// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthRecordLedger {
    struct Record {
        string patientName;
        string sex;
        string birthDate;
        string patientAddress;
        string bloodType;

        string physicianName;
        string physicianAddress;
        string knownMedConditions;
        string diagnosis;
        string treatment;
        string allergies;

        uint256 timestamp;
    }

    // List of all records
    Record[] public records;

    address public owner;

    constructor() {
        owner = msg.sender; // Set the contract deployer as the owner
    }

    // Add a new health record
    function addRecord(
        string memory _patientName,
        string memory _sex,
        string memory _birthDate,
        string memory _patientAddress,
        string memory _bloodType,
        string memory _physicianName,
        string memory _physicianAddress,
        string memory _knownMedConditions,
        string memory _diagnosis,
        string memory _treatment,
        string memory _allergies
    ) public {
        records.push(Record({
            patientName: _patientName,
            sex: _sex,
            birthDate: _birthDate,
            patientAddress: _patientAddress,
            bloodType: _bloodType,
            physicianName: _physicianName,
            physicianAddress: _physicianAddress,
            knownMedConditions: _knownMedConditions,
            diagnosis: _diagnosis,
            treatment: _treatment,
            allergies: _allergies,
            timestamp: block.timestamp
        }));
    }

    // Get a health record by index
    function getRecordByIndex(uint256 index) public view returns (
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        uint256
    ) {
        require(index < records.length, "Record does not exist");
        Record memory record = records[index];

        return (
            record.patientName,
            record.sex,
            record.birthDate,
            record.patientAddress,
            record.bloodType,
            record.physicianName,
            record.physicianAddress,
            record.knownMedConditions,
            record.diagnosis,
            record.treatment,
            record.allergies,
            record.timestamp
        );
    }

    // Get all existing records
    function getAllRecords() public view returns (Record[] memory) {
        return records;
    }

    // Get the total number of records
    function getRecordCount() public view returns (uint256) {
        return records.length;
    }
}
