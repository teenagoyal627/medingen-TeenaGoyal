import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import Login from './component/Authentication/Login';
import { BrowserRouter, Route, Routes } from 'react-router';


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  // <React.StrictMode>
  <BrowserRouter>
  {/* <App/> */}
  <Routes>
    <Route path="/" element={<Login />}/>
      {/* <Route path="products" element={<AllProduct />} /> */}
      <Route path="/view_product" element={<App />} />
    
  </Routes>
</BrowserRouter>
  // </React.StrictMode>
);

