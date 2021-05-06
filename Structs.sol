pragma solidity ^0.5.12;

contract ToDos {

    /*
        Structs -> user defined data structures
        - create
        - read
        - update 
    */

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string memory _text) public {
        // 1st way of creating a struct
        todos.push(Todo(_text, false));
        
        /*
        // 2nd way of creating a struct -> better for more variables
        Todo({
            text: _text,
            completed: false
        });

        // 3rd way of initialising a struct -> initialised with default values
        Todo memory todo;
        todo.text = _text;
        // todo.completed = false 
        */
        }
        
        function get(uint _index) public view returns(string memory, bool) {
            // Data is stored in a state variable -> storage
            Todo storage todo = todos[_index];
            return (todo.text, todo.completed); 
        } 

        function update(uint _index, string memory _text) public {
            Todo storage todo = todos[_index];
            todo.text = _text;
        }

        function toggleCompleted(uint _index) public {
            Todo storage todo = todos[_index];
            todo.completed = !todo.completed;
        }
    



}