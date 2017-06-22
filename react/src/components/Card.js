import React, { Component } from 'react';
import Square from './Square'
import Label from './Label'

class Card extends Component{

  render() {
    //let cardStyle = {height: 200, width: 150, padding: 0, backgroundColor: "#FFF", WebkitFilter: "drop-shadow(0px 0px 5px #666)", filter: "drop-shadow(0px 0px 5px #666)"};
    return(
          <div className="food-card">
            <Square photo={this.props.photo} foodId={this.props.foodId} />
            <Label name={this.props.name} description={this.props.description} />
          </div>

    )
  }
};

export default Card;
