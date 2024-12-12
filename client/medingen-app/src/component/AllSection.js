import React, { useEffect, useState } from "react";
import Header from "./Header/Header";
import axios from "axios";
import CompareMedicine from "./CompareMedicine/CompareMedicine";
import Question from "./FrequentQuestion/Question";
import ReviewRating from "./ReviewRating/ReviewRating";
import Disclaimer from "./Disclaimer/Disclaimer";
import Footer from "./Footer/Footer";
import Navbar from "./Navbar/Navbar";
import { FaAngleLeft } from "react-icons/fa";
import { useNavigate, useParams } from "react-router";
import { useSearchParams } from 'react-router-dom';
import Feature from "./Feature/Feature";
const AllSection = () => {
  const [medicine, setMedicine] = useState(null);
  const [searchParams, setSearchParams] = useSearchParams();
  const navigate = useNavigate();
const [currentStatus,setStatus]=useState('Loading...')
  // let {params} = useParams()
 const med_id =searchParams.get('med_id')

  // const med_id = params.med_id;
  console.log('received id: ',med_id)

  const [accessToken, setAccessToken] = useState(null);

  useEffect(() => {
    const storedToken = localStorage.getItem('accessToken');
    if (storedToken) {
      setAccessToken(storedToken);
    } else {
      // Handle the case where there's no stored token (e.g., redirect to login)
      console.error('Access token not found. Please login.');
      navigate('/')
    }
  }, []);

  useEffect(() => {

  
   async function fetchMed () {
    console.log("api call")
    try {
      const response = await axios.get(`/medicine/${med_id}`, {headers: {
        Authorization: `Bearer ${accessToken}` // Include access token in header
      }});
    
      console.log(response.data);
      setMedicine(response.data);
    } catch (err) {
      console.log(err);
      if(err.message==='Request failed with status code 404'){
        setStatus('Medicine not found')
      }else{
        setStatus('Something went wrong.')

      }
    }
  };

  if (accessToken){

    fetchMed();
  }

  }, [accessToken]);
  if (medicine){
  return (
    <div>
    <div style={{margin:"4rem"}}>
    {/* Paracetamol/acetaminophen */}
    <h5 style={{margin:"2rem"}}> <FaAngleLeft />{medicine.salt_name}</h5>
      <h3 style={{padding:"1rem",borderRadius:".1rem",border:"1px solid #f0f0f0",backgroundColor:"#f0f0f0",textAlign:"center"}}>Medicine Details</h3>
      <Header medicine={medicine} />
      <CompareMedicine medicine={medicine}/>
      <Question medicine={medicine}/>
      <ReviewRating medicine={medicine}/>
      <Disclaimer/>
      <Feature/>
    </div>
    <Footer/>
</div>
  );}else{
return(<div style={{textAlign:"center"}}>{currentStatus}</div>)
  }
};
export default AllSection;
