import React, { Component } from 'react';
class Square extends Component {

  render() {
    let squareStyle = {height: 150, backgroundColor: "#FF6663"};
    return(
      <div style={squareStyle}></div>
    )
  }
};

export default Square;
