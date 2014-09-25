TodoList = React.createClass
  render: ->
    createItem = (itemText) ->
      return <li>{itemText}</li>
    return <ul>{@props.items.map(createItem)}</ul>

TodoApp = React.createClass
  getInitialState: ->
    return {items: [], text: ''}
  onChange: (e) ->
    @setState({text: e.target.value})
  handleSubmit: (e) ->
    e.preventDefault()
    nextItems = @state.items.concat([@state.text])
    nextText = ''
    @setState({items: nextItems, text: nextText})
  render: ->
    return (
      <div>
        <h3>TODO</h3>
        <TodoList items={@state.items} />
        <form onSubmit={@handleSubmit}>
          <input onChange={@onChange} value={this.state.text} />
          <button>{'Add #' + (@state.items.length + 1)}</button>
        </form>
      </div>
    )

React.renderComponent <TodoApp />, document.getElementById('example')
