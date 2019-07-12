import React from 'react'
import { Modal, ModalHeader, ModalBody } from 'reactstrap'
import dateFns from 'date-fns'

const CalendarModal = props => (
  <Modal isOpen={props.modalOpen} toggle={props.closeModal}>
    <ModalHeader toggle={props.closeModal}>
      { dateFns.format(props.selectedDate, 'dddd, MMMM Do') }
    </ModalHeader>
    <ModalBody>
    <h5>Lessons</h5>
      <ul>
        {
          props.dailyLessons.map((lesson) => {
            return(
              <li key={lesson.id}>
                <a href={` /lessons/${lesson.id}`}>
                  {
                    lesson.completed ? <s>{lesson.name}</s> : lesson.name
                  }
                </a>
              </li>
            )
          })
        }
        {
          props.dailyLessons.length === 0 &&
          <p><i>No lessons today</i></p>
        }
      </ul>
    </ModalBody>
  </Modal>
)

export default CalendarModal
