import React from 'react';
import { RiHome5Fill } from "react-icons/ri";
import { TbCircleDashedPercentage } from "react-icons/tb";
import { IoNotificationsOutline } from "react-icons/io5";
import { IoPerson } from "react-icons/io5";
import { AiOutlineShoppingCart } from "react-icons/ai";
import styles from './Navbar.module.css';

const Navbar = () => {
  return (
    <div className={styles.navbar}>
    <div>
    <img 
        src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBFADnRK_55rwLI1jm55Ya5BMfXY2YnB09cw&s' 
        alt='logo' 
        className={styles.logo} 
      />
      <h5>Medingen</h5>
    </div>
      <nav className={styles.nav} >
        <ul className={styles.navList}>
       
        <li className={`${styles.navItem} ${styles.active}`}>
            <RiHome5Fill /> Home
          </li>
          <li className={styles.navItem}>
            <TbCircleDashedPercentage /> Orders
          </li>
          <li className={styles.navItem}>
            <IoNotificationsOutline /> Notification
          </li>
          <li className={styles.navItem}>
            <IoPerson /> Person
          </li>
          
        </ul>
      </nav>
      <div className={styles.cart}>
        <AiOutlineShoppingCart />
      </div>
    </div>
  );
};

export default Navbar;
