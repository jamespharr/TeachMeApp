import React from 'react'
import dateFns from 'date-fns'
import Header from './Header'
import Days from './Days'
import Cells from './Cells'
import CalendarModal from './CalendarModal'

export default class Calendar extends React.Component {
  state = {
    currentMonth: new Date(),
    currentDate: new Date(),
    selectedDate: new Date,
    modalOpen: false,
    lessons:{}
  }

  nextMonth = () => {
    this.setState({
      currentMonth: dateFns.addMonths(this.state.currentMonth, 1)
    })
  }

  prevMonth = () => {
    this.setState({
      currentMonth: dateFns.subMonths(this.state.currentMonth, 1)
    })
  }

  handleDateClick = day => {
    this.setState({ selectedDate: day, modalOpen: true })
  }

  closeModal = () => {
    this.setState({ modalOpen: false })
  }

componentDidMount(){
  fetch(`/user_lessons/${this.props.userId}`)
    .then(response => response.json())
    .then(data => this.setState({lessons:data}))
}

  render(){
    const { currentMonth, currentDate, lessons, modalOpen, selectedDate } = this.state
    return(
      <div className="calendar">
        <Header
          currentMonth={currentMonth}
          prevMonth={this.prevMonth}
          nextMonth={this.nextMonth}
        />
        <Days />
        <Cells
          currentMonth={currentMonth}
          currentDate={currentDate}
          lessons={lessons}
          handleDateClick={this.handleDateClick}
        />
        <CalendarModal
            modalOpen={modalOpen}
            selectedDate={selectedDate}
            closeModal={this.closeModal}
            dailyLessons={ lessons[dateFns.format(selectedDate, 'YYYY-MM-DD')] || [] }
        />
      </div>
    )
  }
}
