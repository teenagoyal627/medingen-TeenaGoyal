import React from 'react';
import './Footer.css'; // Import the CSS file for styling

const Footer = () => {
    return (
        <footer className="footer">
            <div className="footer-content">
                <div className="footer-section">
                    <h4>About Us</h4>
                    <ul>
                        <li><a href="#">About Medingen</a></li>
                        <li><a href="#">Our Mission</a></li>
                        <li><a href="#">Our Team</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div className="footer-section">
                    <h4>Services</h4>
                    <ul>
                        <li><a href="#">Online Pharmacy</a></li>
                        <li><a href="#">Health Checkups</a></li>
                        <li><a href="#">Lab Tests</a></li>
                        <li><a href="#">Doctor Consultations</a></li>
                    </ul>
                </div>
                <div className="footer-section">
                    <h4>Policies</h4>
                    <ul>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Use</a></li>
                        <li><a href="#">Refund Policy</a></li>
                        <li><a href="#">Shipping Policy</a></li>
                    </ul>
                </div>
                <div className="footer-section">
                    <h4>Contact Us</h4>
                    <ul>
                        <li><a href="#">Customer Support</a></li>
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">Feedback</a></li>
                    </ul>
                </div>
            </div>
            <div className="footer-bottom">
                <p>&copy; 2024 Medingen. All Rights Reserved.</p>
            </div>
        </footer>
    );
};

export default Footer;