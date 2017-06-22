import React, { Component } from 'react';
import Card from './Card';

class FoodFeed extends Component {
  constructor(props) {
    super(props);
    this.state = {
      foods: [],
      currentPage: 1,
      foodsPerPage: 12
    }
    this.handlePageNumberClick = this.handlePageNumberClick.bind(this);
    this.retrieveFoods = this.retrieveFoods.bind(this);
  }

  handlePageNumberClick(event) {
    this.setState({ currentPage: event.target.id})
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
    let lastFood = this.state.currentPage * this.state.foodsPerPage;
    let firstFood = lastFood - this.state.foodsPerPage;
    let currentFoods = this.state.foods.slice(firstFood, lastFood);

    let foods = currentFoods.map(food => {
      return (
        <Card
          key={food.id}
          foodId={food.id}
          photo={food.photo.url}
          name={food.name}
          description={food.description}
        />
      );
    });

    let pageNumbers = [];
    for(let i = 1; i <= Math.ceil(this.state.foods.length / this.state.foodsPerPage); i++) {
      pageNumbers.push(i);
    };

    let renderPageNumbers = pageNumbers.map(number => {
      return(
        <li
          key={number}
          id={number}
          onClick={this.handlePageNumberClick}
        >
          {number}
        </li>
      )
    })

    return (
      <div>
        <div className="posts foods" >
          {foods}
        </div>
        <div>
        <ul className="pageNumbers">
          {renderPageNumbers}
        </ul>
        </div>
      </div>
    );
  }
};

export default FoodFeed;
