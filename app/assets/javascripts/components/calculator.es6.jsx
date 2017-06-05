class Calculator extends React.Component {
  constructor() {
    super();
    this.state = {
      sum: 1000000
    };

    this.sumChange = this.sumChange.bind(this);
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
      <form className="form-inline with-margin">
        <div className="form-group">
          <label>Сумма инвестиции&nbsp;</label>
          <input type="string" className="form-control" id="sum" placeholder="Сумма" value={this.state.sum} onChange={this.sumChange} />
        </div>
      </form>
      <table className="table">
        <tbody>
          <tr>
            <th>Годовая доходность реалистично</th>
            <th className="realistic">{this.realisticYear()}</th>
          </tr>
          <tr>
            <th>Годовая доходность оптимистично</th>
            <th className="optimistic">{this.optimisticYear()}</th>
          </tr>
        </tbody>
      </table>
    </div>);
  }
}