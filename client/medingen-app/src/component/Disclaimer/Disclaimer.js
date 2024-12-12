import React from "react";
import styles from "./Disclaimer.module.css"; // Import the CSS file

const Disclaimer = () => {
  return (
    <div className={styles.disclaimerContainer}>
      <h3 className={styles.disclaimerHeading}>Disclaimer</h3>
      <p className={styles.disclaimerText}>
        The contents here are for informational purposes only and not intended
        to be a substitute for professional medical advice, diagnosis, or
        treatment.Please seek the advice of a physician or other qualified
        health provider with any questions you may have regarding a medical
        condition.Medkart or any information and subsequent action or
        inaction is solely at the user's risk, and we do not assume any
        responsibility for the same. The content on the Platform should not be
        considered or used as a substitute for professional and qualified
        medical advice. Please consult your doctor for any query pertaining to
        medicines, tests, and/or diseases, as we support, and do not replace the
        doctor-patient relationship.
      </p>
    </div>
  );
};

export default Disclaimer;
