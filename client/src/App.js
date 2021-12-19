import React, { Component } from 'react';
import { Route, Routes, Link } from 'react-router-dom';
import logo from './logo.svg';
import './App.css';
import OtherPage from './OtherPage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1 className="App-title">Welcome to React | K8S Deployment</h1>
            <Link to="/">Home</Link>
            <Link to="/otherpage">Other Page</Link>
          </header>
          <div>
            <Routes>
              <Route exact path="/" element={<Fib />} />
              <Route path="/otherpage" element={<OtherPage />} />
            </Routes>
          </div>
        </div>
    );
  }
}

export default App;
