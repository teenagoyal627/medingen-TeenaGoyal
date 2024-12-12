import React, { useState } from 'react';
import styles from './Question.module.css';
import { FaAngleDown } from "react-icons/fa";
const Question = ({ medicine }) => {
const[show,setShow]=useState(false)
  return (
    <div className={styles.questionContainer}>
    <div className={styles.headingRow} onClick={()=>setShow(!show)}>
        <p className={styles.heading}>Frequently Asked Questions about Paracetamol</p>
        <span className={styles.icon}>
          <FaAngleDown />
        </span>
      </div>
    { show && 
      <div className={styles.card}>
        {medicine.faq?.map((quesAns, index) => (
          <div key={index} className={styles.questionAnswer}>
            <p className={styles.question}>Q: {quesAns.question}</p>
            <p className={styles.answer}>A: {quesAns.answer}</p>
          </div>
        ))}
      </div>
    }
    </div>
  );
};

export default Question;
