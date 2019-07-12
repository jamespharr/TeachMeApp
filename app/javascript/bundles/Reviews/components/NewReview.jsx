import React from "react";

const NewReview = props => {
  return (
    <React.Fragment>
      <h3 style={{ padding: "1rem" }}>New Review</h3>
      <form style={{ padding: "1rem" }}>
        <h2>Leave your comments below:</h2>
        <fieldset className="form-group">
          <textarea className="form-control" />
          <br />
          <button type="submit" className="btn btn-primary btn-block ">
            Submit
          </button>
        </fieldset>
      </form>
    </React.Fragment>
  );
};

export default NewReview;
