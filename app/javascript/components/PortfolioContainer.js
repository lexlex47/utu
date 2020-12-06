import React, { Component } from 'react'
import Search from './Search'
import axios from 'axios'

class PortfolioContainer extends Component {
    constructor(props) {
        super(props)

        this.state = {
            date: '',
            search_results: {}
        }
        this.handleChange = this.handleChange.bind(this)
    }

    handleChange(e){

      axios.post('http://localhost:3000/search', {
        search: e.target.value
      })
      .then((data) => {
        this.setState({
          search_results: {...data.data.currencies}
        })
      })
      .catch((data) => {
        debugger
      })

    }

    render(){
      return(
        <div>
          <Search searchResults={this.state.search_results} handleChange={this.handleChange}/>
        </div>
      )
    }
}

export default PortfolioContainer
