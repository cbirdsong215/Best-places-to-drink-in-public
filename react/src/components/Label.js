import React, { Component } from 'react';
class Label extends Component {

  render(){
    let labelStyle = {fontFamily: "sans-serif", fontWeight: "bold", padding: 13, margin: 0}
    return(
      <p style={labelStyle}>{this.props.colour}</p>
    )
  }
};

export default Label;
