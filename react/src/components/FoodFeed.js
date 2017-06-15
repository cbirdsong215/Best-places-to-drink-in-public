import React, { Component } from 'react';
import Card from './Card';

class FoodFeed extends Component {
  constructor(props) {
    super(props);
    this.state = {
      foods: []
    }
  }

  retrieveFoods() {
    $.ajax({
      url: '/api/v1/foods',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ foods: data });
    });
  }

  componentDidMount() {
    this.retrieveFoods();
    setInterval(this.retrieveFoods, 5000)
  }

  render() {
    let foods = this.state.foods.map(food => {
      return (
        <Card
          key={food.id}
          foodId={food.id}
        />
      );
    });

    return (
      <div className="posts foods" >
        {foods}
      </div>
    );
  }
};

export default FoodFeed;
