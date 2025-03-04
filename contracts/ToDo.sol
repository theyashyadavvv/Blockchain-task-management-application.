// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ToDo {
    struct Task {
        uint id;
        string description;
        bool completed;
    }

    Task[] public tasks;
    mapping(address => uint) public userTaskCount;
    address public owner;

    event TaskAdded(uint id, string description);
    event TaskCompleted(uint id);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function addTask(string memory _description) public {
        tasks.push(Task(tasks.length, _description, false));
        userTaskCount[msg.sender]++;
        emit TaskAdded(tasks.length - 1, _description);
    }

    function completeTask(uint _id) public {
        require(_id < tasks.length, "Invalid task ID");
        require(!tasks[_id].completed, "Task already completed");

        tasks[_id].completed = true;
        emit TaskCompleted(_id);
    }

    function getTasks() public view returns (Task[] memory) {
        return tasks;
    }
}
