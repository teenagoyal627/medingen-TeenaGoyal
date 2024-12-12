import React from 'react'
import AllSection from './component/AllSection'
import Navbar from './component/Navbar/Navbar'
import { useParams } from 'react-router'

const App = () => {
  
  return (
    <div>
    <Navbar/>
      <AllSection/>
    </div>
  )
}

export default App
