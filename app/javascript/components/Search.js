import React, { Component } from 'react'

class Search extends Component {
  constructor(props){
    super(props)
  }

  render(){
    return(
      <div>
        <h1>Crypto Currencies Data</h1>
        <form>
          <div className="form-group">
            <label>Search for a data(YYYY-MM-DD): </label><br/>
            <input onChange={this.props.handleChange} autoComplete="off" type="text" name="name" placeholder="Ex: YYYY-MM-DD" value={this.props.date} className="field"/>
          </div>
          <table>
            <tr>
              <th>Coin</th>
              <th>Price</th>
              <th>24h</th>
              <th>7d</th>
              <th>1m</th>
              <th>24h Volume</th>
              <th>Market Cap</th>
            </tr>
            { Object.keys(this.props.searchResults).map( key => {
              const result = this.props.searchResults
              if(result[key]){
                // console.log(result[key])
                return(
                  <tr key={key} className="currency-list-item">
                    <td>{result[key][0]}</td>
                    <td>${result[key][1]}</td>
                    <td className={result[key][2] < 0 ? "text-red" : "text-green"}>{result[key][2]}%</td>
                    <td className={result[key][3] < 0 ? "text-red" : "text-green"}>{result[key][3]}%</td>
                    <td className={result[key][4] < 0 ? "text-red" : "text-green"}>{result[key][4]}%</td>
                    <td>${result[key][5]}</td>
                    <td>${result[key][6]}</td>
                  </tr>
                )
              }
            })}
          </table>
        </form>
      </div>
    )
  }
}

export default Search