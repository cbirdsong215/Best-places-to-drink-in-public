import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import FoodFeed from './components/FoodFeed';

  ReactDOM.render(
    <FoodFeed />,
    document.getElementById('app')
  );
  
$(function() {
  ReactDOM.render(
    <FoodFeed />,
    document.getElementById('app')
  );
});
