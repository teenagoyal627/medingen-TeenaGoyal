import React from 'react';
import { RiStarFill, RiStarLine } from 'react-icons/ri'; // Import the icons
import './ReviewRating.css'
const ReviewRating = ({ medicine }) => {
    const med_rat_reviews = medicine.salt_rating_reviews['reviews'];
    const med_rating = medicine.salt_rating_reviews['value'];
  
    // Function to render stars based on the rating
    const renderStars = (rating) => {
        const stars = [];
        for (let i = 1; i <= 5; i++) {
            stars.push(
                <span key={i}>
                    {i <= rating ? (
                        <RiStarFill className="filledStar" />
                    ) : (
                        <RiStarLine className="emptyStar" />
                    )}
                </span>
            );
        }
        return stars;
    };

    return (
        <div className="review-rating">
            <h1>Rating & Review</h1>
            <p>Rating: {med_rating}/5</p>
            
            <div className="star-rating">
                {renderStars(med_rating)} {/* Render the stars dynamically */}
            </div>
            
            <ul className="review-list">
                {med_rat_reviews?.map((review, index) => (
                    <li key={index}>
                        <p>"{review}"</p>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default ReviewRating;
