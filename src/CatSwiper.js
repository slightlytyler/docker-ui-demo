import axios from 'axios';
import React from 'react';

const makeUrl = () => `${API_URL}/v1/images/search?limit=1&order=random&size=full`;

class CatSwiper extends React.Component {
  state = {
    currentCatUrl: null,
    loading: true,
  };

  componentDidMount() {
    this.handleGetCat();
  }

  handleGetCat = () => {
    this.setState({ loading: true })
    axios
      .get(makeUrl())
      .then(res =>
        this.setState({ currentCatUrl: res.data[0].url, loading: false })
      )
      .catch(() => this.setState({ loading: false }))
  }

  render() {
    return (
      <div>
        <div>
          <button disabled={this.state.loading} onClick={this.handleGetCat}>
            Get another cat
          </button>
        </div>
        <div>
          {this.state.loading
            ? <div>Loading...</div>
            : <img style={{ width: '500px' }} src={this.state.currentCatUrl} />}
        </div>
      </div>
    )
  }
}

export default CatSwiper;
