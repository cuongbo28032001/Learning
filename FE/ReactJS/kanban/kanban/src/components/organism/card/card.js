import React, { useState, useRef, useEffect } from "react";
import TextField from "@mui/material/TextField";
import { setListData } from "../../../store/slices/taskSlices";
import Styles from "./card.module.css";
import CloseIcon from "@mui/icons-material/Close";
import MoreHorizIcon from "@mui/icons-material/MoreHoriz";
import AddIcon from "@mui/icons-material/Add";
import ListEdit from '../../organism/listEditable/listEditable'
import AddCardIcon from '@mui/icons-material/AddCard';
import uuid from "react-uuid";
import { useDispatch, useSelector } from "react-redux";
import { Draggable } from "react-beautiful-dnd";

const Card = (props) => {
  const [title, setTitle] = useState("");
  const [addItem, setAddItem] = useState(false);

  const dispatch = useDispatch();
  const listData = useSelector((state) => state.tasks.listData);

  let Id = props.id;
  let listName = props.Lname;
  let task = props.task;

  function handleSubmit() {
    let TitleOfList = title.trim();
    if (TitleOfList !== "") {
      let input = [...listData];
      let createdOn = new Date();
      let month = createdOn.getMonth() + 1;
      let date = createdOn.getDate();
      let year = createdOn.getFullYear();
      let hour = createdOn.getHours();
      let minute = createdOn.getMinutes();
      let second = createdOn.getSeconds();
      let fullDate =
        date +
        "-" +
        month +
        "-" +
        year +
        " " +
        hour +
        ":" +
        minute +
        ":" +
        second;

      let newTask = {
        id: uuid(),
        title: title,
        description: "",
        time: fullDate,
        comments: [],
      };

      const temporary = {
        id: Id,
        listName: listName,
        task: [...task, newTask],
      };
      let index = listData.findIndex((ele) => ele.id === Id);
      input[index] = temporary;

      dispatch(setListData(input));

      localStorage.setItem("List", JSON.stringify(input));

      console.log(listData);
      setTitle("");
    }
  }

  function handleChange(e) {
    setTitle(e.target.value);
  }

  function handleAddButton() {
    setAddItem(!addItem);
  }

  return (
    <div>
      <div className={Styles.TaskBoundary}>
        {task && task.length > 0
          ? task.map((ele, index) => (
            <Draggable key={ele.id} draggableId={ele.id} index={index}>
              {(provided) => (
                <div
                  className={Styles.List}
                  key={ele.id}
                  ref={provided.innerRef}
                  {...provided.draggableProps}
                  {...provided.dragHandleProps}
                >
                  <ListEdit title={ele.title} id={ele.id} cardId={Id} />
                </div>
              )}
            </Draggable>

          ))
          : null}
      </div>
      {!addItem ? (
        <div className={Styles.Addbtn}>
          <div>
            <button onClick={handleAddButton} className={Styles.addButton}>
              <AddIcon
                sx={{ marginBottom: "-5px", paddingRight: "4px" }}
                fontSize="small"
                color="#B7BCC7"
              />
              Add a card
            </button>
          </div>
          <div>
            <AddCardIcon fontSize="small" color="blue" />
          </div>
        </div>
      ) : (
        <div className={Styles.main}>
          <div className={Styles.Main}>
            <TextField
              id="outlined-multiline-static"
              placeholder="Enter card name"
              multiline
              value={title}
              onChange={handleChange}
              rows={2}
              sx={{ width: "100%" }}
            />
          </div>
          <div className={Styles.toggle}>
            <div className={Styles.buttonclose}>
              <button onClick={handleSubmit}>Add Card</button>
              <CloseIcon onClick={handleAddButton} />
            </div>
            <div style={{ cursor: "pointer" }}>
              <MoreHorizIcon fontSize="large" />
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default Card;
