import React, { Component } from 'react';
class Label extends Component {

  render(){
    //let labelStyle = {fontFamily: "sans-serif", fontWeight: "bold", padding: 13, margin: 0}
    return(
      <div>
        <div className="food-card-name">{this.props.name}</div>
        <div className="food-card-desc">{this.props.description}</div>
      </div>
    )
  }
};

export default Label;
