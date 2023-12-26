import React, { useState } from "react";
import EditTwoToneIcon from "@mui/icons-material/EditTwoTone";
import DeleteIcon from "@mui/icons-material/Delete";
import { setListData } from '../../../store/slices/taskSlices'
import Styles from './listEditable.module.css'
import {useDispatch,useSelector} from 'react-redux'
import { useNavigate } from "react-router-dom";

const ListEdit = (props) => {
  let Title = props.title;
  let ListId = props.id;
  let CardId = props.cardId;


  const [isInput, setIsInput] = useState(false);
  const [title, setTitle] = useState(Title);

  const dispatch = useDispatch();
  const listData = useSelector((state)=> state.tasks.listData)





  const navigate = useNavigate();

  function handleDelete() {
    let updateList = [...listData];
    const index = updateList.findIndex((ele) => ele.id === CardId);
    let currentList = { ...updateList[index] };
    const updatedTasks = currentList.task.filter((ele) => ele.id !== ListId);
    currentList.task = updatedTasks;
    updateList[index] = currentList;
    dispatch(setListData(updateList));
    localStorage.setItem("List", JSON.stringify(updateList));

    console.log(listData);
  }

  function handleEdit(e) {
    e.preventDefault();
    let input = [...listData];
    let index = input.findIndex((ele) => ele.id === CardId);
    let current = input[index];
    let taskss = { ...current };
    let Task = [...taskss.task];
    let taskIndex = Task.findIndex((ele) => ele.id === ListId);
    let EditTitle = { ...Task[taskIndex] };
    EditTitle.title = title;
    Task.splice(taskIndex, 1, EditTitle);
    taskss.task = Task;
    console.log(taskss);
    input.splice(index, 1, taskss);
    dispatch(setListData(input));
    localStorage.setItem("List", JSON.stringify(input));
    setIsInput(!isInput);
  }

  function handleNavigate() {
    navigate(`/${CardId}/${ListId}/edit`);
  }

  return (
    <div className={Styles.Main}>
      <div>
        {isInput ? (
          <form onSubmit={(e) => handleEdit(e)}>
            <input
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              className={Styles.editInput}
            />
          </form>
        ) : (
            <p onClick={handleNavigate}>{Title}</p>
        )}
      </div>
      <span>
        <EditTwoToneIcon onClick={() => setIsInput(!isInput)} />
        <DeleteIcon onClick={() => handleDelete()} />
      </span>
    </div>
  );
};

export default ListEdit;
