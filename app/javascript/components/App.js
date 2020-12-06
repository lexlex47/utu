import React, { Component } from 'react'
import PortfolioContainer from './PortfolioContainer'
import axios from 'axios'

//RoR 后台有 csrfToken保护，需要重新定义csrfToken,才可以使用axios的post
const csrfToken = document.querySelector('[name="csrf-token"]').content
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

class App extends Component {
    render() {
        return ( 
          <PortfolioContainer/>
        )
    }
}

export default App