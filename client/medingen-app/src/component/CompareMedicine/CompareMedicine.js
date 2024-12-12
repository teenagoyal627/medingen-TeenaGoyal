import React from "react";
import { RiStarFill, RiStarLine } from "react-icons/ri";
import styles from "./Compare.module.css";
const CompareMedicine = ({ medicine }) => {
  console.log(medicine);
  const products = medicine?.products;

  // Function to render stars based on the rating
  const renderStars = (rating) => {
    const stars = [];
    for (let i = 1; i <= 5; i++) {
      stars.push(
        <span key={i}>
          {i <= rating ? (
            <RiStarFill className={styles.filledStar} />
          ) : (
            <RiStarLine className={styles.emptyStar} />
          )}
        </span>
      );
    }
    return stars;
  };

  return (
    <div className={styles.compareContainer}>
      <h3 className={styles.heading}>Compare Medicine</h3>
      <p className={styles.subheading}>
        Compare medicines price composition to make <br /> your decision
      </p>
      <div className={styles.productRow}>
        {products?.map((product, index) => (
          <div key={index} className={styles.card}>
            <img src={product.medicine_image} alt="" className={styles.img} />
            <h2 className={styles.productName}>{product.p_name}</h2>
            <p className={styles.company}>{product.p_company}</p>
            <h5 className={styles.label}>Generic name</h5>
            <p className={styles.value}>{product.generic_name}</p>
            <h5 className={styles.label}>Average Price</h5>
            <p className={styles.value}>Rs. {product.avg_price}</p>
            <div className={styles.originalPriceRow}>
              <p className={styles.label}>Original Price</p>
              <p className={styles.value}>Rs. {product.p_price}</p>
            </div>
            <h5 className={styles.label}>Chemical formation</h5>
            <p className={styles.value}>{product.chemical_formation}</p>
            <h2 className={styles.ratingTitle}>Rating & Review</h2>
            <div className={styles.ratingRow}>
              <div className={styles.ratingStars}>
                {renderStars(product.rating_value)}
              </div>
              <div className={styles.ratingValue}>
                {product.rating_value} {/* Display the rating value */}
              </div>
            </div>
            {product.reviews.map((review, reviewIndex) => (
              <p key={reviewIndex} className={styles.review}>
                " {review}"
              </p>
            ))}
          </div>
        ))}
      </div>
    </div>
  );
};

export default CompareMedicine;
