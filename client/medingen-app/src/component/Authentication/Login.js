import React, { useEffect, useState } from 'react'

import classes from './Login.module.css'
import {  useNavigate } from 'react-router-dom'
import axios from 'axios'
const Login = () => {

  const navigate=useNavigate()
  
    // const[loginData,setLoginData]=useState({
    //     email:"",
    //     password:""
    // })

    const [email, setEmail] = useState('')
    const [password,setPassword] = useState('')

    const loginSubmitHandler = async (e) => {
      e.preventDefault();
     
      try {
          const response = await axios.post('/login', {"email": email,"password": password},{headers: { 'Content-Type': 'application/json' }}); // Send login data to Flask endpoint
        console.log(response.data)
        if (response.data.access_token) {
          // print()
          // Store the access token (e.g., localStorage)
          localStorage.setItem('accessToken', response.data.access_token);
          navigate('/view_product?med_id=1'); // Redirect to protected route
        } else {
          console.error('Login failed:', response.data.message);
        }
      } catch (error) {
        console.error('Error during login:', error);
      }
    };

  return (
    <div>
<div className={classes.modal}>
    <h5 className={classes.heading}>Login Form</h5>
    <hr/>
    <form 
    onSubmit={loginSubmitHandler} 
    className={classes.loginForm}>
        <label>Email</label>
        <input type="email" id='email' value={email} 
        onChange={(e)=>setEmail(e.target.value)} 
        required/>
        <label>Password</label>
        <input type="password" id='password' value={password} 
        onChange={(e)=>setPassword(e.target.value)} 
        required/>
        <button className={classes.button}>Login</button>

    </form>
    </div>
   
    </div>

  )
}

export default Login
