import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import FoodFeed from './components/FoodFeed';

$(function() {
  ReactDOM.render(
    <FoodFeed />,
    document.getElementById('app')
  );
});
