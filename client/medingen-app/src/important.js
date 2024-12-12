// import React, { useEffect, useState } from 'react'

// const App = () => {

//   const[data,setData]=useState({
//     name:"",
//     age:"",
//     data:"",
//     programming:""
//   })

//   const[persons,setPersons]=useState([])

//   // directly fetch the data from flask to react
//   useEffect(()=>{
//     fetch('').then((res)=>
//     res.json().then((flaskData)=>{
//       console.log(flaskData)
//       setData({
//         name:flaskData.Name,
//         age:flaskData.Age,
//         programming:flaskData.programming
//       })
//     }))
//   },[])

//   // first fetcht the data from mysql on flask and then send here
//   useEffect(()=>{
//     fetch('/persons')
//     .then((res)=>res.json())
//     .then((data)=>setPersons(data))
//     .catch((err)=>console.log(err))
//   },[])

//   return (
//     <div>
//       <header >
//         <h1>React and Flask</h1>
//         <p>{data.name}</p>
//         <p>{data.age}</p>
//         <p>{data.programming}</p>
//         <ul>
//         {persons.map((person)=>(
//           <li key={person.PersonID}>
//             {person.FirstName} {person.LastName}, {person.Address}, {person.City}
//           </li>
//         ))}
//       </ul>
//       </header>
     
//     </div>
//   )
// }

// export default App
