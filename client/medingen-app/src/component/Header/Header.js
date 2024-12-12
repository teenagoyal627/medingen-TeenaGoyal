import React from "react";
import classes from './Header.module.css'
const Header = ({ medicine }) => {
  if (!medicine) {
    return <p>Loading...</p>;
  }
  const currentMedicine = medicine;
  console.log(currentMedicine);
  return (
    <div className={classes.medicine_details}>
      {currentMedicine ? (
        <div>
          <h1>About {currentMedicine.salt_name}</h1>
          <p>{currentMedicine.content}</p>

          <h2>Uses of {currentMedicine.salt_name}</h2>
          {currentMedicine.uses_list &&(
            <ul>
              {currentMedicine.uses_list?.map((use, index) => (
                <li key={index}>{use}</li>
              ))}
            </ul>
          )}

          <h2>How {currentMedicine.salt_name} Works</h2>
          {currentMedicine.works && (
            <ul>
              {currentMedicine.works.map((work, index) => (
                <li key={index}>{work}</li>
              ))}
            </ul>
          )}

          <h2>Side Effects of {currentMedicine.salt_name}</h2>
          <h3>Common Side Effects {currentMedicine.salt_name}</h3>
          {currentMedicine.common_side_effect && (
            <ul>
              {currentMedicine.common_side_effect.map((effect, index) => (
                <li key={index}>{effect}</li>
              ))}
            </ul>
          )}
        </div>
      ) : (
        <p>Loading medicine details...</p>
      )}
    </div>
  );
};

export default Header;
