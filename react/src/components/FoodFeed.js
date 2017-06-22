import React, { Component } from 'react';
import Card from './Card';

class FoodFeed extends Component {
  constructor(props) {
    super(props);
    this.state = {
      foods: [],
      currentPage: 1,
      foodsPerPage: 2,
      search: ''
    }
    this.handlePageNumberClick = this.handlePageNumberClick.bind(this);
    this.retrieveFoods = this.retrieveFoods.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
  }

  handlePageNumberClick(event) {
    this.setState({ currentPage: event.target.id});
  }

  updateSearch(event) {
  this.setState({ search: event.target.value.substr(0,20) });
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
    let filteredfoods = this.state.foods.filter(
      (food) => {
        return food.name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1 ||
        food.description.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1;
      }
    );

    let lastFood = this.state.currentPage * this.state.foodsPerPage;
    let firstFood = lastFood - this.state.foodsPerPage;
    let currentFoods = this.state.foods.slice(firstFood, lastFood);

    if (firstFood < 0 ) {
      currentFoods = filteredfoods.slice(0, 10);
    } else if (lastFood > filteredfoods.length) {
      currentFoods = filteredfoods.slice(filteredfoods.length - 10, filteredfoods.length);
    } else {
      currentFoods = filteredfoods.slice(firstFood, lastFood);
    }


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
      <div className="small-12 columns medium-6 columns large-6 columns">
        <input
          className="searchBar"
          placeholder="Search"
          type="text"
          value={this.state.search}
          onChange={this.updateSearch}
        />
      </div>
        <div className="posts foods" >
          {foods}
        </div>
        <div>
        <ul className="small-8 columns medium-8 columns large-8 columns">
          {renderPageNumbers}
        </ul>
        </div>
      </div>
    );
  }
};

export default FoodFeed;
