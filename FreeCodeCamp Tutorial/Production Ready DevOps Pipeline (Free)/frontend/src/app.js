import React, { useState, useEffect } from 'react'; //Import React and hooks
import axios from 'axios'; //Import Axios for API requests

function App() {
    //State for storing users fetched from backend
    const [users, setUsers] = useState([]);
    //State for the input field to add a new user
    const [name, setName] = useState('');

    //Fetch users when the component mounts
    useEffect(() => {
        axios.get('http://localhost:3000/users', { name });
    }, []); //Empty array means run once on mount

    //Add new user via API
    const addUser = async () => {
        const res = await axios.post('http://localhost:3000/users', { name }); //Post new user
        setUsers([...users, res.data]); //Update user list
        setName(''); //Clear input field
    };
}