class Calculator extends React.Component {
  constructor() {
    super();
    this.state = {
      sum: 1000000
    };
  }

  sumChange(event) {
    this.setState({
      sum: event.target.value
    });
  }

  optimisticYear() {
    const number = this.calculateRate(this.props.optimisticProfitability)
    return this.prettySum(number);
  }

  realisticYear() {
    const number = this.calculateRate(this.props.realisticProfitability)
    return this.prettySum(number);
  }

  calculateRate(rate) {
    return this.state.sum * rate / 100;
  }

  prettySum(number) {
    return formatFloat(number);
  }

  render () {
    return (<div>
      <form className="form-inline">
        <div className="form-group">
          <label className="sr-only">Сумма</label>
          <input type="string" className="form-control" placeholder="Сумма" value={this.state.sum} onChange={this.sumChange} />
        </div>
        <div className="form-group">
          <p>{this.optimisticYear()}</p>
          <p>{this.realisticYear()}</p>
        </div>
      </form>
    </div>);
  }
}