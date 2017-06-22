import React, { Component } from 'react';
class Square extends Component {

  render() {
    //let squareStyle = {width: 300, height: 200};
    //let imgStyle = {height: 20, width: 20}
    return(
      <a href={"/foods/" + this.props.foodId}>
        <img src={this.props.photo}></img>
      </a>
    )
  }
};

export default Square;
